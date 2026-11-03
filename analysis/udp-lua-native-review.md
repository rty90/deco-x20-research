# Deco X20 v3 1.1.8 Build20240119：UDP 五入口的 Lua／原生解码边界

日期：2026-10-25。仅离线静态分析 `F:\fw\x20_root`，未运行固件、未连接设备、未发包、未构造 PoC；未读取密钥文件或输出密钥值。

## 结论与边界

1. 已闭合的公共外层为 `luci.sgi.tmp.main → luci.json.decode → luci.controller.discover.dispatch → luci.model.controller.simple_dispatch`。`simple_dispatch` 交给回调的是 `request.params or {}`，不是整个请求对象。
2. 已绑定的同步解码为 `luci.model.sync.decrypt_table → decrypt → nixio.bin.b64decode → crypt → subprocess.call_output([openssl, aes-256-cbc, -d, -k, group_key], decoded_bytes) → luci.json.decode`。Lua 不向 Base64 原生入口提供独立长度；原生入口自己取得 Lua 字符串长度。
3. `luci.json` 在本镜像中是 Lua 字节码实现，不是 cjson/json-c 原生解码器。其 `decode` 用 `pcall` 包住解析，解析错误返回 nil。没有证据将这一路径的 Lua 类型异常称为原生缓冲区溢出。
4. `nixio.bin.b64decode @ 0xd790` 有输入长度、四字节分组、字符范围、分配失败检查，并按实际长度输出。此次检查未在此函数确认越界写。此结果不是对整个固件或所有 native 函数的安全证明。
5. `sync.crypt/decrypt_table` 本身仅提供 AES-CBC 解密、进程状态检查和 JSON 解码；该 helper 内未见独立 MAC、签名或 nonce／重放状态检查。上层另有 group_id、设备／版本等业务判断。不能仅凭 CBC 或 helper 中没有 MAC，就认定可伪造消息、可重放所有操作或已证明漏洞。
6. 未闭合这五个入口到 `luarsa` 的调用链。RSA 模块内的独立异常线索列在文末，不能用作这五个 UDP 入口的漏洞结论。

## 入口与调用证据

以下 `.decompiled.lua` 行号指本输出目录已有文件；`json.lua`、`subprocess.lua` 的行号指附带工具在内存中生成的 unluac 文本，可用文末命令复核，不覆盖已有产物。

| 入口 | 解码／原生边界 | 证据 |
|---|---|---|
| 公共外层 | `luci.json.decode(body)`；解码 falsy 值替换为 `{}`；随后写入 `form/operation/req_seq` | `tmp.decompiled.lua:1190–1210`；模块导入 `14–16`；`controller.decompiled.lua:761–770` 取 `params` |
| `discover/read` | 对本地 SSID 做 `nixio.bin.b64encode`；未见直接使用请求密文、RSA 或 AES 解密 | `discover.decompiled.lua:651–1001`，其中 Base64 调用 `919–924`；入口绑定 `1960–1963` |
| `sync_config_emmc` | 先 group_hid 比较与 secret 存在检查，再 `sync.decrypt_table(params.secret, local_group.key)`，然后比较解码对象的 group_id | `discover.decompiled.lua:1012–1057`，实际调用 `1042–1046`；入口绑定 `1967–1969` |
| `sync_config` | 匹配现有／默认组的分支调用 `sync.decrypt_table(params.secret, selected_group.key)`；解码后比较 group_id | `discover.decompiled.lua:1195–1283`，调用 `1267–1272`；该调用有分支条件，不能说所有状态都先解密 |
| `sync_master_check` | 本地已有组、AP 角色等条件后，用默认组 key 解 `params.secret`；再用所选设备值解 `decoded.string_code_re` | `discover.decompiled.lua:1787–1845`、`1898–1905`；第二次解码结果只作 `~= nil` 判断；`session_id` 在 `1922–1923` 复制到响应 |
| `sync_slave_check` | 注册时执行 `GETGLOBAL sync_slave_check`，未在本模块定义函数体；无足够证据绑定到某个 native 函数 | `discover.decompiled.lua:1970–1973`；Lua 根原型反汇编 `187–188`；全 `usr/lib/lua/*.lua` 精确名称文件级搜索只命中 `discover.lua` |

