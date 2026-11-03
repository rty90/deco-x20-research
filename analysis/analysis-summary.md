# Deco X20 v3 1.1.8 Build 20240119：离线核查

核查日期：2026-10-25（America/Los_Angeles）。

## 范围与原件

- 用户提供的 rootfs：`F:\fw\x20_root`。未修改。
- 本地升级镜像：`F:\fw\x20_118\X20 3.0_en_1.1.8 Build 20240119 Rel. 37701_US_EU_JP_B4_EG_SE_up.bin`。
- 本地镜像与本次重新下载的官方 ZIP 内同名镜像 SHA-256 相同：`38d84e4c71f6d7022f7382afd79636b89e756d9dce4815972fe5e434a88dcf82`。
- 官方下载页：https://www.tp-link.com/us/support/download/deco-x20/v3/
- 没有独立重新提取并逐文件比对整个 rootfs；rootfs 与升级镜像的关联由用户提供。
- 未对设备发包、登录、执行命令、重启或更改配置；没有执行固件里的 Lua/ELF。

## 已确认的静态事实

### AP 模式与 mesh 角色

`etc/init.d/tmpsvr:7`、`etc/init.d/sync-server:7` 启动服务，不含系统 AP 模式停服分支。`sync-server:28` 的系统模式判断只影响 DHCP hook 的重启。

`sysmode.sysmode.mode=AP` 表示系统工作模式；`repacd.repacd.DeviceType=AP/RE` 表示 mesh 主节点/从节点角色。两者不能混用（`etc/init.d/repacd:1711`）。

`lib/sync-server/scripts/probe:511,567,576,584,639` 分别读取 br-lan 地址、广播地址、选择 AP 模式组件、创建 tdp_client、发送同步探测。消息中有 `sync.encrypt_table` 调用。这说明 AP 同步路径保留；不证明运行时的流量、接口过滤或密码学强度。

### TMP 与 TDP

`usr/bin/tmpsvr` SHA-256：`60c6eb19079af64de9d420355a94a93e75241b3190537b139d6dc52bc594a598`。

静态分析发现 TCP TMP 与 UDP TDP 共用 relay_run，但传入不同的操作码表；0xc505 不在静态 TDP 表中。表外操作还涉及运行时文件 `/var/run/lookup_op_re_only`，不能单凭静态表断言运行时绝对不可达。详见同目录 `tdp-static-notes.md`。

本版 libtmpv2 的客户端支持 SSH 隧道：默认外层端口 20001（可由 `/tmp/ssh_client_port` 覆盖），通过 ssh_channel_open_forward 连接远端 127.0.0.1:20002。这是库实现证据，不是现场流量观测。

`usr/bin/tmp-luci:13` 根据 UCI 状态与组信息决定 opcode 白名单开关；`tmp.decompiled.lua:560` 起从环境获取 URI/FORM/OPERATION，并调用对应模块的 dispatch。因此该 TMP 入口不能与 HTTP 路由认证视作同一条入口。

### quick_setup

实际模块是 `usr/lib/lua/luci/controller/admin/mobile_app/quick_setup.lua`。

- `quick_setup.decompiled.lua:4189` 注册 heartbeat；其 read/sync 回调分别在 1594、1606 行，都会向 radar 请求 update，并非纯返回固定状态。
- `quick_setup.decompiled.lua:4194` 注册 eponymous_detect；299 行起的实现会调用无线扫描函数。
- 本模块没有 tss 表单，也没有 index() 注册函数；不能把模块存在等同于已经注册 HTTP `/admin/quick_setup`。
- `admin_index.decompiled.lua:36` 设置 admin 节点 sysauth=true；`dispatcher.decompiled.lua:916` 起进入会话与 token 检查。
- 上述事实不能证明所有 TMP/HTTP/云代理路径的认证均正确，也没有证明已配置 AP 设备上存在 pre-auth 修改入口。

### 密钥与配置

Dropbear host key、客户端登录公钥、mesh group key 具有不同用途。镜像中的 host key 或 product-info 密钥，不能仅凭长度或可分解性当作 root 登录凭据。

`etc/config/dropbear` 的默认 section 类型与 `etc/init.d/dropbear:188` 遍历的 dropbear2 类型不同。运行时还有 discover 生成配置的代码。因此镜像默认密码、配置和 authorized_keys 文件，不是运行态凭据的完整证据。

## 方法与限制

`normalize_lnum.py` 只写分析副本：将 Lua 5.1 LNUM 头和 tag-9 int32 常量转为标准格式，原指令字节保持不变，并检查完整解析到文件结尾；随后使用从源码编译的 unluac 静态反编译。

反编译输出缺少原调试符号，含 `_UPVALUE..._` 占位和自动变量名；完整闭包绑定、认证控制流和动态路由仍需进一步核对。反编译文本不作为设备可执行代码。

未确认现场回程类型、运行时配置、动态操作码文件、实际密钥或当前网络连接。插网线不单独证明有线回程已建立。

## 公开资料边界

- TP-Link AP/Router 功能对照：https://www.tp-link.com/us/support/faq/2399/
- 有线回程与 IEEE 1905.1：https://www.tp-link.com/us/support/faq/1794/
- CCS24 mesh 研究：https://www.cs.ucr.edu/~zhiyunq/pub/ccs24_wireless_mesh.pdf
- 作者 Deco 示例为 X55，不是本 X20：https://github.com/seclab-ucr/CCS24Mesh/blob/main/TP-Link/README.md
- CVE-2026-15469 官方列 XE75/XE5300/WE10800，不能迁移到 X20：https://www.tp-link.com/us/support/faq/5263/

ARP 只影响相关 IPv4 单播的邻居解析，不能统一重定向二层 IEEE 1905.1、广播/组播或 IPv6；截获 SSH 数据也不等于可解密或注入。鉴于设备不能断网，本次没有采用 ARP 欺骗或主动探测。
