local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = module
L1_1 = "luci.model.controller"
L2_1 = package
L2_1 = L2_1.seeall
L0_1(L1_1, L2_1)
L0_1 = require
L1_1 = "luci.util"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "luci.http"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "nixio"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "luci.sys.config"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "luci.model.sync"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "luci.model.subprocess"
L5_1 = L5_1(L6_1)
L6_1 = require
L7_1 = "luci.tools.debug"
L6_1 = L6_1(L7_1)
L7_1 = require
L8_1 = "luci.model.uci"
L7_1 = L7_1(L8_1)
L8_1 = require
L9_1 = "luci.model.locker"
L8_1 = L8_1(L9_1)
L8_1 = L8_1.Locker
L9_1 = L7_1.inst
L10_1 = nil
L11_1 = 0

function L12_1(A0_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = true
  L3_2 = _UPVALUE0_
  if A0_2 ~= L3_2 then
    L3_2 = ipairs
    L4_2 = {}
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = ...
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L4_2[4] = L8_2
    L4_2[5] = L9_2
    L4_2[6] = L10_2
    L4_2[7] = L11_2
    L4_2[8] = L12_2
    L4_2[9] = L13_2
    L4_2[10] = L14_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      L9_2 = A0_2
      L8_2 = A0_2.rawcommit
      L10_2 = L7_2
      L8_2 = L8_2(L9_2, L10_2)
      L2_2 = L8_2 or L2_2
      if L8_2 then
      end
    end
    return L2_2
  end
  L3_2 = require
  L4_2 = "luci.model.mode"
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.is_emmc_support
  L4_2 = L4_2()
  L5_2 = {}
  L6_2 = false
  L7_2 = ipairs
  L8_2 = {}
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = ...
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L8_2[6] = L14_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = _UPVALUE1_
    L12_2 = L12_2.is_device_config
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if L12_2 then
      L13_2 = A0_2
      L12_2 = A0_2.rawcommit
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      L2_2 = L12_2 or L2_2
      if L12_2 then
      end
      L6_2 = true
    elseif L4_2 == true then
      L12_2 = _UPVALUE1_
      L12_2 = L12_2.is_emmc_config
      L13_2 = L11_2
      L12_2 = L12_2(L13_2)
      if L12_2 then
        L12_2 = A0_2._class
        L12_2.has_emmc_config = true
      end
      L12_2 = A0_2._class
      L12_2 = L12_2.committed
      L12_2[L11_2] = true
      L12_2 = _UPVALUE2_
      if L12_2 == 0 then
        L12_2 = #L5_2
        L12_2 = L12_2 + 1
        L5_2[L12_2] = L11_2
      end
    else
      L12_2 = A0_2._class
      L12_2 = L12_2.committed
      L12_2[L11_2] = true
      L12_2 = _UPVALUE2_
      if L12_2 == 0 then
        L12_2 = #L5_2
        L12_2 = L12_2 + 1
        L5_2[L12_2] = L11_2
      end
    end
  end
  if L6_2 then
    L7_2 = A0_2._class
    L7_2.dev_config_committed = true
    L7_2 = _UPVALUE1_
    L7_2 = L7_2.saveconfig
    L8_2 = "device-config"
    L7_2(L8_2)
  end
  L7_2 = #L5_2
  if 0 < L7_2 then
    L7_2 = _UPVALUE3_
    L8_2 = "WARNING: some configs will NOT be saved!! Consider adding them to device-config in profile."
    L7_2(L8_2)
    L7_2 = _UPVALUE3_
    L8_2 = "         They are:"
    L9_2 = table
    L9_2 = L9_2.concat
    L10_2 = L5_2
    L11_2 = ", "
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2, L11_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  return L2_2
end

uci_commit = L12_1

function L12_1(A0_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = _UPVALUE0_
  L3_2 = "WARNING: direct use of Cursor.commit IS DEPRECATED!"
  L2_2(L3_2)
  L2_2 = uci_commit
  L3_2 = A0_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = ...
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L2_2 = true
  L3_2 = ipairs
  L4_2 = {}
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = ...
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L4_2[6] = L10_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L9_2 = A0_2
    L8_2 = A0_2.rawcommit
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    L2_2 = L8_2 or L2_2
    if L8_2 then
    end
  end
  return L2_2
end

uci_commit_to_fs = L12_1

function L12_1()
  local L0_2, L1_2, L2_2
  L0_2 = getmetatable
  L1_2 = _UPVALUE0_
  L0_2 = L0_2(L1_2)
  L1_2 = uci_commit
  L0_2.commit = L1_2
  L1_2 = {}
  L0_2._class = L1_2
  L1_2 = L0_2._class
  L2_2 = {}
  L1_2.committed = L2_2
  L1_2 = L0_2._class
  L1_2.dev_config_committed = false
  L1_2 = L0_2._class
  L1_2.has_emmc_config = false
end

uci_init = L12_1
L12_1 = uci_init
L12_1()

function L12_1()
  local L0_2, L1_2, L2_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.exec
  L1_2 = {}
  L2_2 = "/sbin/reload_config"
  L1_2[1] = L2_2
  L0_2(L1_2)
end

uci_apply = L12_1

function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = true
  L1_2 = _UPVALUE0_
  if 0 < L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = next
  L2_2 = _UPVALUE1_
  L2_2 = L2_2._class
  L2_2 = L2_2.committed
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    L1_2 = _UPVALUE1_
    L1_2 = L1_2._class
    L1_2 = L1_2.dev_config_committed
    if L1_2 then
      L1_2 = uci_apply
      L1_2()
    end
    L1_2 = true
    return L1_2
  end
  L1_2 = _UPVALUE2_
  L2_2 = _UPVALUE3_
  L2_2 = L2_2.CONFIG_LOCK
  L1_2 = L1_2(L2_2)
  L3_2 = L1_2
  L2_2 = L1_2.lock
  L2_2(L3_2)
  L2_2 = pairs
  L3_2 = _UPVALUE1_
  L3_2 = L3_2._class
  L3_2 = L3_2.committed
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = _UPVALUE1_
    L8_2 = L7_2
    L7_2 = L7_2.rawcommit
    L9_2 = L5_2
    L7_2, L8_2 = L7_2(L8_2, L9_2)
    L0_2 = L7_2 or L0_2
    if L7_2 then
    end
    if not L7_2 then
      L9_2 = _UPVALUE4_
      L10_2 = "WARNING: uci commit error:"
      L11_2 = L8_2
      L9_2(L10_2, L11_2)
    end
  end
  if not L0_2 then
    L2_2 = _UPVALUE1_
    L2_2 = L2_2._class
    L2_2 = L2_2.dev_config_committed
    if L2_2 then
      L2_2 = uci_apply
      L2_2()
    end
    L2_2 = false
    return L2_2
  end
  L3_2 = L1_2
  L2_2 = L1_2.close
  L2_2(L3_2)
  L2_2 = require
  L3_2 = "luci.model.mode"
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.is_emmc_support
  L3_2 = L3_2()
  if L3_2 == true and L0_2 then
    L3_2 = _UPVALUE1_
    L3_2 = L3_2._class
    L3_2 = L3_2.has_emmc_config
    if L3_2 then
      L3_2 = _UPVALUE2_
      L4_2 = _UPVALUE3_
      L4_2 = L4_2.EMMC_CONFIG_LOCK
      L3_2 = L3_2(L4_2)
      L5_2 = L3_2
      L4_2 = L3_2.lock
      L4_2(L5_2)
      L4_2 = _UPVALUE5_
      if L4_2 then
        L5_2 = tostring
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L4_2 = L5_2
        L5_2 = _UPVALUE1_
        L6_2 = L5_2
        L5_2 = L5_2.set
        L7_2 = "emmc_sync"
        L8_2 = "config"
        L9_2 = "version"
        L10_2 = L4_2
        L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
        L0_2 = L5_2 or L0_2
        if L5_2 then
        end
        L5_2 = _UPVALUE1_
        L6_2 = L5_2
        L5_2 = L5_2.rawcommit
        L7_2 = "emmc_sync"
        L5_2 = L5_2(L6_2, L7_2)
        L0_2 = L5_2 or L0_2
        if L5_2 then
        end
      else
        L5_2 = _UPVALUE4_
        L6_2 = "WARNING: No config version"
        L5_2(L6_2)
      end
      if not L0_2 then
        L6_2 = L3_2
        L5_2 = L3_2.close
        L5_2(L6_2)
        L5_2 = false
        return L5_2
      end
      L5_2 = _UPVALUE6_
      L5_2 = L5_2.saveconfig
      L6_2 = "emmc-config"
      L5_2(L6_2)
      L6_2 = L3_2
      L5_2 = L3_2.close
      L5_2(L6_2)
      if L4_2 then
        L5_2 = _UPVALUE3_
        L5_2 = L5_2.sync_boost_emmc
        L5_2()
      end
    end
  end
  L3_2 = _UPVALUE4_
  L4_2 = "controller finalize end"
  L3_2(L4_2)
  return L0_2
end

finalize = L12_1

function L12_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = luci
  L1_2 = L1_2.http
  L1_2 = L1_2.status
  L2_2 = 403
  L3_2 = "Forbidden"
  L1_2(L2_2, L3_2)
  L1_2 = luci
  L1_2 = L1_2.http
  L1_2 = L1_2.prepare_content
  L2_2 = "text/plain"
  L1_2(L2_2)
end

function L13_1(A0_2)
  local L1_2, L2_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.prepare_content
  L2_2 = "text/plain"
  L1_2(L2_2)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.write_json
  L2_2 = A0_2
  L1_2(L2_2)
end

function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A1_2 then
    L2_2 = A1_2
    L3_2 = _UPVALUE0_
    L2_2, L3_2 = L2_2(L3_2)
    if not L2_2 then
      L4_2 = _UPVALUE1_
      L5_2 = {}
      L5_2.success = false
      L5_2.errorcode = L3_2
      L4_2(L5_2)
    end
  end
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.formvalue
  L2_2 = L2_2()
  L3_2 = _UPVALUE0_
  L3_2 = L3_2.isdecfail
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = _UPVALUE2_
    L3_2()
  else
    L3_2 = A0_2
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L4_2 = _UPVALUE1_
      L5_2 = L3_2
      L4_2(L5_2)
    end
  end
end

_index = L14_1

function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L3_2 = _UPVALUE0_
  L3_2 = L3_2 + 1
  _UPVALUE0_ = L3_2
  L3_2 = A1_2 or L3_2
  if A1_2 then
    L3_2 = A1_2.form
  end
  if A1_2 then
    L4_2 = A1_2.operation
    if L4_2 then
      goto lbl_13
    end
  end
  L4_2 = ""
  ::lbl_13::
  L5_2 = _UPVALUE1_
  if not L5_2 then
    L5_2 = A1_2.config_version
  end
  _UPVALUE1_ = L5_2
  L5_2 = true
  L6_2 = nil
  L7_2 = {}
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  
  function L11_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L2_3 = A0_3
    L3_3 = unpack
    L4_3 = A1_3
    L3_3, L4_3, L5_3, L6_3, L7_3, L8_3 = L3_3(L4_3)
    L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
    L5_3 = nil
    if L2_3 then
      L5_3 = L2_3
    else
      L6_3 = false
      _UPVALUE0_ = L6_3
      if L3_3 then
        L6_3 = _UPVALUE1_
        L7_3 = _UPVALUE1_
        L7_3 = #L7_3
        L7_3 = L7_3 + 1
        L6_3[L7_3] = L3_3
      end
      if L4_3 then
        L5_3 = L4_3
      end
    end
    L6_3 = L2_3
    L7_3 = type
    L8_3 = L5_3
    L7_3 = L7_3(L8_3)
    L7_3 = L5_3 or L7_3
    if L7_3 ~= "table" or not L5_3 then
      L7_3 = nil
    end
    return L6_3, L7_3
  end
  
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = A0_2
    L1_3 = L1_3[A0_3]
    L2_3 = nil
    if L1_3 then
      L3_3 = _UPVALUE1_
      L3_3 = L1_3[L3_3]
      L2_3 = L3_3 or L2_3
      if not L3_3 then
        L2_3 = L1_3[".super"]
      end
    end
    if L2_3 then
      L3_3 = L2_3.cb
      if L3_3 then
        L3_3 = L1_3[".args"]
        if L3_3 then
          L3_3 = {}
          L4_3 = _UPVALUE2_
          L5_3 = L1_3[".args"]
          L6_3 = L2_3.args
          L3_3[1] = L4_3
          L3_3[2] = L5_3
          L3_3[3] = L6_3
          if L3_3 then
            goto lbl_30
          end
        end
        L3_3 = {}
        L4_3 = _UPVALUE2_
        L5_3 = L2_3.args
        L3_3[1] = L4_3
        L3_3[2] = L5_3
        ::lbl_30::
        L4_3 = _UPVALUE3_
        L5_3 = L2_3.cb
        L6_3 = L3_3
        L4_3, L5_3 = L4_3(L5_3, L6_3)
        L6_3 = nil
        L7_3 = L2_3.others
        if L7_3 then
          L7_3 = _UPVALUE3_
          L8_3 = L2_3.others
          L9_3 = L3_3
          L7_3, L8_3 = L7_3(L8_3, L9_3)
          L6_3 = L8_3
          _ = L7_3
        end
        L7_3 = _UPVALUE4_
        if L7_3 then
          L7_3 = _UPVALUE4_
          L7_3 = L7_3.post_hook
          if L7_3 then
            L7_3 = _UPVALUE3_
            L8_3 = _UPVALUE4_
            L8_3 = L8_3.post_hook
            L9_3 = {}
            L10_3 = L4_3
            L11_3 = L2_3
            L9_3[1] = L10_3
            L9_3[2] = L11_3
            L7_3(L8_3, L9_3)
          end
        end
        L7_3 = _UPVALUE5_
        if not L7_3 then
          L7_3 = L2_3.own_response
        end
        _UPVALUE5_ = L7_3
        L7_3 = L5_3
        L8_3 = L6_3
        L9_3 = L2_3
        return L7_3, L8_3, L9_3
    end
    else
      L3_3 = false
      _UPVALUE6_ = L3_3
      L3_3 = _UPVALUE7_
      L4_3 = _UPVALUE7_
      L4_3 = #L4_3
      L4_3 = L4_3 + 1
      L3_3[L4_3] = "no such callback"
    end
  end
  
  function L13_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3, L6_3, L7_3, L8_3
    L4_3 = #A1_3
    if L4_3 == 0 then
      L4_3 = A2_3 or L4_3
      if A2_3 then
        L4_3 = A2_3.merge_prefix
      end
      if L4_3 then
        L5_3 = L0_1
        L5_3 = L5_3.update_prefix
        L6_3 = A0_3
        L7_3 = A1_3
        L8_3 = L4_3
        L5_3(L6_3, L7_3, L8_3)
      else
        L5_3 = L0_1
        L5_3 = L5_3.update
        L6_3 = A0_3
        L7_3 = A1_3
        L5_3(L6_3, L7_3)
      end
    else
      L4_3 = L0_1
      L4_3 = L4_3.update
      L5_3 = A0_3
      L6_3 = {}
      L6_3[A3_3] = A1_3
      L4_3(L5_3, L6_3)
    end
  end
  
  L14_2 = type
  L15_2 = L3_2
  L14_2 = L14_2(L15_2)
  if L14_2 ~= "table" then
    L14_2 = L3_2
    L15_2 = L12_2
    L16_2 = L14_2
    L15_2, L16_2 = L15_2(L16_2)
    L9_2 = L16_2
    L8_2 = L15_2
  else
    L14_2 = ipairs
    L15_2 = L3_2
    L14_2, L15_2, L16_2 = L14_2(L15_2)
    for L17_2, L18_2 in L14_2, L15_2, L16_2 do
      L19_2 = L12_2
      L20_2 = L18_2
      L19_2, L20_2, L21_2 = L19_2(L20_2)
      if L19_2 then
        if not L8_2 then
          L22_2 = {}
          L8_2 = L22_2
        end
        L22_2 = L13_2
        L23_2 = L8_2
        L24_2 = L19_2
        L25_2 = L21_2
        L26_2 = L18_2
        L22_2(L23_2, L24_2, L25_2, L26_2)
      end
      if L20_2 then
        if not L9_2 then
          L22_2 = {}
          L9_2 = L22_2
        end
        L22_2 = L13_2
        L23_2 = L9_2
        L24_2 = L20_2
        L25_2 = L21_2
        L26_2 = L18_2
        L22_2(L23_2, L24_2, L25_2, L26_2)
      end
    end
  end
  L14_2 = _UPVALUE0_
  L14_2 = L14_2 - 1
  _UPVALUE0_ = L14_2
  if L5_2 then
    L14_2 = finalize
    L14_2 = L14_2()
    if not L14_2 then
      L5_2 = false
      L14_2 = #L7_2
      L14_2 = L14_2 + 1
      L7_2[L14_2] = "finalize"
    end
  end
  L14_2 = #L7_2
  if 0 < L14_2 then
    L14_2 = table
    L14_2 = L14_2.concat
    L15_2 = L7_2
    L16_2 = "&"
    L14_2 = L14_2(L15_2, L16_2)
    L10_2 = L14_2
  end
  if L6_2 and L5_2 then
    L14_2 = nil
    return L14_2
  else
    L14_2 = {}
    L14_2.success = L5_2
    L14_2.data = L8_2
    L14_2.others = L9_2
    L14_2.errorcode = L10_2
    return L14_2
  end
end

dispatch = L14_1

function L14_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "table" then
    L2_2 = {}
    L2_2.msg = A0_2
    L3_2 = A1_2 or L3_2
    if not A1_2 then
      L3_2 = 1
    end
    L2_2.error_code = L3_2
    return L2_2
  else
    L2_2 = {}
    L2_2.result = A0_2
    L3_2 = A1_2 or L3_2
    if not A1_2 then
      L3_2 = 1
    end
    L2_2.error_code = L3_2
    return L2_2
  end
end

throw_error = L14_1

function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = {}
  L3_2.msg = A0_2
  L3_2.result = A2_2
  L4_2 = A1_2 or L4_2
  if not A1_2 then
    L4_2 = 1
  end
  L3_2.error_code = L4_2
  return L3_2
end

throw_error_with_result = L14_1

function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = _UPVALUE0_
  L2_2 = L2_2 + 1
  _UPVALUE0_ = L2_2
  if not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = _UPVALUE1_
  if not L2_2 then
    L2_2 = A1_2.config_version
  end
  _UPVALUE1_ = L2_2
  L2_2 = A1_2.form
  L2_2 = A0_2[L2_2]
  if L2_2 then
    L2_2 = A1_2.form
    A0_2 = A0_2[L2_2]
  end
  L2_2 = A1_2.operation
  if not L2_2 then
    L2_2 = ".anonymous"
  end
  L3_2 = A0_2[L2_2]
  if L3_2 then
    L4_2 = L3_2.cb
    if L4_2 then
      L4_2 = L3_2.cb
      L5_2 = A1_2.params
      if not L5_2 then
        L5_2 = {}
      end
      L4_2, L5_2, L6_2 = L4_2(L5_2)
      res = L6_2
      msg = L5_2
      result = L4_2
      L4_2 = _UPVALUE0_
      L4_2 = L4_2 - 1
      _UPVALUE0_ = L4_2
      L4_2 = result
      if L4_2 then
        L4_2 = type
        L5_2 = result
        L4_2 = L4_2(L5_2)
        if L4_2 ~= "number" then
          L4_2 = finalize
          L4_2 = L4_2()
          if not L4_2 then
            L4_2 = throw_error
            L5_2 = "finalize"
            return L4_2(L5_2)
          end
          L4_2 = type
          L5_2 = result
          L4_2 = L4_2(L5_2)
          if L4_2 ~= "string" then
            L4_2 = type
            L5_2 = result
            L4_2 = L4_2(L5_2)
            if L4_2 ~= "function" then
              goto lbl_70
            end
          end
          L4_2 = result
          L5_2 = msg
          do return L4_2, L5_2 end
          ::lbl_70::
          L4_2 = type
          L5_2 = result
          L4_2 = L4_2(L5_2)
          if L4_2 == "table" then
            L4_2 = result
            if L4_2 then
              goto lbl_79
            end
          end
          L4_2 = nil
          ::lbl_79::
          result = L4_2
          L4_2 = {}
          L4_2.error_code = 0
          L5_2 = result
          L4_2.result = L5_2
          return L4_2
      end
      else
        L4_2 = res
        if L4_2 then
          L4_2 = type
          L5_2 = res
          L4_2 = L4_2(L5_2)
          if L4_2 == "table" then
            L4_2 = type
            L5_2 = msg
            L4_2 = L4_2(L5_2)
            if L4_2 ~= "table" then
              L4_2 = throw_error_with_result
              L5_2 = msg
              L6_2 = result
              if not L6_2 then
                L6_2 = nil
              end
              L7_2 = res
              return L4_2(L5_2, L6_2, L7_2)
          end
        end
        else
          L4_2 = throw_error
          L5_2 = msg
          L6_2 = result
          if not L6_2 then
            L6_2 = nil
          end
          return L4_2(L5_2, L6_2)
        end
      end
  end
  else
    L4_2 = throw_error
    L5_2 = "no such callback"
    return L4_2(L5_2)
  end
end

simple_dispatch = L14_1

function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 == "function" then
    L2_2 = {}
    L3_2 = A1_2
    L2_2[1] = L3_2
    A1_2 = L2_2
  end
  L2_2 = A1_2
  A1_2 = A1_2[1]
  L3_2 = A1_2
  L4_2 = A0_2
  L5_2 = unpack
  L6_2 = L2_2
  L7_2 = 2
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if L3_2 then
    L3_2 = true
    return L3_2
  else
    L3_2 = false
    return L3_2
  end
end

function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = _UPVALUE0_
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if not L7_2 then
      L7_2 = false
      return L7_2
    end
  end
  L2_2 = true
  return L2_2
end

function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "function" then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= "table" then
      goto lbl_17
    end
  end
  L2_2 = _UPVALUE0_
  L3_2 = A0_2
  L4_2 = A1_2
  do return L2_2(L3_2, L4_2) end
  goto lbl_18
  ::lbl_17::
  do return A1_2 end
  ::lbl_18::
end

check_canbe_empty = L16_1

function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "function" then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= "table" then
      goto lbl_17
    end
  end
  L2_2 = _UPVALUE0_
  L3_2 = A0_2
  L4_2 = A1_2
  do return L2_2(L3_2, L4_2) end
  goto lbl_23
  ::lbl_17::
  if A1_2 == nil then
    L2_2 = true
    return L2_2
  else
    return A1_2
  end
  ::lbl_23::
end

check_canbe_absent = L16_1

function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if not A1_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = L6_2.field
    if L7_2 then
      L7_2 = type
      L8_2 = L6_2.field
      L7_2 = L7_2(L8_2)
      if L7_2 == "table" then
        L7_2 = L6_2.field
        if L7_2 then
          goto lbl_23
        end
      end
      L7_2 = {}
      L8_2 = L6_2.field
      L7_2[1] = L8_2
      ::lbl_23::
      L8_2 = ipairs
      L9_2 = L7_2
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      for L11_2, L12_2 in L8_2, L9_2, L10_2 do
        L13_2 = A0_2[L12_2]
        if L13_2 ~= nil then
          L13_2 = type
          L14_2 = A0_2[L12_2]
          L13_2 = L13_2(L14_2)
          if L13_2 == "string" then
            L13_2 = A0_2[L12_2]
            L13_2 = #L13_2
            if not (0 < L13_2) then
              goto lbl_48
            end
          end
          L13_2 = _UPVALUE0_
          L14_2 = A0_2[L12_2]
          L15_2 = L6_2.check
          L13_2 = L13_2(L14_2, L15_2)
          if not L13_2 then
            L13_2 = false
            return L13_2
          end
          goto lbl_65
          ::lbl_48::
          L13_2 = check_canbe_empty
          L14_2 = A0_2
          L15_2 = L6_2.canbe_empty
          L13_2 = L13_2(L14_2, L15_2)
          if not L13_2 then
          end
          L13_2 = false
          return L13_2
        else
          L13_2 = check_canbe_absent
          L14_2 = A0_2
          L15_2 = L6_2.canbe_absent
          L13_2 = L13_2(L14_2, L15_2)
          if not L13_2 then
            L13_2 = false
            return L13_2
          end
        end
        ::lbl_65::
      end
    else
      L7_2 = _UPVALUE0_
      L8_2 = A0_2
      L9_2 = L6_2.check
      L7_2 = L7_2(L8_2, L9_2)
      if not L7_2 then
        L7_2 = false
        return L7_2
      end
    end
  end
  L2_2 = true
  return L2_2
end

check = L16_1
