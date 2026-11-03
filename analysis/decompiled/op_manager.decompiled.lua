local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1
L0_1 = module
L1_1 = "luci.controller.admin.op_manager"
L2_1 = package
L2_1 = L2_1.seeall
L0_1(L1_1, L2_1)
L0_1 = require
L1_1 = "luci.model.controller"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "luci.tools.debug"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "luci.sys"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "nixio"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "luci.json"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "ubus"
L5_1 = L5_1(L6_1)
L6_1 = require
L7_1 = "luci.model.sync"
L6_1 = L6_1(L7_1)
L7_1 = require
L8_1 = "luci.model.uci"
L7_1 = L7_1(L8_1)
L8_1 = require
L9_1 = "luci.sys.config"
L8_1 = L8_1(L9_1)
L9_1 = require
L10_1 = "luci.model.subprocess"
L9_1 = L9_1(L10_1)
L10_1 = require
L11_1 = "luci.model.locker"
L10_1 = L10_1(L11_1)
L10_1 = L10_1.Locker
L11_1 = require
L12_1 = "luci.tools.status"
L11_1 = L11_1(L12_1)
L12_1 = 15360
L13_1 = L3_1.fs
L14_1 = L7_1.new_cursor
L14_1 = L14_1()
L15_1 = "/var/run/lookup_op"
L16_1 = "/tmp/getfirm-device-id"
L17_1 = "/tmp/uci_comp_config"
L18_1 = "/tmp/uci_comp_config/uci_show_info_before"
L19_1 = "/tmp/uci_comp_config/uci_show_info_after"
L20_1 = "/tmp/uci_comp_config/uci_show_info_diff"
L21_1 = "/etc/config/"
L22_1 = "dev_id:"
L23_1 = {}
L24_1 = "read"
L25_1 = "get"
L26_1 = "list"
L27_1 = "getlist"
L23_1[1] = L24_1
L23_1[2] = L25_1
L23_1[3] = L26_1
L23_1[4] = L27_1
L24_1 = {}
L25_1 = "0xc401"
L26_1 = "0xc402"
L27_1 = "0xc404"
L28_1 = "0xc405"
L29_1 = "0xc406"
L30_1 = "0xc407"
L31_1 = "0xc40b"
L32_1 = "0xc40c"
L33_1 = "0xc40d"
L34_1 = "0xc40e"
L35_1 = "0xc40f"
L36_1 = "0xc710"
L37_1 = "0x4040"
L38_1 = "0x4044"
L39_1 = "0x4048"
L40_1 = "0x4049"
L41_1 = "0x4050"
L42_1 = "0x4060"
L43_1 = "0x4070"
L44_1 = "0x4079"
L45_1 = "0x4096"
L46_1 = "0x4080"
L47_1 = "0x40e0"
L48_1 = "0xc701"
L24_1[1] = L25_1
L24_1[2] = L26_1
L24_1[3] = L27_1
L24_1[4] = L28_1
L24_1[5] = L29_1
L24_1[6] = L30_1
L24_1[7] = L31_1
L24_1[8] = L32_1
L24_1[9] = L33_1
L24_1[10] = L34_1
L24_1[11] = L35_1
L24_1[12] = L36_1
L24_1[13] = L37_1
L24_1[14] = L38_1
L24_1[15] = L39_1
L24_1[16] = L40_1
L24_1[17] = L41_1
L24_1[18] = L42_1
L24_1[19] = L43_1
L24_1[20] = L44_1
L24_1[21] = L45_1
L24_1[22] = L46_1
L24_1[23] = L47_1
L24_1[24] = L48_1

function L25_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = _UPVALUE0_
  L1_2 = L0_2
  L0_2 = L0_2.set_confdir
  L2_2 = "/etc/profile.d"
  L0_2(L1_2, L2_2)
  L0_2 = _UPVALUE0_
  L1_2 = L0_2
  L0_2 = L0_2.get_all
  L2_2 = "opcode-cfg"
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = _UPVALUE0_
  L2_2 = L1_2
  L1_2 = L1_2.get
  L3_2 = "opcode"
  L4_2 = "opcode"
  L5_2 = "op"
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L2_2 = {}
  L3_2 = 1
  L4_2 = #L1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L1_2[L6_2]
    L8_2 = L7_2
    L7_2 = L7_2.lower
    L7_2 = L7_2(L8_2)
    L8_2 = L0_2[L7_2]
    L9_2 = {}
    if L8_2 ~= nil then
      L10_2 = pairs
      L11_2 = L8_2
      L10_2, L11_2, L12_2 = L10_2(L11_2)
      for L13_2, L14_2 in L10_2, L11_2, L12_2 do
        if ".type" ~= L13_2 and ".anonymous" ~= L13_2 and ".name" ~= L13_2 and ".index" ~= L13_2 then
          L15_2 = table
          L15_2 = L15_2.insert
          L16_2 = L9_2
          L17_2 = L13_2
          L15_2(L16_2, L17_2)
        end
      end
      L2_2[L7_2] = L9_2
    end
  end
  L3_2 = _UPVALUE0_
  L4_2 = L3_2
  L3_2 = L3_2.set_confdir
  L5_2 = "/etc/config"
  L3_2(L4_2, L5_2)
  return L2_2
end

function L26_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = ipairs
  L3_2 = _UPVALUE0_
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L6_2 == A0_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = ipairs
  L3_2 = _UPVALUE1_
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L6_2 == A1_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

L27_1 = nil

