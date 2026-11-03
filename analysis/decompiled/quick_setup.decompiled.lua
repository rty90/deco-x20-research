local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1
L0_1 = module
L1_1 = "luci.controller.admin.mobile_app.quick_setup"
L2_1 = package
L2_1 = L2_1.seeall
L0_1(L1_1, L2_1)
L0_1 = require
L1_1 = "ubus"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "nixio"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "luci.model.uci"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "luci.sys"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "luci.json"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "luci.tools.debug"
L5_1 = L5_1(L6_1)
L6_1 = require
L7_1 = "luci.model.sync"
L6_1 = L6_1(L7_1)
L7_1 = require
L8_1 = "luci.model.tipc_config"
L7_1 = L7_1(L8_1)
L8_1 = require
L9_1 = "luci.model.tmp_decrypt"
L8_1 = L8_1(L9_1)
L9_1 = require
L10_1 = "luci.model.accountmgnt"
L9_1 = L9_1(L10_1)
L10_1 = require
L11_1 = "luci.model.getfirm"
L10_1 = L10_1(L11_1)
L11_1 = require
L12_1 = "luci.model.mode"
L11_1 = L11_1(L12_1)
L12_1 = require
L13_1 = "luci.model.app_sysmode"
L12_1 = L12_1(L13_1)
L13_1 = require
L14_1 = "luci.controller.admin.mobile_app.nat"
L13_1 = L13_1(L14_1)
L14_1 = require
L15_1 = "luci.model.wireless_common"
L14_1 = L14_1(L15_1)
L15_1 = L2_1.cursor
L15_1 = L15_1()
L16_1 = "/tmp/wifi_scan_result_2g"
L17_1 = "/tmp/wifi_scan_result_5g"
L18_1 = "/tmp/wifi_scan_result_5g_2"
L19_1 = "HOMEWIFISYSTEM"
L20_1 = 200

function L21_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == "table" then
    L1_2 = pairs
    L2_2 = A0_2
    L1_2, L2_2, L3_2 = L1_2(L2_2)
    for L4_2, L5_2 in L1_2, L2_2, L3_2 do
      L6_2 = _UPVALUE0_
      L6_2 = L6_2.print
      L7_2 = L4_2
      L8_2 = " = "
      L9_2 = tostring
      L10_2 = A0_2[L4_2]
      L9_2 = L9_2(L10_2)
      L7_2 = L7_2 .. L8_2 .. L9_2
      L6_2(L7_2)
      L6_2 = type
      L7_2 = A0_2[L4_2]
      L6_2 = L6_2(L7_2)
      if L6_2 == "table" then
        L6_2 = _print_tbl
        L7_2 = A0_2[L4_2]
        L6_2(L7_2)
      end
    end
  end
end

_print_tbl = L21_1

function L21_1(A0_2)
  local L1_2, L2_2
  if not A0_2 then
    A0_2 = "invalid args"
  end
  L1_2 = false
  L2_2 = A0_2
  return L1_2, L2_2
end

function L22_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = "luci.controller.admin.mobile_app."
  L2_2 = A0_2.module
  L1_2 = L1_2 .. L2_2
  L2_2 = require
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.dispatch
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  return L2_2
end

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if A0_2 then
    L1_2 = A0_2.bluetooth
    if L1_2 then
      goto lbl_9
    end
  end
  L1_2 = _UPVALUE0_
  do return L1_2() end
  ::lbl_9::
  L1_2 = _UPVALUE1_
  L1_2 = L1_2.print
  L2_2 = "recv bt_mode_set"
  L1_2(L2_2)
  L1_2 = A0_2.bluetooth
  L1_2 = L1_2.enable
  if L1_2 == true then
    L2_2 = _UPVALUE2_
    L3_2 = L2_2
    L2_2 = L2_2.set
    L4_2 = "bluetooth"
    L5_2 = "settings"
    L6_2 = "enable"
    L7_2 = "on"
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  elseif L1_2 == false then
    L2_2 = _UPVALUE2_
    L3_2 = L2_2
    L2_2 = L2_2.set
    L4_2 = "bluetooth"
    L5_2 = "settings"
    L6_2 = "enable"
    L7_2 = "off"
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    L2_2 = require
    L3_2 = "luci.model.mode"
    L2_2 = L2_2(L3_2)
    L3_2 = L2_2.is_iot_support
    L3_2 = L3_2()
    if L3_2 == true then
      L3_2 = L2_2.is_iot_wifionly
      L3_2 = L3_2()
      if L3_2 == false then
        L3_2 = require
        L4_2 = "luci.model.iot_ble"
        L3_2 = L3_2(L4_2)
        L4_2 = nil
        L5_2 = _UPVALUE3_
        L5_2 = L5_2.getfirm_cached
        L6_2 = "DEV_ID"
        L5_2 = L5_2(L6_2)
        L6_2 = L5_2
        L5_2 = L5_2.trim
        L5_2 = L5_2(L6_2)
        L6_2 = L3_2.create_mesh_network
        L6_2 = L6_2()
        L4_2 = L6_2
        L6_2 = _UPVALUE2_
        L7_2 = L6_2
        L6_2 = L6_2.set
        L8_2 = "ble_network"
        L9_2 = "settings"
        L10_2 = "key"
        L11_2 = L4_2.nwkey
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L6_2 = _UPVALUE2_
        L7_2 = L6_2
        L6_2 = L6_2.commit
        L8_2 = "ble_network"
        L6_2(L7_2, L8_2)
        L6_2 = _UPVALUE2_
        L7_2 = L6_2
        L6_2 = L6_2.set
        L8_2 = "zigbee_network_sync"
        L9_2 = "zigbee_network_sync"
        L10_2 = "co_device_id"
        L11_2 = L5_2
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L6_2 = "0x"
        L7_2 = tostring
        L8_2 = _UPVALUE4_
        L8_2 = L8_2.uniqueid
        L9_2 = 2
        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L6_2 = L6_2 .. L7_2
        L7_2 = _UPVALUE1_
        L8_2 = "Create coordinator: "
        L9_2 = L5_2
        L10_2 = ", panID: "
        L11_2 = L6_2
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
        L7_2(L8_2)
        L7_2 = _UPVALUE2_
        L8_2 = L7_2
        L7_2 = L7_2.set
        L9_2 = "zigbee_network_sync"
        L10_2 = "zigbee_network_sync"
        L11_2 = "panID"
        L12_2 = L6_2
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
        L7_2 = _UPVALUE2_
        L8_2 = L7_2
        L7_2 = L7_2.set
        L9_2 = "zigbee_network_sync"
        L10_2 = "zigbee_network_sync"
        L11_2 = "model"
        L12_2 = _UPVALUE3_
        L12_2 = L12_2.getfirm_cached
        L13_2 = "MODEL"
        L12_2 = L12_2(L13_2)
        L13_2 = L12_2
        L12_2 = L12_2.trim
        L12_2, L13_2 = L12_2(L13_2)
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L7_2 = _UPVALUE2_
        L8_2 = L7_2
        L7_2 = L7_2.commit
        L9_2 = "zigbee_network_sync"
        L7_2(L8_2, L9_2)
      end
    end
  else
    L2_2 = _UPVALUE0_
    return L2_2()
  end
  L2_2 = _UPVALUE2_
  L3_2 = L2_2
  L2_2 = L2_2.commit
  L4_2 = "bluetooth"
  return L2_2(L3_2, L4_2)
end

function L24_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = {}
  L1_2 = _UPVALUE0_
  L2_2 = L1_2
  L1_2 = L1_2.get
  L3_2 = "bluetooth"
  L4_2 = "settings"
  L5_2 = "enable"
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L2_2 = {}
  L0_2.bluetooth = L2_2
  if L1_2 == "on" then
    L2_2 = L0_2.bluetooth
    L2_2.enable = true
  else
    L2_2 = L0_2.bluetooth
    L2_2.enable = false
  end
  return L0_2
end

function L25_1(A0_2)
  local L1_2, L2_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.exec
  L2_2 = "echo 1 >> /tmp/binding_over "
  L1_2(L2_2)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.fork_call
  L2_2 = "/etc/init.d/cloud_brd restart &"
  L1_2(L2_2)
  if not A0_2 or A0_2 ~= "RE" then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.fork_call
    L2_2 = "/usr/sbin/handheld_radar &"
    L1_2(L2_2)
  end
end

function L26_1()
  local L0_2, L1_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.fork_call
  L1_2 = "fw delete_rule_forbid_forward"
  L0_2(L1_2)
end

function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = require
  L2_2 = "luci.model.subprocess"
  L1_2 = L1_2(L2_2)
  L2_2 = A0_2.user_network
  if L2_2 then
    L3_2 = L2_2.ssid
    if L3_2 then
      L3_2 = L2_2.ssid
      if L3_2 ~= "" then
        goto lbl_16
      end
    end
  end
  L3_2 = -10001
  L4_2 = "invaild user network"
  do return L3_2, L4_2 end
  ::lbl_16::
  L3_2 = _UPVALUE0_
  L3_2 = L3_2.bin
  L3_2 = L3_2.b64decode
  L4_2 = L2_2.ssid
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = -10001
    L5_2 = "invaild user network ssid"
    return L4_2, L5_2
  end
  L4_2 = false
  L5_2 = {}
  L6_2 = {}
  L7_2 = _UPVALUE1_
  L6_2.band2_4 = L7_2
  L7_2 = _UPVALUE2_
  L6_2.band5_1 = L7_2
  L7_2 = _UPVALUE3_
  L6_2.band5_2 = L7_2
  L7_2 = pairs
  L8_2 = L6_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = io
    L12_2 = L12_2.open
    L13_2 = L6_2[L10_2]
    L14_2 = "r"
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      L14_2 = L12_2
      L13_2 = L12_2.read
      L15_2 = "*a"
      L13_2 = L13_2(L14_2, L15_2)
      L14_2 = {}
      L16_2 = L12_2
      L15_2 = L12_2.close
      L15_2(L16_2)
      L15_2 = _UPVALUE4_
      L15_2 = L15_2.ssid_exist
      L16_2 = L13_2
      L17_2 = L3_2
      L15_2 = L15_2(L16_2, L17_2)
      L14_2 = L15_2
      L15_2 = L14_2.exist
      if L15_2 == true then
        L15_2 = L14_2.channel
        if L15_2 ~= 0 then
          L4_2 = L14_2.exist
          L15_2 = L14_2.channel
          L5_2[L10_2] = L15_2
        end
      end
    end
  end
  L7_2 = require
  L8_2 = "luci.model.mode"
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2.is_band_6g_support
  L8_2 = L8_2()
  L9_2 = {}
  L10_2 = require
  L11_2 = "luci.model.mode"
  L10_2 = L10_2(L11_2)
  L11_2 = L10_2.get_radio_device_name
  L12_2 = "radio_2g"
  L11_2 = L11_2(L12_2)
  L12_2 = L10_2.get_radio_device_name
  L13_2 = "radio_5g"
  L12_2 = L12_2(L13_2)
  L13_2 = L10_2.get_radio_device_name
  L14_2 = "radio_5g_2"
  L13_2 = L13_2(L14_2)
  L14_2 = nil
  if L8_2 == true then
    L15_2 = L10_2.get_radio_device_name
    L16_2 = "radio_6g"
    L15_2 = L15_2(L16_2)
    L14_2 = L15_2
  end
  L15_2 = _UPVALUE5_
  L16_2 = L15_2
  L15_2 = L15_2.foreach
  L17_2 = "wireless"
  L18_2 = "wifi-iface"
  
  function L19_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.mode
    if L1_3 == "ap" then
      L1_3 = A0_3.disabled
      if L1_3 == "0" then
        L1_3 = A0_3.device
        L2_3 = _UPVALUE0_
        if L1_3 == L2_3 then
          L1_3 = _UPVALUE1_
          L2_3 = A0_3[".name"]
          L1_3.band2_4 = L2_3
        else
          L1_3 = A0_3.device
          L2_3 = _UPVALUE2_
          if L1_3 == L2_3 then
            L1_3 = _UPVALUE1_
            L2_3 = A0_3[".name"]
            L1_3.band5_1 = L2_3
          else
            L1_3 = A0_3.device
            L2_3 = _UPVALUE3_
            if L1_3 == L2_3 then
              L1_3 = _UPVALUE1_
              L2_3 = A0_3[".name"]
              L1_3.band5_2 = L2_3
            else
              L1_3 = A0_3.device
              L2_3 = _UPVALUE4_
              if L1_3 == L2_3 then
                L1_3 = _UPVALUE1_
                L2_3 = A0_3[".name"]
                L1_3.band6 = L2_3
              end
            end
          end
        end
      end
    end
  end
  
  L15_2(L16_2, L17_2, L18_2, L19_2)
  if L4_2 and L5_2 then
    L15_2 = _UPVALUE4_
    L15_2 = L15_2.scan_special_ssid
    L16_2 = L5_2
    L17_2 = L9_2
    L18_2 = L3_2
    L15_2 = L15_2(L16_2, L17_2, L18_2)
    if L15_2 == true then
      L4_2 = true
    end
  else
    L15_2 = _UPVALUE4_
    L15_2 = L15_2.scan_user_ssid
    L16_2 = L9_2
    L17_2 = L3_2
    L15_2 = L15_2(L16_2, L17_2)
    if L15_2 == true then
      L4_2 = true
    end
  end
  L15_2 = {}
  L16_2 = {}
  L16_2.eponymous_network_exist = L4_2
  return L16_2
end

function L28_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = A0_2.key
    if L1_2 then
      L1_2 = A0_2.gid
      if L1_2 then
        goto lbl_12
      end
    end
  end
  L1_2 = false
  L2_2 = "invalid input"
  do return L1_2, L2_2 end
  ::lbl_12::
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.__check_group_gid_valid
  L2_2 = A0_2.gid
  L1_2 = L1_2(L2_2)
  if L1_2 == false then
    L1_2 = false
    L2_2 = "gid check failed"
    return L1_2, L2_2
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.__check_group_key_valid
  L2_2 = A0_2.key
  return L1_2(L2_2)
end

preconf_check = L28_1

