# X20 v3：UDP TDP → discover 静态审查

对象：用户提供的 `F:\fw\x20_root`，版本身份沿用主审核对的 X20 v3 1.1.8 Build20240119 Rel37701。仅读取原字节码、现有反编译及主机 unluac 的反汇编输出；未执行固件、未发包、未读取密钥内容。此报告不证明在役服务状态或可利用性。

## 证据身份

| 原始文件（均在 F:\fw\x20_root） | SHA-256 |
| --- | --- |
| `usr/lib/lua/luci/controller/discover.lua` | `DDBA941BD22031B8ED3D65A5C8070D85B3DD4572551E49CF9A4DA2CB33CBB2CD` |
| `usr/lib/lua/luci/model/sync.lua` | `AA1A3F7D8654F5170A7B7BE80C82E325D5C4FC23B4B710D28793E99382916F16` |
| `usr/lib/lua/sync-script.lua` | `255BBE26950C302B98A779415442E1BB6E0FDDBE71BAC5706904C6E30027B06B` |
| `usr/lib/lua/luci/model/controller.lua` | `F3B0F10B1B3BAC562A1BE504A923790237D7AA0588C1B60D668058675AC12752` |
| `usr/lib/lua/luci/controller/admin/mobile_app/quick_setup.lua` | `F045706E2BD07F01879F2669451CF70FA532C46A8CB6678335F224AFBB43D9FD` |
| `usr/bin/tmpsvr` | `60C6EB19079AF64DE9D420355A94A93E75241B3190537B139D6DC52BC594A598` |