function L28_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = _UPVALUE0_
  if L0_2 then
    L0_2 = _UPVALUE0_
    return L0_2
  end
  L0_2 = nil
  L1_2 = nil
  L2_2 = io
  L2_2 = L2_2.open
  L3_2 = _UPVALUE1_
  L4_2 = "r"
  L2_2 = L2_2(L3_2, L4_2)
  L0_2 = L2_2
  if not L0_2 then
    L2_2 = call
    L3_2 = {}
    L4_2 = "nvrammanager"
    L5_2 = "-r"
    L6_2 = _UPVALUE1_
    L7_2 = "-p"
    L8_2 = "device-id"
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L3_2[4] = L7_2
    L3_2[5] = L8_2
    L2_2(L3_2)
    L2_2 = io
    L2_2 = L2_2.open
    L3_2 = _UPVALUE1_
    L4_2 = "r"
    L2_2 = L2_2(L3_2, L4_2)
    L0_2 = L2_2
  end
  L3_2 = L0_2
  L2_2 = L0_2.read
  L4_2 = "*all"
  L2_2 = L2_2(L3_2, L4_2)
  L1_2 = L2_2
  L3_2 = L0_2
  L2_2 = L0_2.close
  L2_2(L3_2)
  L2_2 = string
  L2_2 = L2_2.sub
  L3_2 = L1_2
  L4_2 = string
  L4_2 = L4_2.len
  L5_2 = _UPVALUE2_
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 + 1
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L2_2
  L2_2 = L2_2.trim
  L2_2 = L2_2(L3_2)
  _UPVALUE0_ = L2_2
  L2_2 = _UPVALUE0_
  return L2_2
end

function L29_1(A0_2)
  local L1_2
  if A0_2 == "0x40e0" then
    L1_2 = true
    return L1_2
  end
  L1_2 = false
  return L1_2
end

function L30_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L4_2 = 0
  L5_2 = {}
  L6_2 = {}
  L7_2 = 50945
  L8_2 = false
  L9_2 = _UPVALUE0_
  L10_2 = A0_2
  L9_2 = L9_2(L10_2)
  if L9_2 then
    L9_2 = L4_2
    L10_2 = L6_2
    return L9_2, L10_2
  end
  L6_2.error_code = 0
  L9_2 = require
  L10_2 = "luci.model.mode"
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2.upgrade_type_get
  L10_2 = L10_2()
  L11_2 = L9_2.is_mem_protect_support
  L11_2, L12_2 = L11_2()
  if L11_2 == true then
    if L12_2 then
      L13_2 = tonumber
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      _UPVALUE1_ = L13_2
    end
    L13_2 = _UPVALUE2_
    L13_2 = L13_2.get_memfree
    L13_2 = L13_2()
    L14_2 = tonumber
    L15_2 = L13_2
    L14_2 = L14_2(L15_2)
    L15_2 = _UPVALUE1_
    if L14_2 < L15_2 then
      if L10_2 == "mobile_mount" then
        L14_2 = _UPVALUE3_
        L14_2 = L14_2.print
        L15_2 = "===memfree less than 15M 1 time, drop cache and try again ===="
        L14_2(L15_2)
        L14_2 = _UPVALUE4_
        L14_2 = L14_2.call
        L15_2 = "echo 3 > /proc/sys/vm/drop_caches"
        L14_2(L15_2)
        L14_2 = _UPVALUE4_
        L14_2 = L14_2.call
        L15_2 = "sleep 1"
        L14_2(L15_2)
        L14_2 = _UPVALUE2_
        L14_2 = L14_2.get_memfree
        L14_2 = L14_2()
        L13_2 = L14_2
        L14_2 = tonumber
        L15_2 = L13_2
        L14_2 = L14_2(L15_2)
        L15_2 = _UPVALUE1_
        if L14_2 < L15_2 then
          L14_2 = _UPVALUE3_
          L14_2 = L14_2.print
          L15_2 = "===memfree less than 15M 2 times, return ===="
          L14_2(L15_2)
          L14_2 = L4_2
          L15_2 = L6_2
          return L14_2, L15_2
        end
      else
        L14_2 = _UPVALUE3_
        L14_2 = L14_2.print
        L15_2 = "===memfree less than 15M, return===="
        L14_2(L15_2)
        L14_2 = L4_2
        L15_2 = L6_2
        return L14_2, L15_2
      end
    end
  end
  L13_2 = ipairs
  L14_2 = A1_2
  L13_2, L14_2, L15_2 = L13_2(L14_2)
  for L16_2, L17_2 in L13_2, L14_2, L15_2 do
    L18_2 = _UPVALUE5_
    L19_2 = L18_2
    L18_2 = L18_2.get_all
    L20_2 = L17_2
    L18_2 = L18_2(L19_2, L20_2)
    L5_2[L17_2] = L18_2
    L8_2 = true
  end
  if L8_2 == false then
    L13_2 = L4_2
    L14_2 = L6_2
    return L13_2, L14_2
  end
  L13_2 = {}
  L14_2 = {}
  L13_2.params = L14_2
  L14_2 = L13_2.params
  L15_2 = tostring
  L16_2 = A2_2
  L15_2 = L15_2(L16_2)
  L14_2.change = L15_2
  L14_2 = L13_2.params
  L15_2 = _UPVALUE6_
  L15_2 = L15_2()
  L14_2.dev_id = L15_2
  L14_2 = L13_2.params
  L14_2.opcode = A0_2
  L14_2 = L13_2.params
  L14_2.config_version = A3_2
  L14_2 = L13_2.params
  L14_2.data = L5_2
  L14_2 = _UPVALUE7_
  L14_2 = L14_2.get_role
  L14_2 = L14_2()
  if L14_2 == "AP" then
    L15_2 = {}
    L16_2 = os
    L16_2 = L16_2.time
    L16_2 = L16_2()
    L17_2 = _UPVALUE8_
    L17_2 = L17_2.getpid
    L17_2, L18_2, L19_2, L20_2, L21_2 = L17_2()
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L15_2[4] = L19_2
    L15_2[5] = L20_2
    L15_2[6] = L21_2
    L15_2 = "/tmp/transmit_subconfig_request-%d-%d.json" % L15_2
    data_file = L15_2
    L15_2 = io
    L15_2 = L15_2.open
    L16_2 = data_file
    L17_2 = "w"
    L15_2 = L15_2(L16_2, L17_2)
    fp = L15_2
    L15_2 = fp
    if L15_2 then
      L15_2 = fp
      L16_2 = L15_2
      L15_2 = L15_2.write
      L17_2 = _UPVALUE9_
      L17_2 = L17_2.encode
      L18_2 = L13_2
      L17_2, L18_2, L19_2, L20_2, L21_2 = L17_2(L18_2)
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      L15_2 = fp
      L16_2 = L15_2
      L15_2 = L15_2.close
      L15_2(L16_2)
    else
      L15_2 = _UPVALUE3_
      L15_2 = L15_2.print
      L16_2 = "open "
      L17_2 = data_file
      L18_2 = " failed!"
      L16_2 = L16_2 .. L17_2 .. L18_2
      L15_2(L16_2)
      L15_2 = L4_2
      L16_2 = L6_2
      return L15_2, L16_2
    end
    L15_2 = _UPVALUE10_
    L15_2 = L15_2.call
    L16_2 = {}
    L17_2 = "tmpcli"
    L18_2 = "-o"
    L19_2 = tostring
    L20_2 = L7_2
    L19_2 = L19_2(L20_2)
    L20_2 = "-I"
    L21_2 = data_file
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L16_2[4] = L20_2
    L16_2[5] = L21_2
    L15_2 = L15_2(L16_2)
    if L15_2 ~= 0 then
      L16_2 = _UPVALUE3_
      L16_2 = L16_2.print
      L17_2 = "tmpcli exec failed! "
      L16_2(L17_2)
      L16_2 = _UPVALUE11_
      L16_2 = L16_2.unlink
      L17_2 = data_file
      L16_2(L17_2)
      L16_2 = L4_2
      L17_2 = L6_2
      return L16_2, L17_2
    end
    L16_2 = _UPVALUE11_
    L16_2 = L16_2.unlink
    L17_2 = data_file
    L16_2(L17_2)
  else
    L15_2 = {}
    L15_2.opcode = L7_2
    L15_2.target_type = "AP"
    L15_2.data = L13_2
    L16_2 = _UPVALUE12_
    L16_2 = L16_2.connect
    L16_2 = L16_2()
    L18_2 = L16_2
    L17_2 = L16_2.call
    L19_2 = "sync"
    L20_2 = "send"
    L21_2 = L15_2
    L17_2(L18_2, L19_2, L20_2, L21_2)
    L18_2 = L16_2
    L17_2 = L16_2.close
    L17_2(L18_2)
  end
  L15_2 = L4_2
  L16_2 = L6_2
  return L15_2, L16_2