function L28_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = _UPVALUE0_
  L2_2 = _UPVALUE1_
  L2_2 = L2_2.encode
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = "isp_onboarding:%s" % L2_2
  L1_2(L2_2)
  if not A0_2 then
    L1_2 = _UPVALUE2_
    L2_2 = "params not found"
    return L1_2(L2_2)
  end
  L1_2 = A0_2.cloud_account
  if L1_2 then
    L2_2 = L1_2.username
    if L2_2 then
      L2_2 = L1_2.username
      if L2_2 ~= "" then
        goto lbl_26
      end
    end
  end
  L2_2 = -1006
  L3_2 = "invalid cloud_account args"
  do return L2_2, L3_2 end
  ::lbl_26::
  L2_2 = _UPVALUE3_
  L2_2 = L2_2.read_group_info
  L2_2 = L2_2()
  if L2_2 then
    L3_2 = L2_2.key
    if L3_2 then
      L3_2 = L2_2.gid
      if L3_2 then
        goto lbl_40
      end
    end
  end
  L3_2 = -1006
  L4_2 = "group-info invaild"
  do return L3_2, L4_2 end
  ::lbl_40::
  L3_2 = _UPVALUE4_
  L3_2 = L3_2.getfirm_cached
  L4_2 = "DEV_ID"
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2
  L3_2 = L3_2.trim
  L3_2 = L3_2(L4_2)
  L4_2 = _UPVALUE5_
  L4_2 = L4_2.tmp_handle_string
  L5_2 = L1_2.username
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2
  L4_2 = L4_2.trim
  L4_2 = L4_2(L5_2)
  L1_2.username = L4_2
  L4_2 = _UPVALUE5_
  L4_2 = L4_2.tmp_handle_string
  L5_2 = L1_2.password
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2
  L4_2 = L4_2.trim
  L4_2 = L4_2(L5_2)
  L1_2.password = L4_2
  L4_2 = {}
  L5_2 = {}
  L4_2.params = L5_2
  L5_2 = L4_2.params
  L6_2 = {}
  L5_2.nickname = L6_2
  L5_2 = L4_2.params
  L5_2.cloud_account = L1_2
  L5_2 = L4_2.params
  L6_2 = L2_2.gid
  L5_2.group_id = L6_2
  L5_2 = L4_2.params
  L6_2 = L2_2.key
  L5_2.group_key = L6_2
  L5_2 = _UPVALUE6_
  L6_2 = L5_2
  L5_2 = L5_2.get
  L7_2 = "wifi"
  L8_2 = "ap"
  L9_2 = "ssid"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = "TP-LINK"
  end
  L6_2 = L4_2.params
  L7_2 = _UPVALUE7_
  L7_2 = L7_2.bin
  L7_2 = L7_2.b64encode
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  L6_2.group_name = L7_2
  L6_2 = L4_2.params
  L6_2.master_device_id = L3_2
  L4_2.module = "cloud"
  L4_2.form = "group"
  L4_2.operation = "create"
  L6_2 = _UPVALUE8_
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  res = L6_2
  L6_2 = res
  if L6_2 then
    L6_2 = res
    L6_2 = L6_2.error_code
    if L6_2 == 0 then
      goto lbl_123
    end
  end
  L6_2 = _UPVALUE0_
  L7_2 = _UPVALUE1_
  L7_2 = L7_2.encode
  L8_2 = res
  L7_2 = L7_2(L8_2)
  L7_2 = "res:%s" % L7_2
  L6_2(L7_2)
  L6_2 = -1014
  L7_2 = res
  if L7_2 then
    L7_2 = res
    L7_2 = L7_2.msg
    if L7_2 then
      goto lbl_122
    end
  end
  L7_2 = "set cloud account failed"
  ::lbl_122::
  do return L6_2, L7_2 end
  ::lbl_123::
  L6_2 = require
  L7_2 = "luci.model.app_wifi"
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2.Wifi
  L6_2 = L6_2()
  L8_2 = L6_2
  L7_2 = L6_2.get_backhaul_channel
  L7_2 = L7_2(L8_2)
  L8_2 = _UPVALUE3_
  L8_2 = L8_2.get_preconf_pack
  L8_2 = L8_2()
  L9_2 = _UPVALUE0_
  L10_2 = _UPVALUE1_
  L10_2 = L10_2.encode
  L11_2 = L8_2
  L10_2 = L10_2(L11_2)
  L10_2 = "pack is %s" % L10_2
  L9_2(L10_2)
  L9_2 = {}
  L10_2 = L2_2.gid
  L9_2.group_id = L10_2
  L10_2 = L2_2.key
  L9_2.group_key = L10_2
  L9_2.master_device_id = L3_2
  L9_2.backhaul = L7_2
  L9_2.suit_count = L8_2
  return L9_2
end

