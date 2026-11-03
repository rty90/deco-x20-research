# Deco X20 v3：TMP/TDP 离线证据

调查日期：2026-10-25。输入为用户提供的 `F:\fw\x20_root`，标识为 X20 v3、1.1.8 Build 20240119 Rel.37701。本记录只核对该解包中的文件；没有连接设备、执行固件程序、发包、重启服务或修改解包。没有提取或输出密钥。

## 结论

**该 X20 固件的 TMP 与 TDP 具有独立解析/事务路径，但共享 `relay_run` CGI 中转函数；它们传入不同的静态操作码表。** `0xc505` 存在于 TMP 表，指向 `admin.mobile_app.debug / tty2tcp / start`；TDP 表不含该项。不能因为共享中转函数，就断言 UDP 20002 可直接调用 TCP 的这个入口。

同时，`relay_run` 还有读取运行态 `/var/run/lookup_op_re_only` 的分支。仅凭离线静态表，不能排除运行态补充分发；该分支需要结合 Lua 逻辑、实际文件与认证条件另行判断。本记录没有证明 UDP `0xc505` 可达，也没有证明设备在 AP 模式下的实时监听或可利用性。

## 对应文件与地址

| 文件 | SHA-256 |
|---|---|
| `usr/bin/tmpsvr` | `60c6eb19079af64de9d420355a94a93e75241b3190537b139d6dc52bc594a598` |
| `usr/bin/tmpcli` | `f7e14c57d9f6a81b3a9f65454eff4b396eadb17f063c8d953c1da0397ecb45db` |
| `usr/bin/tmp-luci` | `08ee3bb84c39c1df9f7e43aabfa1f0f7a71757e9c066714bc157bbadf2730f84` |
| `usr/lib/libtmpv2.so` | `b7d7cddd067c9fc4b1edf8b365c05502ed433780016cd0f8e1588bc54c8ccec0` |

ELF 为小端 MIPS32r2，无节表但保留 `PT_DYNAMIC`、动态字符串/符号表。使用现有 Python 标准库读取它们，以及有限的 MIPS 指令解码；没有安装反编译工具。下列地址均为 ELF 虚拟地址，不是文件偏移。

| 证据 | 地址与含义 |
|---|---|
| 两条事务入口 | 动态符号 `tmp_trans_feed=0x406a6c`、`tdp_trans_feed=0x408d88` |
| 共用 CGI 中转 | 动态符号 `relay_run=0x409740`；TMP 区调用点 `0x4059b0` 和 `tdp_trans_feed` 内调用点 `0x408e84` 的 `BAL` 都指向它 |
| 两张表 | TMP 调用把 `a1=0x41fa80` 传入，共 503 项；TDP 调用把 `a1=0x421a10` 传入，共 5 项，零项终止 |
| 请求中的操作码位置 | TMP 区在 `0x40585c` 使用 `LHU ... 18(a1)`；TDP 在 `0x408e48` 使用 `LHU ... 2(a1)`。这是本版结构位置证据，不是完整线格式定义 |
| 所问操作码 | TMP 表项位于 `0x4218a0`，值为 `0xc505`，控制器/方法映射见结论；TDP 表遍历没有该值 |
| 协议区分仍保留 | TMP 传 `SERVER_PROTOCOL=TMP/2.0`；TDP 传 `SERVER_PROTOCOL=TDP/2.0`，另设置 `NO_CHECKSUM` 环境项 |
| 表外分支 | `relay_run` 在表未命中等情况下打开 `/var/run/lookup_op_re_only`，按 `0x%04x` 形式检索；未匹配走 `Unsupported opcode` 路径。这里没有观察到自动改查 TMP 总表 |

`tmp-luci` 文本还显示：只有 `firewall.security.opcode_whitelist == "1"` 时才进一步决定白名单开关；没有 `group_info.gid` 时开启，存在该 gid 时关闭。是否启用和其实际限制范围，应由 Lua 调查结果解释，不能把这个文本直接当作任意操作可执行的证据。

## 本版客户端的 SSH/TCP 分层

这是 X20 输入文件的静态证据，不再仅是 X55 类比：

