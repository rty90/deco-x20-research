local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1
L0_1 = module
L1_1 = "luci.controller.discover"
L2_1 = package
L2_1 = L2_1.seeall
L0_1(L1_1, L2_1)
L0_1 = require
L1_1 = "luci.model.controller"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "luci.json"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "luci.model.sync"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "luci.model.getfirm"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "luci.model.subprocess"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "luci.tools.debug"
L5_1 = L5_1(L6_1)
L6_1 = require
L7_1 = "nixio"
L6_1 = L6_1(L7_1)
L7_1 = require
L8_1 = "luci.model.accountmgnt"
L7_1 = L7_1(L8_1)
L8_1 = require
L9_1 = "luci.sys"
L8_1 = L8_1(L9_1)
L9_1 = 4
L10_1 = require
L11_1 = "luci.controller.admin.mobile_app.quick_setup"
L10_1 = L10_1(L11_1)
L11_1 = require
L12_1 = "bit"
L11_1 = L11_1(L12_1)
L12_1 = require
L13_1 = "ubus"
L12_1 = L12_1(L13_1)
L13_1 = require
L14_1 = "luci.model.uci"
L13_1 = L13_1(L14_1)
L13_1 = L13_1.cursor
L14_1 = "/tmp"
L13_1 = L13_1(L14_1)
L14_1 = require
L15_1 = "luci.model.uci"
L14_1 = L14_1(L15_1)
L14_1 = L14_1.cursor_state
L14_1 = L14_1()
L15_1 = "/tmp/work_mode"
L16_1 = "/tmp/ssh_client_port"

function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = require
  L1_2 = "luci.sys"
  L0_2 = L0_2(L1_2)
  L1_2 = L0_2.exec
  L2_2 = "getfirm MAC"
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.trim
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "-"
  L4_2 = ":"
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = L1_2
  L1_2 = L1_2.upper
  L1_2 = L1_2(L2_2)
  L2_2 = require
  L3_2 = "luci.model.wireless_common"
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.get_channel
  L3_2 = L3_2()
  L4_2 = require
  L5_2 = "luci.model.mode"
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.is_tri_band_support
  L5_2 = L5_2()
  L6_2 = L4_2.is_band_6g_support
  L6_2 = L6_2()
  L7_2 = _UPVALUE0_
  L7_2 = L7_2.call_output
  L8_2 = {}
  L9_2 = "ifconfig"
  L10_2 = "br-lan"
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2
  L7_2 = L7_2.match
  L9_2 = "inet addr:([%d%.]+)"
  L7_2 = L7_2(L8_2, L9_2)
  if L5_2 == true then
    if L6_2 == true then
      L8_2 = {}
      L8_2.ip = L7_2
      L8_2.mac = L1_2
      L9_2 = _UPVALUE1_
      L9_2 = L9_2.get_device_id
      L9_2 = L9_2()
      L8_2.device_id = L9_2
      L9_2 = _UPVALUE2_
      L9_2 = L9_2.getfirm_cached
      L10_2 = "MODEL"
      L9_2 = L9_2(L10_2)
      L8_2.device_model = L9_2
      L9_2 = _UPVALUE1_
      L9_2 = L9_2.get_firmware_version
      L9_2 = L9_2()
      L8_2.firmware_ver = L9_2
      L9_2 = L3_2["2g"]
      L8_2.channel_2g = L9_2
      L9_2 = L3_2["5g"]
      L8_2.channel_5g = L9_2
      L9_2 = L3_2["6g"]
      L8_2.channel_6g = L9_2
      return L8_2
    else
      L8_2 = {}
      L8_2.ip = L7_2
      L8_2.mac = L1_2
      L9_2 = _UPVALUE1_
      L9_2 = L9_2.get_device_id
      L9_2 = L9_2()
      L8_2.device_id = L9_2
      L9_2 = _UPVALUE2_
      L9_2 = L9_2.getfirm_cached
      L10_2 = "MODEL"
      L9_2 = L9_2(L10_2)
      L8_2.device_model = L9_2
      L9_2 = _UPVALUE1_
      L9_2 = L9_2.get_firmware_version
      L9_2 = L9_2()
      L8_2.firmware_ver = L9_2
      L9_2 = L3_2["2g"]
      L8_2.channel_2g = L9_2
      L9_2 = L3_2["5g"]
      L8_2.channel_5g = L9_2
      L9_2 = L3_2["5g_2"]
      L8_2.channel_5g_2 = L9_2
      return L8_2
    end
  else
    L8_2 = {}
    L8_2.ip = L7_2
    L8_2.mac = L1_2
    L9_2 = _UPVALUE1_
    L9_2 = L9_2.get_device_id
    L9_2 = L9_2()
    L8_2.device_id = L9_2
    L9_2 = _UPVALUE2_
    L9_2 = L9_2.getfirm_cached
    L10_2 = "MODEL"
    L9_2 = L9_2(L10_2)
    L8_2.device_model = L9_2
    L9_2 = _UPVALUE1_
    L9_2 = L9_2.get_firmware_version
    L9_2 = L9_2()
    L8_2.firmware_ver = L9_2
    L9_2 = L3_2["2g"]
    L8_2.channel_2g = L9_2
    L9_2 = L3_2["5g"]
    L8_2.channel_5g = L9_2
    return L8_2
  end
end

function L18_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = io
  L0_2 = L0_2.open
  L1_2 = _UPVALUE0_
  L2_2 = "r"
  L0_2 = L0_2(L1_2, L2_2)
  if not L0_2 then
    L1_2 = false
    L2_2 = "open file failed"
    return L1_2, L2_2
  end
  L1_2 = _UPVALUE1_
  L1_2 = L1_2.decode
  L3_2 = L0_2
  L2_2 = L0_2.read
  L4_2 = "*a"
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L3_2 = L0_2
  L2_2 = L0_2.close
  L2_2(L3_2)
  if not L1_2 then
    L2_2 = false
    L3_2 = "falied to get work_mode info"
    return L2_2, L3_2
  end
  L2_2 = L1_2.cap_mac
  if L2_2 then
    L2_2 = L1_2.cap_mac
    L3_2 = L2_2
    L2_2 = L2_2.gsub
    L4_2 = ":"
    L5_2 = "-"
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = L2_2
    L2_2 = L2_2.upper
    L2_2 = L2_2(L3_2)
    L1_2.cap_mac = L2_2
  end
  L2_2 = L1_2.cap_mac
  L3_2 = L1_2.work_mode
  return L2_2, L3_2
end