end

function L31_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L5_2 = 0
  L6_2 = 0
  L7_2 = nil
  if A0_2 == nil or A1_2 == nil then
    L8_2 = 0
    L9_2 = nil
    return L8_2, L9_2
  end
  L9_2 = A0_2
  L8_2 = A0_2.lower
  L8_2 = L8_2(L9_2)
  A0_2 = L8_2
  if A2_2 == nil then
    L7_2 = "0"
  else
    L7_2 = A2_2
  end
  L8_2 = _UPVALUE0_
  L9_2 = A0_2
  L10_2 = A1_2
  L8_2 = L8_2(L9_2, L10_2)
  if L8_2 == true then
    L8_2 = 0
    return L8_2
  end
  L8_2 = _UPVALUE1_
  L9_2 = "-%s-%d"
  L8_2 = L8_2 .. L9_2
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = A0_2
  L11_2 = _UPVALUE2_
  L11_2 = L11_2.getpid
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L11_2()
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L9_2 = _UPVALUE3_
  L10_2 = "-%s-%d"
  L9_2 = L9_2 .. L10_2
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = A0_2
  L12_2 = _UPVALUE2_
  L12_2 = L12_2.getpid
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L12_2()
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L10_2 = _UPVALUE4_
  L11_2 = "-%s-%d"
  L10_2 = L10_2 .. L11_2
  L11_2 = L10_2
  L10_2 = L10_2.format
  L12_2 = A0_2
  L13_2 = _UPVALUE2_
  L13_2 = L13_2.getpid
  L13_2, L14_2, L15_2, L16_2, L17_2 = L13_2()
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L11_2 = "md5sum /etc/config/* > "
  L12_2 = L9_2
  L11_2 = L11_2 .. L12_2
  L12_2 = os
  L12_2 = L12_2.execute
  L13_2 = L11_2
  L12_2(L13_2)
  L12_2 = "diff "
  L13_2 = L8_2
  L14_2 = " "
  L15_2 = L9_2
  L16_2 = " > "
  L17_2 = L10_2
  L11_2 = L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
  L12_2 = os
  L12_2 = L12_2.execute
  L13_2 = L11_2
  L12_2(L13_2)
  L12_2 = "rm -rf %s %s %s &"
  L13_2 = L12_2
  L12_2 = L12_2.format
  L14_2 = L8_2
  L15_2 = L9_2
  L16_2 = L10_2
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
  L11_2 = L12_2
  L12_2 = io
  L12_2 = L12_2.open
  L13_2 = L10_2
  L14_2 = "r"
  L12_2 = L12_2(L13_2, L14_2)
  L3_2 = L12_2
  if not L3_2 then
    L12_2 = _UPVALUE5_
    L12_2 = L12_2.print
    L13_2 = "inspect_subconfig failed to open file: "
    L14_2 = L10_2
    L13_2 = L13_2 .. L14_2
    L12_2(L13_2)
    L12_2 = _UPVALUE6_
    L12_2 = L12_2.unlink
    L13_2 = L8_2
    L12_2(L13_2)
    L12_2 = _UPVALUE6_
    L12_2 = L12_2.unlink
    L13_2 = L9_2
    L12_2(L13_2)
    L12_2 = _UPVALUE6_
    L12_2 = L12_2.unlink
    L13_2 = L10_2
    L12_2(L13_2)
    L12_2 = _UPVALUE7_
    L12_2 = L12_2.fork_call
    L13_2 = L11_2
    L12_2(L13_2)
    L12_2 = true
    return L12_2
  end
  repeat
    L13_2 = L3_2
    L12_2 = L3_2.read
    L14_2 = "*line"
    L12_2 = L12_2(L13_2, L14_2)
    L4_2 = L12_2
    L6_2 = L6_2 + 1
    if 2 < L6_2 and L4_2 then
      L12_2 = string
      L12_2 = L12_2.find
      L13_2 = L4_2
      L14_2 = "^[+-]"
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L12_2 = string
        L12_2 = L12_2.find
        L13_2 = L4_2
        L14_2 = _UPVALUE8_
        L12_2 = L12_2(L13_2, L14_2)
        L13_2 = string
        L13_2 = L13_2.sub
        L14_2 = L4_2
        L15_2 = string
        L15_2 = L15_2.len
        L16_2 = _UPVALUE8_
        L15_2 = L15_2(L16_2)
        L15_2 = L12_2 + L15_2
        L16_2 = string
        L16_2 = L16_2.len
        L17_2 = L4_2
        L16_2, L17_2 = L16_2(L17_2)
        L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
        if L13_2 then
          L14_2 = _UPVALUE9_
          L14_2 = L14_2.is_user_config
          L15_2 = L13_2
          L14_2 = L14_2(L15_2)
          if L14_2 then
            L5_2 = 1
            L14_2 = _UPVALUE5_
            L15_2 = {}
            L16_2 = L13_2
            L15_2[1] = L16_2
            L15_2 = "user config(%s) change!" % L15_2
            L14_2(L15_2)
            break
          end
        end
      end
    end
  until L4_2 == nil
  L13_2 = L3_2
  L12_2 = L3_2.close
  L12_2(L13_2)
  L12_2 = _UPVALUE6_
  L12_2 = L12_2.unlink
  L13_2 = L8_2
  L12_2(L13_2)
  L12_2 = _UPVALUE6_
  L12_2 = L12_2.unlink
  L13_2 = L9_2
  L12_2(L13_2)
  L12_2 = _UPVALUE6_
  L12_2 = L12_2.unlink
  L13_2 = L10_2
  L12_2(L13_2)
  L12_2 = _UPVALUE7_
  L12_2 = L12_2.fork_call
  L13_2 = L11_2
  L12_2(L13_2)
  L12_2 = _UPVALUE10_
  L12_2 = L12_2()
  L13_2 = L12_2[A0_2]
  if L13_2 ~= nil then
    L13_2 = _UPVALUE11_
    L14_2 = A0_2
    L15_2 = L12_2[A0_2]
    L16_2 = L5_2
    L17_2 = L7_2
    L13_2(L14_2, L15_2, L16_2, L17_2)
  end
  L13_2 = false
  return L13_2
