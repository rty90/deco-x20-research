# X20 UDP：原生接收、长度、校验与 CGI 边界

日期：2026-10-25。对象为用户给定的 Deco X20 v3、1.1.8 Build 20240119 Rel.37701，`F:\fw\x20_root`。仅离线读取；没有执行固件、发包、构造触发输入、安装工具或读取密钥。只覆盖 UDP 五项操作码共同的原生入口、CGI 中转及相关直接依赖，不扩展 TCP 操作码表。

## 主要结论

1. **长度边界有明确检查。** 设 `N=recvfrom` 返回值、`L=报文声明的 body 长度`：继续处理要求 `16 <= N <= 1024`，且 `L + 16 == N`。因此该入口传给 CGI 的 body 为 `packet+16`、长度 `L`，满足 `0 <= L <= 1008`。没有在这条路径发现“按声明长度越过实际接收区读写”的证据。
2. **CRC 不等于认证。** 原生入口检查 wire version 为 2、CRC32、错误字节和长度；在这段代码中没有看到账号、口令、节点签名、MAC 或密钥校验。五项业务是否另有认证，由下游 Lua 审查决定，不能据此称五项业务均可免认证执行。
3. **存在 CGI 前的状态变更尝试。** 条件满足时，代码调用 `fw_input.sh add <来源IPv4>`，脚本会尝试在 `deco_dev_list` 插入来源 IP 的 ACCEPT 规则。这个动作发生在业务分发之前。本记录没有验证在役规则链、实际放行效果或 SSH 认证绕过。

## 文件身份

所有下列地址均为对应 ELF 的虚拟地址，不是磁盘偏移。

| 文件 | SHA-256 |
|---|---|
| `usr/bin/tmpsvr` | `60c6eb19079af64de9d420355a94a93e75241b3190537b139d6dc52bc594a598` |
| `lib/libubox.so` | `9bbbb2abca8159909b55a46b6957df76d4d1f922b40792ce43ab5d8308f20eb6` |
| `usr/lib/libz.so.1.2.7` | `93a0f47e474d30b40ed82315b7b093032a3f7b337fe78965c912b7686c793363` |
| `sbin/fw_input.sh` | `7096dc7eaaf95fb89594758897de5f8041306c4d0e995fd8f86fac998eae756a` |

## 接收区与长度证明

UDP 回调入口是 `0x407ad0`；在服务器初始化中被写入回调槽（`0x407840`–`0x407850`）。

| 位置 | 指令或条件 | 含义 |
|---|---|---|
| `0x407a20`–`0x407a28` | `pool_open(6, 0x490)` | packet pool 的单项可用大小为 1168 字节；`pool_open` 自加 8 字节管理头，`pool_alloc` 在 `0x4093f8` 返回管理头之后的地址 |
| `0x407b74` | `addiu s3,s0,0x90` | 接收区在 packet 对象的 144 字节偏移；剩余空间正好是 1024 字节 |
| `0x407b8c` / `0x407b90` | `a2=0x400`；调用 `recvfrom` | 传入接收容量 1024，flags 为 0，返回值在 `0x407ba8` 保存到 `s5` |
| `0x407ba4` | `bgez v0,0x407c7c` | 返回值非负才进入头检查；错误分支最终释放 packet 和 transaction |
| `0x407c7c` / `0x407c80` | `sltiu v0,v0,16`；结果为零才进入 `0x407cdc` | 少于 16 字节拒绝，先于完整头读取和 CRC |
| `0x407d78`–`0x407d98` | 读 `packet+4` 的 16 位值，交换字节后 `andi ...,0xffff` | 得到无符号的声明 body 长度 `L`，保存回头部 |
| `0x407e78` | `addiu v0,v1,16` | 计算 `L+16`，是 32 位寄存器计算，没有截回 16 位 |
| `0x407ed8` | `beq v0,s5,0x40828c` | 只有声明总长与实际返回长度 **相等** 才继续；不等时日志后进入清理路径 |
| `0x408ef8`–`0x408f04` | `lhu a2,4(s0)`；`a1=s0+16`；`ustream_write` | 成功建立 relay 后，按已检查的 `L` 转交原始 body |

所以不是仅检查 `L <= 某常量`，而是同时绑定实际接收结果；`L=65535` 等值也不能通过 16 位回绕使总长变小。原生层允许 `N=16,L=0` 通过长度关，是否允许空业务输入由后续处理决定。