function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = require
  L2_2 = "luci.model.uci"
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2.cursor_state
  L2_2 = L2_2()
  L4_2 = L2_2
  L3_2 = L2_2.get
  L5_2 = "repacd"
  L6_2 = "repacd"
  L7_2 = "DeviceType"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if L3_2 ~= "AP" then
    L4_2 = true
    return L4_2
  end
  L4_2 = "/var/run/record_devid"
  L5_2 = io
  L5_2 = L5_2.open
  L6_2 = L4_2
  L7_2 = "r"
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = {}
  if L5_2 == nil then
    L7_2 = _UPVALUE0_
    L7_2 = L7_2.print
    L8_2 = "error open file failed:"
    L9_2 = L4_2
    L8_2 = L8_2 .. L9_2
    L7_2(L8_2)
    L7_2 = false
    return L7_2
  end
  L8_2 = L5_2
  L7_2 = L5_2.read
  L9_2 = "*all"
  L7_2 = L7_2(L8_2, L9_2)
  L9_2 = L5_2
  L8_2 = L5_2.close
  L8_2(L9_2)
  L8_2 = _UPVALUE1_
  L8_2 = L8_2.decode
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  L6_2 = L8_2
  if L6_2 == nil then
    L8_2 = false
    return L8_2
  end
  L8_2 = 1
  L9_2 = #L6_2
  L10_2 = 1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = L6_2[L11_2]
    if A0_2 == L12_2 then
      L12_2 = true
      return L12_2
    end
  end
  L8_2 = _UPVALUE0_
  L8_2 = L8_2.print
  L9_2 = A0_2
  L10_2 = " not in record_devid, need boost probe"
  L9_2 = L9_2 .. L10_2
  L8_2(L9_2)
  L8_2 = false
  return L8_2
end

function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = ":"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.sub
  L3_2 = L1_2
  L4_2 = 1
  L5_2 = 6
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = string
  L3_2 = L3_2.sub
  L4_2 = L1_2
  L5_2 = 7
  L6_2 = 12
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = tonumber
  L5_2 = L3_2
  L6_2 = 16
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 - 1
  L5_2 = string
  L5_2 = L5_2.format
  L6_2 = "%x"
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  L3_2 = L5_2
  L5_2 = string
  L5_2 = L5_2.sub
  L6_2 = L2_2
  L7_2 = 1
  L8_2 = 2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = ":"
  L7_2 = string
  L7_2 = L7_2.sub
  L8_2 = L2_2
  L9_2 = 3
  L10_2 = 4
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = ":"
  L9_2 = string
  L9_2 = L9_2.sub
  L10_2 = L2_2
  L11_2 = 5
  L12_2 = 6
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = ":"
  L11_2 = string
  L11_2 = L11_2.sub
  L12_2 = L3_2
  L13_2 = 1
  L14_2 = 2
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = ":"
  L13_2 = string
  L13_2 = L13_2.sub
  L14_2 = L3_2
  L15_2 = 3
  L16_2 = 4
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  L14_2 = ":"
  L15_2 = string
  L15_2 = L15_2.sub
  L16_2 = L3_2
  L17_2 = 5
  L18_2 = 6
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L1_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
  L6_2 = L1_2
  L5_2 = L1_2.upper
  return L5_2(L6_2)
end

function L21_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = _UPVALUE0_
  L2_2 = L1_2
  L1_2 = L1_2.set
  L3_2 = "ssh_port_detect"
  L4_2 = "ssh_port_detect"
  L5_2 = "ts_"
  L6_2 = A0_2
  L5_2 = L5_2 .. L6_2
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = _UPVALUE0_
  L2_2 = L1_2
  L1_2 = L1_2.commit
  L3_2 = "ssh_port_detect"
  L1_2(L2_2, L3_2)
end

function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = require
  L1_2 = "ubus"
  L0_2 = L0_2(L1_2)
  L1_2 = L0_2.connect
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.call
  L4_2 = "sync"
  L5_2 = "debug"
  L6_2 = {}
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L4_2 = L1_2
  L3_2 = L1_2.close
  L3_2(L4_2)
  L3_2 = L2_2.boost_count
  if L3_2 then
    L3_2 = L2_2.boost_count
    if 0 < L3_2 then
      goto lbl_25
    end
  end
  L3_2 = L2_2.boost_emmc_count
  if L3_2 then
    L3_2 = L2_2.boost_emmc_count
    if 0 < L3_2 then
      ::lbl_25::
      L3_2 = true
      return L3_2
  end
  else
    L3_2 = false
    return L3_2
  end
end

function L23_1()
  local L0_2, L1_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.fs
  L0_2 = L0_2.access
  L1_2 = "/tmp/deco_dev"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = true
    return L0_2
  end
  L0_2 = false
  return L0_2
end

function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = _UPVALUE0_
  L2_2 = L1_2
  L1_2 = L1_2.get
  L3_2 = "ssh_port_detect"
  L4_2 = "ssh_port_detect"
  L5_2 = "ts_"
  L6_2 = A0_2
  L5_2 = L5_2 .. L6_2
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L2_2 = _UPVALUE1_
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = 60
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = 1500
  ::lbl_17::
  if L1_2 then
    L3_2 = os
    L3_2 = L3_2.time
    L3_2 = L3_2()
    L4_2 = tonumber
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2 - L4_2
    if L2_2 > L3_2 then
      L3_2 = true
      return L3_2
    end
  end
  L3_2 = false
  return L3_2
end

function L25_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = false
  L2_2 = _UPVALUE0_
  L3_2 = L2_2
  L2_2 = L2_2.foreach
  L4_2 = "dropbear"
  L5_2 = "dropbear2"
  
  function L6_2(A0_3)
    local L1_3
    L1_3 = A0_3.Port
    if L1_3 == "22" then
      L1_3 = true
      _UPVALUE0_ = L1_3
      L1_3 = false
      return L1_3
    end
  end
  
  L2_2(L3_2, L4_2, L5_2, L6_2)
  if not L1_2 and A0_2 then
    L2_2 = _UPVALUE0_
    L3_2 = L2_2
    L2_2 = L2_2.add
    L4_2 = "dropbear"
    L5_2 = "dropbear2"
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = _UPVALUE0_
    L4_2 = L3_2
    L3_2 = L3_2.set
    L5_2 = "dropbear"
    L6_2 = L2_2
    L7_2 = "Port"
    L8_2 = "22"
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = _UPVALUE0_
    L4_2 = L3_2
    L3_2 = L3_2.set
    L5_2 = "dropbear"
    L6_2 = L2_2
    L7_2 = "RootPasswordAuth"
    L8_2 = "on"
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = _UPVALUE0_
    L4_2 = L3_2
    L3_2 = L3_2.set
    L5_2 = "dropbear"
    L6_2 = L2_2
    L7_2 = "SysAccountLogin"
    L8_2 = "off"
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = _UPVALUE0_
    L4_2 = L3_2
    L3_2 = L3_2.set
    L5_2 = "dropbear"
    L6_2 = L2_2
    L7_2 = "PasswordAuth"
    L8_2 = "on"
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = _UPVALUE0_
    L4_2 = L3_2
    L3_2 = L3_2.save
    L5_2 = "dropbear"
    L3_2(L4_2, L5_2)
    L3_2 = _UPVALUE1_
    L3_2 = L3_2.fork_call
    L4_2 = "/etc/init.d/dropbear reload"
    L3_2(L4_2)
  elseif L1_2 and not A0_2 then
    L2_2 = _UPVALUE0_
    L3_2 = L2_2
    L2_2 = L2_2.revert
    L4_2 = "dropbear"
    L2_2(L3_2, L4_2)
    L2_2 = _UPVALUE1_
    L2_2 = L2_2.fork_call
    L3_2 = "/etc/init.d/dropbear reload"
    L2_2(L3_2)
  end
end