function L29_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  L2_2 = require
  L3_2 = "luci.model.mode"
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.is_set_newgateway_support
  L3_2 = L3_2()
  if not L3_2 then
    L3_2 = -1018
    L4_2 = "Not support to create new group"
    return L3_2, L4_2
  end
  if not A0_2 then
    L3_2 = -1001
    L4_2 = "params not found"
    return L3_2, L4_2
  end
  L3_2 = A0_2.wan
  L4_2 = A0_2.nickname
  L5_2 = A0_2.wireless
  L6_2 = require
  L7_2 = "luci.model.mode"
  L6_2 = L6_2(L7_2)
  L7_2 = A0_2.firmware
  if L5_2 then
    L8_2 = L5_2.ssid
    if L8_2 then
      L8_2 = L5_2.password
      if L8_2 then
        L8_2 = L5_2.ssid
        if L8_2 ~= "" then
          goto lbl_46
        end
      end
    end
  end
  L8_2 = L6_2.is_isp_onboarding
  L8_2 = L8_2()
  if L8_2 then
    L8_2 = _UPVALUE0_
    L9_2 = A0_2
    return L8_2(L9_2)
  else
    L8_2 = -1003
    L9_2 = "invalid wireless args"
    return L8_2, L9_2
  end
  ::lbl_46::
  L8_2 = A0_2.cloud_account
  if L8_2 then
    L9_2 = L8_2.username
    if L9_2 then
      L9_2 = L8_2.username
      if L9_2 ~= "" then
        goto lbl_58
      end
    end
  end
  L9_2 = -1006
  L10_2 = "invalid cloud_account args"
  do return L9_2, L10_2 end
  ::lbl_58::
  L9_2 = _UPVALUE1_
  L9_2 = L9_2.tmp_handle_string
  L10_2 = L8_2.username
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2
  L9_2 = L9_2.trim
  L9_2 = L9_2(L10_2)
  L8_2.username = L9_2
  L9_2 = _UPVALUE1_
  L9_2 = L9_2.tmp_handle_string
  L10_2 = L8_2.password
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2
  L9_2 = L9_2.trim
  L9_2 = L9_2(L10_2)
  L8_2.password = L9_2
  L9_2 = A0_2.date_time
  if L9_2 then
    L10_2 = L9_2.timezone
    if L10_2 then
      L10_2 = L9_2.tz_region
      if L10_2 then
        goto lbl_84
      end
    end
  end
  L10_2 = -1005
  L11_2 = "invalid date_time args"
  do return L10_2, L11_2 end
  ::lbl_84::
  L10_2 = _UPVALUE2_
  L10_2 = L10_2.getfirm_cached
  L11_2 = "DEV_ID"
  L10_2 = L10_2(L11_2)
  L11_2 = L10_2
  L10_2 = L10_2.trim
  L10_2 = L10_2(L11_2)
  L11_2 = _UPVALUE3_
  L11_2 = L11_2.read_group_info
  L11_2 = L11_2()
  if L11_2 then
    L12_2 = L11_2.gid
    if L12_2 then
      L12_2 = _UPVALUE4_
      L13_2 = "Warning: overwriting group "
      L14_2 = L11_2.gid
      L12_2(L13_2, L14_2)
    end
  end
  L12_2 = _UPVALUE3_
  L12_2 = L12_2.read_preconf_group_info
  L12_2 = L12_2()
  if L12_2 then
    L13_2 = L12_2.gid
    if L13_2 then
      L13_2 = L12_2.key
      if L13_2 then
        L13_2 = preconf_check
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          L11_2 = L12_2
          L13_2 = _UPVALUE4_
          L13_2 = L13_2.print
          L14_2 = "set master: use preconf_group as group"
          L13_2(L14_2)
      end
    end
  end
  else
    L13_2 = _UPVALUE3_
    L13_2 = L13_2.create_group
    L13_2 = L13_2()
    L11_2 = L13_2
  end
  L13_2 = _UPVALUE3_
  L13_2 = L13_2.set_create_group_flag
  L13_2()
  if L3_2 then
    L13_2 = {}
    L14_2 = {}
    L13_2.params = L14_2
    L14_2 = L13_2.params
    L14_2.wan = L3_2
    L13_2.module = "network"
    L13_2.form = "wan_ipv4"
    L13_2.operation = "write"
    L14_2 = _UPVALUE5_
    L15_2 = L13_2
    L14_2 = L14_2(L15_2)
    L1_2 = L14_2
    if L1_2 then
      L14_2 = L1_2.error_code
      if L14_2 == 0 then
        goto lbl_161
      end
    end
    L14_2 = _UPVALUE3_
    L14_2 = L14_2.clear_create_group_flag
    L14_2()
    L14_2 = -1010
    if L1_2 then
      L15_2 = L1_2.msg
      if L15_2 then
        goto lbl_160
      end
    end
    L15_2 = "set wan failed"
    ::lbl_160::
    do return L14_2, L15_2 end
    ::lbl_161::
    L14_2 = L3_2.vlan
    if L14_2 then
      L14_2 = {}
      L15_2 = L3_2.vlan
      L15_2 = L15_2.enable
      L14_2.enable = L15_2
      L15_2 = nil
      L16_2 = require
      L17_2 = "luci.model.app_network"
      L16_2 = L16_2(L17_2)
      L17_2 = L14_2.enable
      if L17_2 ~= false then
        L17_2 = L3_2.vlan
        L17_2 = L17_2.id
        if L17_2 then
          L17_2 = L3_2.vlan
          L17_2 = L17_2.id
          if L17_2 ~= -1 then
            goto lbl_189
          end
        end
      end
      L14_2.enable = false
      L14_2.isp_name = nil
      L14_2.id = nil
      L14_2.priority = 0
      L14_2.tag_802_1q = true
      goto lbl_215
      ::lbl_189::
      L17_2 = L14_2.enable
      if L17_2 == true then
        L17_2 = L3_2.vlan
        L17_2 = L17_2.isp_name
        L14_2.isp_name = L17_2
        L17_2 = L3_2.vlan
        L17_2 = L17_2.id
        L14_2.id = L17_2
        L17_2 = L3_2.vlan
        L17_2 = L17_2.priority
        L14_2.priority = L17_2
        L17_2 = L3_2.vlan
        L17_2 = L17_2.tag_802_1q
        L14_2.tag_802_1q = L17_2
      else
        L17_2 = _UPVALUE4_
        L17_2 = L17_2.print
        L18_2 = "unknown vlan status."
        L17_2(L18_2)
        L17_2 = _UPVALUE3_
        L17_2 = L17_2.clear_create_group_flag
        L17_2()
        L17_2 = _UPVALUE6_
        return L17_2()
      end
      ::lbl_215::
      L17_2 = L3_2.vlan
      L17_2 = L17_2.iptv_enable
      if L17_2 == true then
        L14_2.iptv_enable = true
        L17_2 = L3_2.vlan
        L17_2 = L17_2.iptv_mode
        L14_2.iptv_mode = L17_2
        L17_2 = L3_2.vlan
        L17_2 = L17_2.iptv_isp_name
        L14_2.iptv_isp_name = L17_2
        L17_2 = L3_2.vlan
        L17_2 = L17_2.iptv_id
        L14_2.iptv_id = L17_2
        L17_2 = L3_2.vlan
        L17_2 = L17_2.iptv_priority
        L14_2.iptv_priority = L17_2
        L17_2 = L3_2.vlan
        L17_2 = L17_2.iptv_port
        L14_2.iptv_port = L17_2
        L17_2 = L14_2.iptv_port
        if not L17_2 then
          goto lbl_259
        end
        L17_2 = L14_2.iptv_port
        L17_2 = L17_2.ports
        if not L17_2 then
          goto lbl_259
        end
        L17_2 = ipairs
        L18_2 = L14_2.iptv_port
        L18_2 = L18_2.ports
        L17_2, L18_2, L19_2 = L17_2(L18_2)
        for L20_2, L21_2 in L17_2, L18_2, L19_2 do
          L22_2 = L21_2.device_id
          if L22_2 then
            L22_2 = L21_2.device_id
            L22_2 = #L22_2
            if L22_2 ~= 0 then
              goto lbl_255
            end
          end
          L21_2.device_id = L10_2
          ::lbl_255::
        end
      else
        L14_2.iptv_enable = false
      end
      ::lbl_259::
      L17_2 = L16_2.set_vlan
      L18_2 = L14_2
      L17_2 = L17_2(L18_2)
      L15_2 = L17_2
      if L15_2 ~= true then
        L17_2 = _UPVALUE3_
        L17_2 = L17_2.clear_create_group_flag
        L17_2()
        L17_2 = _UPVALUE6_
        return L17_2()
      end
    end
    L14_2 = L3_2.mac_clone
    if L14_2 then
      L14_2 = {}
      L15_2 = L3_2.mac_clone
      L15_2 = L15_2.enable
      if L15_2 == true then
        L14_2.enable = true
        L15_2 = L3_2.mac_clone
        L15_2 = L15_2.clone_mode
        L14_2.clone_mode = L15_2
        L15_2 = L3_2.mac_clone
        L15_2 = L15_2.mac
        L14_2.mac = L15_2
      else
        L14_2.enable = false
      end
      L15_2 = require
      L16_2 = "luci.model.app_network"
      L15_2 = L15_2(L16_2)
      L16_2 = L15_2.set_mac_clone
      L17_2 = L14_2
      L16_2 = L16_2(L17_2)
      if L16_2 == false then
        L17_2 = _UPVALUE4_
        L17_2 = L17_2.print
        L18_2 = "set wan mac_clone fail."
        L17_2(L18_2)
      end
    end
  else
    L13_2 = A0_2.operation_mode
    if L13_2 ~= nil then
      L13_2 = A0_2.operation_mode
      if L13_2 ~= "Router" then
        goto lbl_376
      end
    end
    L13_2 = _UPVALUE4_
    L13_2 = L13_2.print
    L14_2 = "make default wan config!!!"
    L13_2(L14_2)
    L13_2 = {}
    L13_2.dial_type = "dynamic_ip"
    L13_2.enable_auto_dns = true
    L14_2 = require
    L15_2 = "luci.model.app_network"
    L14_2 = L14_2(L15_2)
    L15_2 = {}
    L16_2 = {}
    L15_2.params = L16_2
    L16_2 = L15_2.params
    L16_2.wan = L13_2
    L15_2.module = "network"
    L15_2.form = "wan_ipv4"
    L15_2.operation = "write"
    L16_2 = _UPVALUE5_
    L17_2 = L15_2
    L16_2 = L16_2(L17_2)
    L1_2 = L16_2
    if L1_2 then
      L16_2 = L1_2.error_code
      if L16_2 == 0 then
        goto lbl_345
      end
    end
    L16_2 = _UPVALUE3_
    L16_2 = L16_2.clear_create_group_flag
    L16_2()
    L16_2 = -1010
    if L1_2 then
      L17_2 = L1_2.msg
      if L17_2 then
        goto lbl_344
      end
    end
    L17_2 = "set wan failed"
    ::lbl_344::
    do return L16_2, L17_2 end
    ::lbl_345::
    L16_2 = {}
    L16_2.enable = false
    L17_2 = nil
    L16_2.isp_name = nil
    L16_2.id = nil
    L16_2.priority = 0
    L16_2.tag_802_1q = true
    L16_2.iptv_enable = false
    L18_2 = L14_2.set_vlan
    L19_2 = L16_2
    L18_2 = L18_2(L19_2)
    L17_2 = L18_2
    if L17_2 ~= true then
      L18_2 = _UPVALUE3_
      L18_2 = L18_2.clear_create_group_flag
      L18_2()
      L18_2 = _UPVALUE6_
      return L18_2()
    end
    L18_2 = {}
    L18_2.enable = false
    L19_2 = L14_2.set_mac_clone
    L20_2 = L18_2
    L19_2 = L19_2(L20_2)
    if L19_2 == false then
      L20_2 = _UPVALUE4_
      L20_2 = L20_2.print
      L21_2 = "set wan mac_clone fail."
      L20_2(L21_2)
    end
  end
  ::lbl_376::
  L13_2 = L6_2.is_mobile_device
  L13_2 = L13_2()
  if L13_2 then
    L13_2 = A0_2.mobile_cpe
    if L13_2 then
      L13_2 = require
      L14_2 = "luci.controller.admin.mobile_app.network_mobile"
      L13_2 = L13_2(L14_2)
      L14_2 = A0_2.mobile_cpe
      L14_2 = L14_2.profile_id
      if L14_2 then
        L14_2 = A0_2.mobile_cpe
        L14_2 = L14_2.profile_type
        if L14_2 then
          L14_2 = A0_2.mobile_cpe
          L14_2 = L14_2.profile_type
          if L14_2 == "custom" then
            L14_2 = L13_2.modify_profile
            L15_2 = A0_2.mobile_cpe
            L14_2 = L14_2(L15_2)
            L15_2 = type
            L16_2 = L14_2
            L15_2 = L15_2(L16_2)
            if L15_2 ~= "boolean" then
              L15_2 = -10001
              L16_2 = "set internet info failed"
              return L15_2, L16_2
            end
          end
        end
      end
      L14_2 = _UPVALUE4_
      L14_2 = L14_2.print
      L15_2 = "set_active_profile"
      L14_2(L15_2)
      L14_2 = L13_2.set_active_profile
      L15_2 = A0_2.mobile_cpe
      L14_2 = L14_2(L15_2)
      if L14_2 == 1 then
        L15_2 = -10001
        L16_2 = "set internet info failed"
        return L15_2, L16_2
      end
    end
  end
  L13_2 = {}
  L13_2.enable = "1"
  L14_2 = _UPVALUE7_
  L14_2 = L14_2.bin
  L14_2 = L14_2.b64decode
  L15_2 = L5_2.ssid
  L14_2 = L14_2(L15_2)
  L13_2.ssid = L14_2
  L14_2 = _UPVALUE7_
  L14_2 = L14_2.bin
  L14_2 = L14_2.b64decode
  L15_2 = L5_2.password
  L14_2 = L14_2(L15_2)
  L13_2.password = L14_2
  L14_2 = L13_2.ssid
  if L14_2 then
    L14_2 = L13_2.password
    if L14_2 then
      goto lbl_447
    end
  end
  L14_2 = _UPVALUE3_
  L14_2 = L14_2.clear_create_group_flag
  L14_2()
  L14_2 = -1001
  L15_2 = "invalid args"
  do return L14_2, L15_2 end
  ::lbl_447::
  L14_2 = require
  L15_2 = "luci.model.app_wifi"
  L14_2 = L14_2(L15_2)
  L14_2 = L14_2.Wifi
  L14_2 = L14_2()
  L16_2 = L14_2
  L15_2 = L14_2.set_ap
  L17_2 = L13_2
  L15_2(L16_2, L17_2)
  L16_2 = L14_2
  L15_2 = L14_2.set_backhaul
  L17_2 = L11_2.key
  L15_2(L16_2, L17_2)
  L16_2 = L14_2
  L15_2 = L14_2.commit
  L15_2 = L15_2(L16_2)
  if not L15_2 then
    L16_2 = _UPVALUE3_
    L16_2 = L16_2.clear_create_group_flag
    L16_2()
    L16_2 = -1011
    L17_2 = "set wifi failed."
    return L16_2, L17_2
  end
  L16_2 = {}
  L16_2.params = L9_2
  L16_2.module = "device"
  L16_2.form = "timesetting"
  L16_2.operation = "write"
  L17_2 = _UPVALUE5_
  L18_2 = L16_2
  L17_2 = L17_2(L18_2)
  L1_2 = L17_2
  if L1_2 then
    L17_2 = L1_2.error_code
    if L17_2 == 0 then
      goto lbl_493
    end
  end
  L17_2 = _UPVALUE3_
  L17_2 = L17_2.clear_create_group_flag
  L17_2()
  L17_2 = -1013
  if L1_2 then
    L18_2 = L1_2.msg
    if L18_2 then
      goto lbl_492
    end
  end
  L18_2 = "set time failed"
  ::lbl_492::
  do return L17_2, L18_2 end
  ::lbl_493::
  L17_2 = {}
  L18_2 = {}
  L17_2.params = L18_2
  L18_2 = L17_2.params
  L18_2.nickname = L4_2
  L18_2 = L17_2.params
  L18_2.cloud_account = L8_2
  L18_2 = L17_2.params
  L19_2 = L11_2.gid
  L18_2.group_id = L19_2
  L18_2 = L17_2.params
  L19_2 = L11_2.key
  L18_2.group_key = L19_2
  if L5_2 then
    L18_2 = L5_2.ssid
    if L18_2 then
      L18_2 = L17_2.params
      L19_2 = L5_2.ssid
      L18_2.group_name = L19_2
  end
  else
    L18_2 = _UPVALUE3_
    L18_2 = L18_2.get_wireless_spec
    L18_2 = L18_2()
    L19_2 = L17_2.params
    L20_2 = L18_2.ssid
    L19_2.group_name = L20_2
  end
  L18_2 = L17_2.params
  L18_2.master_device_id = L10_2
  L17_2.module = "cloud"
  L17_2.form = "group"
  L17_2.operation = "create"
  L18_2 = _UPVALUE5_
  L19_2 = L17_2
  L18_2 = L18_2(L19_2)
  L1_2 = L18_2
  if L1_2 then
    L18_2 = L1_2.error_code
    if L18_2 == 0 then
      goto lbl_546
    end
  end
  L18_2 = _UPVALUE3_
  L18_2 = L18_2.clear_create_group_flag
  L18_2()
  L18_2 = -1014
  if L1_2 then
    L19_2 = L1_2.msg
    if L19_2 then
      goto lbl_545
    end
  end
  L19_2 = "set cloud account failed"
  ::lbl_545::
  do return L18_2, L19_2 end
  ::lbl_546::
  L18_2 = _UPVALUE3_
  L18_2 = L18_2.join_group
  L19_2 = L11_2.gid
  L20_2 = L11_2.key
  L21_2 = "AP"
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = {}
  L19_2 = _UPVALUE2_
  L19_2 = L19_2.getfirm_cached
  L20_2 = "MAC"
  L19_2 = L19_2(L20_2)
  L20_2 = L19_2
  L19_2 = L19_2.trim
  L19_2 = L19_2(L20_2)
  L18_2.mac = L19_2
  L18_2.role = "AP"
  L19_2 = L4_2.nickname
  if L19_2 == "custom" then
    L20_2 = L4_2.custom_nickname
    if L20_2 then
      L19_2 = L4_2.custom_nickname
    end
  end
  L18_2.nickname = L19_2
  L20_2 = tostring
  L21_2 = os
  L21_2 = L21_2.time
  L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2 = L21_2()
  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2)
  L18_2.bindtime = L20_2
  L20_2 = _UPVALUE7_
  L20_2 = L20_2.fs
  L20_2 = L20_2.access
  L21_2 = "/tmp/run/ntpd.uptime"
  L20_2 = L20_2(L21_2)
  if not L20_2 and L9_2 then
    L20_2 = L9_2.time
    if L20_2 then
      L20_2 = tostring
      L21_2 = L9_2.time
      L20_2 = L20_2(L21_2)
      L18_2.bindtime = L20_2
    end
  end
  L20_2 = _UPVALUE3_
  L20_2 = L20_2.getfirm_cached
  L21_2 = "MODEL"
  L20_2 = L20_2(L21_2)
  L18_2.device_model = L20_2
  L20_2 = _UPVALUE3_
  L20_2 = L20_2.get_pregroup_crc32_hex
  L20_2 = L20_2()
  if L20_2 and L20_2 ~= "" then
    L18_2.preconf_id = L20_2
  end
  L21_2 = _UPVALUE3_
  L21_2 = L21_2.add_bind_device
  L22_2 = L10_2
  L23_2 = L18_2
  L21_2(L22_2, L23_2)
  L21_2 = _UPVALUE8_
  L22_2 = L21_2
  L21_2 = L21_2.set
  L23_2 = "bluetooth"
  L24_2 = "settings"
  L25_2 = "enable"
  L26_2 = "off"
  L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
  L21_2 = _UPVALUE8_
  L22_2 = L21_2
  L21_2 = L21_2.commit
  L23_2 = "bluetooth"
  L21_2(L22_2, L23_2)
  L21_2 = L6_2.is_iot_support
  L21_2 = L21_2()
  if L21_2 == true then
    L21_2 = L6_2.is_iot_wifionly
    L21_2 = L21_2()
    if L21_2 == false then
      L21_2 = require
      L22_2 = "luci.model.iot_ble"
      L21_2 = L21_2(L22_2)
      L22_2 = nil
      L23_2 = _UPVALUE2_
      L23_2 = L23_2.getfirm_cached
      L24_2 = "DEV_ID"
      L23_2 = L23_2(L24_2)
      L24_2 = L23_2
      L23_2 = L23_2.trim
      L23_2 = L23_2(L24_2)
      L24_2 = L21_2.create_mesh_network
      L24_2 = L24_2()
      L22_2 = L24_2
      L24_2 = _UPVALUE8_
      L25_2 = L24_2
      L24_2 = L24_2.set
      L26_2 = "ble_network"
      L27_2 = "settings"
      L28_2 = "key"
      L29_2 = L22_2.nwkey
      L24_2(L25_2, L26_2, L27_2, L28_2, L29_2)
      L24_2 = _UPVALUE8_
      L25_2 = L24_2
      L24_2 = L24_2.commit
      L26_2 = "ble_network"
      L24_2(L25_2, L26_2)
      L24_2 = _UPVALUE8_
      L25_2 = L24_2
      L24_2 = L24_2.set
      L26_2 = "zigbee_network_sync"
      L27_2 = "zigbee_network_sync"
      L28_2 = "co_device_id"
      L29_2 = L23_2
      L24_2(L25_2, L26_2, L27_2, L28_2, L29_2)
      L24_2 = "0x"
      L25_2 = tostring
      L26_2 = _UPVALUE9_
      L26_2 = L26_2.uniqueid
      L27_2 = 2
      L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2 = L26_2(L27_2)
      L25_2 = L25_2(L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2)
      L24_2 = L24_2 .. L25_2
      L25_2 = _UPVALUE4_
      L26_2 = "Create coordinator: "
      L27_2 = L23_2
      L28_2 = ", panID: "
      L29_2 = L24_2
      L26_2 = L26_2 .. L27_2 .. L28_2 .. L29_2
      L25_2(L26_2)
      L25_2 = _UPVALUE8_
      L26_2 = L25_2
      L25_2 = L25_2.set
      L27_2 = "zigbee_network_sync"
      L28_2 = "zigbee_network_sync"
      L29_2 = "panID"
      L30_2 = L24_2
      L25_2(L26_2, L27_2, L28_2, L29_2, L30_2)
      L25_2 = _UPVALUE8_
      L26_2 = L25_2
      L25_2 = L25_2.set
      L27_2 = "zigbee_network_sync"
      L28_2 = "zigbee_network_sync"
      L29_2 = "model"
      L30_2 = _UPVALUE2_
      L30_2 = L30_2.getfirm_cached
      L31_2 = "MODEL"
      L30_2 = L30_2(L31_2)
      L31_2 = L30_2
      L30_2 = L30_2.trim
      L30_2, L31_2, L32_2 = L30_2(L31_2)
      L25_2(L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2)
      L25_2 = _UPVALUE8_
      L26_2 = L25_2
      L25_2 = L25_2.commit
      L27_2 = "zigbee_network_sync"
      L25_2(L26_2, L27_2)
    end
  end
  L21_2 = L6_2.is_auto_upgrade_support
  L21_2 = L21_2()
  if L21_2 == true then
    L21_2 = require
    L22_2 = "luci.model.auto_upgrade"
    L21_2 = L21_2(L22_2)
    if L7_2 ~= nil then
      L22_2 = L21_2.set_auto_upgrade
      L23_2 = L7_2
      L22_2(L23_2)
    else
      L22_2 = _UPVALUE9_
      L22_2 = L22_2.fork_exec
      L23_2 = "auto_upgrade unsub"
      L22_2(L23_2)
    end
  end
  L21_2 = _UPVALUE8_
  L22_2 = L21_2
  L21_2 = L21_2.set
  L23_2 = "wifi"
  L24_2 = "default"
  L25_2 = "enable"
  L26_2 = "0"
  L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
  L21_2 = _UPVALUE9_
  L21_2 = L21_2.exec
  L22_2 = "echo \"wifi.default.enable='1'\" >> /var/state/wifi "
  L21_2(L22_2)
  L21_2 = _UPVALUE8_
  L22_2 = L21_2
  L21_2 = L21_2.commit
  L23_2 = "wifi"
  L21_2(L22_2, L23_2)
  L21_2 = _UPVALUE8_
  L22_2 = L21_2
  L21_2 = L21_2.commit
  L23_2 = "iot_wifi"
  L21_2(L22_2, L23_2)
  L21_2 = _UPVALUE10_
  L21_2 = L21_2.set_tipc_config
  L21_2()
  L21_2 = _UPVALUE11_
  L21_2()
  L21_2 = _UPVALUE3_
  L21_2 = L21_2.clear_create_group_flag
  L21_2()
  L21_2 = _UPVALUE12_
  L21_2()
  L22_2 = L14_2
  L21_2 = L14_2.get_backhaul_channel
  L21_2 = L21_2(L22_2)
  L22_2 = _UPVALUE3_
  L22_2 = L22_2.get_preconf_pack
  L22_2 = L22_2()
  L23_2 = _UPVALUE4_
  L23_2 = L23_2.print
  L24_2 = "pack is "
  L25_2 = tostring
  L26_2 = L22_2
  L25_2 = L25_2(L26_2)
  L24_2 = L24_2 .. L25_2
  L23_2(L24_2)
  L23_2 = {}
  L24_2 = L6_2.is_mobile_device
  L24_2 = L24_2()
  if L24_2 then
    L24_2 = {}
    L24_2.mode = nil
    L25_2 = A0_2.operation_mode
    if L25_2 then
      L25_2 = A0_2.operation_mode
      if L25_2 ~= "LTE" then
        L25_2 = A0_2.operation_mode
        if L25_2 ~= "Mobile_5G" then
          L25_2 = A0_2.operation_mode
        end
      end
      if L25_2 == "Router" then
        L25_2 = A0_2.operation_mode
        L24_2.mode = L25_2
      end
    else
      L24_2.mode = "Router"
    end
    L25_2 = L24_2.mode
    if L25_2 ~= nil then
      L25_2 = _UPVALUE13_
      L25_2 = L25_2.set_sys_mode
      L26_2 = L24_2
      L25_2(L26_2)
    end
  else
    L24_2 = require
    L25_2 = "luci.model.app_sysmode"
    L24_2 = L24_2(L25_2)
    L25_2 = L24_2.get_op_mode
    L25_2 = L25_2()
    if L25_2 ~= "AP" then
      L26_2 = A0_2.operation_mode
      if L26_2 == "AP" then
        L26_2 = _UPVALUE8_
        L27_2 = L26_2
        L26_2 = L26_2.set
        L28_2 = "system"
        L29_2 = "ap_onboarding"
        L30_2 = "channel_5G"
        L31_2 = L21_2.band5_1
        L31_2 = L31_2.channel
        L26_2(L27_2, L28_2, L29_2, L30_2, L31_2)
        L26_2 = _UPVALUE8_
        L27_2 = L26_2
        L26_2 = L26_2.set
        L28_2 = "system"
        L29_2 = "ap_onboarding"
        L30_2 = "onboarding_boot"
        L31_2 = "1"
        L26_2(L27_2, L28_2, L29_2, L30_2, L31_2)
        L26_2 = _UPVALUE8_
        L27_2 = L26_2
        L26_2 = L26_2.set
        L28_2 = "system"
        L29_2 = "ap_onboarding"
        L30_2 = "need_set_wan"
        L31_2 = "1"
        L26_2(L27_2, L28_2, L29_2, L30_2, L31_2)
        L26_2 = _UPVALUE8_
        L27_2 = L26_2
        L26_2 = L26_2.commit
        L28_2 = "system"
        L26_2(L27_2, L28_2)
        L26_2 = require
        L27_2 = "luci.sys.config"
        L26_2 = L26_2(L27_2)
        L27_2 = L26_2.saveconfig
        L28_2 = "device-config"
        L27_2(L28_2)
        L27_2 = {}
        L27_2.mode = "AP"
        L28_2 = L24_2.set_sys_mode
        L29_2 = L27_2
        L28_2(L29_2)
        L23_2.reboot_time = 90
    end
    elseif L25_2 == "AP" then
      L26_2 = _UPVALUE7_
      L26_2 = L26_2.fs
      L26_2 = L26_2.access
      L27_2 = "/tmp/default_ap_public_ip"
      L26_2 = L26_2(L27_2)
      if L26_2 then
        L26_2 = _UPVALUE4_
        L26_2 = L26_2.print
        L27_2 = "modem is bridge mode, set deco to router"
        L26_2(L27_2)
        L26_2 = {}
        L26_2.mode = "Router"
        L27_2 = L24_2.set_sys_mode
        L28_2 = L26_2
        L27_2(L28_2)
        L27_2 = _UPVALUE14_
        L27_2 = L27_2.cursor
        L28_2 = "/etc/profile.d"
        L27_2 = L27_2(L28_2)
        L29_2 = L27_2
        L28_2 = L27_2.get
        L30_2 = "profile"
        L31_2 = "ap_onboarding"
        L32_2 = "reboot_time"
        L28_2 = L28_2(L29_2, L30_2, L31_2, L32_2)
        if not L28_2 then
          L28_2 = 120
        end
        L23_2.reboot_time = L28_2
      end
    end
  end
  L24_2 = L11_2.gid
  L23_2.group_id = L24_2
  L24_2 = L11_2.key
  L23_2.group_key = L24_2
  L23_2.master_device_id = L10_2
  L23_2.backhaul = L21_2
  L23_2.suit_count = L22_2
  return L23_2
