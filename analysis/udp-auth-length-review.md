# X20 v3：UDP 五个 opcode 的认证与长度审查

2026-10-25；用户提供的 `F:\fw\x20_root`，1.1.8 Build20240119 Rel37701。全程离线；没有运行固件、发包、执行 PoC、重启、改动原始解包或读取密钥文件。tmpsvr SHA-256：`60c6eb19079af64de9d420355a94a93e75241b3190537b139d6dc52bc594a598`。

**发现三条有代码证据的可疑路径：身份检查失败后把 MAC 字段拼进 shell；组内解密前修改 SSH 兼容配置；Lua 认证/白名单前尝试放行来源 IP。已检查的 UDP 接收、流转交和 Base64 解码没有确认固定栈缓冲区溢出。** 这些是静态结论，未证明在役可利用性。

完整分工证据：[原生接收/长度](F:/IF/hads/gup/output/deco-x20-offline/udp-native-boundary.md)、[discover 控制器](F:/IF/hads/gup/output/deco-x20-offline/udp-discover-review.md)、[Lua 与原生扩展](F:/IF/hads/gup/output/deco-x20-offline/udp-lua-native-review.md)。以下 VA 为 ELF 虚拟地址；FO 为**原始 Lua 文件的函数指令区起点**，不是规范化副本偏移或运行内存地址。Lua 闭包以 CLOSURE/MOVE 实际绑定核对，未按反编译占位符猜测。

## 公共分发边界

```text
tmpsvr UDP callback 0x407ad0
 → 版本/CRC/实收与声明长度检查
 → 条件性来源 IP 放行
 → tdp_trans_feed 0x408d88 → relay_run 0x409740
 → tmp-luci：条件性 opcode 白名单
 → luci.sgi.tmp.main FO 0x113b：JSON decode
 → discover.dispatch → simple_dispatch → callback(params or {})
```

- `tmp-luci:13–21` 只有在 `firewall.security.opcode_whitelist == "1"` 时，才按是否存在 group_info.gid 设置白名单开关。tmp 根字节码确认默认开关为 0。名单包含 0001/c401/c402，不含 d401/d402。启用时后两项在控制器前被拒绝；错误输出最终调用 os.exit，不能误认为检查会穿透。
- CGI 路径没有经过 WebUI 的 sysauth/stok/session。CRC 与 group_hid 的 CRC32 比较不构成节点凭据认证。
- `relay_run` 清空环境，按表设置 URI/FORM/OPERATION。FORM 非空时才覆盖 JSON form；OPERATION 由表覆盖。simple_dispatch 无统一 schema，仅传 params or {}。op_manager.dispose_opcode 遇到 TDP 返回本机处理，不自动转发。
- tmp.run（原始 code FO 0x2441；反编译 1362–1376）以 pcall(main) 捕获普通 Lua 异常，错误文本限制 768 字符。它不回滚已发生的副作用，也不能捕获原生内存破坏。

## 五项矩阵

| opcode / 表 VA | handler / discover 原始 code FO | 认证与状态门槛 | 结果 |
|---|---|---|---|
| 0001 / 0x421a10 | read，main/f11 / 0x160d | 无组密钥或账号会话检查；按本机状态回复 | 包含 sync_boost 副作用 |
| c401 / 0x421a20 | sync_config，main/f14 / 0x2803 | 当前/默认组选择；匹配分支解密后检查内层 group_id；未组网另有回退 | 兼容配置在解密前；部分设备表/同步动作早于后置默认组拒绝 |
| c402 / 0x421a30 | sync_config_emmc，main/f13 / 0x2232 | 当前组标识匹配、解密、内层 group_id 与版本判断 | 兼容配置在解密前；后续主要是设备状态/同步唤醒 |
| d401 / 0x421a40 | sync_slave_check，全局引用 | 启用白名单时拒绝 | discover 中无定义；Lua 定点搜索只找到该引用，运行期绑定未闭合 |
| d402 / 0x421a50 | sync_master_check，main/f15 / 0x3962 | 白名单未阻挡；本机有组、组角色 AP、预配置未全绑定；默认组外层解密、设备列表/第二层检查 | 两个失败分支把外层解密后的 MAC 字段送入 shell |

组角色 AP 与 AP/桥接工作模式是不同变量。c401/c402 的名称不能作为“直接落盘整份配置”的证据。

## A：设备身份失败处理中的 shell 拼接

数据流：`discover.sync_master_check → 默认组外层解密 → 设备 ID 不匹配或第二层解密失败 → quick_setup.pre_config_kick_mac(mac_2_4G,mac_5G) → sys.fork_call → nixio.exec('/bin/sh','-c',command)`。