end

inspect_subconfig = L31_1

function L31_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = _UPVALUE0_
  L1_2 = "-%d"
  L0_2 = L0_2 .. L1_2
  L1_2 = L0_2
  L0_2 = L0_2.format
  L2_2 = _UPVALUE1_
  L2_2 = L2_2.getpid
  L2_2, L3_2 = L2_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  L1_2 = "mkdir -p "
  L2_2 = _UPVALUE2_
  L1_2 = L1_2 .. L2_2
  L2_2 = os
  L2_2 = L2_2.execute
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = "md5sum /etc/config/* > "
  L3_2 = L0_2
  L1_2 = L2_2 .. L3_2
  L2_2 = os
  L2_2 = L2_2.execute
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = 0
  return L2_2
end

fetch_subconfig = L31_1

function L31_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = false
  L4_2 = 0
  L5_2 = nil
  if A0_2 then
    L5_2 = A0_2
  else
    L6_2 = _UPVALUE0_
    L6_2 = L6_2.getpid
    L6_2 = L6_2()
    L5_2 = L6_2
  end
  L6_2 = _UPVALUE1_
  L7_2 = "-%d"
  L6_2 = L6_2 .. L7_2
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = _UPVALUE2_
  L8_2 = "-%d"
  L7_2 = L7_2 .. L8_2
  L8_2 = L7_2
  L7_2 = L7_2.format
  L9_2 = L5_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = _UPVALUE3_
  L9_2 = "-%d"
  L8_2 = L8_2 .. L9_2
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = "md5sum /etc/config/* > "
  L10_2 = L7_2
  L9_2 = L9_2 .. L10_2
  L10_2 = os
  L10_2 = L10_2.execute
  L11_2 = L9_2
  L10_2(L11_2)
  L10_2 = "diff "
  L11_2 = L6_2
  L12_2 = " "
  L13_2 = L7_2
  L14_2 = " > "
  L15_2 = L8_2
  L9_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
  L10_2 = os
  L10_2 = L10_2.execute
  L11_2 = L9_2
  L10_2(L11_2)
  L10_2 = "rm -rf %s %s %s &"
  L11_2 = L10_2
  L10_2 = L10_2.format
  L12_2 = L6_2
  L13_2 = L7_2
  L14_2 = L8_2
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  L9_2 = L10_2
  L10_2 = io
  L10_2 = L10_2.open
  L11_2 = L8_2
  L12_2 = "r"
  L10_2 = L10_2(L11_2, L12_2)
  L1_2 = L10_2
  if not L1_2 then
    L10_2 = _UPVALUE4_
    L10_2 = L10_2.print
    L11_2 = "inspect_subconfig failed to open file: "
    L12_2 = L8_2
    L11_2 = L11_2 .. L12_2
    L10_2(L11_2)
    L10_2 = _UPVALUE5_
    L10_2 = L10_2.unlink
    L11_2 = L6_2
    L10_2(L11_2)
    L10_2 = _UPVALUE5_
    L10_2 = L10_2.unlink
    L11_2 = L7_2
    L10_2(L11_2)
    L10_2 = _UPVALUE5_
    L10_2 = L10_2.unlink
    L11_2 = L8_2
    L10_2(L11_2)
    L10_2 = _UPVALUE6_
    L10_2 = L10_2.fork_call
    L11_2 = L9_2
    L10_2(L11_2)
    return
  end
  repeat
    L11_2 = L1_2
    L10_2 = L1_2.read
    L12_2 = "*line"
    L10_2 = L10_2(L11_2, L12_2)
    L2_2 = L10_2
    L4_2 = L4_2 + 1
    if 2 < L4_2 and L2_2 then
      L10_2 = string
      L10_2 = L10_2.find
      L11_2 = L2_2
      L12_2 = "^[+-]"
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 then
        L10_2 = string
        L10_2 = L10_2.find
        L11_2 = L2_2
        L12_2 = _UPVALUE7_
        L10_2 = L10_2(L11_2, L12_2)
        L11_2 = string
        L11_2 = L11_2.sub
        L12_2 = L2_2
        L13_2 = string
        L13_2 = L13_2.len
        L14_2 = _UPVALUE7_
        L13_2 = L13_2(L14_2)
        L13_2 = L10_2 + L13_2
        L14_2 = string
        L14_2 = L14_2.len
        L15_2 = L2_2
        L14_2, L15_2 = L14_2(L15_2)
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
        if L11_2 then
          L12_2 = _UPVALUE8_
          L12_2 = L12_2.is_user_config
          L13_2 = L11_2
          L12_2 = L12_2(L13_2)
          if L12_2 then
            L3_2 = true
            L12_2 = _UPVALUE4_
            L13_2 = {}
            L14_2 = L11_2
            L13_2[1] = L14_2
            L13_2 = "user config(%s) change!" % L13_2
            L12_2(L13_2)
            break
          end
        end
      end
    end
  until L2_2 == nil
  L11_2 = L1_2
  L10_2 = L1_2.close
  L10_2(L11_2)
  L10_2 = _UPVALUE5_
  L10_2 = L10_2.unlink
  L11_2 = L6_2
  L10_2(L11_2)
  L10_2 = _UPVALUE5_
  L10_2 = L10_2.unlink
  L11_2 = L7_2
  L10_2(L11_2)
  L10_2 = _UPVALUE5_
  L10_2 = L10_2.unlink
  L11_2 = L8_2
  L10_2(L11_2)
  L10_2 = _UPVALUE6_
  L10_2 = L10_2.fork_call
  L11_2 = L9_2
  L10_2(L11_2)
  if L3_2 == true then
    L10_2 = _UPVALUE4_
    L10_2 = L10_2.print
    L11_2 = "inspect user_config change, saving"
    L10_2(L11_2)
    L10_2 = _UPVALUE8_
    L10_2 = L10_2.save_config_version
    L11_2 = "0"
    L10_2(L11_2)
    L10_2 = _UPVALUE9_
    L11_2 = _UPVALUE10_
    L11_2 = L11_2.CONFIG_LOCK
    L10_2 = L10_2(L11_2)
    L12_2 = L10_2
    L11_2 = L10_2.lock
    L11_2(L12_2)
    L11_2 = _UPVALUE8_
    L11_2 = L11_2.reload_user_config
    L11_2()
    L12_2 = L10_2
    L11_2 = L10_2.close
    L11_2(L12_2)
    L11_2 = L0_1
    L11_2 = L11_2.uci_apply
    L11_2()
    L11_2 = _UPVALUE10_
    L11_2 = L11_2.sync_boost_uloop
    L11_2()
  end