- `libtmpv2.so` 的 `0x4bb4` 经 GOT 装载 `ssh_channel_open_forward`，`0x4bc8` 调用它；参数 `a1` 指向 `127.0.0.1`，`a2=20002`。因此该 SSH 路径请求远端回环地址的 **TCP 20002** 通道。参数含义见 [libssh 原始 API 文档](https://api.libssh.org/stable/group__libssh__channel.html)。
- `tmp_client_new` 在 `0x4eec` 一带把默认端口字符串 `20001` 放入缓冲区；若 `/tmp/ssh_client_port` 存在，可从该文件覆盖；`0x4f9c` 调 `ssh_options_set`，option 为 2，即 `SSH_OPTIONS_PORT_STR`，传入该缓冲区。枚举及语义见 [libssh 头文件](https://api.libssh.org/stable/libssh_8h_source.html) 和 [会话 API](https://api.libssh.org/stable/group__libssh__session.html)。
- 库同时有直接 TCP 和 SSH 两类客户端路径；`tmpcli` 包含 “Use ssh tunnel” 选项说明。上述证据表明**库支持默认 SSH 20001 → 回环 TCP 20002**，不表示每次调用都使用 SSH，也不证明在役设备目前采用默认外层端口。

## 公开研究及可迁移边界

1. **TMP 公共客户端源码**：[ropbear/tmpcli](https://github.com/ropbear/tmpcli)，[tmp.py](https://raw.githubusercontent.com/ropbear/tmpcli/main/src/tmp.py)、[tmpclient.py](https://raw.githubusercontent.com/ropbear/tmpcli/main/src/tmpclient.py)。访问于 2026-10-25，仓库说明未给出明确测试机型/固件。其 DATA 帧使用 16 字节外层头和 8 字节业务头，并明确使用 `SOCK_STREAM`；业务操作码位于总帧偏移 18。源码把末尾字段写成可能是 token 或 padding，不能把作者不确定处改写为已确认协议规范。**本版 X20 的完整 TMP/2.0 头、分片、认证状态机尚未逐字段恢复，不能直接将这个客户端全部格式套入。**

2. **TDP 原始研究**：[ZDI：Exploiting the TP-Link Archer A7 at Pwn2Own Tokyo](https://www.thezdi.com/blog/2020/4/6/exploiting-the-tp-link-archer-c7-at-pwn2own-tokyo)，页面日期 2020-04-07（URL 的 c7 与标题不同）。研究对象是 Archer A7 AC1750 v5、固件 190726，`tdpServer` 的 LAN UDP 20002。文章给出 16 字节 TDP 头：version/type、opcode、length、flags/alignment、serial、checksum；opcode 在外层偏移 2，与上述 TCP TMP 包头层次不同。该文及其 CVE-2020-10882 不能证明 X20 受影响。

3. **较新的 Archer TDP 研究**：[NCC MeshyJSON](https://www.nccgroup.com/research/meshyjson-a-tp-link-tdpserver-json-stack-overflow/)。测试发生在 2022-11，设备 Archer AX21(US) v3.6、1.1.1 Build 20220603；文章记载 2022-12-02 发布修复版 1.1.3 Build 20221125。它研究 TDP JSON 数组处理的栈溢出，仍不是本 X20 的处理函数或版本证明。文章没有给出 CVE 编号，不在此擅自匹配。

4. **Deco TCP 研究**：[Untangling the Knot 的 TP-Link 原始伴随页](https://untanglingthekn0t.com/TP-Link/)，对应 [CCS 2024 论文](https://www.cs.ucr.edu/~zhiyunq/pub/ccs24_wireless_mesh.pdf)，会议 2024-10-14 至 18。伴随页示例明确为 Deco X55、1.2.2 Build 20230301 Rel.53300；其 `0xc505` 证据经过 SSH 转发到 localhost TCP 20002，不能改称直接 UDP 入口证明。本 X20 的调用表结论来自上面的本地文件，而非照搬 X55。

5. **CVE-2026-15469**：[TP-Link 官方公告](https://www.tp-link.com/us/support/faq/5263/)，[研究者仓库](https://github.com/tony102741/CVE-2026-15469)，[技术分析](https://raw.githubusercontent.com/tony102741/CVE-2026-15469/main/docs/technical-analysis.md)。研究者记载 CVE 发布于 2026-08-24，分析样本 1.3.1 Build 20251023 rel.43624；公开列出的对象为 XE75 v3、XE5300 v3.6、WE10800 v3.6，修复版 1.5.0 Build 20260603。报告的 UDP→`tmp-luci` 流程和 `group-info` 节点认证材料，不等于 X20 的已验证缺陷；`group-info` 认证材料也不应与产品信息或 Dropbear 主机密钥混为一谈。

6. **容易混淆的 TDDP**：TP-Link 于 2026-10-01 更新的 [CVE-2026-17176](https://www.tp-link.com/us/support/faq/5293/) 涉及 Deco BE11000 v2（修复 1.3.5 Build26071712）和 M9 Plus v2（修复 1.9.2 Build20260818）的 TDDP 命令注入；同日更新的 [CVE-2026-8618](https://www.tp-link.com/us/support/faq/5322/) 涉及 M9 Plus v2 的 `/usr/bin/tddp`、TDDPv2 subtype 0x91、设备设置阶段的 pre-auth 栈溢出，修复同为 1.9.2 Build20260818。**TDDP、这里的 TDP 和 TCP TMP 不能只凭名字相近合并为一层；公告也没有把 X20 v3 列为这些漏洞的受影响产品。**

## 复核

```powershell
python F:\IF\hads\gup\output\deco-x20-offline\elf-static-check.py F:\fw\x20_root
```

脚本仅使用 Python 标准库；先核对上述 SHA-256，随后读取 ELF 映射、符号、有限调用指令和表结构。若输入哈希不同会停止，避免误用地址。2026-10-25 实际运行退出码为 0：两处调用均指向同一 `relay_run`，两张表分别为 503/5 项，TDP 表不含 `0xc505`，SSH 转发参数及默认/覆盖端口字符串均吻合。

未完成项：完整 TMP/TDP 字节级协议恢复、运行态 `lookup_op_re_only` 内容、下游 Lua 所有权限检查、AP 模式实际监听/防火墙状态以及任何网络行为验证。本记录不以静态检查代替这些证据。
