# 家庭网络设备识别与公开公告核查

核查日期：2026-10-21。此报告基于用户描述和公开原始资料，未扫描、登录、重置或修改局域网设备；设备的准确型号、固件及账户归属仍待确认。用户要求保留现有配置，不恢复出厂。

## 1. OpenSSH 10.2 与 RTSP/5000

这两个服务不足以确认 Linux、树莓派或录像机。OpenSSH 版本不是硬件型号指纹，RTSP 也不只用于监控。

值得优先考虑 AirPlay 音频接收器：Apple 官方列出 TCP 5000 用于 AirPlay；Shairport Sync 的官方配置明确写出经典 AirPlay 使用 5000，AirPlay 2 使用 7000。该项目可运行于 Linux、FreeBSD、macOS、OpenBSD 和树莓派等设备。因此，Linux 主机或树莓派上的音频接收服务是有证据支持的候选，但不能排除其他实现或 Mac。

纯软件识别可结合已有的完整 SSH banner、实际 RTSP 响应头、DHCP 主机名及 mDNS 服务公告。`_raop._tcp` / `_airplay._tcp` 支持 AirPlay 解释，但不能独自确认硬件型号。扫描器仅按端口显示的服务名称，比实际协议响应证据弱；扫描范围内未发现其他开放端口，也不代表所有 TCP/UDP 服务均不存在。