end

inspect_and_save_subconfig = L31_1

function L31_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = "accountmgnt"
  L1_2 = "cloud_account"
  L2_2 = nil
  L3_2 = nil
  L4_2 = _UPVALUE0_
  L5_2 = L4_2
  L4_2 = L4_2.foreach
  L6_2 = L0_2
  L7_2 = L1_2
  
  function L8_2(A0_3)
    local L1_3
    L1_3 = A0_3.username
    _UPVALUE0_ = L1_3
    L1_3 = A0_3.shadow
    _UPVALUE1_ = L1_3
  end
  
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end

function L32_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "/tmp/sync-server/mesh_ip_"
  L2_2 = A0_2
  L1_2 = L1_2 .. L2_2
  L2_2 = io
  L2_2 = L2_2.open
  L3_2 = L1_2
  L4_2 = "r"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = nil
    return L3_2
  end
  L4_2 = L2_2
  L3_2 = L2_2.read
  L5_2 = "*all"
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L3_2
  L3_2 = L3_2.trim
  L3_2 = L3_2(L4_2)
  return L3_2
end

function L33_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = _UPVALUE0_
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = #L1_2
    if 7 <= L2_2 then
      return L1_2
    end
  end
  L2_2 = "/tmp/sync-server/mesh_dev_list"
  L3_2 = io
  L3_2 = L3_2.open
  L4_2 = L2_2
  L5_2 = "r"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L5_2 = L3_2
  L4_2 = L3_2.read
  L6_2 = "*all"
  L4_2 = L4_2(L5_2, L6_2)
  L6_2 = L3_2
  L5_2 = L3_2.close
  L5_2(L6_2)
  L5_2 = pairs
  L6_2 = _UPVALUE1_
  L6_2 = L6_2.decode
  L7_2 = L4_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = tostring
    L11_2 = L8_2
    L10_2 = L10_2(L11_2)
    L11_2 = tostring
    L12_2 = A0_2
    L11_2 = L11_2(L12_2)
    if L10_2 == L11_2 then
      L10_2 = L9_2.ip
      return L10_2
    end
  end
