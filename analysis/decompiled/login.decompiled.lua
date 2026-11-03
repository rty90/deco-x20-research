local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = module
L1_1 = "luci.controller.login"
L2_1 = package
L2_1 = L2_1.seeall
L0_1(L1_1, L2_1)
L0_1 = require
L1_1 = "luci.model.controller"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "nixio"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "nixio.fs"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "luci.sys"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "luci.util"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "luci.tools.debug"
L5_1 = L5_1(L6_1)
L6_1 = require
L7_1 = "luci.service"
L6_1 = L6_1(L7_1)
L7_1 = nil
L8_1 = "/var/run/luci-attempts.lock"
L9_1 = "/tmp/luci-attempts"
L10_1 = 7200
L11_1 = 10

function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = _UPVALUE1_
  L1_2 = L1_2.open
  L2_2 = _UPVALUE2_
  L3_2 = "w"
  L4_2 = 600
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  _UPVALUE0_ = L1_2
  L1_2 = _UPVALUE0_
  L2_2 = L1_2
  L1_2 = L1_2.flock
  if A0_2 then
    L3_2 = "ex"
    if L3_2 then
      goto lbl_16
    end
  end
  L3_2 = "sh"
  ::lbl_16::
  L1_2(L2_2, L3_2)
end

function L13_1()
  local L0_2, L1_2
  L0_2 = _UPVALUE0_
  L1_2 = L0_2
  L0_2 = L0_2.close
  L0_2(L1_2)
  L0_2 = nil
  _UPVALUE0_ = L0_2
end

function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.access
  L1_2 = _UPVALUE1_
  L2_2 = "r"
  L0_2 = L0_2(L1_2, L2_2)
  if not L0_2 then
    L0_2 = {}
    return L0_2
  end
  L0_2 = _UPVALUE2_
  L0_2()
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.readfile
  L1_2 = _UPVALUE1_
  L0_2 = L0_2(L1_2)
  L1_2 = _UPVALUE3_
  L1_2()
  L1_2 = loadstring
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = setfenv
  L3_2 = L1_2
  L4_2 = {}
  L2_2(L3_2, L4_2)
  L2_2 = L1_2
  L2_2 = L2_2()
  L3_2 = assert
  L4_2 = type
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 == "table"
  L3_2(L4_2)
  return L2_2
end

function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = _UPVALUE0_
  L2_2 = true
  L1_2(L2_2)
  L1_2 = _UPVALUE1_
  L1_2 = L1_2.open
  L2_2 = _UPVALUE2_
  L3_2 = "w"
  L4_2 = 600
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L3_2 = L1_2
  L2_2 = L1_2.writeall
  L4_2 = _UPVALUE3_
  L4_2 = L4_2.get_bytecode
  L5_2 = A0_2
  L4_2, L5_2 = L4_2(L5_2)
  L2_2(L3_2, L4_2, L5_2)
  L3_2 = L1_2
  L2_2 = L1_2.close
  L2_2(L3_2)
  L2_2 = _UPVALUE4_
  L2_2()
end

function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L5_2.ltime
    L7_2 = _UPVALUE0_
    L6_2 = L6_2 + L7_2
    L7_2 = _UPVALUE1_
    L7_2 = L7_2.uptime
    L7_2 = L7_2()
    if L6_2 < L7_2 then
      A0_2[L4_2] = nil
    end
  end
end