下文 D/S/C/Q/SS 的行号分别对应 `F:\IF\hads\gup\output\deco-x20-offline\` 下 `discover.decompiled.lua`、`sync_model.decompiled.lua`、`controller.decompiled.lua`、`quick_setup.decompiled.lua`、`sync_script.decompiled.lua`。

本次 discover 反编译文件 SHA-256 为 `7CFC3A681046F36D9EF8525006369E36421139996EFC6D86742CD5EC9D58F3F6`；sync_model 为 `A8EAD3F9A602AEFF03CDB0165970704F2F3D29ECE9A68003F085D5C4924AA328`。

## 五个入口

上游三元组由主审重新读取 tmpsvr ELF 提供；控制器回调另以 D:1960–1987 和主函数字节码独立核对。

| opcode | tmpsvr VA | module / form / operation | 控制器回调 |
| --- | --- | --- | --- |
| 0x0001 | 0x421a10 | discover / discover / read | main/f11，D:651–1000 |
| 0xc401 | 0x421a20 | discover / NULL / sync_config | main/f14，D:1195–1785 |
| 0xc402 | 0x421a30 | discover / NULL / sync_config_emmc | main/f13，D:1012–1193 |
| 0xd401 | 0x421a40 | discover / NULL / sync_slave_check | 外部同名全局符号，D:1970–1973 |
| 0xd402 | 0x421a50 | discover / NULL / sync_master_check | main/f15，D:1787–1958 |

NULL form 不等于强制清空输入 form：主审确认 tmp 仅在对应环境变量存在时覆盖 form。simple_dispatch 若操作表内存在输入 form 才进入子表，否则停在根表，再取 operation 的 `.cb(params or {})`（C:751–770）。该函数没有通用 schema 或账号会话认证检查。原生白名单、来源限制及 tmp 外层捕获另由主审核查。

d401 的符号读取在字节码中确为 GETGLOBAL，discover 本文件没有定义该函数；不能将其视为已证实可调用的处理器。加载环境是否注入它待主审核实。

## 闭包绑定：已确定与反编译限制

缺少局部变量/闭包名称调试信息使 unluac 输出 `_UPVALUE` 占位；不能按编号跨函数套用。本次使用现有 `normalized/*.luac` 的 `unluac.Main --disassemble`，核对 CLOSURE 后的 MOVE 捕获，未改写这些文件。

- discover f13/f14 的 u0=sync、u1=nixio、u2=main/f10（D:602 的端口兼容处理）。f14 的 u3=f2（D:221），u4=subprocess，u5=4，u6=debug，u7=本机信息 f0，u8=getfirm，u9=ubus，u10=bit，u11=f6。
- f10 的 u0=f4（记录时间）、u1=f7（时间窗口）、u2=f8（动态 Dropbear 配置）、u3=f9（SSH 客户端端口）。f8 捕获 `uci.cursor_state()` 和 `luci.sys`；f9 捕获 `/tmp/ssh_client_port`。
- f11/read 的 u0=本机信息 f0、u1=sync；f15/master_check 的 u0=sync、u1=quick_setup、u2=debug、u3=subprocess、u4=nixio。
- sync 的 crypt 捕获 subprocess；decrypt 捕获 nixio；decrypt_table 捕获 luci.json。quick_setup f30/pre_config_kick_mac 捕获 r3，即 luci.sys。
- D:1215–1250 的 if/else 缩进失真；下述选组顺序以 f14 字节码 l33/l47/l52/l55 跳转为准。

## 入口校验及副作用顺序

### read / 0x0001

D:651–674 先获取本机信息并调用 sync_boost，之后读组信息/账户状态。此回调没有对请求实施组密钥或登录认证，主要按本机状态构造发现响应。sync_boost 经 ubus 调 `sync.boost` 和 `sync.probe`（S:1220–1249），故 read 含同步唤醒副作用。D:974–985 的 tmp_port 取 dropbear2.Port、缺省 20001，是响应值来源，不证明实际监听。

### sync_config_emmc / 0xc402

顺序：当前组存在且外层 group_hid 匹配其 CRC32 → secret 为 truthy → **端口兼容处理** → 用当前组 key 解密并 JSON 解码 → 结果 truthy 且内层 group_id 相等 → emmc_config_version truthy → 比较版本/缓存设备条目 → 条件性 sync_boost_emmc → 加密响应（D:1014–1192）。CRC32 是组选择/一致性检查，不是密钥认证。

端口兼容调用 D:1039–1041 早于解密 D:1042–1046。其余版本处理和 sync boost 在内层 gid 检查后；sync_boost_emmc 调用 ubus boost_emmc/probe_emmc（S:1303–1327）。此回调没有直接把来包作为整份配置写进持久分区。

### sync_config / 0xc401

字节码确认依次选择：当前组哈希匹配 → 否则默认组哈希匹配（当前组已存在时也可能进入）→ 两者都不匹配但本机无当前 gid 时选择默认组、匹配标记保持 false → 其余拒绝。

之后仅检查 secret truthy，即执行端口兼容处理（D:1251–1259）。只有当前组或默认组匹配标记为 true 才解密并核验内层 gid（D:1267–1283）。无当前 gid 的未组网回退分支不在此解密来包，但仍可构造默认组加密的本机响应；不能将其外推为已组网设备配置写入绕过。

内层检查后可比较版本，读取 ubus 设备表，组装来包字段并调用 `ubus sync.device`，通知在线事件及触发 sync boost（D:1287–1552）。默认组路径上“本机已绑定，不答复未绑定设备”的拒绝位于这些处理之后（D:1555–1566）；错误答复不能证明之前没有设备表/同步副作用。

函数名称不等于落盘功能：本回调直接可见的是发现/设备状态更新、同步唤醒及响应构造。

### sync_master_check / 0xd402

本机前置：输入 truthy、当前组含 gid/key、sync.get_role()==AP、预配置设备尚未全部绑定（D:1789–1825）。这里 AP 是组角色（S:2442–2464），不是 sysmode 的工作模式判断。

接着以**默认组 key**解密外层 secret，无先行外层 group_hid 检查（D:1827–1832）。结果需含 truthy 的 device_id_md5/string_code_re，排除自身 ID，再匹配 preconfig_device_list；匹配 section 名作为第二层解密 key（D:1833–1903）。第二层结果只检查 `~= nil`，本函数未见预期值相等、类型或重放窗口校验；这不等于完整协议没有别处约束。

成功分支 fork 后调用 quick_setup.pre_config_add_re，并返回默认组加密的响应（D:1904–1946）。无对应预配置设备或内层解密失败时调用 pre_config_kick_mac（D:1888–1896、1947–1952），错误路径有副作用。

## 优先复核项

### A. 组内验证前修改端口兼容状态：静态顺序已确认

c401/c402 的外层组选择和 secret 存在检查之后、内层解密之前调用 f10。其可记录 `/tmp` 的 ssh_port_detect 时间；依据时间窗口调用 f8 增加/回退 dropbear2 配置并重载，f9 可写 `/tmp/ssh_client_port`（D:373–391、446–649）。

这证明组内验证前存在配置副作用；尚不能证明在役设备可开启可登录 SSH，仍依赖上游访问、组哈希、当前状态、重载效果、防火墙及认证策略。

### B. 预配置失败处理的 shell 注入危险路径

discover 两个错误分支把默认组解码结果中的 mac_2_4G/mac_5G 传入 pre_config_kick_mac。该函数仅检查两个实参 truthy（Q:3423–3425），直接拼接到 kickmac 命令字符串，交给 luci.sys.fork_call（Q:3450–3463），没有局部 MAC 格式/长度验证或转义。闭包身份已核实。

主审另行独立核实 `sys.decompiled.lua:114–173`：fork_call 最终经 nixio.exec 调 `/bin/sh -c`，且 sys 的闭包捕获绑定已核实。本分工没有重做 sys 审查，完整原始哈希/偏移由主审总报告提供。

可报告为：**在外层默认组解密成功及预配置状态条件下，设备身份验证失败处理内存在不安全字符串到 shell 的路径。** 尚未证明不受信任来源能够满足全部条件或在役可利用；不称为无条件 pre-auth RCE。未构造输入、未执行路径。

### C. 类型/长度检查薄弱：局部缺口已确定，影响未动态验证

- `params or {}` 只处理 nil/false，不保证 table（C:766–770）；三个带参回调直接索引字段。
- c401/c402 的 secret 只做 truthy 检查；d402 直接送 decrypt_table。未见字符串类型、长度、Base64 校验先于解码。
- decrypt 直接调用原生 nixio.bin.b64decode（S:1170–1186），再经 subprocess 调 OpenSSL AES-256-CBC（S:1105–1147），然后 luci.json.decode（S:1206–1218）。这些助手无显式长度上限、MAC/tag 或重放检查；其他层限制不在此结论内。
- decrypt_table 未检查 decrypt 返回值即调用 JSON decoder；handler 对结果多是 truthy 后取字段，未确认 table。decoder 的具体异常/兜底行为未在本审查验证。
- compare_config_version/compare_sync_version 在 tonumber 后直接减法（S:915–951）；有值但非数值的版本缺局部保护。Lua 异常不等于原生越界或进程崩溃。
- c401 向 ubus sync.device 传 ID/IP/MAC/型号/版本/extra_info 等字段前，无该分支内逐项类型或长度约束（D:1443–1526）；原生接收端检查由主审另查。

### D. 错误捕获边界

simple_dispatch 直接调用 cb（C:770），没有本函数内 pcall/xpcall；外层 tmp 的捕获及状态清理由主审判定。sync-script.run 的 xpcall（SS:137–168）属于另一脚本框架，不能自动当作 discover UDP 保护。

read_group_info 读分区/打开缓存失败时可能返回 nil（S:108–124），c401/c402 随即取 .gid；这是本地故障处理边界，不证明远端可制造文件故障。早返回的锁是否依赖对象回收未核实，不定性为死锁。

## 尚未证明

1. 五 opcode 实际启用、白名单、外层长度/CRC、tmp 认证及异常生命周期；这些需合并主审原生证据。
2. d401 外部全局函数来源；不能凭空补全处理器。
3. 默认/当前组密钥跨设备共享关系。只定位 group-info 分区/缓存与 getfirm/profile 回退（S:67–72、82–148、2108–2148、2342–2440），未提取密钥值。
4. nixio.so/ubus.so 的内存安全。deco_on_off_iface.lua 是 Lua 模块，不能仅凭名称称作原生；OpenSSL 是外部程序。
5. 在役设备上的动态可达、有效请求、写入、异常或利用结果。此次只产生本静态报告，未改变设备或原解包文件。