function L26_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = io
  L1_2 = L1_2.open
  L2_2 = _UPVALUE0_
  L3_2 = "r"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L3_2 = L1_2
    L2_2 = L1_2.read
    L4_2 = "*n"
    L2_2 = L2_2(L3_2, L4_2)
    L4_2 = L1_2
    L3_2 = L1_2.close
    L3_2(L4_2)
    if L2_2 == A0_2 then
      return
    end
  end
  L2_2 = io
  L2_2 = L2_2.open
  L3_2 = _UPVALUE0_
  L4_2 = "w"
  L2_2 = L2_2(L3_2, L4_2)
  L1_2 = L2_2
  if L1_2 then
    L3_2 = L1_2
    L2_2 = L1_2.write
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    L3_2 = L1_2
    L2_2 = L1_2.close
    L2_2(L3_2)
  end
end

function L27_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.tmp_port_ver
  if not L1_2 then
    L1_2 = _UPVALUE0_
    L2_2 = "v0"
    L1_2(L2_2)
  else
    L1_2 = A0_2.tmp_port_ver
    if L1_2 == "v1" then
      L1_2 = _UPVALUE0_
      L2_2 = "v1"
      L1_2(L2_2)
    end
  end
  L1_2 = _UPVALUE1_
  L2_2 = "v0"
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = _UPVALUE1_
    L2_2 = "v1"
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      goto lbl_28
    end
  end
  L1_2 = _UPVALUE2_
  L2_2 = true
  L1_2(L2_2)
  goto lbl_31
  ::lbl_28::
  L1_2 = _UPVALUE2_
  L2_2 = false
  L1_2(L2_2)
  ::lbl_31::
  L1_2 = _UPVALUE1_
  L2_2 = "v0"
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = _UPVALUE3_
    L2_2 = 22
    L1_2(L2_2)
  else
    L1_2 = _UPVALUE3_
    L2_2 = 20001
    L1_2(L2_2)
  end
end

