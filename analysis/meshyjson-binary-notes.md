# X20 tmpsvr 与 NCC MeshyJSON 的离线比对

日期：2026-10-25。输入：`F:\fw\x20_root`，用户提供的 Deco X20 v3、1.1.8 Build 20240119 Rel.37701 解包。本次仅读取二进制、脚本及已有反编译产物；没有运行固件、发包、构造触发输入、安装工具或改动解包。本记录不含密钥或利用代码。

## 结论

**未在本版 `tmpsvr` 及其动态依赖闭包中找到 NCC 所述的 cJSON 数组到固定 32 字节栈数组的处理链。** 这有三层证据：动态导入和依赖不匹配；特定字段与函数标记不存在；实际可见的 TDP 事务路径把原始 body 转交 CGI，JSON 解码位于下游 Lua 层。

这个结论不是“所有 JSON 数组越界均不存在”，也不是完整可利用性鉴定。动态符号没有出现，不能单独排除经过静态链接、去符号、内联或改写的代码。本次没有逐函数恢复整个机器码、所有 Lua 控制器和全部 native 模块；未发现的是 **`data.onemesh_support_version` → cJSON 数组长度/元素 → 固定栈数组** 这一具体路径。

## 原研究的确切根因

[NCC 原文：MeshyJSON](https://www.nccgroup.com/research/meshyjson-a-tp-link-tdpserver-json-stack-overflow/) 的对象是 **Archer AX21(US) v3.6、1.1.1 Build 20220603**，发现/利用于 2022 年 11 月，2022-12-02 发布的 **1.1.3 Build 20221125** 修复。当前页面没有明确文章发布日期。

原文 `processProbePacket`（该 AX21 二进制 VA `0x00029360`）调用 `cJSON_ParseWithLength`，取 `data.onemesh_support_version` 数组，再经 `cJSON_GetArraySize` / `cJSON_GetArrayItem` 逐项取数值，转换成单字节，写进栈结构的 32 字节成员。缺陷是循环没有目标数组上界检查，**不是 `strcpy`**。Patch 段另称函数为 `processPacketMethod`；展示的新增条件是数组长度 **`>= 32` 时跳过**，不能改述成只拒绝 `> 32`。

公开资料未建立 AX21 与这个 X20 构建的共同源码/提交关系。二者架构不同也不能排除共享 C 源码。NCC PoC 的线格式版本字段与 X20 设置的 CGI `SERVER_PROTOCOL=TDP/2.0` 属于不同层，不能直接相互比较。

## 文件身份和动态依赖

使用已有 `elf-static-check.py` 中的 `ELF32` 读取器，由 `PT_DYNAMIC` / `DT_STRTAB` / `DT_SYMTAB` / `DT_MIPS_SYMTABNO` 恢复完整动态表。没有通过 `ldd` 或动态加载来执行这些文件。依赖文件的 SONAME 与下表目标匹配。

| 文件 | SHA-256 | 动态符号表项数 |
|---|---|---:|
| `usr/bin/tmpsvr` | `60c6eb19079af64de9d420355a94a93e75241b3190537b139d6dc52bc594a598` | 140 |
| `lib/libubox.so` | `9bbbb2abca8159909b55a46b6957df76d4d1f922b40792ce43ab5d8308f20eb6` | 174 |
| `usr/lib/libuuid.so.1.3.0` | `114d6eeb88d9fdf3c74a59e2f787707003ac2c3b98f0f8eca13614b8bc807b0e` | 64 |
| `usr/lib/libz.so.1.2.7` | `93a0f47e474d30b40ed82315b7b093032a3f7b337fe78965c912b7686c793363` | 114 |
| `lib/libuClibc-0.9.33.2.so` | `ec7eee5b47c5bd2df3141007a4eca8b3b8be4bdaf3d90d11bfabc57f6adf74bf` | 1334 |
| `lib/ld-uClibc-0.9.33.2.so` | `60e0bcf049c5bdf243e62a2ac9f50e2def8b355fdcead72a67b3c7315f493bd3` | 82 |

`tmpsvr` 的全部 `DT_NEEDED` 为 `libubox.so`、`libuuid.so.1`、`libz.so.1`、`libc.so.0`。前三者仅继续需要 `libc.so.0`；libc 需要 `ld-uClibc.so.0`；该 loader 没有后续 `DT_NEEDED`。这条闭包内没有 cJSON/JSON 库依赖，也没有名称包含 `cJSON` 或 `json` 的动态导入/导出。

对这些文件做完整字节串检索，均未命中 `onemesh_support_version`、`processProbePacket`、`tdpOneMesh.c`、`cJSON_ParseWithLength`、`cJSON_GetArraySize`、`cJSON_GetArrayItem`。`tmpsvr` 自身也没有 `dlopen` / `dlsym` 或 `blobmsg` 动态导入。

`libubox` 虽然导出 `blobmsg_parse_array`（VA `0x39ac`）、`blobmsg_check_array`（`0x37f4`）和 `blobmsg_parse`（`0x3b28`），但 `tmpsvr` 没有导入这些函数；它们不能被当作 cJSON 处理链证据。根文件系统中其他 JSON 库的存在，也不等于被这个进程加载。

`tmpsvr` 导入了 `memcpy`、`memmove`、`strncpy`、`sprintf`、`snprintf` 等通用内存/格式化函数。仅有这些名字不能认定溢出；没有 `strcpy` 导入同样不能证明无溢出。

## UDP body 的实际可见路径

以下都是上述哈希 `tmpsvr` 的 ELF VA，不能套用到其他构建。

| 位置 | 离线可验证事实 | 对比含义 |
|---|---|---|
| `0x407b68` / `0x407b90` | 经 GOT 取 `recvfrom` 后调用；`0x407b8c` 将长度参数 `a2` 设为 `0x400` | 接收的是报文字节，接收长度限制本身不是数组目的缓冲区安全证明 |
| `0x40822c` | `BAL` 目标是 `tdp_trans_feed=0x408d88` | UDP 接收处理进入 TDP 事务层 |
| `0x408e84` | `tdp_trans_feed` 调 `relay_run=0x409740` | 与前次离线检查一致，进入 CGI 中转层 |
| `0x408ef4`–`0x408f00` | 装载 `ustream_write`；从报文偏移 4 读取长度，body 指针为报文地址加 16，调用 stream write | 这里把原始 body 送到流；没有出现 NCC 那种 cJSON 数组元素读取及逐个字节写栈数组的序列 |
| `0x409e94` / `0x409e9c` | `relay_run` 装载并调用 `execl`，目标字符串是 `/usr/bin/tmp-luci` | JSON/控制器工作跨入另一个程序，不能只审计 tmpsvr 导入就称整个请求链已审完 |

这确认的是静态调用及参数关系，不是实际运行的 UDP 可达性、认证通过、AP 模式监听或某个请求成功。

## 下游 Lua / JSON 边界

`usr/bin/tmp-luci` 的文本入口要求 `luci.sgi.tmp`，最终调用其 `run()`。入口文件 SHA-256：`08ee3bb84c39c1df9f7e43aabfa1f0f7a71757e9c066714bc157bbadf2730f84`。

| 原始字节码 | SHA-256 | 观察 |
|---|---|---|
| `usr/lib/lua/luci/sgi/tmp.lua` | `0d0132237ecaefbb9a970592870ef1854b777ae757807dbb81217714cfb1c8b8` | 包含 `luci.json`、`decode`；已有反编译第 14–16 行为 require；第 1192–1194 行调用 `.decode`，第 1212 行后调用 `dispose_opcode` |
| `usr/lib/lua/luci/json.lua` | `ac3e0d0423ef9f8c32bf18618e25c5acf94a1f51764d875f390c2296f1a52977` | Lua 字节码，存在 `Decoder`、`parse_array`、`parse_object`、`parse_number` 等常量；本次没有完整恢复该模块实现 |
| `usr/lib/lua/luci/controller/discover.lua` | `ddba941bd22031b8ed3d65a5c8070d85b3dd4572551e49cf9a4da2cb33cbb2cd` | 包含 `luci.json` 和 `decode`；已有反编译第 11 行 require 名称，第 189、263、1103 行出现 decode 调用 |

这三个原始 Lua 文件均未包含 `onemesh_support_version` 或上述 cJSON API 名称。已有反编译仍保留 `_UPVALUE` 占位，因此不能把函数成员名和顶部 require 自动视为所有闭包绑定已复原；但它们足以说明下游仍有 JSON 处理，需要与 `tmpsvr` 的原生导入检查分开。

可复核位置：

- [已有 tmp 反编译，JSON 调用](F:/IF/hads/gup/output/deco-x20-offline/tmp.decompiled.lua:1192)
- [已有 discover 反编译](F:/IF/hads/gup/output/deco-x20-offline/discover.decompiled.lua:189)
- [前次 ELF 静态读取脚本](F:/IF/hads/gup/output/deco-x20-offline/elf-static-check.py)
- [前次 TMP/TDP 分发记录](F:/IF/hads/gup/output/deco-x20-offline/tdp-static-notes.md)

## 未覆盖项

- 没有排除所有静态链接、内联或重新命名的 JSON 实现，也没有穷举每个数组写入与边界条件。
- 没有完整检查 Lua 解码器、所有控制器调用的原生扩展、子进程，以及运行态增补的模块。
- 没有取得运行态路由、防火墙、`lookup_op_re_only` 内容或认证结果，未进行任何行为测试。
- 没有凭端口相同、TDP 名称相同、出现通用复制函数或架构不同，认定漏洞存在或不存在。

本次交付是**对具体已知根因的证据比对**：目前没有找到把 NCC MeshyJSON 从 AX21 映射到该 X20 构建的代码证据。

## 补充：解包目录的特定标记检索

主审补查了 `onemesh_support_version`、`tdpOneMesh.c`、`processProbePacket` 三个字面字节串。首次 `rg` 返回 2：Windows 无法打开解包里的 Linux 链接/重解析项，因此没有把该次结果当成成功的全目录扫描。

随后使用 Python 只读取普通文件，明确跳过重解析项：读取 **2,272 个文件**，跳过 **472 个重解析项**，普通文件读取错误 **0**，三个标记命中文件 **0**。扫描没有跟随链接、加载二进制或连接设备。该结果只覆盖可读普通文件中的原样字节串，不排除编码、运行时构造、改名或压缩内容。