限制：这是对 `recvfrom` 返回的已接收字节数的证明。调用使用 flags=0，没有单独取得/检查原始 datagram 的截断状态；不能据此断言线上大于 1024 字节的原始 datagram 必然整包被拒绝。没有为验证这一点发包。

## 16 字节头与 CRC

| 头偏移 | 本版已确认行为 | 指令证据 |
|---:|---|---|
| 0 | 必须等于 2 | `0x407c84` 设置比较常量；`0x407cdc` 取字节；`0x407ce4` 相等才进入 CRC |
| 2–3 | 操作码，按网络序转换为本机序 | `0x407d60`–`0x407d7c` |
| 4–5 | body 长度 `L`，按网络序转换 | `0x407d78`–`0x407d98` |
| 7 | 必须为零，日志称为 error code | `0x407e6c` 取字节；`0x407e74` 为零才进入长度相等检查 |
| 8–11 | 32 位字段做字节序转换 | `0x407d90`–`0x407dcc`；本回调未观察到基于该字段的重放验证 |
| 12–15 | 保存收到的 CRC，置为固定占位字节再计算，最后转换并比较 | `0x407d48`、`0x407d5c`、`0x407dec` |

本回调没有观察到对偏移 1、6 的额外拒绝检查；不据此推断它们在整个协议中的完整语义。

CRC 调用位于 `0x407d58`：`a0=0`、`a1=packet`、`a2=N`（`0x407d54`），因此 CRC 覆盖的是实际收到的长度，**不是尚未验证的声明长度**。CRC 不匹配时不能进入业务转交。`libz.so` 的导出 `crc32` 入口为 `0x1b1c`，可见按剩余长度处理的字节、32 字节块和 4 字节块循环；它不接受身份凭据。这是完整性/格式检查，不是 MAC 或节点认证。

wire 首字节的实测代码检查值 2 与 CGI 字符串 `TDP/2.0` 是两份独立证据；不能仅由后者反推前者。

## CGI 前的来源 IP 状态分支

下列行为位于通过上述版本、CRC、错误码及长度检查之后，但早于 `tdp_trans_feed`、操作码表分发和 Lua 业务检查。

1. `0x407fa4`–`0x407fbc` 检查 `/tmp/deco_dev/`。目录不可访问时直接跳到 `0x408224` 继续转交业务，不调用放行脚本。
2. 目录存在时，`0x407fc4`–`0x407fcc` 对 `recvfrom` 得到的来源 IPv4 调用 `inet_ntoa`；`0x407fe8` 将结果放入 16 字节栈区。字符串不是取自 JSON body。
3. `0x407ff0`–`0x407ffc` 对操作码 `0xc401` 走特殊分支；另外四个静态表内操作码直接到 `0x4081ec`。
4. `0xc401` 分支检查缓存绑定标志。该全局初值为字符 `'0'`。未缓存为 `'1'` 时尝试读取 `/tmp/is_binded` 的首字符；在 `0x4080ac` 若仍为 `'0'`，跳到 `0x408224`。缺失文件且初值未改变时也走此路。
5. 绑定分支随后检查 `/tmp/deco_dev/<来源IP>`；已存在时跳到 `0x408224`。不存在时尝试创建该标记文件，然后进入脚本调用；即使创建失败，代码仍继续到该调用路径。
6. `0x4081ec`–`0x408214` 格式化固定命令路径并调用 `system`，参数为来源 IPv4；之后仍在 `0x40822c` 调用 `tdp_trans_feed`。代码没有依据该 `system` 返回值阻止业务转交。

`fw_input.sh:153` 的 `add` 分支调用 `add_client_accept`；第 34 行在 `deco_dev_list` 插入来源 IP 的 ACCEPT。该脚本的 `start` 分支第 10 行将 `deco_dev_list` 挂到 INPUT TCP 20001。**这证明存在认证前的放行尝试，不证明当前机器的该链已经挂载或 SSH 身份验证被绕过。** 本次没有执行脚本。`inet_ntoa` 产生的 IPv4 文本与 JSON 可控任意字符串不同；没有据此报告 shell 注入。