`sync_slave_check` 的静态名称搜索不能排除运行期全局注入；这里只报告未闭合，不推断不可达或一定返回某错误。

## 闭包绑定已核对

用规范化分析副本的 Lua 5.1 `CLOSURE` 后 `MOVE` 上值声明核对，不按 `_UPVALUE0_` 等反编译名字猜模块：

- `tmp.lua main/f10`（`main`）的 upvalue14 来自顶层 r3，即 `require("luci.json")`。根反汇编文本 `177–194`。
- `discover.lua main/f13`（emmc）、`main/f14`（config）、`main/f15`（master）upvalue0 均来自顶层 r2，即 `require("luci.model.sync")`。根反汇编文本 `151–175`。
- `sync.lua main/f18`（crypt）upvalue0 来自 r5=`luci.model.subprocess`；`main/f20`（decrypt）来自 r3=`nixio`；`main/f22`（decrypt_table）来自 r1=`luci.json`。根反汇编文本 `327–341`。
- `json.lua main/f0`（decode）upvalue0 来自 r13=`pcall`。根反汇编文本 `108`、`120–122`。

## JSON 的返回值／错误处理

- `json.lua:38–61`：创建 `ActiveDecoder`，将输入设为 `.chunk`，执行 `pcall(decoder.get, decoder)`；失败或解析结果 falsy 时返回 nil。`ActiveDecoder.get` 位于 `1352–1374`，通过 Lua `Decoder.dispatch` 处理文本。
- `json.lua:538–626` 与 `1327–1391` 显示解析器为 Lua 方法调用。此调查未完整证明所有嵌套／资源上限，不宣称抗资源耗尽。
- 外层 `tmp.main` 与同步函数并非每处都验证解码结果是 table：外层取 truthy 结果后直接赋字段；emmc/config/master 对结果主要做 truthy 检查后索引字段。由 JSON 标量导致的类型异常属于 Lua 层行为；本报告不把其称为 native 内存损坏。
- `sync.decrypt_table` 在 `sync_model.decompiled.lua:1206–1215` 未先检查 `decrypt` 的返回值，直接把结果交给 `json.decode`；后者的受保护解析可把此类解析失败变成 nil。
- 但 `sync.decrypt` 的 Base64 调用 `1172–1176` 不在 `json.decode` 的 pcall 之内。`params.secret`／`string_code_re` 非字符串兼容类型时，`luaL_checklstring` 可产生 Lua 参数错误；不能把 JSON 解码层的 pcall 当成覆盖整个加解密链。顶层错误捕获由主审单独核对。

## Base64 native 的长度证据

文件：`F:\fw\x20_root\usr\lib\lua\nixio.so`。注册函数 `nixio_open_bin @ 0xe05c` 在 `0xe0a4` 调 `luaL_register`，注册表为 VA `0x255b4`；表项 `0x255d4` 映射 `b64decode → 0xd790`。这不是按字符串猜函数地址。

| 代码 VA | 已观察事实 |
|---|---|
| `0xd79c–0xd7cc` | `luaL_checklstring(L, 1, sp+24)`；使用真实 Lua 字符串长度，未取第二个 Lua 实参作长度 |
| `0xd7d0–0xd7f4` | 长度为零直接推回第一个值并返回一个结果 |
| `0xd7f8–0xd800` | `len & 3` 非零进入参数错误路径 |
| `0xd804–0xd820` | 输出分配大小为 `3 * (len >> 2)`；这一计算不先对 len 乘 3，32 位无符号输入长度下该大小不超过 len |
| `0xd828–0xd840` | malloc 返回零时调用 `luaL_error` |
| `0xd854–0xd880` | 每字符减 43、转无符号八位后要求 `< 80`，再查表；表值 255 走拒绝分支 |
| `0xd8e8–0xd928` | 每 4 个输入字节生成 3 字节；循环由已取得的 len 限定 |
| `0xd930–0xd960` | 从末尾两个字节的 `=` 数量修正输出长度，使用 `lua_pushlstring` 显式传长，不依赖输出 NUL 终止 |
| `0xd884–0xd8c4` | 非法字符释放分配，随后 errno=22，调用 `nixio__perror`；长度非法也进入此路径 |