function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = luci
  L1_2 = L1_2.sys
  L1_2 = L1_2.net
  L1_2 = L1_2.arptable
  L1_2 = L1_2()
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = L6_2["IP address"]
    if L7_2 == A0_2 then
      L7_2 = string
      L7_2 = L7_2.upper
      L8_2 = L6_2["HW address"]
      L9_2 = L8_2
      L8_2 = L8_2.gsub
      L10_2 = ":"
      L11_2 = "%-"
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2, L10_2, L11_2)
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
end

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2
  L1_2 = require
  L2_2 = "luci.model.asycrypto"
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2.Crypto
  L2_2 = "rsa"
  L1_2 = L1_2(L2_2)
  L2_2 = require
  L3_2 = "luci.model.subprocess"
  L2_2 = L2_2(L3_2)
  L3_2 = require
  L4_2 = "luci.model.accountmgnt"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "luci.sauth"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "luci.model.checktypes"
  L5_2 = L5_2(L6_2)
  L6_2 = require
  L7_2 = "luci.model.uci"
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2.cursor
  L6_2 = L6_2()
  L7_2 = require
  L8_2 = "luci.model.uci"
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2.cursor_state
  L7_2 = L7_2()
  L8_2 = {}
  L9_2 = A0_2.username
  if not L9_2 then
    L9_2 = "admin"
  end
  L10_2 = A0_2.password
  L11_2 = _UPVALUE0_
  L11_2 = L11_2.getenv
  L12_2 = "REMOTE_ADDR"
  L11_2 = L11_2(L12_2)
  L12_2 = L1_2.decrypt
  L13_2 = L10_2
  L12_2 = L12_2(L13_2)
  L10_2 = L12_2
  if not L10_2 then
    L12_2 = false
    return L12_2
  end
  L12_2 = nil
  L13_2 = L5_2.check_ip_in_lan
  L14_2 = L11_2
  L13_2 = L13_2(L14_2)
  L13_2 = not L13_2
  L14_2 = require
  L15_2 = "luci.model.app_clientmgmt"
  L14_2 = L14_2(L15_2)
  if not L13_2 then
    L15_2 = L14_2.get_mac_by_ip
    L16_2 = L11_2
    L15_2 = L15_2(L16_2)
    L12_2 = L15_2
    if not L12_2 then
      L15_2 = _UPVALUE1_
      L16_2 = L11_2
      L15_2 = L15_2(L16_2)
      L12_2 = L15_2 or L12_2
      if not L15_2 then
        L12_2 = "00-00-00-00-00-00"
      end
    end
    L15_2 = assert
    L16_2 = L12_2
    L17_2 = "lan mac is nil!"
    L15_2(L16_2, L17_2)
  end
  L15_2 = L11_2 or L15_2
  if not L13_2 or not L11_2 then
    L15_2 = L12_2
  end
  L16_2 = L4_2.limit
  L17_2 = L15_2
  L18_2 = L13_2
  L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
  if not L16_2 then
    L19_2 = L18_2.user
    L8_2.logined_user = L19_2
    L19_2 = L18_2.remote
    L8_2.logined_remote = L19_2
    L19_2 = L18_2.remote
    if L19_2 then
      L19_2 = L18_2.addr
      L8_2.logined_ip = L19_2
    else
      L19_2 = L18_2.addr
      L8_2.logined_mac = L19_2
      L19_2 = L14_2.get_client_by
      L20_2 = "mac"
      L21_2 = L8_2.logined_mac
      L19_2 = L19_2(L20_2, L21_2)
      if L19_2 then
        L20_2 = L19_2.ip
        L8_2.logined_ip = L20_2
        L20_2 = L19_2.hostname
        L8_2.logined_host = L20_2
      end
    end
    L20_2 = L6_2
    L19_2 = L6_2.get
    L21_2 = "administration"
    L22_2 = "login"
    L23_2 = "preempt"
    L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
    if L19_2 == "off" and L11_2 ~= "127.0.0.1" then
      L20_2 = -5001
      L21_2 = L8_2
      return L20_2, L21_2
    end
  end
  L19_2 = _UPVALUE2_
  L19_2 = L19_2()
  L20_2 = _UPVALUE3_
  L21_2 = L19_2
  L20_2(L21_2)
  L20_2 = L19_2[L15_2]
  if not L20_2 then
    L20_2 = {}
    L20_2.attempts = 0
  end
  L21_2 = L20_2.attempts
  L22_2 = _UPVALUE4_
  if L21_2 >= L22_2 then
    L21_2 = {}
    L8_2 = L21_2
    L21_2 = L20_2.attempts
    L8_2.failureCount = L21_2
    L21_2 = _UPVALUE4_
    L22_2 = L20_2.attempts
    L21_2 = L21_2 - L22_2
    L8_2.attemptsAllowed = L21_2
    L21_2 = -5003
    L22_2 = L8_2
    return L21_2, L22_2
  end
  L21_2 = L3_2.compare_cloud_password
  L22_2 = L21_2
  L23_2 = L10_2
  L22_2 = L22_2(L23_2)
  if L22_2 then
    L19_2[L15_2] = nil
    L22_2 = _UPVALUE5_
    L23_2 = L19_2
    L22_2(L23_2)
  else
    L22_2 = L20_2.attempts
    L22_2 = L22_2 + 1
    L20_2.attempts = L22_2
    L22_2 = _UPVALUE0_
    L22_2 = L22_2.uptime
    L22_2 = L22_2()
    L20_2.ltime = L22_2
    L19_2[L15_2] = L20_2
    L22_2 = _UPVALUE5_
    L23_2 = L19_2
    L22_2(L23_2)
    L22_2 = {}
    L8_2 = L22_2
    L22_2 = L20_2.attempts
    L8_2.failureCount = L22_2
    L22_2 = _UPVALUE4_
    L23_2 = L20_2.attempts
    L22_2 = L22_2 - L23_2
    L8_2.attemptsAllowed = L22_2
    L22_2 = -5002
    L23_2 = L8_2
    return L22_2, L23_2
  end
  L22_2 = L2_2.call_output
  L23_2 = {}
  L24_2 = "md5sum"
  L23_2[1] = L24_2
  L24_2 = "admin"
  L25_2 = L10_2
  L24_2 = L24_2 .. L25_2
  L22_2 = L22_2(L23_2, L24_2)
  L23_2 = L22_2
  L22_2 = L22_2.match
  L24_2 = "%x+"
  L22_2 = L22_2(L23_2, L24_2)
  L23_2 = L3_2.password_crypt
  L24_2 = L22_2
  L23_2 = L23_2(L24_2)
  L25_2 = L7_2
  L24_2 = L7_2.section
  L26_2 = "accountmgnt"
  L27_2 = "web_login"
  L28_2 = "web_login"
  L29_2 = {}
  L29_2.password_md5 = L23_2
  L24_2(L25_2, L26_2, L27_2, L28_2, L29_2)
  L25_2 = L7_2
  L24_2 = L7_2.save
  L26_2 = "accountmgnt"
  L24_2(L25_2, L26_2)
  L24_2 = _UPVALUE0_
  L24_2 = L24_2.uniqueid
  L25_2 = 16
  L24_2 = L24_2(L25_2)
  if L17_2 then
    L25_2 = L4_2.kill
    L26_2 = L17_2
    L25_2(L26_2)
  end
  L25_2 = require
  L26_2 = "luci.http"
  L25_2 = L25_2(L26_2)
  L26_2 = L25_2.get_aeskey
  L26_2 = L26_2()
  L27_2 = L25_2.get_seqnum
  L27_2 = L27_2()
  L28_2 = _UPVALUE0_
  L28_2 = L28_2.uniqueid
  L29_2 = 16
  L28_2 = L28_2(L29_2)
  L17_2 = L28_2
  L28_2 = L4_2.write
  L29_2 = L17_2
  L30_2 = {}
  L30_2.addr = L15_2
  L30_2.remote = L13_2
  L30_2.user = L9_2
  L30_2.token = L24_2
  L31_2 = _UPVALUE0_
  L31_2 = L31_2.uniqueid
  L32_2 = 16
  L31_2 = L31_2(L32_2)
  L30_2.secret = L31_2
  if L26_2 then
    L31_2 = L26_2.key
    if L31_2 then
      goto lbl_239
    end
  end
  L31_2 = nil
  ::lbl_239::
  L30_2.aeskey = L31_2
  if L26_2 then
    L31_2 = L26_2.iv
    if L31_2 then
      goto lbl_246
    end
  end
  L31_2 = nil
  ::lbl_246::
  L30_2.aesiv = L31_2
  L30_2.seqnum = L27_2
  L28_2(L29_2, L30_2)
  L28_2 = require
  L29_2 = "luci.controller.domain_login"
  L28_2 = L28_2(L29_2)
  L29_2 = L28_2.tips_cancel
  L29_2()
  L29_2 = L25_2.header
  L30_2 = "Set-Cookie"
  L31_2 = "sysauth="
  L32_2 = L17_2
  L33_2 = ";path="
  L34_2 = _UPVALUE0_
  L34_2 = L34_2.getenv
  L35_2 = "SCRIPT_NAME"
  L34_2 = L34_2(L35_2)
  L31_2 = L31_2 .. L32_2 .. L33_2 .. L34_2
  if not L31_2 then
    L31_2 = ""
  end
  L29_2(L30_2, L31_2)
  L8_2.stok = L24_2
  return L8_2