end

function L30_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = require
  L2_2 = "luci.model.radar"
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2.send_transaction_to_other
  L3_2 = "update"
  L2_2(L3_2)
  L2_2 = true
  return L2_2
end

function L31_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = require
  L2_2 = "luci.model.radar"
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2.send_request_to_local
  L3_2 = "update"
  L2_2(L3_2)
  L2_2 = true
  return L2_2
end

function L32_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L1_2 = {}
  L2_2 = require
  L3_2 = "luci.model.app_cloudfirm"
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.get_online_status
  L3_2 = L3_2()
  L4_2 = "offline"
  if L3_2 then
    L4_2 = "online"
  end
  L5_2 = L0_1
  L5_2 = L5_2.connect
  L5_2 = L5_2()
  L7_2 = L5_2
  L6_2 = L5_2.call
  L8_2 = "sync"
  L9_2 = "list"
  L10_2 = {}
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = _UPVALUE1_
  L8_2 = L7_2
  L7_2 = L7_2.get_all
  L9_2 = "bind_device_list"
  L7_2 = L7_2(L8_2, L9_2)
  L9_2 = L5_2
  L8_2 = L5_2.close
  L8_2(L9_2)
  
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = _UPVALUE0_
    if not L1_3 then
      L1_3 = false
      return L1_3
    end
    L1_3 = pairs
    L2_3 = _UPVALUE0_
    L1_3, L2_3, L3_3 = L1_3(L2_3)
    for L4_3, L5_3 in L1_3, L2_3, L3_3 do
      L6_3 = L5_3.mac
      if L6_3 == A0_3 then
        L6_3 = true
        return L6_3
      end
    end
    L1_3 = false
    return L1_3
  end
  
  L9_2 = _UPVALUE2_
  L9_2 = L9_2.sync_boost
  L9_2()
  L9_2 = {}
  L10_2 = pairs
  L11_2 = L6_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  for L13_2, L14_2 in L10_2, L11_2, L12_2 do
    while true do
      L15_2 = L14_2.role
      L16_2 = {}
      if L15_2 ~= "UNBIND" then
        break
      end
      L17_2 = L14_2.mac
      L18_2 = L17_2
      L17_2 = L17_2.gsub
      L19_2 = ":"
      L20_2 = "-"
      L17_2 = L17_2(L18_2, L19_2, L20_2)
      L18_2 = L17_2
      L17_2 = L17_2.upper
      L17_2 = L17_2(L18_2)
      L18_2 = L8_2
      L19_2 = L17_2
      L18_2 = L18_2(L19_2)
      if L18_2 then
        break
      end
      L16_2.device_id = L13_2
      L16_2.mac = L17_2
      L18_2 = _UPVALUE3_
      L16_2.device_type = L18_2
      L18_2 = L14_2.device_model
      L16_2.device_model = L18_2
      L18_2 = L14_2.signal_level
      L16_2.signal_level = L18_2
      L18_2 = L14_2.extra_info
      L16_2.extra_info = L18_2
      L18_2 = L14_2.iptv_extend
      if L18_2 then
        L16_2.enable_iptv_port = true
      else
        L16_2.enable_iptv_port = false
      end
      L18_2 = {}
      L19_2 = L14_2.nickname_category
      if L19_2 then
        L19_2 = L14_2.nickname_category
        L18_2.nickname_category = L19_2
        L16_2.extra_info = L18_2
      end
      L19_2 = #L9_2
      L19_2 = L19_2 + 1
      L9_2[L19_2] = L16_2
      break
    end
  end
  L1_2.inet_status = L4_2
  L1_2.max_discover_time = 70
  L10_2 = L9_2 or L10_2
  if not L9_2 then
    L10_2 = {}
  end
  L1_2.device_list = L10_2
  return L1_2
end

function L33_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = require
  L1_2 = "luci.fs"
  L0_2 = L0_2(L1_2)
  L1_2 = "/tmp/quick_setup/"
  L2_2 = L1_2
  L3_2 = "add_device_done"
  L2_2 = L2_2 .. L3_2
  L3_2 = L0_2.isdirectory
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = L0_2.mkdir
    L4_2 = L1_2
    L5_2 = true
    L3_2(L4_2, L5_2)
  end
  L3_2 = {}
  L4_2 = L2_2
  L3_2[1] = L4_2
  L3_2 = "touch %s " % L3_2
  L4_2 = _UPVALUE0_
  L4_2 = L4_2.call
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = _UPVALUE1_
  L4_2 = L4_2.print
  L5_2 = "set_add_device_flag"
  L4_2(L5_2)
  L4_2 = true
  return L4_2
end

function L34_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if not A0_2 then
    return
  end
  L1_2 = "/var/run/"
  L2_2 = L1_2
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L3_2 = {}
  L4_2 = L2_2
  L3_2[1] = L4_2
  L3_2 = "touch %s " % L3_2
  L4_2 = _UPVALUE0_
  L4_2 = L4_2.call
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = _UPVALUE1_
  L4_2 = L4_2.print
  L5_2 = "set_pre_add_flag"
  L4_2(L5_2)
  L4_2 = true
  return L4_2
end

function L35_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if not A0_2 then
    return
  end
  L1_2 = "/var/run/"
  L2_2 = L1_2
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L3_2 = {}
  L4_2 = L2_2
  L3_2[1] = L4_2
  L3_2 = "rm %s " % L3_2
  L4_2 = _UPVALUE0_
  L4_2 = L4_2.call
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = _UPVALUE1_
  L4_2 = L4_2.print
  L5_2 = "del_pre_add_flag"
  L4_2(L5_2)
  L4_2 = true
  return L4_2
end

function L36_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if not A0_2 then
    return
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.print
  L2_2 = "check_pre_add_flag"
  L1_2(L2_2)
  L1_2 = "/var/run/"
  L2_2 = L1_2
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L3_2 = _UPVALUE1_
  L3_2 = L3_2.fs
  L3_2 = L3_2.access
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = true
    return L3_2
  end
  L3_2 = false
  return L3_2
end

function L37_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.print
  L3_2 = "do_add_m5_device start"
  L2_2(L3_2)
  L2_2 = nil
  L3_2 = A1_2.nickname
  L4_2 = A1_2.front_wireless
  if A0_2 then
    L5_2 = A1_2.cloud_account
    L6_2 = A1_2.is_base
    if not L6_2 then
      L7_2 = _UPVALUE0_
      L7_2 = L7_2.print
      L8_2 = "cloud is not valid, do transfer"
      L7_2(L8_2)
      L7_2 = _UPVALUE1_
      L7_2 = L7_2.tmp_handle_string
      L8_2 = L5_2.username
      L7_2 = L7_2(L8_2)
      L8_2 = L7_2
      L7_2 = L7_2.trim
      L7_2 = L7_2(L8_2)
      L5_2.username = L7_2
      L7_2 = _UPVALUE1_
      L7_2 = L7_2.tmp_handle_string
      L8_2 = L5_2.password
      L7_2 = L7_2(L8_2)
      L8_2 = L7_2
      L7_2 = L7_2.trim
      L7_2 = L7_2(L8_2)
      L5_2.password = L7_2
    else
      L7_2 = _UPVALUE0_
      L7_2 = L7_2.print
      L8_2 = "cloud is valid, do not transfer"
      L7_2(L8_2)
    end
    L7_2 = {}
    L8_2 = {}
    L7_2.params = L8_2
    L8_2 = L7_2.params
    L8_2.nickname = L3_2
    L8_2 = L7_2.params
    L8_2.cloud_account = L5_2
    L8_2 = L7_2.params
    L9_2 = A1_2.group_id
    L8_2.group_id = L9_2
    L8_2 = L7_2.params
    L9_2 = A1_2.group_key
    L8_2.group_key = L9_2
    L8_2 = L7_2.params
    L9_2 = L4_2.ssid
    L8_2.group_name = L9_2
    L8_2 = L7_2.params
    L9_2 = A1_2.master_device_id
    L8_2.master_device_id = L9_2
    L7_2.module = "cloud"
    L7_2.form = "group"
    L7_2.operation = "add"
    L8_2 = _UPVALUE2_
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    L2_2 = L8_2
    if L2_2 then
      L8_2 = L2_2.error_code
      if L8_2 == 0 then
        goto lbl_109
      end
    end
    L8_2 = -1014
    if L2_2 then
      L9_2 = L2_2.msg
      if L9_2 then
        goto lbl_75
      end
    end
    L9_2 = "set cloud account failed"
    ::lbl_75::
    return L8_2, L9_2
  else
    L5_2 = L3_2.nickname
    L6_2 = _UPVALUE0_
    L6_2 = L6_2.print
    L7_2 = "not bind cloud, but modify location"
    L6_2(L7_2)
    if L5_2 == "custom" then
      L6_2 = L3_2.custom_nickname
      if L6_2 then
        L5_2 = L3_2.custom_nickname
      end
    end
    if L5_2 then
      L6_2 = _UPVALUE0_
      L6_2 = L6_2.print
      L7_2 = "location"
      L8_2 = tostring
      L9_2 = L5_2
      L8_2 = L8_2(L9_2)
      L7_2 = L7_2 .. L8_2
      L6_2(L7_2)
      L6_2 = _UPVALUE3_
      L7_2 = L6_2
      L6_2 = L6_2.set
      L8_2 = "cloud_config"
      L9_2 = "info"
      L10_2 = "alias"
      L11_2 = L5_2
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      L6_2 = _UPVALUE3_
      L7_2 = L6_2
      L6_2 = L6_2.commit
      L8_2 = "cloud_config"
      L6_2(L7_2, L8_2)
    end
  end
  ::lbl_109::
  L5_2 = _UPVALUE3_
  L6_2 = L5_2
  L5_2 = L5_2.set
  L7_2 = "bluetooth"
  L8_2 = "settings"
  L9_2 = "enable"
  L10_2 = "off"
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = _UPVALUE3_
  L6_2 = L5_2
  L5_2 = L5_2.commit
  L7_2 = "bluetooth"
  L5_2(L6_2, L7_2)
  L5_2 = _UPVALUE4_
  L5_2()
  L5_2 = _UPVALUE5_
  L5_2()
  L5_2 = _UPVALUE6_
  L5_2 = L5_2.sync_boost
  L5_2()
  L5_2 = require
  L6_2 = "luci.model.mode"
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2.is_emmc_support
  L6_2 = L6_2()
  if true == L6_2 then
    L6_2 = _UPVALUE6_
    L6_2 = L6_2.sync_boost_emmc
    L6_2()
  end
  L6_2 = {}
  return L6_2
end

function L38_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L2_2 = true
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end

function L39_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L2_2 = false
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end