end

function L34_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L3_2 = "/tmp/sync-server/forward_tmp_request"
  L4_2 = ""
  L5_2 = {}
  L6_2 = 0
  L7_2 = nil
  if A2_2 then
    L8_2 = _UPVALUE0_
    L8_2 = L8_2.decode
    L9_2 = A2_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      goto lbl_15
    end
  end
  L8_2 = {}
  ::lbl_15::
  if A0_2 == nil or L8_2 == nil or A1_2 == nil then
    L9_2 = 0
    L10_2 = L8_2
    return L9_2, L10_2
  end
  L9_2 = L3_2
  L10_2 = "-%s-%d-%s"
  L9_2 = L9_2 .. L10_2
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = A0_2
  L12_2 = _UPVALUE1_
  L12_2 = L12_2.getpid
  L12_2 = L12_2()
  L13_2 = tostring
  L14_2 = _UPVALUE2_
  L14_2 = L14_2.uniqueid
  L15_2 = 2
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L14_2(L15_2)
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
  L10_2 = ipairs
  L11_2 = A1_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  for L13_2, L14_2 in L10_2, L11_2, L12_2 do
    if L4_2 == "" then
      L4_2 = L14_2
    else
      L15_2 = L4_2
      L16_2 = ","
      L17_2 = L14_2
      L4_2 = L15_2 .. L16_2 .. L17_2
    end
  end
  L10_2 = _UPVALUE3_
  L10_2 = L10_2.connect
  L10_2 = L10_2()
  L11_2 = {}
  L11_2.opcode = A0_2
  L11_2.target_id = L4_2
  L11_2.load = L9_2
  L12_2 = L8_2.params
  if L12_2 == nil then
    L12_2 = {}
    L13_2 = {}
    L12_2.params = L13_2
    L13_2 = L12_2.params
    L13_2.data = L8_2
    L11_2.data = L12_2
  else
    L11_2.data = L8_2
  end
  L12_2 = io
  L12_2 = L12_2.open
  L13_2 = L9_2
  L14_2 = "w"
  L12_2 = L12_2(L13_2, L14_2)
  L7_2 = L12_2
  if L7_2 then
    L13_2 = L7_2
    L12_2 = L7_2.write
    L14_2 = _UPVALUE0_
    L14_2 = L14_2.encode
    L15_2 = L11_2.data
    L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L14_2(L15_2)
    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
    L13_2 = L7_2
    L12_2 = L7_2.close
    L12_2(L13_2)
  else
    L5_2.error_code = 1
    L6_2 = 1
    L12_2 = _UPVALUE4_
    L12_2 = L12_2.print
    L13_2 = "forward_tmp_request write failed"
    L12_2(L13_2)
    L12_2 = L6_2
    L13_2 = L5_2
    return L12_2, L13_2
  end
  L13_2 = L10_2
  L12_2 = L10_2.call
  L14_2 = "sync"
  L15_2 = "request"
  L16_2 = L11_2
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
  L14_2 = L10_2
  L13_2 = L10_2.close
  L13_2(L14_2)
  L13_2 = "rm -rf %s &"
  L14_2 = L13_2
  L13_2 = L13_2.format
  L15_2 = L9_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = _UPVALUE5_
  L14_2 = L14_2.unlink
  L15_2 = L9_2
  L14_2(L15_2)
  L14_2 = _UPVALUE2_
  L14_2 = L14_2.fork_call
  L15_2 = L13_2
  L14_2(L15_2)
  if L12_2 then
    L14_2 = L12_2.success
    if L14_2 then
      goto lbl_128
    end
  end
  L14_2 = _UPVALUE4_
  L14_2 = L14_2.print
  L15_2 = "forward_tmp_request sync request inner error"
  L14_2(L15_2)
  L5_2.error_code = 1
  L6_2 = 1
  goto lbl_201
  ::lbl_128::
  L14_2 = L12_2.success
  if L14_2 < 0 then
    L14_2 = _UPVALUE4_
    L14_2 = L14_2.print
    L15_2 = "forward_tmp_request sync request error: "
    L16_2 = _UPVALUE0_
    L16_2 = L16_2.encode
    L17_2 = L12_2
    L16_2 = L16_2(L17_2)
    L15_2 = L15_2 .. L16_2
    L14_2(L15_2)
    L6_2 = 1
    L5_2 = L12_2
  else
    L14_2 = L12_2.success
    if 0 < L14_2 then
      L14_2 = {}
      L15_2 = L12_2.success
      if L15_2 == 1 then
        L15_2 = #L14_2
        L15_2 = L15_2 + 1
        L16_2 = L12_2.data
        L14_2[L15_2] = L16_2
      else
        L14_2 = L12_2.data
      end
      if not L14_2 then
        L15_2 = 1
        L16_2 = L12_2
        return L15_2, L16_2
      end
      L15_2 = ipairs
      L16_2 = L14_2
      L15_2, L16_2, L17_2 = L15_2(L16_2)
      for L18_2, L19_2 in L15_2, L16_2, L17_2 do
        L20_2 = L14_2[L18_2]
        L20_2 = L20_2.error_code
        if L20_2 ~= 0 then
          L21_2 = _UPVALUE4_
          L21_2 = L21_2.print
          L22_2 = "forward_tmp_request one RE result error:"
          L23_2 = A0_2
          L24_2 = ", "
          L25_2 = _UPVALUE0_
          L25_2 = L25_2.encode
          L26_2 = L14_2[L18_2]
          L25_2 = L25_2(L26_2)
          L22_2 = L22_2 .. L23_2 .. L24_2 .. L25_2
          L21_2(L22_2)
          L21_2 = 1
          L22_2 = L14_2[L18_2]
          return L21_2, L22_2
        else
          L6_2 = 0
          L5_2 = L14_2[L18_2]
        end
      end
    else
      L14_2 = _UPVALUE4_
      L14_2 = L14_2.print
      L15_2 = "forward_tmp_request sync request timeout"
      L16_2 = A0_2
      L15_2 = L15_2 .. L16_2
      L14_2(L15_2)
      L14_2 = _UPVALUE2_
      L14_2 = L14_2.fork_call
      L15_2 = "ubus call sync detect_re >/dev/null 2>&1 &"
      L14_2(L15_2)
      L5_2.error_code = 1
      L6_2 = 1
    end
  end
  ::lbl_201::
  L14_2 = L6_2
  L15_2 = L5_2
  return L14_2, L15_2