| UDP 静态表项 | 原生长度/CRC规则 | CGI 前额外路径 |
|---|---|---|
| `0x0001` / discover.read | 共同规则 | 目录存在时尝试来源 IP 放行 |
| `0xc401` / sync_config | 共同规则 | 还受绑定标志及来源 IP 标记文件分支影响 |
| `0xc402` / sync_config_emmc | 共同规则 | 目录存在时尝试来源 IP 放行 |
| `0xd401` / sync_slave_check | 共同规则 | 目录存在时尝试来源 IP 放行 |
| `0xd402` / sync_master_check | 共同规则 | 目录存在时尝试来源 IP 放行 |

上述文件状态不是密码学身份校验；业务名称中的 “check” 也不说明原生入口已完成认证。五个 Lua 处理函数的认证结果由独立审查合并。

## Relay 环境与写流依赖

`tdp_trans_feed=0x408d88` 在 `0x408e64` 用 `snprintf`、32 字节本地缓冲区将 `L` 转为十进制；该长度最多 1008。传入 `relay_run=0x409740` 的附加环境数组包含：

- `CONTENT_LENGTH=<L>`；`NO_CHECKSUM=1`；`SERVER_PROTOCOL=TDP/2.0`；`SERVER_SOFTWARE=TDP Server`。
- 此处的 `NO_CHECKSUM=1` 不表示跳过前面的报文 CRC，而是提供给后续 CGI 的环境值。
- 这份 TDP 附加数组没有 TOKEN、账号或密码。它不是对下游是否另查 JSON 凭据的结论。

`relay_run` 用 TDP 的五项表 `0x421a10` 选择 URI/FORM/OPERATION；表外运行态 RE_ONLY 分支由主审另行解释。它还设置 `OPCODE`、脚本路径、PATH 等。子进程在 `0x409e70` 调 `clearenv`，在 `0x409e78`、`0x409e80` 两次调用键值数组设置器；设置器 `0x4017b8` 在 `0x4017f0` 通过 `setenv(..., overwrite=1)` 设置非空值。随后 `0x409e9c` 执行 `/usr/bin/tmp-luci`。

`tdp_trans_feed` 在 `0x408e90` 只允许 `relay_run` 返回非负后继续向流写 body；失败则走错误路径。传入流的仍是前述原始 body 指针与已验证长度，没有在这层解析 JSON 字段或检查数组元素数量。

直接依赖 `libubox`：`ustream_write=0x6434` 保存输入指针/长度，先尝试调用流的 write 回调；不足部分进入 `0x5a28` 排队。队列路径在 `0x5aac` 计算当前块剩余空间，`0x5ab0`–`0x5abc` 取它和剩余输入长度的较小值，再在 `0x5ac8` 调 `memcpy`；之后同时推进指针并减小剩余长度。这里没有固定 32 字节 JSON 数组转换，也没有身份认证。没有完成对整个 libubox、所有流回调或 libc 的通用内存安全证明。

## 复核方式与实际状态

脚本 [udp-native-check.py](F:/IF/hads/gup/output/deco-x20-offline/udp-native-check.py) 只用宿主机 Python 标准库，复用已有 ELF 读取器；先核对输入哈希。tmpsvr 模式额外核对 9 条关键指令的机器码。它只格式化有限 MIPS 指令，不是模拟器、漏洞测试器或完整反编译器；解释跳转时必须考虑 delay slot。

```powershell
python F:\IF\hads\gup\output\deco-x20-offline\udp-native-check.py
python F:\IF\hads\gup\output\deco-x20-offline\udp-native-check.py --start 0x407b34 --end 0x407f54
python F:\IF\hads\gup\output\deco-x20-offline\udp-native-check.py --start 0x407fa4 --end 0x408264
python F:\IF\hads\gup\output\deco-x20-offline\udp-native-check.py --start 0x408d88 --end 0x408f24
python F:\IF\hads\gup\output\deco-x20-offline\udp-native-check.py --component libubox --start 0x5a28 --end 0x5b2c
```

本次实际运行完成：三个组件的哈希检查和指定范围读取均退出码 0；9 条关键 tmpsvr 指令匹配。只写了本记录和该脚本，没有修改其他产物或解包。

未验证：在役 AP 模式的监听/防火墙状态、实际调用成功、下游业务认证与字段长度、异常资源状态下的服务可用性、长 datagram 截断行为，以及完整原生依赖安全性。因此这些静态结果不应改写成“已经利用”或“整条业务链安全”。