function L40_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = require
  L2_2 = "luci.model.mode"
  L1_2 = L1_2(L2_2)
  L2_2 = nil
  L3_2 = _UPVALUE0_
  L3_2 = L3_2.print
  L4_2 = "add_m5_device start"
  L3_2(L4_2)
  if not A0_2 then
    L3_2 = -1001
    L4_2 = "params not found"
    return L3_2, L4_2
  end
  L3_2 = A0_2.group_id
  if L3_2 then
    L3_2 = A0_2.group_key
    if L3_2 then
      L3_2 = A0_2.group_id
      if L3_2 ~= "" then
        goto lbl_26
      end
    end
  end
  L3_2 = -1008
  L4_2 = "invalid group args"
  do return L3_2, L4_2 end
  ::lbl_26::
  L3_2 = A0_2.master_device_id
  if L3_2 then
    L3_2 = A0_2.master_device_id
    if L3_2 ~= "" then
      goto lbl_35
    end
  end
  L3_2 = -1009
  L4_2 = "invalid master_device_id"
  do return L3_2, L4_2 end
  ::lbl_35::
  L3_2 = A0_2.generator
  if L3_2 == "sync" then
    L3_2 = A0_2.sync_version
    if L3_2 then
      L3_2 = A0_2.sync_version
      if L3_2 ~= "" then
        goto lbl_47
      end
    end
    L3_2 = -1009
    L4_2 = "invalid sync_version"
    do return L3_2, L4_2 end
    ::lbl_47::
    L3_2 = _UPVALUE1_
    L3_2 = L3_2.join_group
    L4_2 = A0_2.group_id
    L5_2 = A0_2.group_key
    L6_2 = "RE"
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = _UPVALUE2_
    L4_2 = L3_2
    L3_2 = L3_2.set
    L5_2 = "sync"
    L6_2 = "config"
    L7_2 = "sync_version"
    L8_2 = A0_2.sync_version
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = _UPVALUE2_
    L4_2 = L3_2
    L3_2 = L3_2.commit
    L5_2 = "sync"
    L3_2(L4_2, L5_2)
    L3_2 = _UPVALUE1_
    L3_2 = L3_2.sync_boost
    L3_2()
    L3_2 = require
    L4_2 = "luci.model.app_cloudfirm"
    L3_2 = L3_2(L4_2)
    L4_2 = L3_2.get_nickname
    L4_2 = L4_2()
    L5_2 = L4_2.nickname
    if L5_2 == "custom" then
      L6_2 = L4_2.custom_nickname
      if L6_2 then
        L5_2 = L4_2.custom_nickname
      end
    end
    L6_2 = _UPVALUE3_
    L6_2()
    L6_2 = {}
    L7_2 = _UPVALUE4_
    L7_2 = L7_2.getfirm_cached
    L8_2 = "DEV_ID"
    L7_2 = L7_2(L8_2)
    L8_2 = L7_2
    L7_2 = L7_2.trim
    L7_2 = L7_2(L8_2)
    L6_2.slave_device_id = L7_2
    L7_2 = _UPVALUE4_
    L7_2 = L7_2.getfirm_cached
    L8_2 = "MAC"
    L7_2 = L7_2(L8_2)
    L8_2 = L7_2
    L7_2 = L7_2.trim
    L7_2 = L7_2(L8_2)
    L6_2.mac = L7_2
    L7_2 = _UPVALUE1_
    L7_2 = L7_2.getfirm_cached
    L8_2 = "MODEL"
    L7_2 = L7_2(L8_2)
    L6_2.device_model = L7_2
    L6_2.role = "RE"
    L7_2 = L1_2.get_product_level
    L7_2 = L7_2()
    L6_2.product_level = L7_2
    L6_2.nickname = L5_2
    return L6_2
  end
  L3_2 = A0_2.nickname
  L4_2 = A0_2.front_wireless
  if L4_2 then
    L5_2 = L4_2.ssid
    if L5_2 then
      L5_2 = L4_2.password
      if L5_2 then
        L5_2 = L4_2.ssid
        if L5_2 ~= "" then
          goto lbl_123
        end
      end
    end
  end
  L5_2 = -1007
  L6_2 = "invalid front_wireless args"
  do return L5_2, L6_2 end
  ::lbl_123::
  L5_2 = A0_2.cloud_account
  if L5_2 then
    L6_2 = L5_2.username
    if L6_2 then
      L6_2 = L5_2.username
      if L6_2 ~= "" then
        goto lbl_135
      end
    end
  end
  L6_2 = -1006
  L7_2 = "invalid cloud_account args"
  do return L6_2, L7_2 end
  ::lbl_135::
  L6_2 = _UPVALUE1_
  L6_2 = L6_2.read_group_info
  L6_2 = L6_2()
  if L6_2 then
    L7_2 = L6_2.gid
    if L7_2 then
      L7_2 = _UPVALUE0_
      L8_2 = "Warning: overwriting group "
      L9_2 = L6_2.gid
      L7_2(L8_2, L9_2)
    end
  end
  L7_2 = _UPVALUE1_
  L7_2 = L7_2.join_group
  L8_2 = A0_2.group_id
  L9_2 = A0_2.group_key
  L10_2 = "RE"
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = _UPVALUE5_
  L7_2 = L7_2.fork
  L7_2 = L7_2()
  if L7_2 == 0 then
    L8_2 = _UPVALUE6_
    L9_2 = A0_2
    L8_2(L9_2)
    L8_2 = os
    L8_2 = L8_2.exit
    L9_2 = 1
    L8_2(L9_2)
  end
  L8_2 = L3_2.nickname
  if L8_2 == "custom" then
    L9_2 = L3_2.custom_nickname
    if L9_2 then
      L8_2 = L3_2.custom_nickname
    end
  end
  L9_2 = _UPVALUE3_
  L9_2()
  L9_2 = _UPVALUE0_
  L9_2 = L9_2.print
  L10_2 = "add_m5_device: end"
  L9_2(L10_2)
  L9_2 = _UPVALUE1_
  L9_2 = L9_2.get_pregroup_crc32_hex
  L9_2 = L9_2()
  if L9_2 == "" then
    L9_2 = nil
  end
  L10_2 = {}
  L11_2 = _UPVALUE4_
  L11_2 = L11_2.getfirm_cached
  L12_2 = "DEV_ID"
  L11_2 = L11_2(L12_2)
  L12_2 = L11_2
  L11_2 = L11_2.trim
  L11_2 = L11_2(L12_2)
  L10_2.slave_device_id = L11_2
  L11_2 = _UPVALUE4_
  L11_2 = L11_2.getfirm_cached
  L12_2 = "MAC"
  L11_2 = L11_2(L12_2)
  L12_2 = L11_2
  L11_2 = L11_2.trim
  L11_2 = L11_2(L12_2)
  L10_2.mac = L11_2
  L11_2 = _UPVALUE1_
  L11_2 = L11_2.getfirm_cached
  L12_2 = "MODEL"
  L11_2 = L11_2(L12_2)
  L10_2.device_model = L11_2
  L10_2.role = "RE"
  L11_2 = L1_2.get_product_level
  L11_2 = L11_2()
  L10_2.product_level = L11_2
  L10_2.preconf_id = L9_2
  L10_2.nickname = L8_2
  return L10_2
end

function L41_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "/tmp/re_product_level"
  L2_2 = io
  L2_2 = L2_2.open
  L3_2 = L1_2
  L4_2 = "w"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L4_2 = L2_2
    L3_2 = L2_2.write
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
    L4_2 = L2_2
    L3_2 = L2_2.close
    L3_2(L4_2)
  end
end

function L42_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.print
  L2_2 = "add_m5_device_list: start"
  L1_2(L2_2)
  L1_2 = _UPVALUE1_
  L1_2 = L1_2.getfirm_cached
  L2_2 = "DEV_ID"
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.trim
  L1_2 = L1_2(L2_2)
  L2_2 = _UPVALUE2_
  L2_2 = L2_2.get_role
  L2_2 = L2_2()
  L3_2 = _UPVALUE2_
  L3_2 = L3_2.read_group_info
  L3_2 = L3_2()
  L4_2 = {}
  L5_2 = 0
  L6_2 = nil
  L7_2 = nil
  L8_2 = 0
  L9_2 = nil
  if L2_2 == "AP" and L3_2 then
    L10_2 = L3_2.gid
    if L10_2 then
      goto lbl_32
    end
  end
  L10_2 = -1008
  L11_2 = "invalid my role or invaild gid"
  do return L10_2, L11_2 end
  ::lbl_32::
  L10_2 = nil
  L11_2 = A0_2.generator
  L12_2 = A0_2.cloud_account
  if L11_2 == "sync" then
    L13_2 = _UPVALUE2_
    L13_2 = L13_2.get_sync_version
    L13_2 = L13_2()
    L10_2 = L13_2
    if not L10_2 then
      L13_2 = -1008
      L14_2 = "invalid sync version"
      return L13_2, L14_2
    end
  else
    L13_2 = A0_2.from
    if L13_2 or L12_2 then
      L13_2 = L12_2.username
      if L13_2 then
        L13_2 = L12_2.username
        if L13_2 ~= "" then
          goto lbl_61
        end
      end
    end
    L13_2 = -1006
    L14_2 = "invalid cloud_account args"
    return L13_2, L14_2
  end
  ::lbl_61::
  L13_2 = _UPVALUE3_
  L14_2 = L13_2
  L13_2 = L13_2.get_all
  L15_2 = "wifi"
  L16_2 = "ap"
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  L14_2 = {}
  L15_2 = _UPVALUE4_
  L15_2 = L15_2.bin
  L15_2 = L15_2.b64encode
  L16_2 = L13_2.ssid
  L15_2 = L15_2(L16_2)
  L14_2.ssid = L15_2
  L15_2 = _UPVALUE4_
  L15_2 = L15_2.bin
  L15_2 = L15_2.b64encode
  L16_2 = L13_2.password
  L15_2 = L15_2(L16_2)
  L14_2.password = L15_2
  L15_2 = _UPVALUE2_
  L15_2 = L15_2.set_binding_flag
  L15_2()
  L15_2 = L0_1
  L15_2 = L15_2.connect
  L15_2 = L15_2()
  L17_2 = L15_2
  L16_2 = L15_2.call
  L18_2 = "sync"
  L19_2 = "list"
  L20_2 = {}
  L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
  L17_2 = _UPVALUE3_
  L18_2 = L17_2
  L17_2 = L17_2.get_all
  L19_2 = "bind_device_list"
  L17_2 = L17_2(L18_2, L19_2)
  
  function L18_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = _UPVALUE0_
    if not L1_3 then
      L1_3 = false
      return L1_3
    end
    L1_3 = pairs
    L2_3 = _UPVALUE0_
    L1_3, L2_3, L3_3 = L1_3(L2_3)
    for L4_3, L5_3 in L1_3, L2_3, L3_3 do
      L6_3 = L5_3.mac
      if L6_3 == A0_3 then
        L6_3 = true
        return L6_3
      end
    end
    L1_3 = false
    return L1_3
  end
  
  function L19_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = _UPVALUE0_
    if not L1_3 then
      L1_3 = nil
      return L1_3
    end
    L1_3 = pairs
    L2_3 = _UPVALUE0_
    L1_3, L2_3, L3_3 = L1_3(L2_3)
    for L4_3, L5_3 in L1_3, L2_3, L3_3 do
      if L4_3 == A0_3 then
        L6_3 = L5_3.qs_version
        return L6_3
      end
    end
    L1_3 = nil
    return L1_3
  end
  
  L20_2 = {}
  L21_2 = {}
  L22_2 = A0_2.device_list
  L23_2 = require
  L24_2 = "luci.model.mode"
  L23_2 = L23_2(L24_2)
  L24_2 = L23_2.get_product_level
  L24_2 = L24_2()
  L20_2.is_master_qualified = true
  L25_2 = ipairs
  L26_2 = L22_2
  L25_2, L26_2, L27_2 = L25_2(L26_2)
  for L28_2, L29_2 in L25_2, L26_2, L27_2 do
    L30_2 = L22_2[L28_2]
    L31_2 = {}
    L32_2 = L30_2.device_id
    L31_2.device_id = L32_2
    L32_2 = L30_2.mac
    L31_2.mac = L32_2
    L32_2 = L18_2
    L33_2 = L31_2.mac
    L32_2 = L32_2(L33_2)
    if not L32_2 then
      L32_2 = {}
      L32_2.generator = L11_2
      L32_2.sync_version = L10_2
      L32_2.master_device_id = L1_2
      L33_2 = L3_2.gid
      L32_2.group_id = L33_2
      L33_2 = L3_2.key
      L32_2.group_key = L33_2
      L33_2 = L30_2.nickname
      L32_2.nickname = L33_2
      L32_2.front_wireless = L14_2
      L33_2 = L19_2
      L34_2 = L30_2.device_id
      L33_2 = L33_2(L34_2)
      if L33_2 == nil and L12_2 and L8_2 == 1 then
        L34_2 = {}
        L32_2.cloud_account = L34_2
        L34_2 = L32_2.cloud_account
        L34_2.username = L6_2
        L34_2 = L32_2.cloud_account
        L34_2.password = L7_2
      elseif L33_2 == nil and L12_2 then
        L34_2 = {}
        L32_2.cloud_account = L34_2
        L34_2 = _UPVALUE6_
        L34_2 = L34_2.tmp_handle_string
        L35_2 = L12_2.username
        L34_2 = L34_2(L35_2)
        L35_2 = L34_2
        L34_2 = L34_2.trim
        L34_2 = L34_2(L35_2)
        L6_2 = L34_2
        L34_2 = _UPVALUE6_
        L34_2 = L34_2.tmp_handle_string
        L35_2 = L12_2.password
        L34_2 = L34_2(L35_2)
        L35_2 = L34_2
        L34_2 = L34_2.trim
        L34_2 = L34_2(L35_2)
        L7_2 = L34_2
        L34_2 = L32_2.cloud_account
        L34_2.username = L6_2
        L34_2 = L32_2.cloud_account
        L34_2.password = L7_2
        L8_2 = 1
      else
        L32_2.cloud_account = L12_2
      end
      if L16_2 then
        L34_2 = L30_2.device_id
        L34_2 = L16_2[L34_2]
        if L34_2 then
          L34_2 = L30_2.device_id
          L34_2 = L16_2[L34_2]
          L34_2 = L34_2.oui_version
          if L34_2 then
            L34_2 = L30_2.device_id
            L34_2 = L16_2[L34_2]
            L9_2 = L34_2.oui_version
          else
            L9_2 = 0
          end
        end
      end
      L34_2 = _UPVALUE0_
      L34_2 = L34_2.print
      L35_2 = "AP: bind other M5"
      L34_2(L35_2)
      L34_2 = {}
      L35_2 = tonumber
      L36_2 = 16417
      L35_2 = L35_2(L36_2)
      L34_2.opcode = L35_2
      L35_2 = L30_2.device_id
      L34_2.target_id = L35_2
      L35_2 = {}
      L35_2.params = L32_2
      L34_2.data = L35_2
      L36_2 = _UPVALUE0_
      L36_2 = L36_2.print
      L37_2 = "args: "
      L38_2 = _UPVALUE7_
      L38_2 = L38_2.encode
      L39_2 = L34_2
      L38_2 = L38_2(L39_2)
      L37_2 = L37_2 .. L38_2
      L36_2(L37_2)
      L37_2 = L15_2
      L36_2 = L15_2.call
      L38_2 = "sync"
      L39_2 = "request"
      L40_2 = L34_2
      L36_2 = L36_2(L37_2, L38_2, L39_2, L40_2)
      if L36_2 then
        L37_2 = L36_2.success
        if L37_2 then
          goto lbl_231
        end
      end
      L37_2 = _UPVALUE0_
      L37_2 = L37_2.print
      L38_2 = "sync request error"
      L37_2(L38_2)
      L31_2.error_code = 1
      goto lbl_330
      ::lbl_231::
      L37_2 = L36_2.success
      if L37_2 < 0 then
        L37_2 = _UPVALUE0_
        L37_2 = L37_2.print
        L38_2 = "sync request error."
        L37_2(L38_2)
        L31_2.error_code = 1
      else
        L37_2 = _UPVALUE0_
        L37_2 = L37_2.print
        L38_2 = "result: "
        L39_2 = _UPVALUE7_
        L39_2 = L39_2.encode
        L40_2 = L36_2
        L39_2 = L39_2(L40_2)
        L38_2 = L38_2 .. L39_2
        L37_2(L38_2)
        L37_2 = L36_2.data
        if not L37_2 then
          L31_2.error_code = 1
        else
          L38_2 = L37_2.error_code
          if L38_2 ~= 0 then
            L39_2 = _UPVALUE0_
            L39_2 = L39_2.print
            L40_2 = "request error."
            L39_2(L40_2)
            L31_2.error_code = 1
          else
            L39_2 = {}
            L40_2 = L37_2.result
            L40_2 = L40_2.product_level
            if not L40_2 then
              L40_2 = _UPVALUE8_
            end
            if L24_2 < L40_2 then
              L41_2 = _UPVALUE0_
              L41_2 = L41_2.print
              L42_2 = "====== is master qualified is false ===="
              L41_2(L42_2)
              L20_2.is_master_qualified = false
            end
            L41_2 = L37_2.result
            L41_2 = L41_2.mac
            L39_2.mac = L41_2
            L41_2 = L37_2.result
            L41_2 = L41_2.role
            L39_2.role = L41_2
            L41_2 = L37_2.result
            L41_2 = L41_2.nickname
            L39_2.nickname = L41_2
            L41_2 = L37_2.result
            L41_2 = L41_2.device_model
            L39_2.device_model = L41_2
            L41_2 = tostring
            L42_2 = os
            L42_2 = L42_2.time
            L42_2, L43_2 = L42_2()
            L41_2 = L41_2(L42_2, L43_2)
            L39_2.bindtime = L41_2
            L39_2.oui_version = L9_2
            L41_2 = L37_2.result
            L41_2 = L41_2.preconf_id
            if L41_2 then
              L41_2 = L37_2.result
              L41_2 = L41_2.preconf_id
              if L41_2 ~= "" then
                L41_2 = L37_2.result
                L41_2 = L41_2.preconf_id
                L39_2.preconf_id = L41_2
              end
            end
            if L11_2 ~= "sync" then
              L41_2 = _UPVALUE2_
              L41_2 = L41_2.add_bind_device
              L42_2 = L37_2.result
              L42_2 = L42_2.slave_device_id
              L43_2 = L39_2
              L41_2(L42_2, L43_2)
              L41_2 = _UPVALUE2_
              L41_2 = L41_2.update_network_oui
              L41_2()
            else
              L41_2 = L37_2.result
              L41_2 = L41_2.slave_device_id
              L4_2[L41_2] = L39_2
              L5_2 = L5_2 + 1
            end
            L41_2 = L37_2.result
            L41_2 = L41_2.mac
            L31_2.mac = L41_2
            L31_2.error_code = 0
          end
        end
      end
    else
      L32_2 = L31_2.mac
      L31_2.mac = L32_2
      L31_2.error_code = 0
    end
    ::lbl_330::
    L32_2 = #L21_2
    L32_2 = L32_2 + 1
    L21_2[L32_2] = L31_2
  end
  L26_2 = L15_2
  L25_2 = L15_2.close
  L25_2(L26_2)
  if 0 < L5_2 then
    L25_2 = _UPVALUE2_
    L25_2 = L25_2.add_local_device_list
    L26_2 = L4_2
    L25_2(L26_2)
  end
  L20_2.device_list = L21_2
  L25_2 = _UPVALUE2_
  L25_2 = L25_2.clear_binding_flag
  L25_2()
  L25_2 = _UPVALUE0_
  L25_2 = L25_2.print
  L26_2 = "add_m5_device_list res: "
  L27_2 = _UPVALUE7_
  L27_2 = L27_2.encode
  L28_2 = L20_2
  L27_2 = L27_2(L28_2)
  L26_2 = L26_2 .. L27_2
  L25_2(L26_2)
  return L20_2