end

function L35_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L3_2 = "/tmp/sync-server/forward_tmp_request"
  L4_2 = ""
  L5_2 = {}
  L6_2 = nil
  if A2_2 then
    L7_2 = _UPVALUE0_
    L7_2 = L7_2.decode
    L8_2 = A2_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      goto lbl_14
    end
  end
  L7_2 = {}
  ::lbl_14::
  if A0_2 == nil or L7_2 == nil or A1_2 == nil then
    L8_2 = 0
    L9_2 = L7_2
    return L8_2, L9_2
  end
  L8_2 = L3_2
  L9_2 = "-%s-%d-%s"
  L8_2 = L8_2 .. L9_2
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = A0_2
  L11_2 = _UPVALUE1_
  L11_2 = L11_2.getpid
  L11_2 = L11_2()
  L12_2 = tostring
  L13_2 = _UPVALUE2_
  L13_2 = L13_2.uniqueid
  L14_2 = 2
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L13_2(L14_2)
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
  L9_2 = ipairs
  L10_2 = A1_2
  L9_2, L10_2, L11_2 = L9_2(L10_2)
  for L12_2, L13_2 in L9_2, L10_2, L11_2 do
    L4_2 = L13_2
    break
  end
  L9_2 = _UPVALUE3_
  L10_2 = L4_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L10_2 = _UPVALUE4_
    L11_2 = A0_2
    L12_2 = A1_2
    L13_2 = A2_2
    return L10_2(L11_2, L12_2, L13_2)
  end
  L10_2 = _UPVALUE5_
  L10_2, L11_2 = L10_2()
  L12_2 = {}
  L13_2 = L7_2.params
  if L13_2 == nil then
    L13_2 = {}
    L14_2 = {}
    L13_2.params = L14_2
    L14_2 = L13_2.params
    L14_2.data = L7_2
    L12_2.data = L13_2
  else
    L12_2.data = L7_2
  end
  L13_2 = nil
  L14_2 = io
  L14_2 = L14_2.open
  L15_2 = L8_2
  L16_2 = "w"
  L14_2 = L14_2(L15_2, L16_2)
  L6_2 = L14_2
  if L6_2 then
    L15_2 = L6_2
    L14_2 = L6_2.write
    L16_2 = _UPVALUE0_
    L16_2 = L16_2.encode
    L17_2 = L12_2.data
    L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L16_2(L17_2)
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
    L15_2 = L6_2
    L14_2 = L6_2.close
    L14_2(L15_2)
  else
    L5_2.error_code = 1
    L13_2 = 1
    L14_2 = _UPVALUE6_
    L14_2 = L14_2.print
    L15_2 = "forward_tmp_request write failed"
    L14_2(L15_2)
    L14_2 = L13_2
    L15_2 = L5_2
    return L14_2, L15_2
  end
  L14_2 = _UPVALUE7_
  L14_2 = L14_2.call_output
  L15_2 = {}
  L16_2 = "tmpcli"
  L17_2 = "-s"
  L18_2 = "-o"
  L19_2 = A0_2
  L20_2 = "-u"
  L21_2 = L9_2
  L22_2 = "-U"
  L23_2 = L10_2
  L24_2 = "-P"
  L25_2 = L11_2
  L26_2 = "-I"
  L27_2 = L8_2
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L15_2[3] = L18_2
  L15_2[4] = L19_2
  L15_2[5] = L20_2
  L15_2[6] = L21_2
  L15_2[7] = L22_2
  L15_2[8] = L23_2
  L15_2[9] = L24_2
  L15_2[10] = L25_2
  L15_2[11] = L26_2
  L15_2[12] = L27_2
  L14_2 = L14_2(L15_2)
  L15_2 = "rm -rf %s &"
  L16_2 = L15_2
  L15_2 = L15_2.format
  L17_2 = L8_2
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = _UPVALUE8_
  L16_2 = L16_2.unlink
  L17_2 = L8_2
  L16_2(L17_2)
  L16_2 = _UPVALUE2_
  L16_2 = L16_2.fork_call
  L17_2 = L15_2
  L16_2(L17_2)
  L16_2 = _UPVALUE0_
  L16_2 = L16_2.decode
  L17_2 = L14_2
  L16_2 = L16_2(L17_2)
  if L16_2 then
    L17_2 = L16_2.error_code
    if L17_2 then
      goto lbl_143
    end
  end
  L17_2 = _UPVALUE6_
  L17_2 = L17_2.print
  L18_2 = "forward_tmp_request sync request inner error"
  L17_2(L18_2)
  L5_2.error_code = 1
  L13_2 = 1
  goto lbl_145
  ::lbl_143::
  L13_2 = 0
  L5_2 = L16_2
  ::lbl_145::
  L17_2 = L13_2
  L18_2 = L5_2
  return L17_2, L18_2
end

function L36_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "table" then
    L3_2 = #A1_2
    if 1 < L3_2 then
      L3_2 = _UPVALUE0_
      L4_2 = A0_2
      L5_2 = A1_2
      L6_2 = A2_2
      return L3_2(L4_2, L5_2, L6_2)
    end
  end
  L3_2 = _UPVALUE1_
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end