function L28_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = require
  L2_2 = "luci.model.uci"
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2.cursor_state
  L1_2 = L1_2()
  L2_2 = _UPVALUE0_
  L2_2 = L2_2()
  L3_2 = require
  L4_2 = "luci.model.mode"
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.is_dcmp_device
  L4_2 = L4_2()
  L2_2.firmware_ver = nil
  L5_2 = _UPVALUE1_
  L5_2 = L5_2.sync_boost
  L5_2()
  L5_2 = _UPVALUE1_
  L5_2 = L5_2.read_group_info
  L5_2 = L5_2()
  L6_2 = _UPVALUE2_
  L6_2 = L6_2.is_dft_account_exist
  L6_2 = L6_2()
  if L5_2 then
    L7_2 = L5_2.gid
    if L7_2 and false == L6_2 then
      L7_2 = _UPVALUE3_
      L7_2 = L7_2.call_output
      L8_2 = {}
      L9_2 = "md5sum"
      L8_2[1] = L9_2
      L9_2 = L5_2.gid
      L7_2 = L7_2(L8_2, L9_2)
      L8_2 = L7_2
      L7_2 = L7_2.match
      L9_2 = "%x+"
      L7_2 = L7_2(L8_2, L9_2)
      L2_2.group_id = L7_2
      L2_2.factory_default = false
  end
  else
    if L5_2 then
      L7_2 = L5_2.gid
      if L7_2 and true == L6_2 then
        L7_2 = _UPVALUE1_
        L7_2 = L7_2.get_role
        L7_2 = L7_2()
        if L7_2 == "RE" then
          L2_2.factory_default = false
        else
          L2_2.factory_default = true
        end
    end
    else
      L2_2.factory_default = true
    end
  end
  L7_2 = _UPVALUE3_
  L7_2 = L7_2.call_output
  L8_2 = {}
  L9_2 = "md5sum"
  L8_2[1] = L9_2
  L9_2 = L2_2.device_id
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L7_2
  L7_2 = L7_2.match
  L9_2 = "%x+"
  L7_2 = L7_2(L8_2, L9_2)
  L2_2.device_id = L7_2
  L7_2 = _UPVALUE4_
  L7_2 = L7_2.getfirm_cached
  L8_2 = "DEVICE_TYPE"
  L7_2 = L7_2(L8_2)
  L2_2.device_type = L7_2
  L7_2 = _UPVALUE4_
  L7_2 = L7_2.getfirm_cached
  L8_2 = "HARDVERSION"
  L7_2 = L7_2(L8_2)
  L2_2.hardware_version = L7_2
  L7_2 = _UPVALUE5_
  L7_2, L8_2 = L7_2()
  if L7_2 ~= false then
    if L8_2 == "RE" then
      L2_2.role = "slave"
      if L7_2 and L7_2 ~= "" then
        L10_2 = L1_2
        L9_2 = L1_2.foreach
        L11_2 = "bind_device_list"
        L12_2 = "device"
        
        function L13_2(A0_3)
          local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
          L1_3 = A0_3.mac
          L2_3 = L1_3
          L1_3 = L1_3.gsub
          L3_3 = ":"
          L4_3 = "-"
          L1_3 = L1_3(L2_3, L3_3, L4_3)
          L2_3 = L1_3
          L1_3 = L1_3.upper
          L1_3 = L1_3(L2_3)
          L2_3 = _UPVALUE0_
          if L1_3 == L2_3 then
            L2_3 = tostring
            L3_3 = A0_3[".name"]
            L2_3 = L2_3(L3_3)
            L3_3 = _UPVALUE1_
            L4_3 = _UPVALUE2_
            L4_3 = L4_3.call_output
            L5_3 = {}
            L6_3 = "md5sum"
            L5_3[1] = L6_3
            L6_3 = L2_3
            L4_3 = L4_3(L5_3, L6_3)
            L5_3 = L4_3
            L4_3 = L4_3.match
            L6_3 = "%x+"
            L4_3 = L4_3(L5_3, L6_3)
            L3_3.master_device_id = L4_3
          end
        end
        
        L9_2(L10_2, L11_2, L12_2, L13_2)
      end
    elseif L8_2 == "FAP" or L8_2 == "HAP" then
      L2_2.role = "master"
      L9_2 = L2_2.device_id
      L2_2.master_device_id = L9_2
    else
      L10_2 = L1_2
      L9_2 = L1_2.get
      L11_2 = "repacd"
      L12_2 = "repacd"
      L13_2 = "DeviceType"
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
      if L9_2 == "AP" then
        L10_2 = "master"
        if L10_2 then
          goto lbl_120
        end
      end
      L10_2 = "slave"
      ::lbl_120::
      L2_2.role = L10_2
    end
    if L4_2 then
      L9_2 = L2_2.master_device_id
      if L9_2 then
        L9_2 = L2_2.master_device_id
      end
      if L9_2 == "" and L8_2 == "RE" then
        L2_2.role = "slave"
        if L7_2 and L7_2 ~= "" then
          L9_2 = require
          L10_2 = "luci.controller.admin.mobile_app.device"
          L9_2 = L9_2(L10_2)
          L11_2 = L1_2
          L10_2 = L1_2.foreach
          L12_2 = "bind_device_list"
          L13_2 = "device"
          
          function L14_2(A0_3)
            local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
            L1_3 = A0_3.mac
            L2_3 = L1_3
            L1_3 = L1_3.gsub
            L3_3 = ":"
            L4_3 = "-"
            L1_3 = L1_3(L2_3, L3_3, L4_3)
            L2_3 = L1_3
            L1_3 = L1_3.upper
            L1_3 = L1_3(L2_3)
            L2_3 = _UPVALUE0_
            L2_3 = L2_3.mac_degree
            L3_3 = _UPVALUE1_
            L2_3 = L2_3(L3_3)
            if L1_3 == L2_3 then
              L2_3 = tostring
              L3_3 = A0_3[".name"]
              L2_3 = L2_3(L3_3)
              L3_3 = _UPVALUE2_
              L4_3 = _UPVALUE3_
              L4_3 = L4_3.call_output
              L5_3 = {}
              L6_3 = "md5sum"
              L5_3[1] = L6_3
              L6_3 = L2_3
              L4_3 = L4_3(L5_3, L6_3)
              L5_3 = L4_3
              L4_3 = L4_3.match
              L6_3 = "%x+"
              L4_3 = L4_3(L5_3, L6_3)
              L3_3.master_device_id = L4_3
            end
          end
          
          L10_2(L11_2, L12_2, L13_2, L14_2)
        end
      end
    end
  end
  L9_2 = L2_2.master_device_id
  if L9_2 then
    L9_2 = L2_2.master_device_id
    if L9_2 ~= "" then
      goto lbl_159
    end
  end
  L9_2 = _UPVALUE6_
  L9_2 = L9_2.print
  L10_2 = "[discover.lua] master_device_id is not found"
  L9_2(L10_2)
  ::lbl_159::
  L9_2 = 1
  L11_2 = L1_2
  L10_2 = L1_2.foreach
  L12_2 = "accountmgnt"
  L13_2 = "cloud_account"
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.username_md5
    if L1_3 then
      L1_3 = A0_3.username_md5
      username = L1_3
    else
      L1_3 = _UPVALUE0_
      L1_3 = L1_3.call_output
      L2_3 = {}
      L3_3 = "md5sum"
      L2_3[1] = L3_3
      L3_3 = A0_3.username
      L1_3 = L1_3(L2_3, L3_3)
      L2_3 = L1_3
      L1_3 = L1_3.match
      L3_3 = "%x+"
      L1_3 = L1_3(L2_3, L3_3)
      username = L1_3
    end
    L1_3 = A0_3.version
    if L1_3 then
      L1_3 = tonumber
      L2_3 = A0_3.version
      L1_3 = L1_3(L2_3)
      _UPVALUE1_ = L1_3
    end
  end
  
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L10_2 = username
  L2_2.owner = L10_2
  L2_2.need_account_digest = false
  if L9_2 == 2 then
    L2_2.need_account_digest = true
  end
  L11_2 = L1_2
  L10_2 = L1_2.get
  L12_2 = "wifi"
  L13_2 = "ap"
  L14_2 = "ssid"
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  if not L10_2 or L10_2 == "" then
    L11_2 = _UPVALUE6_
    L11_2 = L11_2.print
    L12_2 = "ap ssid is illegal"
    L11_2(L12_2)
  else
    L11_2 = _UPVALUE7_
    L11_2 = L11_2.bin
    L11_2 = L11_2.b64encode
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    L2_2.group_name = L11_2
  end
  L11_2 = {}
  L11_2.provider = ""
  if L4_2 then
    L12_2 = require
    L13_2 = "luci.model.mode"
    L12_2 = L12_2(L13_2)
    L13_2 = _UPVALUE1_
    L13_2 = L13_2.read_group_info
    L13_2 = L13_2()
    L14_2 = L12_2.is_isp_onboarding
    L14_2 = L14_2()
    if L14_2 and L13_2 then
      L14_2 = L13_2.gid
      if L14_2 then
        L14_2 = L13_2.key
        if L14_2 then
          L14_2 = L12_2.get_extra_isp
          L14_2 = L14_2()
          if not L14_2 then
            L14_2 = L11_2
          end
          L2_2.extra_isp = L14_2
        end
      end
    end
  else
    L12_2 = require
    L13_2 = "luci.model.mode"
    L12_2 = L12_2(L13_2)
    L13_2 = L12_2.is_isp_onboarding
    L13_2 = L13_2()
    if L13_2 then
      L13_2 = L12_2.get_extra_isp
      L13_2 = L13_2()
      if not L13_2 then
        L13_2 = L11_2
      end
      L2_2.extra_isp = L13_2
    end
  end
  L12_2 = require
  L13_2 = "luci.model.uci"
  L12_2 = L12_2(L13_2)
  L12_2 = L12_2.cursor
  L12_2 = L12_2()
  L13_2 = tonumber
  L15_2 = L12_2
  L14_2 = L12_2.get_first
  L16_2 = "dropbear"
  L17_2 = "dropbear2"
  L18_2 = "Port"
  L14_2, L15_2, L16_2, L17_2, L18_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  if not L13_2 then
    L13_2 = 20001
  end
  L14_2 = {}
  L15_2 = L13_2
  L14_2[1] = L15_2
  L2_2.tmp_port = L14_2
  L14_2 = _UPVALUE8_
  L14_2 = L14_2()
  if L14_2 then
    L2_2.banner_type = 1
  end
  L14_2 = _UPVALUE6_
  L14_2 = L14_2.print
  L15_2 = "Discover:"
  L16_2 = _UPVALUE9_
  L16_2 = L16_2.encode
  L17_2 = L2_2
  L16_2 = L16_2(L17_2)
  L15_2 = L15_2 .. L16_2
  L14_2(L15_2)
  return L2_2
end

function L29_1(A0_2)
  local L1_2, L2_2
  L1_2 = _UPVALUE0_
  L2_2 = A0_2
  return L1_2(L2_2)
end

_discover = L29_1