end

function L43_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.print
  L2_2 = "preconf_add_m5_device: start"
  L1_2(L2_2)
  L1_2 = _UPVALUE1_
  L1_2 = L1_2.getfirm_cached
  L2_2 = "DEV_ID"
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.trim
  L1_2 = L1_2(L2_2)
  L2_2 = _UPVALUE2_
  L2_2 = L2_2.get_role
  L2_2 = L2_2()
  L3_2 = _UPVALUE2_
  L3_2 = L3_2.read_group_info
  L3_2 = L3_2()
  L4_2 = {}
  L5_2 = 0
  if L2_2 == "AP" and L3_2 then
    L6_2 = L3_2.gid
    if L6_2 then
      goto lbl_29
    end
  end
  L6_2 = -1008
  L7_2 = "invalid my role or invaild gid"
  do return L6_2, L7_2 end
  ::lbl_29::
  L6_2 = _UPVALUE3_
  L6_2 = L6_2.get_device_account_temporary
  L6_2 = L6_2()
  if L6_2 then
    L7_2 = L6_2.username
    if L7_2 then
      L7_2 = L6_2.username
      if L7_2 ~= "" then
        goto lbl_43
      end
    end
  end
  L7_2 = {}
  L6_2 = L7_2
  goto lbl_55
  ::lbl_43::
  L7_2 = _UPVALUE4_
  L7_2 = L7_2.bin
  L7_2 = L7_2.b64encode
  L8_2 = L6_2.username
  L7_2 = L7_2(L8_2)
  L6_2.username = L7_2
  L7_2 = _UPVALUE4_
  L7_2 = L7_2.bin
  L7_2 = L7_2.b64encode
  L8_2 = L6_2.password
  L7_2 = L7_2(L8_2)
  L6_2.password = L7_2
  ::lbl_55::
  L7_2 = _UPVALUE5_
  L8_2 = L7_2
  L7_2 = L7_2.get_all
  L9_2 = "wifi"
  L10_2 = "ap"
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = {}
  L9_2 = _UPVALUE4_
  L9_2 = L9_2.bin
  L9_2 = L9_2.b64encode
  L10_2 = L7_2.ssid
  L9_2 = L9_2(L10_2)
  L8_2.ssid = L9_2
  L9_2 = _UPVALUE4_
  L9_2 = L9_2.bin
  L9_2 = L9_2.b64encode
  L10_2 = L7_2.password
  L9_2 = L9_2(L10_2)
  L8_2.password = L9_2
  L9_2 = _UPVALUE2_
  L9_2 = L9_2.set_binding_flag
  L9_2()
  L9_2 = L0_1
  L9_2 = L9_2.connect
  L9_2 = L9_2()
  L11_2 = L9_2
  L10_2 = L9_2.call
  L12_2 = "sync"
  L13_2 = "list"
  L14_2 = {}
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  L11_2 = _UPVALUE5_
  L12_2 = L11_2
  L11_2 = L11_2.get_all
  L13_2 = "bind_device_list"
  L11_2 = L11_2(L12_2, L13_2)
  
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = _UPVALUE0_
    if not L1_3 then
      L1_3 = false
      return L1_3
    end
    L1_3 = pairs
    L2_3 = _UPVALUE0_
    L1_3, L2_3, L3_3 = L1_3(L2_3)
    for L4_3, L5_3 in L1_3, L2_3, L3_3 do
      L6_3 = L5_3.mac
      if L6_3 == A0_3 then
        L6_3 = true
        return L6_3
      end
    end
    L1_3 = false
    return L1_3
  end
  
  L13_2 = A0_2.device
  L14_2 = require
  L15_2 = "luci.model.mode"
  L14_2 = L14_2(L15_2)
  L15_2 = L14_2.get_product_level
  L15_2 = L15_2()
  L16_2 = A0_2.is_pre_config
  L17_2 = {}
  L18_2 = L13_2.device_id
  L17_2.device_id = L18_2
  L18_2 = L13_2.mac
  L17_2.mac = L18_2
  L18_2 = L12_2
  L19_2 = L17_2.mac
  L18_2 = L18_2(L19_2)
  if not L18_2 then
    if L16_2 then
      L18_2 = _UPVALUE7_
      L19_2 = L17_2.device_id
      L18_2 = L18_2(L19_2)
      if L18_2 then
        return
      else
        L18_2 = _UPVALUE8_
        L19_2 = L17_2.device_id
        L18_2(L19_2)
      end
    end
    L18_2 = {}
    L18_2.master_device_id = L1_2
    L19_2 = L3_2.gid
    L18_2.group_id = L19_2
    L19_2 = L3_2.key
    L18_2.group_key = L19_2
    L19_2 = L13_2.nickname
    L18_2.nickname = L19_2
    L18_2.front_wireless = L8_2
    L18_2.cloud_account = L6_2
    if L16_2 == true then
      L18_2.is_pre_config = true
    end
    L19_2 = _UPVALUE0_
    L19_2 = L19_2.print
    L20_2 = "AP: bind other M5"
    L19_2(L20_2)
    L19_2 = {}
    L20_2 = tonumber
    L21_2 = 50278
    L20_2 = L20_2(L21_2)
    L19_2.opcode = L20_2
    L20_2 = L13_2.device_id
    L19_2.target_id = L20_2
    L20_2 = {}
    L20_2.params = L18_2
    L19_2.data = L20_2
    L21_2 = _UPVALUE0_
    L21_2 = L21_2.print
    L22_2 = "args: "
    L23_2 = _UPVALUE9_
    L23_2 = L23_2.encode
    L24_2 = L19_2
    L23_2 = L23_2(L24_2)
    L22_2 = L22_2 .. L23_2
    L21_2(L22_2)
    L22_2 = L9_2
    L21_2 = L9_2.call
    L23_2 = "sync"
    L24_2 = "request"
    L25_2 = L19_2
    L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
    if L21_2 then
      L22_2 = L21_2.success
      if L22_2 then
        goto lbl_171
      end
    end
    L22_2 = _UPVALUE0_
    L22_2 = L22_2.print
    L23_2 = "sync request error"
    L22_2(L23_2)
    L17_2.error_code = 1
    goto lbl_249
    ::lbl_171::
    L22_2 = L21_2.success
    if L22_2 < 0 then
      L22_2 = _UPVALUE0_
      L22_2 = L22_2.print
      L23_2 = "sync request error."
      L22_2(L23_2)
      L17_2.error_code = 1
    else
      L22_2 = _UPVALUE0_
      L22_2 = L22_2.print
      L23_2 = "result: "
      L24_2 = _UPVALUE9_
      L24_2 = L24_2.encode
      L25_2 = L21_2
      L24_2 = L24_2(L25_2)
      L23_2 = L23_2 .. L24_2
      L22_2(L23_2)
      L22_2 = L21_2.data
      if not L22_2 then
        L17_2.error_code = 1
      else
        L23_2 = L22_2.error_code
        if L23_2 ~= 0 then
          L24_2 = _UPVALUE0_
          L24_2 = L24_2.print
          L25_2 = "request error."
          L24_2(L25_2)
        else
          L24_2 = {}
          L25_2 = L22_2.result
          L25_2 = L25_2.product_level
          if not L25_2 then
            L25_2 = _UPVALUE10_
          end
          if L15_2 < L25_2 then
            L26_2 = _UPVALUE0_
            L26_2 = L26_2.print
            L27_2 = "====== is master qualified is false ===="
            L26_2(L27_2)
            L26_2 = res
            L26_2.is_master_qualified = false
          end
          L26_2 = L22_2.result
          L26_2 = L26_2.mac
          L24_2.mac = L26_2
          L26_2 = L22_2.result
          L26_2 = L26_2.role
          L24_2.role = L26_2
          L26_2 = L22_2.result
          L26_2 = L26_2.nickname
          L24_2.nickname = L26_2
          L26_2 = L22_2.result
          L26_2 = L26_2.device_model
          L24_2.device_model = L26_2
          L26_2 = tostring
          L27_2 = os
          L27_2 = L27_2.time
          L27_2 = L27_2()
          L26_2 = L26_2(L27_2)
          L24_2.bindtime = L26_2
          L26_2 = L22_2.result
          L26_2 = L26_2.preconf_id
          if L26_2 then
            L26_2 = L22_2.result
            L26_2 = L26_2.preconf_id
            if L26_2 ~= "" then
              L26_2 = L22_2.result
              L26_2 = L26_2.preconf_id
              L24_2.preconf_id = L26_2
            end
          end
          L26_2 = L22_2.result
          L26_2 = L26_2.slave_device_id
          L4_2[L26_2] = L24_2
          L5_2 = L5_2 + 1
        end
      end
    end
  end
  ::lbl_249::
  L19_2 = L9_2
  L18_2 = L9_2.close
  L18_2(L19_2)
  if L16_2 then
    L18_2 = _UPVALUE11_
    L19_2 = L17_2.device_id
    L18_2(L19_2)
  end
  if 0 < L5_2 then
    L18_2 = _UPVALUE2_
    L18_2 = L18_2.add_local_device_list
    L19_2 = L4_2
    L18_2(L19_2)
  end
  L18_2 = _UPVALUE2_
  L18_2 = L18_2.clear_binding_flag
  L18_2()
  if L16_2 == true then
    L18_2 = _UPVALUE4_
    L18_2 = L18_2.fork
    L18_2 = L18_2()
    if L18_2 == 0 then
      L19_2 = require
      L20_2 = "cloud.tp_apps.dcmp"
      L19_2 = L19_2(L20_2)
      L20_2 = L19_2.check_bind_event
      L20_2()
      L20_2 = L19_2.check_upgrade_event
      L20_2()
      L20_2 = L19_2.check_internet_event
      L20_2()
      L20_2 = os
      L20_2 = L20_2.exit
      L21_2 = 0
      L20_2(L21_2)
    end
  end
  if 0 < L5_2 then
    L18_2 = require
    L19_2 = "luci.model.message_center"
    L18_2 = L18_2(L19_2)
    L18_2 = L18_2.Msgcenter
    L18_2 = L18_2()
    L20_2 = L18_2
    L19_2 = L18_2.add_auto_pair
    L21_2 = false
    L22_2 = L13_2.mac
    L19_2 = L19_2(L20_2, L21_2, L22_2)
    L20_2 = true
    return L20_2
  else
    L18_2 = false
    return L18_2
  end
end

function L44_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = require
  L2_2 = "luci.model.mode"
  L1_2 = L1_2(L2_2)
  L2_2 = nil
  L3_2 = true
  L4_2 = _UPVALUE0_
  L4_2 = L4_2.print
  L5_2 = "preconf_write_m5_devicestart"
  L4_2(L5_2)
  if not A0_2 then
    L4_2 = -1001
    L5_2 = "params not found"
    return L4_2, L5_2
  end
  L4_2 = A0_2.group_id
  if L4_2 then
    L4_2 = A0_2.group_key
    if L4_2 then
      L4_2 = A0_2.group_id
      if L4_2 ~= "" then
        goto lbl_27
      end
    end
  end
  L4_2 = -1008
  L5_2 = "invalid group args"
  do return L4_2, L5_2 end
  ::lbl_27::
  L4_2 = A0_2.master_device_id
  if L4_2 then
    L4_2 = A0_2.master_device_id
    if L4_2 ~= "" then
      goto lbl_36
    end
  end
  L4_2 = -1009
  L5_2 = "invalid master_device_id"
  do return L4_2, L5_2 end
  ::lbl_36::
  L4_2 = A0_2.nickname
  L5_2 = A0_2.front_wireless
  if L5_2 then
    L6_2 = L5_2.ssid
    if L6_2 then
      L6_2 = L5_2.password
      if L6_2 then
        L6_2 = L5_2.ssid
        if L6_2 ~= "" then
          goto lbl_52
        end
      end
    end
  end
  L6_2 = -1007
  L7_2 = "invalid front_wireless args"
  do return L6_2, L7_2 end
  ::lbl_52::
  L6_2 = A0_2.cloud_account
  if L6_2 then
    L7_2 = L6_2.username
    if L7_2 then
      L7_2 = L6_2.username
      if L7_2 ~= "" then
        goto lbl_66
      end
    end
  end
  L7_2 = _UPVALUE0_
  L7_2 = L7_2.print
  L8_2 = "add device without cloud_account"
  L7_2(L8_2)
  L3_2 = false
  ::lbl_66::
  L7_2 = _UPVALUE1_
  L7_2 = L7_2.read_group_info
  L7_2 = L7_2()
  if L7_2 then
    L8_2 = L7_2.gid
    if L8_2 then
      L8_2 = _UPVALUE0_
      L9_2 = "Warning: overwriting group "
      L10_2 = L7_2.gid
      L8_2(L9_2, L10_2)
    end
  end
  L8_2 = _UPVALUE1_
  L8_2 = L8_2.join_group
  L9_2 = A0_2.group_id
  L10_2 = A0_2.group_key
  L11_2 = "RE"
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = _UPVALUE2_
  L8_2 = L8_2.fork
  L8_2 = L8_2()
  if L8_2 == 0 then
    L9_2 = os
    L9_2 = L9_2.execute
    L10_2 = "ubus call leds init '{\"state\":\"binding\"}'"
    L9_2(L10_2)
    if L3_2 then
      A0_2.is_base = true
      L9_2 = _UPVALUE3_
      L10_2 = A0_2
      L9_2(L10_2)
    else
      L9_2 = _UPVALUE4_
      L10_2 = A0_2
      L9_2(L10_2)
    end
    L9_2 = os
    L9_2 = L9_2.exit
    L10_2 = 1
    L9_2(L10_2)
  end
  L9_2 = L4_2.nickname
  if L9_2 == "custom" then
    L10_2 = L4_2.custom_nickname
    if L10_2 then
      L9_2 = L4_2.custom_nickname
    end
  end
  L10_2 = _UPVALUE5_
  L10_2()
  L10_2 = _UPVALUE0_
  L10_2 = L10_2.print
  L11_2 = "preconf_write_m5_device: end"
  L10_2(L11_2)
  L10_2 = _UPVALUE1_
  L10_2 = L10_2.get_pregroup_crc32_hex
  L10_2 = L10_2()
  if L10_2 == "" then
    L10_2 = nil
  end
  L11_2 = {}
  L12_2 = _UPVALUE6_
  L12_2 = L12_2.getfirm_cached
  L13_2 = "DEV_ID"
  L12_2 = L12_2(L13_2)
  L13_2 = L12_2
  L12_2 = L12_2.trim
  L12_2 = L12_2(L13_2)
  L11_2.slave_device_id = L12_2
  L12_2 = _UPVALUE6_
  L12_2 = L12_2.getfirm_cached
  L13_2 = "MAC"
  L12_2 = L12_2(L13_2)
  L13_2 = L12_2
  L12_2 = L12_2.trim
  L12_2 = L12_2(L13_2)
  L11_2.mac = L12_2
  L12_2 = _UPVALUE1_
  L12_2 = L12_2.getfirm_cached
  L13_2 = "MODEL"
  L12_2 = L12_2(L13_2)
  L11_2.device_model = L12_2
  L11_2.role = "RE"
  L12_2 = L1_2.get_product_level
  L12_2 = L12_2()
  L11_2.product_level = L12_2
  L11_2.preconf_id = L10_2
  L11_2.nickname = L9_2
  return L11_2