end

function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L1_2 = require
  L2_2 = "luci.model.asycrypto"
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2.Crypto
  L2_2 = "rsa"
  L1_2 = L1_2(L2_2)
  L2_2 = require
  L3_2 = "luci.model.accountmgnt"
  L2_2 = L2_2(L3_2)
  L3_2 = require
  L4_2 = "luci.sauth"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "luci.model.checktypes"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "luci.model.uci"
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2.cursor
  L5_2 = L5_2()
  L6_2 = {}
  L7_2 = A0_2.username
  if not L7_2 then
    L7_2 = "admin"
  end
  L8_2 = A0_2.password
  L9_2 = _UPVALUE0_
  L9_2 = L9_2.getenv
  L10_2 = "REMOTE_ADDR"
  L9_2 = L9_2(L10_2)
  L10_2 = L1_2.decrypt
  L11_2 = L8_2
  L10_2 = L10_2(L11_2)
  L8_2 = L10_2
  if not L8_2 then
    L10_2 = false
    return L10_2
  end
  L10_2 = nil
  L11_2 = L4_2.check_ip_in_lan
  L12_2 = L9_2
  L11_2 = L11_2(L12_2)
  L11_2 = not L11_2
  L12_2 = require
  L13_2 = "luci.model.app_clientmgmt"
  L12_2 = L12_2(L13_2)
  if not L11_2 then
    L13_2 = L12_2.get_mac_by_ip
    L14_2 = L9_2
    L13_2 = L13_2(L14_2)
    L10_2 = L13_2
    if not L10_2 then
      L13_2 = _UPVALUE1_
      L14_2 = L9_2
      L13_2 = L13_2(L14_2)
      L10_2 = L13_2 or L10_2
      if not L13_2 then
        L10_2 = "00-00-00-00-00-00"
      end
    end
    L13_2 = assert
    L14_2 = L10_2
    L15_2 = "lan mac is nil!"
    L13_2(L14_2, L15_2)
  end
  L13_2 = L9_2 or L13_2
  if not L11_2 or not L9_2 then
    L13_2 = L10_2
  end
  L14_2 = L3_2.limit
  L15_2 = L13_2
  L16_2 = L11_2
  L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
  if not L14_2 then
    L17_2 = L16_2.user
    L6_2.logined_user = L17_2
    L17_2 = L16_2.remote
    L6_2.logined_remote = L17_2
    L17_2 = L16_2.remote
    if L17_2 then
      L17_2 = L16_2.addr
      L6_2.logined_ip = L17_2
    else
      L17_2 = L16_2.addr
      L6_2.logined_mac = L17_2
      L17_2 = L12_2.get_client_by
      L18_2 = "mac"
      L19_2 = L6_2.logined_mac
      L17_2 = L17_2(L18_2, L19_2)
      if L17_2 then
        L18_2 = L17_2.ip
        L6_2.logined_ip = L18_2
        L18_2 = L17_2.hostname
        L6_2.logined_host = L18_2
      end
    end
    L18_2 = L5_2
    L17_2 = L5_2.get
    L19_2 = "administration"
    L20_2 = "login"
    L21_2 = "preempt"
    L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
    if L17_2 == "off" and L9_2 ~= "127.0.0.1" then
      L18_2 = -5001
      L19_2 = L6_2
      return L18_2, L19_2
    end
  end
  L17_2 = _UPVALUE2_
  L17_2 = L17_2()
  L18_2 = _UPVALUE3_
  L19_2 = L17_2
  L18_2(L19_2)
  L18_2 = L17_2[L13_2]
  if not L18_2 then
    L18_2 = {}
    L18_2.attempts = 0
  end
  L19_2 = L18_2.attempts
  L20_2 = _UPVALUE4_
  if L19_2 >= L20_2 then
    L19_2 = {}
    L6_2 = L19_2
    L19_2 = L18_2.attempts
    L6_2.failureCount = L19_2
    L19_2 = _UPVALUE4_
    L20_2 = L18_2.attempts
    L19_2 = L19_2 - L20_2
    L6_2.attemptsAllowed = L19_2
    L19_2 = -5003
    L20_2 = L6_2
    return L19_2, L20_2
  end
  L19_2 = L2_2.compare_cloud_password
  L20_2 = L19_2
  L21_2 = L8_2
  L20_2 = L20_2(L21_2)
  if L20_2 then
    L17_2[L13_2] = nil
    L20_2 = _UPVALUE5_
    L21_2 = L17_2
    L20_2(L21_2)
  else
    L20_2 = L18_2.attempts
    L20_2 = L20_2 + 1
    L18_2.attempts = L20_2
    L20_2 = _UPVALUE0_
    L20_2 = L20_2.uptime
    L20_2 = L20_2()
    L18_2.ltime = L20_2
    L17_2[L13_2] = L18_2
    L20_2 = _UPVALUE5_
    L21_2 = L17_2
    L20_2(L21_2)
    L20_2 = {}
    L6_2 = L20_2
    L20_2 = L18_2.attempts
    L6_2.failureCount = L20_2
    L20_2 = _UPVALUE4_
    L21_2 = L18_2.attempts
    L20_2 = L20_2 - L21_2
    L6_2.attemptsAllowed = L20_2
    L20_2 = -5002
    L21_2 = L6_2
    return L20_2, L21_2
  end
  L20_2 = _UPVALUE0_
  L20_2 = L20_2.uniqueid
  L21_2 = 16
  L20_2 = L20_2(L21_2)
  if L15_2 then
    L21_2 = L3_2.kill
    L22_2 = L15_2
    L21_2(L22_2)
  end
  L21_2 = require
  L22_2 = "luci.http"
  L21_2 = L21_2(L22_2)
  L22_2 = _UPVALUE0_
  L22_2 = L22_2.uniqueid
  L23_2 = 16
  L22_2 = L22_2(L23_2)
  L15_2 = L22_2
  L22_2 = L3_2.write
  L23_2 = L15_2
  L24_2 = {}
  L24_2.addr = L13_2
  L24_2.remote = L11_2
  L24_2.user = L7_2
  L24_2.token = L20_2
  L25_2 = _UPVALUE0_
  L25_2 = L25_2.uniqueid
  L26_2 = 16
  L25_2 = L25_2(L26_2)
  L24_2.secret = L25_2
  L22_2(L23_2, L24_2)
  L22_2 = require
  L23_2 = "luci.controller.domain_login"
  L22_2 = L22_2(L23_2)
  L23_2 = L22_2.tips_cancel
  L23_2()
  L23_2 = L21_2.header
  L24_2 = "Set-Cookie"
  L25_2 = "sysauth="
  L26_2 = L15_2
  L27_2 = ";path="
  L28_2 = _UPVALUE0_
  L28_2 = L28_2.getenv
  L29_2 = "SCRIPT_NAME"
  L28_2 = L28_2(L29_2)
  L25_2 = L25_2 .. L26_2 .. L27_2 .. L28_2
  if not L25_2 then
    L25_2 = ""
  end
  L23_2(L24_2, L25_2)
  L6_2.stok = L20_2
  return L6_2