`nixio__perror @ 0x2e04` 对此 errno 推 nil、错误编号和错误文本（`0x2e64–0x2eb8`）。`sync.decrypt` 仅接收第一个结果（`1176`）并在 falsy 时返回 nil（`1178–1180`），不保留详细错误。这是错误信息降级，不是未经检查继续使用无效缓冲区。

所链接的 `liblua.so.5.1.5:luaL_checklstring @ 0x1b84c` 在 `0x1b874` 调 `lua_tolstring @ 0x4638`，返回零则在 `0x1b898` 进入类型错误辅助函数，类型编号 4。这里是 Lua 字符串转换／检查 API，不能描述成“任意指针直接进入 Base64”。

## AES、子进程与完整性／重放结论的范围

- `sync_model.decompiled.lua:1105–1147`：如未传入 key，从组信息取 key；没有 key 返回 nil。构造固定参数数组 `openssl`, `aes-256-cbc`, `-e`/`-d`, `-k`, key；把输入字节作为 `subprocess.call_output` 第二参数；只在子进程状态等于零时返回输出。
- `sync_model.decompiled.lua:1170–1189`：先 Base64，成功后才 `crypt(data,key,false)`；`1206–1215` 随后 JSON 解码。
- `subprocess.lua:119–270`：通过 pipe、fork、dup 与 `nixio.execp(unpack(argv))` 启动程序，输入写入 stdin；此调用链没有把密文拼入 shell 命令。`195–206` 对 stdin 只调用一次 `.write(data)`，没有接收其返回值或循环确认完整写入；仅据这一点不能确定该固件在实际长度下会发生短写。
- `subprocess.lua:272–305`：收集 stdout，透传 pump 错误，成功返回 `output,0`。crypt 会检查这个状态。
- 在以上完整 crypt/decrypt/decrypt_table helper 中没有独立 MAC、签名、序列号数据库或 nonce 比较。group_hid 是另一处 CRC32 比较，不能据此声称密码学消息认证。
- 上层不是完全没有状态判断：`discover.decompiled.lua:1059–1080` 有 emmc 版本逻辑；`1293–1320` 有 config/sync 版本判断；master 的 `session_id` 在 `1922–1923` 被回显。尚未证明这些逻辑构成严格防重放，也未证明所有状态可重放。
- 本次没有调用目标 OpenSSL，没有证明可伪造任意解密结果，没有研究实际密钥内容或可获性。

## 范围外 RSA 线索（不纳入五入口结论）

`luarsa.so:luaopen_luarsa @ 0x1678` 在 `0x16fc/0x1734` 注册表 `0x11a40`，表项可复核为 `gen_keys→0x14b0`、`encrypt→0x1194`、`decrypt→0xeb0`、`decrypt_reverse→0xb54`。`luci.model.asycrypto` 的包装函数只有 payload truthy 检查，参数仍为字符串／key 字段，没有另传长度（该 Lua 文件反编译 `129–241`）。

离线观察到两个值得另案核查的点：`decrypt` 的 hex helper `0xa70` 按 `strlen/2+1` 分配，但 `0x10b8` 的 RSA 解密长度实参来自 `RSA_size`；`decrypt_reverse` 成功路径 `0xd78` 与 `0xe80` 出现对同一保存寄存器 s0 的 `RSA_free`。没有将其连接到五个 UDP 回调，未做触发验证，也没有进一步拓展此旁支。

## 输入身份与复核