forward_tmp_request = L36_1

function L36_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil or A1_2 == nil then
    L2_2 = 0
    return L2_2
  end
  L2_2 = _UPVALUE0_
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 == true then
    L2_2 = 0
    return L2_2
  end
  L2_2 = _UPVALUE1_
  L3_2 = "-%s-%d"
  L2_2 = L2_2 .. L3_2
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = A0_2
  L5_2 = _UPVALUE2_
  L5_2 = L5_2.getpid
  L5_2 = L5_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = "mkdir -p "
  L4_2 = _UPVALUE3_
  L3_2 = L3_2 .. L4_2
  L4_2 = os
  L4_2 = L4_2.execute
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = "md5sum /etc/config/* > "
  L5_2 = L2_2
  L3_2 = L4_2 .. L5_2
  L4_2 = os
  L4_2 = L4_2.execute
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = 0
  return L4_2
end

function L37_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L3_2 = "/tmp/mix_network_status"
  L4_2 = nil
  L5_2 = nil
  L6_2 = 0
  L7_2 = 0
  L8_2 = {}
  L9_2 = nil
  if A0_2 == nil then
    L10_2 = 0
    L11_2 = nil
    return L10_2, L11_2
  end
  if A2_2 ~= nil then
    L10_2 = string
    L10_2 = L10_2.find
    L11_2 = A2_2
    L12_2 = "TDP"
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 ~= nil then
      L10_2 = 0
      L11_2 = nil
      return L10_2, L11_2
    end
  end
  L10_2 = _UPVALUE0_
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = 0
    L11_2 = nil
    return L10_2, L11_2
  end
  L10_2 = _UPVALUE1_
  L11_2 = A0_2
  L12_2 = A1_2
  L10_2(L11_2, L12_2)
  L10_2 = _UPVALUE2_
  L10_2 = L10_2.get_role
  L10_2 = L10_2()
  if L10_2 ~= "AP" then
    L11_2 = 0
    L12_2 = nil
    return L11_2, L12_2
  end
  L11_2 = _UPVALUE3_
  L11_2 = L11_2.access
  L12_2 = L3_2
  L11_2 = L11_2(L12_2)
  if not L11_2 then
    L11_2 = 0
    L12_2 = nil
    return L11_2, L12_2
  end
  L11_2 = _UPVALUE3_
  L11_2 = L11_2.access
  L12_2 = _UPVALUE4_
  L11_2 = L11_2(L12_2)
  if L11_2 then
    L11_2 = io
    L11_2 = L11_2.open
    L12_2 = _UPVALUE4_
    L13_2 = "r"
    L11_2 = L11_2(L12_2, L13_2)
    L4_2 = L11_2
    L12_2 = L4_2
    L11_2 = L4_2.read
    L13_2 = "*all"
    L11_2 = L11_2(L12_2, L13_2)
    L5_2 = L11_2
    L12_2 = L4_2
    L11_2 = L4_2.close
    L11_2(L12_2)
    L11_2 = string
    L11_2 = L11_2.find
    L12_2 = L5_2
    L13_2 = A0_2
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 == nil then
      L12_2 = 0
      L13_2 = nil
      return L12_2, L13_2
    end
    L12_2 = string
    L12_2 = L12_2.sub
    L13_2 = L5_2
    L14_2 = L11_2
    L12_2 = L12_2(L13_2, L14_2)
    L13_2 = string
    L13_2 = L13_2.find
    L14_2 = L12_2
    L15_2 = "]"
    L13_2 = L13_2(L14_2, L15_2)
    L11_2 = L13_2
    if L11_2 == nil then
      L13_2 = 0
      L14_2 = nil
      return L13_2, L14_2
    end
    L13_2 = string
    L13_2 = L13_2.sub
    L14_2 = L12_2
    L15_2 = 1
    L16_2 = L11_2
    L13_2 = L13_2(L14_2, L15_2, L16_2)
    L14_2 = "{\"%s}"
    L15_2 = L14_2
    L14_2 = L14_2.format
    L16_2 = L13_2
    L14_2 = L14_2(L15_2, L16_2)
    L15_2 = _UPVALUE5_
    L15_2 = L15_2.decode
    L16_2 = L14_2
    L15_2 = L15_2(L16_2)
    L9_2 = L15_2
    L15_2 = L9_2[A0_2]
    if L15_2 then
      L15_2 = _UPVALUE6_
      L15_2 = L15_2()
      if L15_2 == nil then
        L16_2 = 0
        L17_2 = nil
        return L16_2, L17_2
      end
      L16_2 = L9_2[A0_2]
      L17_2 = ipairs
      L18_2 = L16_2
      L17_2, L18_2, L19_2 = L17_2(L18_2)
      for L20_2, L21_2 in L17_2, L18_2, L19_2 do
        if L15_2 == L21_2 then
          L6_2 = L6_2 + 1
        else
          L22_2 = #L8_2
          L22_2 = L22_2 + 1
          L8_2[L22_2] = L21_2
          L7_2 = L7_2 + 1
        end
      end
    else
      L15_2 = 0
      L16_2 = nil
      return L15_2, L16_2
    end
  else
    L11_2 = 0
    L12_2 = nil
    return L11_2, L12_2
  end
  if 1 <= L6_2 and L7_2 == 0 then
    L11_2 = 0
    L12_2 = nil
    return L11_2, L12_2
  elseif 1 <= L6_2 and 1 <= L7_2 then
    L11_2 = 1
    L12_2 = L8_2
    return L11_2, L12_2
  elseif L6_2 == 0 and 1 <= L7_2 then
    L11_2 = 2
    L12_2 = L8_2
    return L11_2, L12_2
  end
  L11_2 = 0
  L12_2 = nil
  return L11_2, L12_2
end

dispose_opcode = L37_1

function L37_1()
  local L0_2, L1_2
end

index = L37_1