function L29_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.read_group_info
  L1_2 = L1_2()
  L2_2 = L1_2.gid
  if L2_2 then
    L2_2 = A0_2.group_hid
    L3_2 = _UPVALUE1_
    L3_2 = L3_2.bin
    L3_2 = L3_2.crc32
    L4_2 = L1_2.gid
    L3_2 = L3_2(L4_2)
    if L2_2 == L3_2 then
      goto lbl_18
    end
  end
  L2_2 = -3000
  L3_2 = "group hid mismatched"
  do return L2_2, L3_2 end
  ::lbl_18::
  L2_2 = A0_2.secret
  if not L2_2 then
    L2_2 = false
    L3_2 = "no secret"
    return L2_2, L3_2
  end
  L2_2 = _UPVALUE2_
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.decrypt_table
  L3_2 = A0_2.secret
  L4_2 = L1_2.key
  L2_2 = L2_2(L3_2, L4_2)
  A0_2 = L2_2
  if A0_2 then
    L2_2 = A0_2.group_id
    L3_2 = L1_2.gid
    if L2_2 == L3_2 then
      goto lbl_42
    end
  end
  L2_2 = -3000
  L3_2 = "group id mismatched"
  do return L2_2, L3_2 end
  ::lbl_42::
  L2_2 = A0_2.emmc_config_version
  if not L2_2 then
    L2_2 = false
    L3_2 = "no emmc version"
    return L2_2, L3_2
  end
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.get_emmc_config_version
  L2_2 = L2_2()
  L3_2 = A0_2.device_id
  L4_2 = _UPVALUE0_
  L4_2 = L4_2.get_device_id
  L4_2 = L4_2()
  if L3_2 ~= L4_2 then
    L3_2 = false
    L4_2 = _UPVALUE0_
    L4_2 = L4_2.compare_config_version
    L5_2 = L2_2
    L6_2 = A0_2.emmc_config_version
    L4_2 = L4_2(L5_2, L6_2)
    if 0 < L4_2 then
      L3_2 = true
    end
    L4_2 = A0_2.device_id
    if not L4_2 then
      L3_2 = true
    end
    if not L3_2 then
      L4_2 = "/tmp/sync-server/mesh_dev_list_emmc"
      L5_2 = io
      L5_2 = L5_2.open
      L6_2 = L4_2
      L7_2 = "r"
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = {}
      if L5_2 ~= nil then
        L8_2 = L5_2
        L7_2 = L5_2.read
        L9_2 = "*all"
        L7_2 = L7_2(L8_2, L9_2)
        L9_2 = L5_2
        L8_2 = L5_2.close
        L8_2(L9_2)
        L8_2 = _UPVALUE3_
        L8_2 = L8_2.decode
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        L6_2 = L8_2
      end
      L7_2 = A0_2.device_id
      L7_2 = L6_2[L7_2]
      if L7_2 then
        L8_2 = L7_2.role
        L9_2 = A0_2.role
        if L8_2 == L9_2 then
          L8_2 = L7_2.ip
          L9_2 = A0_2.ip
          if L8_2 == L9_2 then
            L8_2 = L7_2.fw_version
            L9_2 = A0_2.firmware_ver
            if L8_2 == L9_2 then
              L8_2 = L7_2.config_version
              L9_2 = A0_2.config_version
              if L8_2 == L9_2 then
                goto lbl_112
              end
            end
          end
        end
      end
      L3_2 = true
    end
    ::lbl_112::
    if L3_2 then
      L4_2 = _UPVALUE0_
      L4_2 = L4_2.sync_boost_emmc
      L4_2()
    end
  end
  L3_2 = {}
  L4_2 = L1_2.gid
  L3_2.group_id = L4_2
  L3_2.emmc_config_version = L2_2
  L4_2 = _UPVALUE0_
  L4_2 = L4_2.get_role
  L4_2 = L4_2()
  L3_2.role = L4_2
  L4_2 = _UPVALUE4_
  L4_2 = L4_2.call_output
  L5_2 = {}
  L6_2 = "ifconfig"
  L7_2 = "br-lan"
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2
  L4_2 = L4_2.match
  L6_2 = "inet addr:([%d%.]+)"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.ip = L4_2
  L4_2 = require
  L5_2 = "luci.sys"
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.exec
  L6_2 = "getfirm MAC"
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2
  L5_2 = L5_2.trim
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2
  L5_2 = L5_2.gsub
  L7_2 = "-"
  L8_2 = ":"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L5_2
  L5_2 = L5_2.upper
  L5_2 = L5_2(L6_2)
  L3_2.mac = L5_2
  L5_2 = _UPVALUE0_
  L5_2 = L5_2.get_firmware_version
  L5_2 = L5_2()
  L3_2.firmware_ver = L5_2
  L5_2 = _UPVALUE0_
  L5_2 = L5_2.get_device_id
  L5_2 = L5_2()
  L3_2.device_id = L5_2
  L5_2 = {}
  L6_2 = _UPVALUE0_
  L6_2 = L6_2.encrypt_table
  L7_2 = L3_2
  L8_2 = L1_2.key
  L6_2 = L6_2(L7_2, L8_2)
  L5_2.secret = L6_2
  return L5_2
end