| rootfs 相对文件 | SHA-256 |
|---|---|
| `usr/lib/lua/luci/sgi/tmp.lua` | `0d0132237ecaefbb9a970592870ef1854b777ae757807dbb81217714cfb1c8b8` |
| `usr/lib/lua/luci/controller/discover.lua` | `ddba941bd22031b8ed3d65a5c8070d85b3dd4572551e49cf9a4da2cb33cbb2cd` |
| `usr/lib/lua/luci/model/sync.lua` | `aa1a3f7d8654f5170a7b7be80c82e325d5c4fc23b4b710d28793e99382916f16` |
| `usr/lib/lua/luci/json.lua` | `ac3e0d0423ef9f8c32bf18618e25c5acf94a1f51764d875f390c2296f1a52977` |
| `usr/lib/lua/luci/model/subprocess.lua` | `a868fc1b818fdce12eb8abef39652496edbbc4e01f1b44518d94e5afcc5e8686` |
| `usr/lib/lua/nixio.so` | `c1d16981c96f45dfb886186d5ce60c2b24f7dd2655b5aa3fc68e7d5e5bed19e0` |
| `usr/lib/liblua.so.5.1.5` | `836dc1f115e0e3904824b330dd0076507fce03ae8acf7d6099430ce34cbd15bd` |
| `usr/lib/lua/luarsa.so` | `73a9934ff9cbb6cddb83e9e4dc50b45d634db0f76a533a1b186d06b0cc934a46` |

独立脚本 `udp-lua-native-tools.py` 使用既有 `normalize_lnum.py` 与 `elf-static-check.py`；不执行 rootfs 内文件。Lua 的分析副本放入主机临时目录，Java 只解析字节码；命令完成后清除临时分析副本。MIPS 视图是标准库实现的有限指令解码器：输出原始指令字、VA、GOT 目标；不支持的指令会明确标记，不能据未实现的指令作安全结论。此次关键 Base64／RSA 片段使用的指令均有显式解码。

在本输出目录运行，例如：

```powershell
python .\udp-lua-native-tools.py regtable F:\fw\x20_root\usr\lib\lua\nixio.so --start 0x255b4 --end 0x25624
python .\udp-lua-native-tools.py native F:\fw\x20_root\usr\lib\lua\nixio.so --start 0xd790 --end 0xd9a0
python .\udp-lua-native-tools.py lua F:\fw\x20_root\usr\lib\lua\luci\json.lua --start 38 --end 61
python .\udp-lua-native-tools.py lua F:\fw\x20_root\usr\lib\lua\luci\model\subprocess.lua --start 119 --end 305
python .\udp-lua-native-tools.py lasm F:\fw\x20_root\usr\lib\lua\luci\model\sync.lua --start 327 --end 341
python .\udp-lua-native-tools.py lasm F:\fw\x20_root\usr\lib\lua\luci\controller\discover.lua --start 137 --end 199
```

## 补核：nixio.exec 的 shell 参数边界

主审已从 `sys.lua main/f2`（原始 code offset `0xa20`）确认 `fork_call` 调用 `nixio.exec('/bin/sh', '-c', command)`。本补核只闭合其 native 一端，不重复 Lua 来源判断。

`nixio.so` 身份同上。`nixio_open_process @ 0xc6b0` 在 `0xc6c8` 尾调用 `luaL_register`，第三参数来自 `0x20000+0x5444=0x25444`。注册表 `0x254e4` 是 **`exec → 0xc694`**；另外 `0x254ec` 为 `execp → 0xc678`、`0x254f4` 为 `exece → 0xc65c`。

| VA | 观察结果 |
|---|---|
| `0xc694–0xc6ac` | `exec` wrapper 尾跳 `nixio__exec @ 0xc1f4`，第二参数 mode=2 |
| `0xc200–0xc244` | `luaL_checklstring(L,1,NULL)`；返回的第一参数字符串指针保存于 s2 |
| `0xc28c–0xc2a0` | mode=2 使用 `lua_gettop(L)` 得到 Lua 实参数量 n |
| `0xc2a4–0xc2d4` | 分配 `(n+1)*sizeof(char*)` 的 Lua userdata；设置 `argv[n]=NULL`、`argv[0]=arg1` |
| `0xc5c8–0xc5f0` | 依次对 Lua 参数 2..n 调 `luaL_checklstring(L,index,NULL)`，将返回指针写入 argv；未复制／修改字符串内容，也未做 shell 字符转义 |
| `0xc5f4–0xc61c` | mode==2 选择 GOT `0x25844 → execv`；a0=s2，a1=s1=argv；调用点 `0xc618` |
| `0xc624–0xc658` | 若 exec 返回，尾调用 `nixio__perror` |