end

function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.read_rsakey
  L0_2 = L0_2()
  if not L0_2 then
    L1_2 = false
    L2_2 = "no valid rsa key"
    return L1_2, L2_2
  end
  L1_2 = {}
  L2_2 = {}
  L3_2 = L0_2.n
  L4_2 = L0_2.e
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L1_2.key = L2_2
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.gen_seqnum
  L2_2 = L2_2()
  L1_2.seq = L2_2
  return L1_2
end

function L21_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = require
  L1_2 = "luci.model.asycrypto"
  L0_2 = L0_2(L1_2)
  L0_2 = L0_2.Crypto
  L1_2 = "rsa"
  L0_2 = L0_2(L1_2)
  L1_2 = L0_2.read_pubkey
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = L1_2.n
  L4_2 = L1_2.e
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L3_2 = {}
  L3_2.username = ""
  L3_2.password = L2_2
  return L3_2
end

function L22_1()
  local L0_2, L1_2, L2_2
  L0_2 = require
  L1_2 = "luci.model.sync"
  L0_2 = L0_2(L1_2)
  L1_2 = L0_2.read_group_info
  L1_2 = L1_2()
  if L1_2 then
    L2_2 = L1_2.gid
    if L2_2 then
      L2_2 = L1_2.gid
      if L2_2 ~= "" then
        goto lbl_18
      end
    end
  end
  L2_2 = {}
  L2_2.is_default = true
  do return L2_2 end
  goto lbl_21
  ::lbl_18::
  L2_2 = {}
  L2_2.is_default = false
  do return L2_2 end
  ::lbl_21::