function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.read_group_info
  L1_2 = L1_2()
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.read_dft_group_info
  L2_2 = L2_2()
  L3_2 = nil
  L4_2 = false
  L5_2 = false
  L6_2 = require
  L7_2 = "luci.model.mode"
  L6_2 = L6_2(L7_2)
  L7_2 = L6_2.is_band_6g_support
  L7_2 = L7_2()
  L8_2 = L6_2.is_band_6g2_support
  L8_2 = L8_2()
  L9_2 = L6_2.is_dcmp_device
  L9_2 = L9_2()
  L10_2 = L1_2.gid
  if L10_2 then
    L10_2 = A0_2.group_hid
    L11_2 = _UPVALUE1_
    L11_2 = L11_2.bin
    L11_2 = L11_2.crc32
    L12_2 = L1_2.gid
    L11_2 = L11_2(L12_2)
    if L10_2 == L11_2 then
      L4_2 = true
      L3_2 = L1_2
  end
  else
    L10_2 = L2_2.gid
    if L10_2 then
      L10_2 = A0_2.group_hid
      L11_2 = _UPVALUE1_
      L11_2 = L11_2.bin
      L11_2 = L11_2.crc32
      L12_2 = L2_2.gid
      L11_2 = L11_2(L12_2)
      if L10_2 == L11_2 then
        L5_2 = true
        L3_2 = L2_2
    end
    else
      L10_2 = L1_2.gid
      if not L10_2 then
        L3_2 = L2_2
      else
        L10_2 = -3000
        L11_2 = "group hid mismatched"
        return L10_2, L11_2
      end
    end
  end
  L10_2 = A0_2.secret
  if not L10_2 then
    L10_2 = false
    L11_2 = "no secret"
    return L10_2, L11_2
  end
  L10_2 = _UPVALUE2_
  L11_2 = A0_2
  L10_2(L11_2)
  L10_2 = _UPVALUE0_
  L10_2 = L10_2.get_sync_version
  L10_2 = L10_2()
  L11_2 = _UPVALUE0_
  L11_2 = L11_2.get_config_version
  L11_2 = L11_2()
  L12_2 = "0"
  if L4_2 or L5_2 then
    L13_2 = _UPVALUE0_
    L13_2 = L13_2.decrypt_table
    L14_2 = A0_2.secret
    L15_2 = L3_2.key
    L13_2 = L13_2(L14_2, L15_2)
    A0_2 = L13_2
    if A0_2 then
      L13_2 = A0_2.group_id
      L14_2 = L3_2.gid
      if L13_2 == L14_2 then
        goto lbl_90
      end
    end
    L13_2 = -3000
    L14_2 = "group id mismatched"
    do return L13_2, L14_2 end
    ::lbl_90::
    L13_2 = false
    L14_2 = false
    if L4_2 then
      L15_2 = A0_2.device_id
      L16_2 = _UPVALUE0_
      L16_2 = L16_2.get_device_id
      L16_2 = L16_2()
      if L15_2 ~= L16_2 then
        L15_2 = A0_2.config_version
        if not L15_2 then
          L15_2 = false
          L16_2 = "no version"
          return L15_2, L16_2
        end
        if L4_2 then
          L15_2 = A0_2.sync_version
          if L15_2 then
            L15_2 = _UPVALUE0_
            L15_2 = L15_2.compare_sync_version
            L16_2 = L10_2
            L17_2 = A0_2.sync_version
            L15_2 = L15_2(L16_2, L17_2)
            if 0 < L15_2 then
              L13_2 = true
            end
          end
        end
        if L4_2 then
          L15_2 = _UPVALUE0_
          L15_2 = L15_2.compare_config_version
          L16_2 = L11_2
          L17_2 = A0_2.config_version
          L15_2 = L15_2(L16_2, L17_2)
          if 0 < L15_2 then
            L13_2 = true
          end
        end
      end
    end
    L15_2 = A0_2.device_id
    L16_2 = _UPVALUE0_
    L16_2 = L16_2.get_device_id
    L16_2 = L16_2()
    if L15_2 ~= L16_2 then
      L15_2 = A0_2.device_id
      if not L15_2 then
        L13_2 = true
      end
      L15_2 = require
      L16_2 = "luci.model.uci"
      L15_2 = L15_2(L16_2)
      L16_2 = L15_2.cursor_state
      L16_2 = L16_2()
      L18_2 = L16_2
      L17_2 = L16_2.get
      L19_2 = "repacd"
      L20_2 = "repacd"
      L21_2 = "DeviceType"
      L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
      if not L13_2 then
        L18_2 = require
        L19_2 = "ubus"
        L18_2 = L18_2(L19_2)
        L19_2 = L18_2.connect
        L19_2 = L19_2()
        L21_2 = L19_2
        L20_2 = L19_2.call
        L22_2 = "sync"
        L23_2 = "list"
        L24_2 = {}
        L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2)
        if not L20_2 then
          L20_2 = {}
        end
        L22_2 = L19_2
        L21_2 = L19_2.close
        L21_2(L22_2)
        L21_2 = A0_2.device_id
        L21_2 = L20_2[L21_2]
        if L21_2 then
          L22_2 = L21_2.role
          L23_2 = A0_2.role
          if L22_2 == L23_2 then
            L22_2 = L21_2.ip
            L23_2 = A0_2.ip
            if L22_2 == L23_2 then
              L22_2 = L21_2.fw_version
              L23_2 = A0_2.firmware_ver
              if L22_2 == L23_2 then
                L22_2 = L21_2.config_version
                L23_2 = A0_2.config_version
                if L22_2 == L23_2 then
                  L22_2 = L21_2.sync_version
                  L23_2 = A0_2.sync_version
                  if L22_2 == L23_2 then
                    L22_2 = _UPVALUE3_
                    L23_2 = A0_2.device_id
                    L22_2 = L22_2(L23_2)
                    if L22_2 ~= false then
                      L22_2 = L21_2.eth_backhual
                      L23_2 = A0_2.eth_backhual
                      if L22_2 == L23_2 then
                        L22_2 = L21_2.iptv_extend
                        L23_2 = A0_2.iptv_extend
                        if L22_2 == L23_2 then
                          L22_2 = L21_2.guest_ver
                          L23_2 = A0_2.guest_ver
                          if L22_2 == L23_2 then
                            L22_2 = L21_2.tps
                            L23_2 = A0_2.tps
                            if L22_2 == L23_2 then
                              goto lbl_212
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        L13_2 = true
        ::lbl_212::
        if not L21_2 then
          L22_2 = A0_2.device_id
          if L22_2 then
            L22_2 = A0_2.role
            if L22_2 then
              L22_2 = A0_2.ip
              if L22_2 then
                L14_2 = true
                L22_2 = _UPVALUE4_
                L22_2 = L22_2.call_output
                L23_2 = {}
                L24_2 = "ifconfig"
                L25_2 = "br-lan"
                L23_2[1] = L24_2
                L23_2[2] = L25_2
                L22_2 = L22_2(L23_2)
                L23_2 = L22_2
                L22_2 = L22_2.match
                L24_2 = "inet addr:([%d%.]+)"
                L22_2 = L22_2(L23_2, L24_2)
                L23_2 = A0_2.ip
                L23_2 = L22_2 == L23_2
                L24_2 = pairs
                L25_2 = L20_2
                L24_2, L25_2, L26_2 = L24_2(L25_2)
                for L27_2, L28_2 in L24_2, L25_2, L26_2 do
                  L29_2 = L28_2.ip
                  L30_2 = A0_2.ip
                  if L29_2 == L30_2 then
                    L23_2 = true
                    break
                  end
                end
                if not L23_2 then
                  L24_2 = {}
                  L25_2 = A0_2.role
                  L24_2.role = L25_2
                  L25_2 = A0_2.ip
                  L24_2.ip = L25_2
                  L25_2 = A0_2.mac
                  L24_2.mac = L25_2
                  L25_2 = A0_2.device_model
                  L24_2.device_model = L25_2
                  L25_2 = A0_2.firmware_ver
                  L24_2.fw_version = L25_2
                  L25_2 = A0_2.sync_version
                  L24_2.sync_version = L25_2
                  L25_2 = A0_2.config_version
                  L24_2.config_version = L25_2
                  L25_2 = A0_2.hwid
                  L24_2.hwid = L25_2
                  L25_2 = A0_2.oemid
                  L24_2.oemid = L25_2
                  L25_2 = A0_2.channel_2g
                  L24_2.channel_2g = L25_2
                  L25_2 = A0_2.channel_5g
                  L24_2.channel_5g = L25_2
                  L25_2 = A0_2.channel_5g_2
                  L24_2.channel_5g_2 = L25_2
                  L25_2 = A0_2.signal_level
                  L24_2.signal_level = L25_2
                  L25_2 = A0_2.eth_backhual
                  L24_2.eth_backhual = L25_2
                  L25_2 = A0_2.pid
                  L24_2.preconf_id = L25_2
                  L25_2 = A0_2.iptv_extend
                  L24_2.iptv_extend = L25_2
                  L25_2 = A0_2.guest_ver
                  L24_2.guest_ver = L25_2
                  L25_2 = A0_2.need_account_digest
                  L24_2.need_account_digest = L25_2
                  L25_2 = A0_2.qs_version
                  L24_2.qs_version = L25_2
                  L25_2 = A0_2.tipc
                  L24_2.tipc = L25_2
                  L25_2 = A0_2.performance_limited
                  L24_2.performance_limited = L25_2
                  L25_2 = A0_2.tps
                  L24_2.tps = L25_2
                  L25_2 = _UPVALUE5_
                  L24_2.countdown = L25_2
                  if L7_2 == true then
                    L25_2 = A0_2.channel_6g
                    L24_2.channel_6g = L25_2
                  end
                  L25_2 = A0_2.oversized_firmware
                  if L25_2 == nil then
                    L24_2.oversized_firmware = false
                  else
                    L25_2 = A0_2.oversized_firmware
                    L24_2.oversized_firmware = L25_2
                  end
                  L25_2 = A0_2.extra_info
                  L24_2.extra_info = L25_2
                  L25_2 = A0_2.oui_version
                  if L25_2 == nil then
                    L24_2.oui_version = 0
                  else
                    L25_2 = A0_2.oui_version
                    L24_2.oui_version = L25_2
                  end
                  L25_2 = {}
                  L25_2.handle_type = "add"
                  L26_2 = A0_2.device_id
                  L25_2.handle_id = L26_2
                  L25_2.data = L24_2
                  L26_2 = L18_2.connect
                  L26_2 = L26_2()
                  L28_2 = L26_2
                  L27_2 = L26_2.call
                  L29_2 = "sync"
                  L30_2 = "device"
                  L31_2 = L25_2
                  L27_2(L28_2, L29_2, L30_2, L31_2)
                  L28_2 = L26_2
                  L27_2 = L26_2.close
                  L27_2(L28_2)
                  L27_2 = {}
                  L28_2 = #L27_2
                  L28_2 = L28_2 + 1
                  L29_2 = L25_2.handle_id
                  L27_2[L28_2] = L29_2
                  L28_2 = require
                  L29_2 = "deco_on_off_iface"
                  L28_2 = L28_2(L29_2)
                  L29_2 = _UPVALUE6_
                  L29_2 = L29_2.print
                  L30_2 = "deco online event when discover!"
                  L29_2(L30_2)
                  L29_2 = L28_2.inform_online_event_to_all
                  L30_2 = L27_2
                  L29_2(L30_2)
                end
              end
            end
          end
        end
      end
      if L13_2 then
        L18_2 = _UPVALUE0_
        L18_2 = L18_2.sync_boost
        L18_2()
      end
    end
  end
  L13_2 = L1_2.gid
  if L13_2 and not L4_2 then
    L13_2 = A0_2.tps
    if L13_2 then
      L13_2 = -4000
      L14_2 = "bind not reply to unbind"
      return L13_2, L14_2
    else
      L13_2 = -3000
      L14_2 = "bind not reply to unbind"
      return L13_2, L14_2
    end
  end
  L13_2 = L1_2.gid
  if not L13_2 or L4_2 then
    L13_2 = _UPVALUE7_
    L13_2 = L13_2()
    L14_2 = L3_2.gid
    L13_2.group_id = L14_2
    L13_2.sync_version = L10_2
    L13_2.config_version = L11_2
    L14_2 = _UPVALUE0_
    L14_2 = L14_2.get_role
    L14_2 = L14_2()
    L13_2.role = L14_2
    L14_2 = _UPVALUE8_
    L14_2 = L14_2.getfirm_cached
    L15_2 = "OEM_ID"
    L14_2 = L14_2(L15_2)
    L13_2.oemid = L14_2
    L14_2 = _UPVALUE8_
    L14_2 = L14_2.getfirm_cached
    L15_2 = "HW_ID"
    L14_2 = L14_2(L15_2)
    L13_2.hwid = L14_2
    L13_2.need_account_digest = true
    L14_2 = require
    L15_2 = "luci.model.uci"
    L14_2 = L14_2(L15_2)
    L15_2 = L14_2.cursor
    L15_2 = L15_2()
    L17_2 = L15_2
    L16_2 = L15_2.get
    L18_2 = "sysmode"
    L19_2 = "sysmode"
    L20_2 = "mode"
    L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
    L17_2 = L14_2.cursor
    L18_2 = "/etc/profile.d"
    L17_2 = L17_2(L18_2)
    if L16_2 == "AP" then
      L19_2 = L17_2
      L18_2 = L17_2.get
      L20_2 = "component-ap-owner"
      L21_2 = "list"
      L22_2 = "quick_setup"
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
      L13_2.qs_version = L18_2
    else
      L19_2 = L17_2
      L18_2 = L17_2.get
      L20_2 = "component-router-owner"
      L21_2 = "list"
      L22_2 = "quick_setup"
      L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
      L13_2.qs_version = L18_2
    end
    L18_2 = require
    L19_2 = "luci.model.mode"
    L18_2 = L18_2(L19_2)
    L19_2 = L18_2.get_performance_limited
    L19_2 = L19_2()
    if L19_2 then
      L13_2.performance_limited = true
    end
    L19_2 = require
    L20_2 = "luci.model.tipc_config"
    L19_2 = L19_2(L20_2)
    tipc_config = L19_2
    L13_2.tipc = 0
    L19_2 = tipc_config
    L19_2 = L19_2.check_tipc_enable
    L19_2 = L19_2()
    if L19_2 then
      L19_2 = tipc_config
      L19_2 = L19_2.get_tipc_id
      L19_2 = L19_2()
      L13_2.tipc = L19_2
    end
    if L8_2 == false then
      L19_2 = require
      L20_2 = "luci.model.app_wifi"
      L19_2 = L19_2(L20_2)
      L19_2 = L19_2.Wifi
      L19_2 = L19_2()
      L21_2 = L19_2
      L20_2 = L19_2.get_signal_level
      L20_2 = L20_2(L21_2)
      L13_2.signal_level = L20_2
    end
    L19_2 = _UPVALUE0_
    L19_2 = L19_2.get_eth_link_status
    L19_2 = L19_2()
    L13_2.eth_backhual = L19_2
    L19_2 = _UPVALUE0_
    L19_2 = L19_2.get_pregroup_crc32_hex
    L19_2 = L19_2()
    L13_2.pid = L19_2
    L19_2 = _UPVALUE0_
    L19_2 = L19_2.get_iptv_extend
    L19_2 = L19_2()
    L13_2.iptv_extend = L19_2
    L19_2 = _UPVALUE0_
    L19_2 = L19_2.get_guest_ver
    L19_2 = L19_2()
    L13_2.guest_ver = L19_2
    L19_2 = require
    L20_2 = "luci.model.mode"
    L19_2 = L19_2(L20_2)
    L20_2 = L19_2.is_oversized_firmware
    L20_2 = L20_2()
    L13_2.oversized_firmware = L20_2
    L20_2 = L19_2.get_oui_version
    L20_2 = L20_2()
    L13_2.oui_version = L20_2
    if L9_2 then
      L20_2 = _UPVALUE9_
      L20_2 = L20_2.connect
      L20_2 = L20_2()
      L21_2 = {}
      L21_2.operation = 2
      L23_2 = L20_2
      L22_2 = L20_2.call
      L24_2 = "awn"
      L25_2 = "preconfig"
      L26_2 = L21_2
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2)
      L24_2 = L20_2
      L23_2 = L20_2.close
      L23_2(L24_2)
      if L22_2 then
        L23_2 = L22_2.state
        if L23_2 == 1 then
          L23_2 = L13_2.mix
          if L23_2 ~= nil then
            L23_2 = _UPVALUE10_
            L23_2 = L23_2.bor
            L24_2 = L13_2.mix
            L25_2 = _UPVALUE10_
            L25_2 = L25_2.lshift
            L26_2 = 1
            L27_2 = 0
            L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L25_2(L26_2, L27_2)
            L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
            L13_2.mix = L23_2
          else
            L23_2 = _UPVALUE10_
            L23_2 = L23_2.bor
            L24_2 = 0
            L25_2 = _UPVALUE10_
            L25_2 = L25_2.lshift
            L26_2 = 1
            L27_2 = 0
            L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L25_2(L26_2, L27_2)
            L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
            L13_2.mix = L23_2
          end
      end
      else
        L23_2 = L13_2.mix
        if L23_2 ~= nil then
          L23_2 = _UPVALUE10_
          L23_2 = L23_2.band
          L24_2 = L13_2.mix
          L25_2 = _UPVALUE10_
          L25_2 = L25_2.bnot
          L26_2 = _UPVALUE10_
          L26_2 = L26_2.lshift
          L27_2 = 1
          L28_2 = 0
          L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L26_2(L27_2, L28_2)
          L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L25_2(L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
          L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
          L13_2.mix = L23_2
        else
          L23_2 = _UPVALUE10_
          L23_2 = L23_2.band
          L24_2 = 0
          L25_2 = _UPVALUE10_
          L25_2 = L25_2.bnot
          L26_2 = _UPVALUE10_
          L26_2 = L26_2.lshift
          L27_2 = 1
          L28_2 = 0
          L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L26_2(L27_2, L28_2)
          L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L25_2(L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
          L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
          L13_2.mix = L23_2
        end
      end
    end
    L20_2 = L18_2.is_outdoor_nickname_support
    L20_2 = L20_2()
    if L20_2 == true then
      L13_2.nickname_category = 1
    end
    L20_2 = _UPVALUE11_
    L20_2 = L20_2()
    if L20_2 then
      L13_2.tps = "1"
    end
    L20_2 = {}
    L21_2 = _UPVALUE0_
    L21_2 = L21_2.encrypt_table
    L22_2 = L13_2
    L23_2 = L3_2.key
    L21_2 = L21_2(L22_2, L23_2)
    L20_2.secret = L21_2
    return L20_2
  end
  L13_2 = A0_2.tps
  if L13_2 then
    L13_2 = -4000
    L14_2 = "bind not reply to unbind"
    return L13_2, L14_2
  else
    L13_2 = -3000
    L14_2 = "bind not reply to unbind"
    return L13_2, L14_2
  end
end

function L31_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if not A0_2 then
    L1_2 = -3000
    L2_2 = "sync master check: invalid input"
    return L1_2, L2_2
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.read_group_info
  L1_2 = L1_2()
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.read_dft_group_info
  L2_2 = L2_2()
  if L1_2 then
    L3_2 = L1_2.gid
    if L3_2 then
      L3_2 = L1_2.key
      if L3_2 then
        goto lbl_21
      end
    end
  end
  do return end
  ::lbl_21::
  L3_2 = _UPVALUE0_
  L3_2 = L3_2.get_role
  L3_2 = L3_2()
  if L3_2 ~= "AP" then
    return
  end
  L4_2 = _UPVALUE1_
  L4_2 = L4_2.has_all_device_binded
  L4_2 = L4_2()
  if L4_2 == true then
    L5_2 = _UPVALUE2_
    L5_2 = L5_2.print
    L6_2 = "<pre-config> preconfig_device all binded"
    L5_2(L6_2)
    return
  end
  L5_2 = _UPVALUE0_
  L5_2 = L5_2.decrypt_table
  L6_2 = A0_2.secret
  L7_2 = L2_2.key
  L5_2 = L5_2(L6_2, L7_2)
  A0_2 = L5_2
  if A0_2 then
    L5_2 = nil
    if A0_2 then
      L6_2 = A0_2.device_id_md5
      if L6_2 then
        L6_2 = A0_2.string_code_re
        if L6_2 then
          goto lbl_57
        end
      end
    end
    L6_2 = -3000
    L7_2 = "invalid input"
    do return L6_2, L7_2 end
    ::lbl_57::
    L6_2 = _UPVALUE0_
    L6_2 = L6_2.get_device_id
    L6_2 = L6_2()
    L7_2 = _UPVALUE3_
    L7_2 = L7_2.call_output
    L8_2 = {}
    L9_2 = "md5sum"
    L8_2[1] = L9_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = L7_2
    L7_2 = L7_2.match
    L9_2 = "%x+"
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = A0_2.device_id_md5
    if L7_2 == L8_2 then
      return
    end
    L8_2 = require
    L9_2 = "luci.model.uci"
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2.cursor
    L9_2 = L9_2()
    L11_2 = L9_2
    L10_2 = L9_2.foreach
    L12_2 = "preconfig_device_list"
    L13_2 = "device"
    
    function L14_2(A0_3)
      local L1_3, L2_3
      L1_3 = A0_3.device_id_md5
      L2_3 = A0_2
      L2_3 = L2_3.device_id_md5
      if L1_3 == L2_3 then
        L1_3 = A0_3[".name"]
        _UPVALUE1_ = L1_3
      end
    end
    
    L10_2(L11_2, L12_2, L13_2, L14_2)
    if L5_2 == nil or L5_2 == L6_2 then
      L10_2 = _UPVALUE1_
      L10_2 = L10_2.pre_config_kick_mac
      L11_2 = A0_2.mac_2_4G
      L12_2 = A0_2.mac_5G
      L10_2(L11_2, L12_2)
      L10_2 = -3000
      L11_2 = "invalid device id"
      return L10_2, L11_2
    end
    L10_2 = _UPVALUE0_
    L10_2 = L10_2.decrypt_table
    L11_2 = A0_2.string_code_re
    L12_2 = L5_2
    L10_2 = L10_2(L11_2, L12_2)
    string_code_re = L10_2
    L10_2 = string_code_re
    if L10_2 ~= nil then
      L10_2 = {}
      L11_2 = _UPVALUE3_
      L11_2 = L11_2.call_output
      L12_2 = {}
      L13_2 = "ifconfig"
      L14_2 = "br-lan"
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L11_2 = L11_2(L12_2)
      L12_2 = L11_2
      L11_2 = L11_2.match
      L13_2 = "inet addr:([%d%.]+)"
      L11_2 = L11_2(L12_2, L13_2)
      L10_2.role = L3_2
      L12_2 = string_code_re
      L10_2.string_code_re = L12_2
      L12_2 = A0_2.session_id
      L10_2.session_id = L12_2
      L10_2.ip = L11_2
      L12_2 = _UPVALUE4_
      L12_2 = L12_2.fork
      L12_2 = L12_2()
      if L12_2 == 0 then
        L13_2 = _UPVALUE1_
        L13_2 = L13_2.pre_config_add_re
        L14_2 = L5_2
        L15_2 = A0_2.mac
        L13_2(L14_2, L15_2)
        L13_2 = os
        L13_2 = L13_2.exit
        L14_2 = 1
        L13_2(L14_2)
      end
      L13_2 = {}
      L14_2 = _UPVALUE0_
      L14_2 = L14_2.encrypt_table
      L15_2 = L10_2
      L16_2 = L2_2.key
      L14_2 = L14_2(L15_2, L16_2)
      L13_2.secret = L14_2
      return L13_2
    else
      L10_2 = _UPVALUE1_
      L10_2 = L10_2.pre_config_kick_mac
      L11_2 = A0_2.mac_2_4G
      L12_2 = A0_2.mac_5G
      L10_2(L11_2, L12_2)
    end
  end
  L5_2 = -3000
  L6_2 = "sync_master_check error"
  return L5_2, L6_2
end

L32_1 = {}
L33_1 = {}
L33_1.cb = L28_1
L32_1.read = L33_1
L33_1 = {}
L33_1.cb = L30_1
L32_1.sync_config = L33_1
L33_1 = {}
L33_1.cb = L29_1
L32_1.sync_config_emmc = L33_1
L33_1 = {}
L34_1 = sync_slave_check
L33_1.cb = L34_1
L32_1.sync_slave_check = L33_1
L33_1 = {}
L33_1.cb = L31_1
L32_1.sync_master_check = L33_1

function L33_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L0_1
  L1_2 = L1_2.simple_dispatch
  L2_2 = _UPVALUE1_
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end

dispatch = L33_1

function L33_1()
  local L0_2, L1_2
end

index = L33_1