因此，在主审已确认的 Lua 调用前提下，这个原生绑定实际执行的调用参数是：

```text
execv("/bin/sh", ["/bin/sh", "-c", command, NULL])
```

native 层没有将 command 当成仅一个普通工具参数，也没有保护其中 shell 语法；shell 解释来自显式 `/bin/sh -c`。参数为 Lua 管理的 NUL 结尾字符串指针，没有在这条 mode=2 路径上观察到固定字符数组或无界 `strcpy`。这里只确认数据到 shell 的边界；运行期触发、执行身份和实际影响仍需主审分别表述。

复核命令：

```powershell
python .\udp-lua-native-tools.py regtable F:\fw\x20_root\usr\lib\lua\nixio.so --start 0x25444 --end 0x2550c
python .\udp-lua-native-tools.py native F:\fw\x20_root\usr\lib\lua\nixio.so --start 0xc694 --end 0xc6d0
python .\udp-lua-native-tools.py native F:\fw\x20_root\usr\lib\lua\nixio.so --start 0xc1f4 --end 0xc2e4
python .\udp-lua-native-tools.py native F:\fw\x20_root\usr\lib\lua\nixio.so --start 0xc5c8 --end 0xc65c
```

## 补核：ubus Lua 字符串到 blob 的边界

文件 `usr/lib/lua/ubus.so`，SHA-256：`2bbb332f2d7d9d2cecc5363bbe6cc611c0347224ea39085bd1b1d74258b9e273`。

- `luaopen_ubus @ 0x3074` 在 `0x30f8/0x3130` 注册表 `0x149c8`；`0x149f0` 表项为 `call → 0x1a50`。
- `call @ 0x1a50` 对 arg1 做 userdata 类型检查（`0x1a8c`）、arg2/arg3 做 `luaL_checklstring(...,NULL)`（`0x1aa8/0x1ac4`），要求 arg4 是 table（`0x1ae0`）。随后在 `0x1afc` 初始化 blob buffer，在 `0x1b1c` 调本地表转换 helper `0x12c0`。
- helper `0x12c0` 以 `lua_type` 分派字段值。类型4对应表项 `0x474c`，原始值 `0xfffe49f4` 加 `_gp=0x1ca10` 得到字符串分支 `0x1404`，因此分支映射不是靠位置猜测。
- **字符串分支不是 Lua 实际二进制长度接口**：`0x1410` 调 `lua_tolstring(L,-1,NULL)`；`0x1428` 调 `strlen(pointer)`；`0x1438–0x1454` 调 `blobmsg_add_field(buffer,3,name,pointer,strlen(pointer)+1)`，第五参数显式存到 `sp+16`。内嵌 NUL 后的字节不会传入该 blob 字符串字段。
- 该分支未见复制到本地固定字符数组，也未见 binding 自行执行 `strcpy`；只是把指针与计算长度交给 `blobmsg_add_field`。这不能替代对 libubox 分配／长度编码的检查，也不意味着 binding 对字段做了 MAC 地址格式、长度上限或 shell 转义验证。
- `blobmsg_add_field` 的返回值在 `0x145c–0x1464` 后未作本地成功判断，直接继续迭代；这仅记录 binding 的错误处理边界，未扩展到内存不足触发或 libubox 内部。
- `call` 在 `0x1bf4` 调 `ubus_invoke(ctx, object_id, method, blob, ...)`。本次到此为止，未分析 sync-server，也未发送 ubus 调用。

复核命令：

```powershell
python .\udp-lua-native-tools.py regtable F:\fw\x20_root\usr\lib\lua\ubus.so --start 0x149c8 --end 0x14a18
python .\udp-lua-native-tools.py native F:\fw\x20_root\usr\lib\lua\ubus.so --start 0x1a50 --end 0x1c60
python .\udp-lua-native-tools.py native F:\fw\x20_root\usr\lib\lua\ubus.so --start 0x12c0 --end 0x1468
```