来源：[Apple 端口表](https://support.apple.com/en-nz/103229)、[Shairport Sync 配置](https://github.com/mikebrady/shairport-sync/blob/master/scripts/shairport-sync.conf)、[项目支持平台](https://github.com/mikebrady/shairport-sync)。

## 2. SSH 巡检与 fail2ban

“7 个用户名 × 20 个密码逐个尝试”属于密码猜测，不适合作为日常巡检的登录流程。这里不提供调整猜密速率、间隔或探测封禁阈值的方法。

- 仅从远端 SSH 超时、拒绝连接等现象，无法可靠确认 fail2ban；防火墙、连接限制等也能产生类似结果。
- 有已有管理会话或本地管理终端时，可检查服务状态、已启用的 jail 和封禁日志；安装了 fail2ban 不代表 SSH jail 已启用。
- `findtime` 是失败统计窗口，`bantime` 是封禁时长。上游默认值不能代表目标实际配置；发行版和每个 jail 可以覆盖它们。
- 定时封禁通常按配置解除，但也可能配置永久封禁或递增封禁；不能保证等一个固定时间就恢复。
- 巡检应使用预置专用账户和密钥，认证失败即停止并报告。丢失账户时走管理员或厂商恢复流程。

来源：[Fail2ban 配置手册](https://manpages.debian.org/unstable/fail2ban/jail.conf.5.en.html)。

## 3. TP-Link Deco 公告

`luci`、`stok`、`keys/auth/login`、`ozker` 路径不能单独确认固件来源或漏洞适用性。公开返回登录所需公钥也不自动构成认证绕过。Archer 或通用 OpenWrt/LuCI 的漏洞不能仅凭路径相似套到 Deco。

官方公告入口：[TP-Link 产品安全中心](https://www.tp-link.com/uk/product-security/)。以下是已核对的具体案例，不是对用户设备的漏洞判定，也不是完整历史清单。

| 公告 | 官方列出的型号/硬件版 | 官方修复信息 |
|---|---|---|
| [CVE-2026-17176](https://www.tp-link.com/us/support/faq/5293/)：命令注入 | Deco BE11000 v2；M9 Plus v2 | 分别为 1.3.5 Build 26071712；1.9.2 Build 20260818 |
| [CVE-2026-15469](https://www.tp-link.com/uk/support/faq/5263/)：Mesh 认证使用共享硬编码密钥 | XE75 v3；XE5300 v3.6；WE10800 v3.6 | 1.5.0 Build 20260603 Rel.14401 |
| [CVE-2026-5040](https://www.tp-link.com/uk/support/faq/5190/)：弱密码哈希 | M5 v1 | 1.9.4 Build 20260312 Rel.17129；公告前提包括已经取得哈希或拥有高权限访问 |
| [CVE-2026-0654、0655、22229](https://www.tp-link.com/us/support/faq/4993/)：命令注入、路径遍历等 | BE25 v1.0，固件不高于 1.1.1 Build 20250822 | 公告要求已认证的邻近攻击者；建议更新对应地区最新固件，但未明确首个修复版本 |

匹配时必须核对型号、硬件版、地区和完整固件号。前三条给出的是修复固件，不等于完整枚举所有受影响旧版本。

有管理账号时，软件识别方法：

- Deco App 的网络地图中点选各节点，可查看节点名称、IP、MAC 和相关详情。
- 在线客户端列表中的详情可显示 IP、MAC 和所连接的 Deco，帮助把地址与实际设备对应。
- 固件可在“更多 → 系统 → 更新 Deco”查看；部分 App 版本为“更多 → 更新 Deco”。硬件版本是否显示取决于型号和界面。

来源：[节点/客户端关联方法](https://www.tp-link.com/us/support/faq/3036/)、[固件版本查询](https://www.tp-link.com/us/support/faq/2818/)、[硬件版本查询](https://www.tp-link.com/us/support/faq/46/)。没有管理账号时，外部服务信息通常只能形成候选，不能保证读到精确硬件版。

## 4. Cox / Technicolor / Vantiva 网关

`Xfinity Broadband Router Server` banner 和 `check.jst` 不足以对应具体型号、运营商固件分支或漏洞。Cox 官方明确列出 CGM4141、CGM4331；本轮没有找到支持将用户设备认定为 CGM4332 的官方证据。

本轮未找到能够据现有信息确认为适用于这台设备的权威 CVE 条目。这是证据不足，不是“没有漏洞”的证明。不要将其他 Technicolor/Vantiva 型号的公告或 Cable Haunt 等家族问题直接标记为该设备已受影响。

实际核查顺序：

1. 从 Cox 账户设备记录或正常登录的网关状态页确认完整型号。
2. 记录完整 Software/Firmware Version；账户设备页不保证显示完整固件 build。
3. 将精确型号与 CVE/厂商公告的受影响范围对应，再由 Cox 确认其运营商固件分支是否部署修复。

Cox 的 Panoramic 服务包括自动软件更新；不能用其他运营商同类设备的版本号大小判断本机补丁状态。本轮也未找到这些型号的完整公开逐版本安全公告目录。

来源：[Cox 设备型号清单](https://www.cox.com/residential/support/certified-cable-modems.html)、[Cox 自动更新说明](https://www.cox.com/residential/internet/learn/panoramic-upgrade-program.html)、[官方支持](https://www.cox.com/residential/contactus.html)。

## 5. SMB 协商字段与 Windows 版本

原描述中有一个重要编号错误：签名算法 2 是 AES-GMAC，不是 AES-CMAC。

| 字段所属结构 | 值 | 含义 |
|---|---|---|
| SigningAlgorithms | 0x0000 | HMAC-SHA256 |
| SigningAlgorithms | 0x0001 | AES-CMAC |
| SigningAlgorithms | 0x0002 | AES-GMAC |
| Ciphers | 0x0002 | AES-128-GCM |
| HashAlgorithms | 0x0001 | SHA-512 |
| ContextType | 0x0008 | SMB2_SIGNING_CAPABILITIES |

来源：[签名算法定义](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/cb9b5d66-b6be-4d18-aa66-8784a871cc10)、[加密算法定义](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/16693be7-2b27-4d3b-804b-f605bde5bcdd)。

微软文档说明 Windows 10 及以前、Windows Server v20H2 及以前不发送/处理 SMB2_SIGNING_CAPABILITIES；GMAC 签名由 Windows 11 / Server 2022 引入。因此，若值 2 确实来自目标 NEGOTIATE 响应的签名上下文，并且已确定是原生 Windows SMB 实现，它与 Windows 10 1903/1909 不符，符合更晚的产品范围。

必须检查报文方向与字段：请求列表表示客户端提供的能力；响应中的签名算法表示为这条连接选择的算法，计数应为 1。不要将 Cipher=2、ContextType=2 或 SecurityMode=2 当成 SigningAlgorithm=2。

SMB 3.1.1、AES-128-GCM、SHA-512、多通道、持久句柄不能唯一映射 Windows build；其他实现如 Samba/NAS 也能提供相关能力。缺失某项也不总能说明不支持，因为结果受双方协商与配置影响。没有可靠的一一对应表；官方 Product Behavior 附录提供功能边界，不是精确系统指纹。

来源：[微软产品行为附录](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/a64e55aa-1152-48e4-8206-edd96444e7f7)、[SMB 安全功能](https://learn.microsoft.com/en-us/windows-server/storage/file-server/smb-security)、[签名响应定义](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/91897c76-e3a2-4601-b3ce-40f343fa4a6d)。

要决定是否升级，请设备使用者在本机运行 `winver`，核实版本与 build。Windows 10 1909 全部版本已于 2022-05-10 前结束服务；协商字段不能证明已安装安全补丁。[微软生命周期说明](https://learn.microsoft.com/lifecycle/announcements/windows-10-1909-enterprise-education-eos)。

## 6. 不重置、保留配置的账户恢复

用户说明：管理密码、邮箱均不清楚，没有已登录 App，也找不到登记电话或账单账号，且不愿重置。此时没有能保证成功的通用远程软件恢复方法。

- 可以在自己已有授权的浏览器密码管理器中查找曾保存的 TP-Link、Cox 登录项；这只是查已有记录，不保证存在，也不需要导出整个密码库。
- Wi-Fi 密码与云端账户、本地管理密码不同。曾连接过网络的 Windows 设备可能仍保存 Wi-Fi 密码，可通过系统设置查看；这不恢复设备管理权限。[微软说明](https://support.microsoft.com/en-us/windows/experience/connectivity-networking/connect-to-a-wi-fi-network-in-windows)。
- Cox 的自助找回 User ID 支持登记电话或账单账户号等信息，不必先知道邮箱；这些均不可用时，应由开户人联系官方人工支持，询问可接受的身份和服务归属证明。不能保证仅凭服务地址就可重置账号。[User ID 找回](https://www.cox.com/residential/support/trouble-signing-in-on-the-cox-website.html)、[密码恢复](https://www.cox.com/residential/support/resetting-your-cox-password.html)、[人工支持入口](https://www.cox.com/residential/contactus.html)。
- 可先查自己能访问的历史电子账单、安装单、购买记录、银行卡宽带扣款，或确认是否由房东/物业开户。这些是找回开户关系的线索，不是身份核验的替代品。
- TP-Link ID 邮箱完全忘记时，未找到官方保证可用的自助查回邮箱功能。可联系官方支持核查，是否能恢复及需要哪些证据由支持方决定。[TP-Link 账户恢复说明](https://www.tp-link.com/us/support/faq/1442/)、[官方支持](https://www.tp-link.com/us/support/contact-technical-support/)。
- 在恢复账户前，可以继续分析已有端口、banner、服务公告和本机网络信息，但这些不能代替管理身份验证或保证读取完整固件信息。

本次仅完成公开资料研究与说明文件编写，没有重置、解绑、修改设备配置、尝试密码或改变防护设置。