end

L23_1 = {}
L24_1 = {}
L25_1 = {}
L25_1.cb = L20_1
L24_1.read = L25_1
L23_1.auth = L24_1
L24_1 = {}
L25_1 = {}
L25_1.cb = L21_1
L24_1.read = L25_1
L23_1.keys = L24_1
L24_1 = {}
L25_1 = {}
L25_1.cb = L18_1
L24_1.login = L25_1
L23_1.login = L24_1
L24_1 = {}
L25_1 = {}
L25_1.cb = L22_1
L24_1.read = L25_1
L23_1.check_factory_default = L24_1
L24_1 = {}
L25_1 = {}
L25_1.cb = L19_1
L24_1.login = L25_1
L23_1.mini_login = L24_1
L24_1 = {}
L25_1 = {}
L25_1.cb = L21_1
L24_1.read = L25_1
L23_1.cloud_login = L24_1

function L24_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.print
  L2_2 = "do difspatch login"
  L1_2(L2_2)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.dumptable
  L2_2 = A0_2
  L1_2(L2_2)
  if A0_2 then
    L1_2 = A0_2.params
    if L1_2 then
      L1_2 = A0_2.params
      L2_2 = A0_2.operation
      L1_2.operation = L2_2
    end
  end
  L1_2 = L0_1
  L1_2 = L1_2.simple_dispatch
  L2_2 = _UPVALUE2_
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end

dispatch = L24_1

function L24_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2._index
  L1_2 = dispatch
  return L0_2(L1_2)
end

_index = L24_1

function L24_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = entry
  L1_2 = {}
  L2_2 = "login"
  L1_2[1] = L2_2
  L2_2 = call
  L3_2 = "_index"
  L2_2, L3_2 = L2_2(L3_2)
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  L0_2.leaf = true
end

index = L24_1