end

function L45_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.get_preconf_gid
  L1_2 = L1_2()
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.get_preconf_key
  L2_2 = L2_2()
  L3_2 = _UPVALUE0_
  L3_2 = L3_2.get_preconf_pack
  L3_2 = L3_2()
  L4_2 = {}
  if L1_2 then
    L4_2.gid = L1_2
  end
  if L2_2 then
    L4_2.key = L2_2
  end
  if L3_2 then
    L5_2 = tonumber
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L4_2.pack = L5_2
  end
  return L4_2
end

function L46_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.config
  L2_2 = A0_2.device_list
  if L1_2 then
    L3_2 = L1_2.internet
    if L3_2 then
      L3_2 = _UPVALUE0_
      L4_2 = L3_2
      L3_2 = L3_2.section
      L5_2 = "preconfig_device_list"
      L6_2 = "pre_config"
      L7_2 = "internet"
      L8_2 = L1_2.internet
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    end
  end
  if L1_2 then
    L3_2 = L1_2.wireless
    if L3_2 then
      L3_2 = _UPVALUE0_
      L4_2 = L3_2
      L3_2 = L3_2.section
      L5_2 = "preconfig_device_list"
      L6_2 = "pre_config"
      L7_2 = "wifi"
      L8_2 = L1_2.wireless
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    end
  end
  if L1_2 then
    L3_2 = L1_2.sip_alg
    if L3_2 then
      L3_2 = _UPVALUE1_
      L3_2 = L3_2.print
      L4_2 = _UPVALUE2_
      L4_2 = L4_2.encode
      L5_2 = A0_2
      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L4_2(L5_2)
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L3_2 = L1_2.sip_alg
      L4_2 = L3_2.enable
      if L4_2 == true then
        L3_2.enable = "1"
      else
        L3_2.enable = "0"
      end
      L4_2 = _UPVALUE0_
      L5_2 = L4_2
      L4_2 = L4_2.section
      L6_2 = "preconfig_device_list"
      L7_2 = "pre_config"
      L8_2 = "sip_alg"
      L9_2 = L3_2
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    end
  end
  if L2_2 then
    L3_2 = _UPVALUE0_
    L4_2 = L3_2
    L3_2 = L3_2.foreach
    L5_2 = "preconfig_device_list"
    L6_2 = "device"
    
    function L7_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      L1_3 = 1
      L2_3 = ipairs
      L3_3 = _UPVALUE0_
      L2_3, L3_3, L4_3 = L2_3(L3_3)
      for L5_3, L6_3 in L2_3, L3_3, L4_3 do
        L7_3 = A0_3[".name"]
        if L7_3 == L6_3 then
          L1_3 = 0
          break
        end
      end
      if L1_3 == 1 then
        L2_3 = _UPVALUE1_
        L3_3 = L2_3
        L2_3 = L2_3.delete
        L4_3 = "preconfig_device_list"
        L5_3 = A0_3[".name"]
        L2_3(L3_3, L4_3, L5_3)
      end
    end
    
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = _UPVALUE3_
    L3_2 = L3_2.exec
    L4_2 = "getfirm DEV_ID"
    L3_2 = L3_2(L4_2)
    L4_2 = L3_2
    L3_2 = L3_2.trim
    L3_2 = L3_2(L4_2)
    L4_2 = require
    L5_2 = "luci.model.subprocess"
    L4_2 = L4_2(L5_2)
    L5_2 = ipairs
    L6_2 = L2_2
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    for L8_2, L9_2 in L5_2, L6_2, L7_2 do
      L10_2 = {}
      if L9_2 == L3_2 then
        L10_2.role = "AP"
        L10_2.need_bind = "0"
      else
        L10_2.role = "RE"
        L10_2.need_bind = "1"
      end
      L11_2 = L4_2.call_output
      L12_2 = {}
      L13_2 = "md5sum"
      L12_2[1] = L13_2
      L13_2 = L9_2
      L11_2 = L11_2(L12_2, L13_2)
      L12_2 = L11_2
      L11_2 = L11_2.match
      L13_2 = "%x+"
      L11_2 = L11_2(L12_2, L13_2)
      L10_2.device_id_md5 = L11_2
      L11_2 = _UPVALUE0_
      L12_2 = L11_2
      L11_2 = L11_2.section
      L13_2 = "preconfig_device_list"
      L14_2 = "device"
      L15_2 = L9_2
      L16_2 = L10_2
      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    end
  end
  L3_2 = _UPVALUE0_
  L4_2 = L3_2
  L3_2 = L3_2.commit
  L5_2 = "preconfig_device_list"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 == 0 then
    L4_2 = "/var/run/preconfig_finished_flag"
    L5_2 = _UPVALUE3_
    L5_2 = L5_2.call
    L6_2 = "echo 1 > %s" % L4_2
    L5_2(L6_2)
  end
  return L3_2
end

function L47_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = "Deco"
  L3_2 = nil
  L4_2 = require
  L5_2 = "luci.util"
  L4_2 = L4_2(L5_2)
  if A0_2 then
    L6_2 = A0_2
    L5_2 = A0_2.gsub
    L7_2 = ":"
    L8_2 = "-"
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L6_2 = L5_2
    L5_2 = L5_2.upper
    L5_2 = L5_2(L6_2)
    L6_2 = L4_2.split
    L7_2 = L5_2
    L8_2 = "-"
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = L6_2[5]
    if L7_2 then
      L7_2 = L6_2[6]
      if L7_2 then
        L7_2 = "Deco_"
        L8_2 = tostring
        L9_2 = L6_2[5]
        L8_2 = L8_2(L9_2)
        L9_2 = tostring
        L10_2 = L6_2[6]
        L9_2 = L9_2(L10_2)
        L2_2 = L7_2 .. L8_2 .. L9_2
      end
    end
  end
  L5_2 = _UPVALUE0_
  L5_2 = L5_2.bin
  L5_2 = L5_2.b64encode
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L3_2 = L5_2
  L1_2.nickname = "custom"
  L1_2.custom_nickname = L3_2
  return L1_2
end

function L48_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = true
  L1_2 = _UPVALUE0_
  L2_2 = L1_2
  L1_2 = L1_2.foreach
  L3_2 = "preconfig_device_list"
  L4_2 = "device"
  
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = _UPVALUE0_
    L2_3 = L1_3
    L1_3 = L1_3.get
    L3_3 = "bind_device_list"
    L4_3 = A0_3[".name"]
    L5_3 = "bindtime"
    L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
    if L1_3 == nil then
      L2_3 = false
      L0_2 = L2_3
    end
  end
  
  L1_2(L2_2, L3_2, L4_2, L5_2)
  return L0_2
end

has_all_device_binded = L48_1

function L48_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if not A0_2 or not A1_2 then
    return
  end
  L2_2 = require
  L3_2 = "luci.model.uci"
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.cursor
  L4_2 = "/etc/profile.d"
  L3_2 = L3_2(L4_2)
  L5_2 = L3_2
  L4_2 = L3_2.get
  L6_2 = "isp_info"
  L7_2 = "pre_config"
  L8_2 = "iface_2G"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = "ath06"
  end
  L6_2 = L3_2
  L5_2 = L3_2.get
  L7_2 = "isp_info"
  L8_2 = "pre_config"
  L9_2 = "iface_5G"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = "ath16"
  end
  L6_2 = "iwpriv "
  L7_2 = L4_2
  L8_2 = " kickmac "
  L9_2 = A0_2
  L10_2 = ";"
  L11_2 = "iwpriv "
  L12_2 = L5_2
  L13_2 = " kickmac "
  L14_2 = A1_2
  L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2
  L7_2 = _UPVALUE0_
  L7_2 = L7_2.fork_call
  L8_2 = L6_2
  L7_2(L8_2)
end

pre_config_kick_mac = L48_1

function L48_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 and not A1_2 then
    return
  end
  L2_2 = {}
  L3_2 = _UPVALUE0_
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  L3_2 = {}
  L4_2 = {}
  L5_2 = {}
  L5_2.device_id = A0_2
  L5_2.mac = A1_2
  L5_2.nickname = L2_2
  L3_2.device = L5_2
  L3_2.is_pre_config = true
  L6_2 = _UPVALUE1_
  L6_2 = L6_2.print
  L7_2 = "!!!!!!params = "
  L8_2 = _UPVALUE2_
  L8_2 = L8_2.encode
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  L7_2 = L7_2 .. L8_2
  L6_2(L7_2)
  L4_2.form = "preconf"
  L4_2.operation = "preconf_add"
  L4_2.params = L3_2
  L4_2.module = "quick_setup"
  L6_2 = _UPVALUE3_
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L7_2 = _UPVALUE1_
  L7_2 = L7_2.print
  L8_2 = "add_prv result:"
  L9_2 = tostring
  L10_2 = L6_2
  L9_2 = L9_2(L10_2)
  L8_2 = L8_2 .. L9_2
  L7_2(L8_2)
  L7_2 = _UPVALUE1_
  L7_2 = L7_2.print
  L8_2 = "add_prv result:"
  L9_2 = _UPVALUE2_
  L9_2 = L9_2.encode
  L10_2 = L6_2
  L9_2 = L9_2(L10_2)
  L8_2 = L8_2 .. L9_2
  L7_2(L8_2)
  if L6_2 then
    L7_2 = L6_2.error_code
    if L7_2 == 0 then
    end
  end
  L7_2 = _UPVALUE4_
  L7_2 = L7_2.fork
  L7_2 = L7_2()
  if L7_2 == 0 then
    L8_2 = require
    L9_2 = "cloud.tp_apps.dcmp"
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2.check_bind_event
    L9_2()
    L9_2 = L8_2.check_upgrade_event
    L9_2()
    L9_2 = L8_2.check_internet_event
    L9_2()
    L9_2 = os
    L9_2 = L9_2.exit
    L10_2 = 0
    L9_2(L10_2)
  end
  return L6_2
end

pre_config_add_re = L48_1

function L48_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = false
  L1_2 = "/tmp/onboarding"
  L2_2 = nil
  L3_2 = nil
  L4_2 = require
  L5_2 = "nixio.fs"
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.access
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = io
    L5_2 = L5_2.open
    L6_2 = L1_2
    L7_2 = "r"
    L5_2 = L5_2(L6_2, L7_2)
    L2_2 = L5_2
    if not L2_2 then
      L5_2 = _UPVALUE0_
      L6_2 = "open onboarding file with unexpect error"
      L5_2(L6_2)
      return L0_2
    end
    L6_2 = L2_2
    L5_2 = L2_2.read
    L7_2 = "*line"
    L5_2 = L5_2(L6_2, L7_2)
    L3_2 = L5_2
    L6_2 = L2_2
    L5_2 = L2_2.close
    L5_2(L6_2)
    if L3_2 then
      L5_2 = tostring
      L6_2 = L3_2
      L5_2 = L5_2(L6_2)
      if L5_2 == "1" then
        L0_2 = true
      end
    end
  end
  return L0_2
end

function L49_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.print
  L2_2 = "!!!sys_mode_set begin"
  L1_2(L2_2)
  if A0_2 == nil then
    return
  end
  L1_2 = _UPVALUE1_
  L1_2 = L1_2.call
  L2_2 = "sleep 15"
  L1_2(L2_2)
  L1_2 = {}
  L2_2 = {}
  L1_2.params = L2_2
  L2_2 = L1_2.params
  L2_2.mode = A0_2
  L2_2 = "/tmp/pre_config_mode"
  L3_2 = require
  L4_2 = "luci.model.subprocess"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "luci.model.app_clientmgmt"
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.write_to_file
  L6_2 = L2_2
  L7_2 = L1_2
  L5_2(L6_2, L7_2)
  L5_2 = -1
  L6_2 = _UPVALUE0_
  L6_2 = L6_2.print
  L7_2 = "!!!!!!!!change_mode :"
  L8_2 = _UPVALUE2_
  L8_2 = L8_2.encode
  L9_2 = L1_2
  L8_2 = L8_2(L9_2)
  L7_2 = L7_2 .. L8_2
  L6_2(L7_2)
  L6_2 = L3_2.call
  L7_2 = {}
  L8_2 = "tmpcli"
  L9_2 = "-o"
  L10_2 = "0x40a1"
  L11_2 = "-I"
  L12_2 = L2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L6_2 = L6_2(L7_2)
  L5_2 = L6_2
  L6_2 = _UPVALUE3_
  L6_2 = L6_2.fs
  L6_2 = L6_2.unlink
  L7_2 = L2_2
  L6_2(L7_2)
  if L5_2 == 0 then
    L5_2 = true
  end
  return L5_2
end