- [discover.decompiled.lua:1888](F:/IF/hads/gup/output/deco-x20-offline/discover.decompiled.lua:1888) 和 1947：两个失败分支调用 kick helper。
- [quick_setup.decompiled.lua:3421](F:/IF/hads/gup/output/deco-x20-offline/quick_setup.decompiled.lua:3421)：main/f30，原始 code FO **0x727f**；仅检查两个参数 truthy，3450–3463 直接拼接 MAC 字段并调用 fork_call，未见 MAC 格式/长度验证或 shell 转义。
- [sys.decompiled.lua:114](F:/IF/hads/gup/output/deco-x20-offline/sys.decompiled.lua:114)：fork_call=main/f2，原始 code FO **0xa20**；153–158 传 `/bin/sh -c`。闭包确认对象为 nixio。原始 sys.lua SHA-256 `ad76ef89d76268f6aaae9784b12ec940557075c2100bf92ff85dd139f4f170e5`。
- nixio exec 表项 **0x254e4 → 0xc694 → nixio__exec 0xc1f4**；mode 2 最终传到 execv，argv 为 shell、-c、命令，无原生转义。[native 补核](F:/IF/hads/gup/output/deco-x20-offline/udp-lua-native-review.md:108)

**判定：条件性命令注入危险数据流，静态证据强。** 必须保留外层解密成功、本机组/预配置/角色以及上游白名单等前提；未证明不受信任来源可满足这些前提，不称为无条件免认证 RCE。修正方向是 MAC 严格格式校验、独立 argv 调用，以及避免身份失败时使用未验证字段执行命令。

关键可达性限制：quick_setup 3391–3416 的 has_all_device_binded 初值为 true，只有预配置列表里出现没有 bindtime 的设备才置 false。**若列表没有条目，d402 会在解密前提前返回。** 本次 rootfs 的 etc/config 下未预置 preconfig_device_list 文件；运行期是否生成及其内容未核查，不能据此宣称普通已配置家庭设备会进入上述分支。

## B：组内解密前调整 SSH 兼容状态

c401 在 discover 1257–1259、c402 在 1039–1041 调用 **main/f10，原始 code FO 0x150d**，早于各自 decrypt_table。该 helper 处理 tmp_port_ver 和时间状态，可经 484–564 保存 dropbear2 配置、选择端口 22 并调用 reload；另经 566–600 修改 `/tmp/ssh_client_port`。

**判定：组内验证前存在配置副作用，顺序已确认。** c402 仍需外层当前组标识匹配，c401 仍有选组条件；是否修改/监听/可登录取决于本地状态与后续认证，不能称为 SSH 登录绕过。建议把兼容处理移至解密与字段校验之后。

## C：业务认证前尝试放行来源 IP

**tmpsvr VA 0x408214** 调 system 放行脚本，之后才在 **0x40822c** 转交 TDP 事务，先于 Lua 白名单、JSON 和组内验证。前提为 `/tmp/deco_dev/` 存在；c401 另受绑定标志和来源标记分支影响，其余四项没有该特殊分支。

fw_input.sh 第 34 行尝试在 deco_dev_list 插入来源 IP ACCEPT；第 10 行的 start 路径将该链挂在 INPUT TCP20001。来源文本来自 inet_ntoa，而非 JSON 任意字符串，未将此 system 调用归为命令注入。

**判定：认证前放行尝试，静态证据确定；在役链/执行效果及 SSH 身份绕过未验证。** 建议只在节点身份确认后加入管理端口允许列表，并处理失效撤销。

## 长度和输入检查

| 边界 | 已核实 | 限制 |
|---|---|---|
| UDP 接收 | recvfrom 0x407b90 最大1024；不足16拒绝；0x407ed8 要求 L+16==N，body≤1008；wire首字节==2 | flags=0，未单独取得原始 datagram 截断状态，不能说线上超大包必然整包拒绝 |
| 流转交 | 0x408ef8 起按已验证 L 转交；libubox 0x5ab0 起按剩余输入/空间取较小拷贝长度 | 未穷举所有流回调/libc |
| JSON | 纯 Lua decoder，解析错误受 pcall 保护 | 无统一 table/params schema；未完整证明嵌套资源上限 |
| Base64 | nixio b64decode **0xd790** 使用 Lua 字符串实际长度，检查分组/字符/分配并显式传长 | 本次未确认此函数固定栈溢出；普通类型错误不等于 native 崩溃 |
| AES | 固定 argv 的 OpenSSL 子进程、stdin 输入、检查退出状态 | helper 未见独立消息认证码/签名/nonce，不能因此直接断言可伪造或所有操作可重放 |
| ubus | 字符串分支 **0x1404–0x1454** 用 lua_tolstring、strlen+1、blobmsg_add_field | 内嵌 NUL 截断，未见业务字段格式/限长；sync-server 接收端未全面审计 |

## 完成范围和复核

原生脚本的输入哈希及关键指令核对通过。Lua 原始文件偏移由 `lua-prototype-map.py` 完整解析到 EOF，保存在 `udp-lua-offsets.json`；该脚本不打印常量或执行 Lua。反编译只作用于分析副本。

本轮覆盖五入口的共同分发、可识别控制器、公共 JSON/Base64/AES/shell/ubus binding 和以上三条路径。尚未核查：d401 运行期绑定、实际组密钥/预配置/防火墙状态、sync-server 全部字段消费者和任何行为/利用验证。相关 RSA 旁支未与五入口建立调用关系，不纳入本结论。