function L50_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.print
  L2_2 = "dcmp_pre_config_set begin"
  L1_2(L2_2)
  if A0_2 then
    L1_2 = A0_2.config
    if L1_2 ~= nil then
      goto lbl_15
    end
    L1_2 = A0_2.device_list
    if L1_2 ~= nil then
      goto lbl_15
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_15::
  if A0_2 then
    L1_2 = A0_2.dcmp_cause
    if L1_2 then
      L1_2 = _UPVALUE1_
      L2_2 = A0_2
      L1_2(L2_2)
    end
  end
  L1_2 = _UPVALUE2_
  L1_2 = L1_2.read_group_info
  L1_2 = L1_2()
  if L1_2 then
    L2_2 = L1_2.gid
    if L2_2 then
      L2_2 = L1_2.gid
      if L2_2 ~= "" then
        L2_2 = true
        return L2_2
    end
  end
  else
    L2_2 = _UPVALUE3_
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = _UPVALUE0_
      L2_2 = L2_2.print
      L3_2 = "in onboarding status, do not bind isp preconfig device"
      L2_2(L3_2)
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = _UPVALUE2_
  L2_2 = L2_2.create_group
  L2_2 = L2_2()
  L1_2 = L2_2
  L2_2 = A0_2.config
  L3_2 = nil
  L4_2 = _UPVALUE2_
  L4_2 = L4_2.getfirm_cached
  L5_2 = "MAC"
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2
  L4_2 = L4_2.gsub
  L6_2 = "-"
  L7_2 = ":"
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = _UPVALUE4_
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = _UPVALUE5_
  L6_2 = L6_2.exec
  L7_2 = "getfirm DEV_ID"
  L6_2 = L6_2(L7_2)
  L7_2 = L6_2
  L6_2 = L6_2.trim
  L6_2 = L6_2(L7_2)
  L7_2 = _UPVALUE2_
  L7_2 = L7_2.set_create_group_flag
  L7_2()
  if L2_2 then
    L7_2 = L2_2.internet
    if L7_2 then
      L7_2 = L2_2.internet
      L8_2 = {}
      L9_2 = L7_2.dial_type
      L8_2.dial_type = L9_2
      L9_2 = L8_2.dial_type
      if L9_2 == "pppoe" then
        L9_2 = {}
        L8_2.user_info = L9_2
        L9_2 = L8_2.user_info
        L10_2 = L7_2.username
        L9_2.username = L10_2
        L9_2 = L8_2.user_info
        L10_2 = L7_2.password
        L9_2.password = L10_2
      else
        L9_2 = L8_2.dial_type
        if L9_2 ~= "l2tp" then
          L9_2 = L8_2.dial_type
          if L9_2 ~= "pptp" then
            goto lbl_112
          end
        end
        L9_2 = {}
        L8_2.user_info = L9_2
        L9_2 = L8_2.user_info
        L10_2 = L7_2.username
        L9_2.username = L10_2
        L9_2 = L8_2.user_info
        L10_2 = L7_2.password
        L9_2.password = L10_2
        L9_2 = L8_2.user_info
        L10_2 = L7_2.vpn_server
        L9_2.vpn_server = L10_2
        L8_2.secondary_connection = "dynamic_ip"
      end
      ::lbl_112::
      L9_2 = L7_2.dns1
      if L9_2 == nil then
        L9_2 = L7_2.dns2
        if L9_2 == nil then
          goto lbl_126
        end
      end
      L9_2 = L7_2.dns1
      L9_2 = #L9_2
      if L9_2 < 1 then
        L9_2 = L7_2.dns2
        L9_2 = #L9_2
        if L9_2 < 1 then
          ::lbl_126::
          L8_2.enable_auto_dns = true
      end
      else
        L8_2.enable_auto_dns = false
        L9_2 = {}
        L8_2.ip_info = L9_2
        L9_2 = L8_2.ip_info
        L10_2 = L7_2.dns1
        L9_2.dns1 = L10_2
        L9_2 = L8_2.ip_info
        L10_2 = L7_2.dns2
        L9_2.dns2 = L10_2
      end
      L9_2 = {}
      L10_2 = {}
      L9_2.params = L10_2
      L10_2 = L9_2.params
      L10_2.wan = L8_2
      L9_2.module = "network"
      L9_2.form = "wan_ipv4"
      L9_2.operation = "write"
      L10_2 = _UPVALUE6_
      L11_2 = L9_2
      L10_2 = L10_2(L11_2)
      L3_2 = L10_2
      if L3_2 then
        L10_2 = L3_2.error_code
        if L10_2 == 0 then
          goto lbl_163
        end
      end
      L10_2 = _UPVALUE0_
      L10_2 = L10_2.print
      L11_2 = "!!!dcmp_pre_config_set res:"
      L12_2 = _UPVALUE7_
      L12_2 = L12_2.encode
      L13_2 = L3_2
      L12_2 = L12_2(L13_2)
      L11_2 = L11_2 .. L12_2
      L10_2(L11_2)
    end
  end
  ::lbl_163::
  L7_2 = require
  L8_2 = "luci.model.app_wifi"
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2.Wifi
  L7_2 = L7_2()
  if L2_2 then
    L8_2 = L2_2.wireless
    if L8_2 then
      L8_2 = {}
      L8_2.enable = "1"
      L9_2 = _UPVALUE8_
      L9_2 = L9_2.bin
      L9_2 = L9_2.b64decode
      L10_2 = L2_2.wireless
      L10_2 = L10_2.ssid
      L9_2 = L9_2(L10_2)
      if not L9_2 then
        L9_2 = L2_2.wireless
        L9_2 = L9_2.ssid
      end
      L8_2.ssid = L9_2
      L9_2 = _UPVALUE8_
      L9_2 = L9_2.bin
      L9_2 = L9_2.b64decode
      L10_2 = L2_2.wireless
      L10_2 = L10_2.password
      L9_2 = L9_2(L10_2)
      if not L9_2 then
        L9_2 = L2_2.wireless
        L9_2 = L9_2.password
      end
      L8_2.password = L9_2
      L9_2 = L8_2.ssid
      if L9_2 then
        L9_2 = L8_2.password
        if L9_2 then
          L10_2 = L7_2
          L9_2 = L7_2.set_ap
          L11_2 = L8_2
          L9_2(L10_2, L11_2)
          L9_2 = _UPVALUE0_
          L9_2 = L9_2.print
          L10_2 = "[PRE-CONFIG] group:"
          L11_2 = _UPVALUE7_
          L11_2 = L11_2.encode
          L12_2 = L1_2
          L11_2 = L11_2(L12_2)
          L10_2 = L10_2 .. L11_2
          L9_2(L10_2)
          L10_2 = L7_2
          L9_2 = L7_2.set_backhaul
          L11_2 = L1_2.key
          L9_2(L10_2, L11_2)
          L10_2 = L7_2
          L9_2 = L7_2.commit
          L9_2 = L9_2(L10_2)
          if not L9_2 then
            L10_2 = _UPVALUE0_
            L10_2 = L10_2.print
            L11_2 = "!!!!!!dcmp_pre_config_set set wifi error:"
            L12_2 = _UPVALUE7_
            L12_2 = L12_2.encode
            L13_2 = L9_2
            L12_2 = L12_2(L13_2)
            L11_2 = L11_2 .. L12_2
            L10_2(L11_2)
          end
        end
      end
    end
  end
  L8_2 = _UPVALUE2_
  L8_2 = L8_2.join_group
  L9_2 = L1_2.gid
  L10_2 = L1_2.key
  L11_2 = "AP"
  L8_2(L9_2, L10_2, L11_2)
  if L2_2 then
    L8_2 = L2_2.sip_alg
    if L8_2 then
      L8_2 = _UPVALUE9_
      L8_2 = L8_2.set_sip_alg_common
      L9_2 = L2_2.sip_alg
      L8_2(L9_2)
    end
  end
  L8_2 = {}
  L9_2 = _UPVALUE5_
  L9_2 = L9_2.exec
  L10_2 = "getfirm MAC"
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2
  L9_2 = L9_2.trim
  L9_2 = L9_2(L10_2)
  L8_2.mac = L9_2
  L8_2.role = "AP"
  L9_2 = L5_2.nickname
  if L9_2 == "custom" then
    L10_2 = L5_2.custom_nickname
    if L10_2 then
      L9_2 = L5_2.custom_nickname
    end
  end
  L8_2.nickname = L9_2
  L10_2 = tostring
  L11_2 = os
  L11_2 = L11_2.time
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L11_2()
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L8_2.bindtime = L10_2
  L10_2 = _UPVALUE2_
  L10_2 = L10_2.getfirm_cached
  L11_2 = "MODEL"
  L10_2 = L10_2(L11_2)
  L8_2.device_model = L10_2
  L10_2 = _UPVALUE2_
  L10_2 = L10_2.add_bind_device
  L11_2 = L6_2
  L12_2 = L8_2
  L10_2(L11_2, L12_2)
  L10_2 = _UPVALUE0_
  L10_2 = L10_2.print
  L11_2 = "not bind cloud, but modify location"
  L10_2(L11_2)
  if L9_2 then
    L10_2 = _UPVALUE0_
    L10_2 = L10_2.print
    L11_2 = "location"
    L12_2 = tostring
    L13_2 = L9_2
    L12_2 = L12_2(L13_2)
    L11_2 = L11_2 .. L12_2
    L10_2(L11_2)
    L10_2 = _UPVALUE10_
    L11_2 = L10_2
    L10_2 = L10_2.set
    L12_2 = "cloud_config"
    L13_2 = "info"
    L14_2 = "alias"
    L15_2 = L9_2
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    L10_2 = _UPVALUE10_
    L11_2 = L10_2
    L10_2 = L10_2.commit
    L12_2 = "cloud_config"
    L10_2(L11_2, L12_2)
  end
  L10_2 = _UPVALUE10_
  L11_2 = L10_2
  L10_2 = L10_2.set
  L12_2 = "bluetooth"
  L13_2 = "settings"
  L14_2 = "enable"
  L15_2 = "off"
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = _UPVALUE10_
  L11_2 = L10_2
  L10_2 = L10_2.commit
  L12_2 = "bluetooth"
  L10_2(L11_2, L12_2)
  L10_2 = require
  L11_2 = "luci.model.mode"
  L10_2 = L10_2(L11_2)
  L11_2 = L10_2.is_iot_support
  L11_2 = L11_2()
  if L11_2 == true then
    L11_2 = L10_2.is_iot_wifionly
    L11_2 = L11_2()
    if L11_2 == false then
      L11_2 = require
      L12_2 = "luci.model.iot_ble"
      L11_2 = L11_2(L12_2)
      L12_2 = nil
      L13_2 = _UPVALUE5_
      L13_2 = L13_2.exec
      L14_2 = "getfirm DEV_ID"
      L13_2 = L13_2(L14_2)
      L14_2 = L13_2
      L13_2 = L13_2.trim
      L13_2 = L13_2(L14_2)
      L14_2 = L11_2.create_mesh_network
      L14_2 = L14_2()
      L12_2 = L14_2
      L14_2 = _UPVALUE10_
      L15_2 = L14_2
      L14_2 = L14_2.set
      L16_2 = "ble_network"
      L17_2 = "settings"
      L18_2 = "key"
      L19_2 = L12_2.nwkey
      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
      L14_2 = _UPVALUE10_
      L15_2 = L14_2
      L14_2 = L14_2.commit
      L16_2 = "ble_network"
      L14_2(L15_2, L16_2)
      L14_2 = _UPVALUE10_
      L15_2 = L14_2
      L14_2 = L14_2.set
      L16_2 = "zigbee_network_sync"
      L17_2 = "zigbee_network_sync"
      L18_2 = "co_device_id"
      L19_2 = L13_2
      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
      L14_2 = "0x"
      L15_2 = tostring
      L16_2 = _UPVALUE5_
      L16_2 = L16_2.uniqueid
      L17_2 = 2
      L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L16_2(L17_2)
      L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      L14_2 = L14_2 .. L15_2
      L15_2 = _UPVALUE0_
      L16_2 = "Create coordinator: "
      L17_2 = L13_2
      L18_2 = ", panID: "
      L19_2 = L14_2
      L16_2 = L16_2 .. L17_2 .. L18_2 .. L19_2
      L15_2(L16_2)
      L15_2 = _UPVALUE10_
      L16_2 = L15_2
      L15_2 = L15_2.set
      L17_2 = "zigbee_network_sync"
      L18_2 = "zigbee_network_sync"
      L19_2 = "panID"
      L20_2 = L14_2
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
      L15_2 = _UPVALUE10_
      L16_2 = L15_2
      L15_2 = L15_2.set
      L17_2 = "zigbee_network_sync"
      L18_2 = "zigbee_network_sync"
      L19_2 = "model"
      L20_2 = _UPVALUE5_
      L20_2 = L20_2.exec
      L21_2 = "getfirm MODEL"
      L20_2 = L20_2(L21_2)
      L21_2 = L20_2
      L20_2 = L20_2.trim
      L20_2, L21_2 = L20_2(L21_2)
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      L15_2 = _UPVALUE10_
      L16_2 = L15_2
      L15_2 = L15_2.commit
      L17_2 = "zigbee_network_sync"
      L15_2(L16_2, L17_2)
    end
  end
  L11_2 = _UPVALUE10_
  L12_2 = L11_2
  L11_2 = L11_2.set
  L13_2 = "wifi"
  L14_2 = "default"
  L15_2 = "enable"
  L16_2 = "0"
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = _UPVALUE5_
  L11_2 = L11_2.exec
  L12_2 = "echo \"wifi.default.enable='1'\" >> /var/state/wifi "
  L11_2(L12_2)
  L11_2 = _UPVALUE10_
  L12_2 = L11_2
  L11_2 = L11_2.commit
  L13_2 = "wifi"
  L11_2(L12_2, L13_2)
  L11_2 = _UPVALUE8_
  L11_2 = L11_2.fork
  L11_2 = L11_2()
  if L11_2 == 0 then
    L12_2 = _UPVALUE11_
    L12_2 = L12_2.set_tipc_config
    L12_2()
    L12_2 = _UPVALUE12_
    L12_2()
    L12_2 = _UPVALUE2_
    L12_2 = L12_2.clear_create_group_flag
    L12_2()
  end
  L13_2 = L7_2
  L12_2 = L7_2.get_backhaul_channel
  L12_2 = L12_2(L13_2)
  L13_2 = _UPVALUE0_
  L13_2 = L13_2.print
  L14_2 = "dcmp_pre_config_set end"
  L13_2(L14_2)
  L13_2 = A0_2.config
  L13_2 = L13_2.operation_mode
  L14_2 = _UPVALUE10_
  L15_2 = L14_2
  L14_2 = L14_2.get
  L16_2 = "sysmode"
  L17_2 = "sysmode"
  L18_2 = "mode"
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
  if not L14_2 then
    L14_2 = "Router"
  end
  if L14_2 ~= L13_2 then
    L15_2 = _UPVALUE8_
    L15_2 = L15_2.fork
    L15_2 = L15_2()
    if L15_2 == 0 then
      L16_2 = _UPVALUE13_
      L17_2 = L13_2
      L16_2(L17_2)
    end
  end
  L15_2 = {}
  L16_2 = L1_2.gid
  L15_2.group_id = L16_2
  L16_2 = L1_2.key
  L15_2.group_key = L16_2
  L15_2.master_device_id = L6_2
  L15_2.backhaul = L12_2
  return L15_2
end

L51_1 = {}
L52_1 = {}
L53_1 = {}
L53_1.cb = L29_1
L52_1.write = L53_1
L51_1.newgroup = L52_1
L52_1 = {}
L53_1 = {}
L53_1.cb = L40_1
L52_1.write = L53_1
L51_1.newdevice = L52_1
L52_1 = {}
L53_1 = {}
L53_1.cb = L32_1
L52_1.read = L53_1
L53_1 = {}
L53_1.cb = L42_1
L52_1.write = L53_1
L51_1.batchdevices = L52_1
L52_1 = {}
L53_1 = {}
L53_1.cb = L45_1
L52_1.preconf_read = L53_1
L53_1 = {}
L53_1.cb = L44_1
L52_1.preconf_write = L53_1
L53_1 = {}
L53_1.cb = L43_1
L52_1.preconf_add = L53_1
L53_1 = {}
L54_1 = preconf_check
L53_1.cb = L54_1
L52_1.preconf_check = L53_1
L51_1.preconf = L52_1
L52_1 = {}
L53_1 = {}
L53_1.cb = L30_1
L52_1.read = L53_1
L53_1 = {}
L53_1.cb = L31_1
L52_1.sync = L53_1
L51_1.heartbeat = L52_1
L52_1 = {}
L53_1 = {}
L53_1.cb = L27_1
L52_1.write = L53_1
L51_1.eponymous_detect = L52_1
L52_1 = {}
L53_1 = {}
L53_1.cb = L23_1
L52_1.write = L53_1
L53_1 = {}
L53_1.cb = L24_1
L52_1.read = L53_1
L51_1.bluetooth = L52_1
L52_1 = {}
L53_1 = {}
L53_1.cb = L50_1
L52_1.pre_config_write = L53_1
L53_1 = {}
L53_1.cb = L46_1
L52_1.save_pre_config = L53_1
L51_1.dcmp_pre_config = L52_1

function L52_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = require
  L2_2 = "luci.model.controller"
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2.simple_dispatch
  L3_2 = _UPVALUE0_
  L4_2 = A0_2
  return L2_2(L3_2, L4_2)
end

dispatch = L52_1
