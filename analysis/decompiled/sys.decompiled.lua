local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = require
L1_1 = "io"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "os"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "table"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "nixio"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "nixio.fs"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "luci.model.uci"
L5_1 = L5_1(L6_1)
L6_1 = {}
L7_1 = require
L8_1 = "luci.util"
L7_1 = L7_1(L8_1)
L6_1.util = L7_1
L7_1 = require
L8_1 = "luci.ip"
L7_1 = L7_1(L8_1)
L6_1.ip = L7_1
L7_1 = tonumber
L8_1 = ipairs
L9_1 = pairs
L10_1 = pcall
L11_1 = type
L12_1 = next
L13_1 = setmetatable
L14_1 = require
L15_1 = select
L16_1 = module
L17_1 = "luci.sys"
L16_1(L17_1)

function L16_1(...)
  local L1_2, L2_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.execute
  L2_2 = ...
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2 / 256
  return L1_2
end

call = L16_1

function L16_1(...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.fork
  L1_2 = L1_2()
  if L1_2 == 0 then
    L2_2 = _UPVALUE0_
    L2_2 = L2_2.chdir
    L3_2 = "/"
    L2_2(L3_2)
    L2_2 = _UPVALUE0_
    L2_2 = L2_2.chdir
    L3_2 = "/"
    L2_2(L3_2)
    L2_2 = _UPVALUE0_
    L2_2 = L2_2.open
    L3_2 = "/dev/null"
    L4_2 = "w+"
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L3_2 = _UPVALUE0_
      L3_2 = L3_2.dup
      L4_2 = L2_2
      L5_2 = _UPVALUE0_
      L5_2 = L5_2.stderr
      L3_2(L4_2, L5_2)
      L3_2 = _UPVALUE0_
      L3_2 = L3_2.dup
      L4_2 = L2_2
      L5_2 = _UPVALUE0_
      L5_2 = L5_2.stdout
      L3_2(L4_2, L5_2)
      L3_2 = _UPVALUE0_
      L3_2 = L3_2.dup
      L4_2 = L2_2
      L5_2 = _UPVALUE0_
      L5_2 = L5_2.stdin
      L3_2(L4_2, L5_2)
      L4_2 = L2_2
      L3_2 = L2_2.fileno
      L3_2 = L3_2(L4_2)
      if 2 < L3_2 then
        L4_2 = L2_2
        L3_2 = L2_2.close
        L3_2(L4_2)
      end
    end
    L3_2 = _UPVALUE0_
    L3_2 = L3_2.exec
    L4_2 = "/bin/sh"
    L5_2 = "-c"
    L6_2 = ...
    return L3_2(L4_2, L5_2, L6_2)
  else
    return
  end
end

fork_exec = L16_1

function L16_1(...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.fork
  L1_2 = L1_2()
  if L1_2 == 0 then
    L2_2 = _UPVALUE0_
    L2_2 = L2_2.open
    L3_2 = "/dev/null"
    L4_2 = "w+"
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L3_2 = _UPVALUE0_
      L3_2 = L3_2.dup
      L4_2 = L2_2
      L5_2 = _UPVALUE0_
      L5_2 = L5_2.stderr
      L3_2(L4_2, L5_2)
      L3_2 = _UPVALUE0_
      L3_2 = L3_2.dup
      L4_2 = L2_2
      L5_2 = _UPVALUE0_
      L5_2 = L5_2.stdout
      L3_2(L4_2, L5_2)
      L3_2 = _UPVALUE0_
      L3_2 = L3_2.dup
      L4_2 = L2_2
      L5_2 = _UPVALUE0_
      L5_2 = L5_2.stdin
      L3_2(L4_2, L5_2)
      L4_2 = L2_2
      L3_2 = L2_2.fileno
      L3_2 = L3_2(L4_2)
      if 2 < L3_2 then
        L4_2 = L2_2
        L3_2 = L2_2.close
        L3_2(L4_2)
      end
    end
    L3_2 = _UPVALUE0_
    L3_2 = L3_2.exec
    L4_2 = "/bin/sh"
    L5_2 = "-c"
    L6_2 = ...
    return L3_2(L4_2, L5_2, L6_2)
  elseif 0 < L1_2 then
    L2_2 = _UPVALUE0_
    L2_2 = L2_2.waitpid
    L3_2 = L1_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    if L3_2 == "exited" then
      return L4_2
    else
      L5_2 = nil
      return L5_2
    end
  end
end

fork_call = L16_1

function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.pipe
  L2_2, L3_2 = L2_2()
  L4_2 = nil
  L5_2 = nil
  if A1_2 then
    L6_2 = _UPVALUE0_
    L6_2 = L6_2.pipe
    L6_2, L7_2 = L6_2()
    L5_2 = L7_2
    L4_2 = L6_2
  end
  L6_2 = _UPVALUE0_
  L6_2 = L6_2.fork
  L6_2 = L6_2()
  if 0 < L6_2 then
    if A1_2 then
      L8_2 = L5_2
      L7_2 = L5_2.write
      L9_2 = A1_2
      L7_2(L8_2, L9_2)
      L8_2 = L4_2
      L7_2 = L4_2.close
      L7_2(L8_2)
      L8_2 = L5_2
      L7_2 = L5_2.close
      L7_2(L8_2)
    end
    L8_2 = L3_2
    L7_2 = L3_2.close
    L7_2(L8_2)
    L7_2 = nil
    
    function L8_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3
      if not A0_3 then
        A0_3 = 2048
      end
      L1_3 = _UPVALUE0_
      L2_3 = L1_3
      L1_3 = L1_3.read
      L3_3 = A0_3
      L1_3 = L1_3(L2_3, L3_3)
      L2_3 = _UPVALUE1_
      L2_3 = L2_3.waitpid
      L3_3 = _UPVALUE2_
      L4_3 = "nohang"
      L2_3, L3_3 = L2_3(L3_3, L4_3)
      L4_3 = _UPVALUE3_
      if not L4_3 and L2_3 and L3_3 == "exited" then
        L4_3 = true
        _UPVALUE3_ = L4_3
      end
      if L1_3 then
        L4_3 = #L1_3
        if 0 < L4_3 then
          return L1_3
      end
      else
        L4_3 = _UPVALUE3_
        if L4_3 then
          L4_3 = _UPVALUE0_
          L5_3 = L4_3
          L4_3 = L4_3.close
          L4_3(L5_3)
          L4_3 = nil
          return L4_3
        end
      end
    end
    
    return L8_2
  elseif L6_2 == 0 then
    L8_2 = L2_2
    L7_2 = L2_2.close
    L7_2(L8_2)
    if A1_2 then
      L8_2 = L5_2
      L7_2 = L5_2.close
      L7_2(L8_2)
    end
    L8_2 = L3_2
    L7_2 = L3_2.fileno
    L7_2 = L7_2(L8_2)
    L8_2 = _UPVALUE0_
    L8_2 = L8_2.stdout
    L9_2 = L8_2
    L8_2 = L8_2.fileno
    L8_2 = L8_2(L9_2)
    if L7_2 ~= L8_2 then
      L7_2 = _UPVALUE0_
      L7_2 = L7_2.dup
      L8_2 = L3_2
      L9_2 = _UPVALUE0_
      L9_2 = L9_2.stdout
      L7_2(L8_2, L9_2)
      L8_2 = L3_2
      L7_2 = L3_2.close
      L7_2(L8_2)
    end
    if A1_2 then
      L8_2 = L4_2
      L7_2 = L4_2.fileno
      L7_2 = L7_2(L8_2)
      L8_2 = _UPVALUE0_
      L8_2 = L8_2.stdin
      L9_2 = L8_2
      L8_2 = L8_2.fileno
      L8_2 = L8_2(L9_2)
      if L7_2 ~= L8_2 then
        L7_2 = _UPVALUE0_
        L7_2 = L7_2.dup
        L8_2 = L4_2
        L9_2 = _UPVALUE0_
        L9_2 = L9_2.stdin
        L7_2(L8_2, L9_2)
        L8_2 = L4_2
        L7_2 = L4_2.close
        L7_2(L8_2)
      end
    end
    L7_2 = _UPVALUE0_
    L7_2 = L7_2.exec
    L8_2 = "/bin/sh"
    L9_2 = "-c"
    L10_2 = A0_2
    L7_2(L8_2, L9_2, L10_2)
  end
end

ltn12_popen = L16_1
L16_1 = L6_1.util
L16_1 = L16_1.exec
exec = L16_1

function L16_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = {}
  L1_2 = {}
  L2_2 = "fs"
  L3_2 = "blocks"
  L4_2 = "used"
  L5_2 = "available"
  L6_2 = "percent"
  L7_2 = "mountpoint"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.util
  L2_2 = L2_2.execi
  L3_2 = "df"
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  else
    L3_2 = L2_2
    L3_2()
  end
  L3_2 = L2_2
  L4_2 = nil
  L5_2 = nil
  for L6_2 in L3_2, L4_2, L5_2 do
    L7_2 = {}
    L8_2 = 1
    L10_2 = L6_2
    L9_2 = L6_2.gmatch
    L11_2 = "[^%s]+"
    L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
    for L12_2 in L9_2, L10_2, L11_2 do
      L13_2 = L1_2[L8_2]
      L7_2[L13_2] = L12_2
      L8_2 = L8_2 + 1
    end
    L9_2 = L1_2[1]
    L9_2 = L7_2[L9_2]
    if L9_2 then
      L9_2 = L1_2[2]
      L9_2 = L7_2[L9_2]
      if not L9_2 then
        L8_2 = 2
        L9_2 = L2_2
        L9_2 = L9_2()
        L6_2 = L9_2
        L10_2 = L6_2
        L9_2 = L6_2.gmatch
        L11_2 = "[^%s]+"
        L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
        for L12_2 in L9_2, L10_2, L11_2 do
          L13_2 = L1_2[L8_2]
          L7_2[L13_2] = L12_2
          L8_2 = L8_2 + 1
        end
      end
      L9_2 = _UPVALUE1_
      L9_2 = L9_2.insert
      L10_2 = L0_2
      L11_2 = L7_2
      L9_2(L10_2, L11_2)
    end
  end
  return L0_2
end

mounts = L16_1
L16_1 = L3_1.getenv
getenv = L16_1

function L16_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == "string" then
    L1_2 = #A0_2
    if 0 < L1_2 then
      L1_2 = _UPVALUE1_
      L1_2 = L1_2.writefile
      L2_2 = "/proc/sys/kernel/hostname"
      L3_2 = A0_2
      L1_2(L2_2, L3_2)
      return A0_2
  end
  else
    L1_2 = _UPVALUE2_
    L1_2 = L1_2.uname
    L1_2 = L1_2()
    L1_2 = L1_2.nodename
    return L1_2
  end
end

hostname = L16_1

function L16_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A2_2 then
    if A1_2 then
      L3_2 = L0_1
      L3_2 = L3_2.popen
      if L3_2 then
        goto lbl_12
      end
    end
    L3_2 = _UPVALUE1_
    L3_2 = L3_2.util
    L3_2 = L3_2.exec
    ::lbl_12::
    L4_2 = L3_2
    L5_2 = "wget -qO- '"
    L7_2 = A0_2
    L6_2 = A0_2.gsub
    L8_2 = "'"
    L9_2 = ""
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = "'"
    L5_2 = L5_2 .. L6_2 .. L7_2
    return L4_2(L5_2)
  else
    L3_2 = _UPVALUE2_
    L3_2 = L3_2.execute
    L4_2 = {}
    L6_2 = A2_2
    L5_2 = A2_2.gsub
    L7_2 = "'"
    L8_2 = ""
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L7_2 = A0_2
    L6_2 = A0_2.gsub
    L8_2 = "'"
    L9_2 = ""
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2, L8_2, L9_2)
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L4_2[4] = L8_2
    L4_2[5] = L9_2
    L4_2 = "wget -qO '%s' '%s'" % L4_2
    return L3_2(L4_2)
  end
end

httpget = L16_1

function L16_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.sysinfo
  L0_2 = L0_2()
  L1_2 = L0_2.loads
  L1_2 = L1_2[1]
  L2_2 = L0_2.loads
  L2_2 = L2_2[2]
  L3_2 = L0_2.loads
  L3_2 = L3_2[3]
  return L1_2, L2_2, L3_2
end

loadavg = L16_1

function L16_1()
  local L0_2, L1_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.execute
  L1_2 = "reboot >/dev/null 2>&1"
  return L0_2(L1_2)
end

reboot = L16_1

function L16_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.readfile
  L1_2 = "/proc/cpuinfo"
  L0_2 = L0_2(L1_2)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.readfile
  L2_2 = "/proc/meminfo"
  L1_2 = L1_2(L2_2)
  L2_2 = _UPVALUE1_
  L4_2 = L1_2
  L3_2 = L1_2.match
  L5_2 = "MemTotal:%s*(%d+)"
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L3_2 = _UPVALUE1_
  L5_2 = L1_2
  L4_2 = L1_2.match
  L6_2 = [[

Cached:%s*(%d+)]]
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L4_2 = _UPVALUE1_
  L6_2 = L1_2
  L5_2 = L1_2.match
  L7_2 = "MemFree:%s*(%d+)"
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L5_2(L6_2, L7_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L5_2 = _UPVALUE1_
  L7_2 = L1_2
  L6_2 = L1_2.match
  L8_2 = "Buffers:%s*(%d+)"
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L6_2(L7_2, L8_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L6_2 = _UPVALUE1_
  L8_2 = L0_2
  L7_2 = L0_2.match
  L9_2 = [[
[Bb]ogo[Mm][Ii][Pp][Ss].-: ([^
]+)]]
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L7_2(L8_2, L9_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  if not L6_2 then
    L6_2 = 0
  end
  L7_2 = _UPVALUE1_
  L9_2 = L1_2
  L8_2 = L1_2.match
  L10_2 = "SwapTotal:%s*(%d+)"
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L8_2(L9_2, L10_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L8_2 = _UPVALUE1_
  L10_2 = L1_2
  L9_2 = L1_2.match
  L11_2 = "SwapCached:%s*(%d+)"
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L9_2(L10_2, L11_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L9_2 = _UPVALUE1_
  L11_2 = L1_2
  L10_2 = L1_2.match
  L12_2 = "SwapFree:%s*(%d+)"
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L10_2(L11_2, L12_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L11_2 = L0_2
  L10_2 = L0_2.match
  L12_2 = [[
system type	+: ([^
]+)]]
  L10_2 = L10_2(L11_2, L12_2)
  if not L10_2 then
    L11_2 = L0_2
    L10_2 = L0_2.match
    L12_2 = [[
Processor	+: ([^
]+)]]
    L10_2 = L10_2(L11_2, L12_2)
    if not L10_2 then
      L11_2 = L0_2
      L10_2 = L0_2.match
      L12_2 = [[
model name	+: ([^
]+)]]
      L10_2 = L10_2(L11_2, L12_2)
    end
  end
  L11_2 = _UPVALUE2_
  L11_2 = L11_2.util
  L11_2 = L11_2.pcdata
  L12_2 = _UPVALUE0_
  L12_2 = L12_2.readfile
  L13_2 = "/tmp/sysinfo/model"
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L12_2(L13_2)
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  if not L11_2 then
    L12_2 = L0_2
    L11_2 = L0_2.match
    L13_2 = [[
machine	+: ([^
]+)]]
    L11_2 = L11_2(L12_2, L13_2)
    if not L11_2 then
      L12_2 = L0_2
      L11_2 = L0_2.match
      L13_2 = [[
Hardware	+: ([^
]+)]]
      L11_2 = L11_2(L12_2, L13_2)
      if not L11_2 then
        L11_2 = _UPVALUE2_
        L11_2 = L11_2.util
        L11_2 = L11_2.pcdata
        L12_2 = _UPVALUE0_
        L12_2 = L12_2.readfile
        L13_2 = "/proc/diag/model"
        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L12_2(L13_2)
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        if not L11_2 then
          L11_2 = _UPVALUE3_
          L11_2 = L11_2.uname
          L11_2 = L11_2()
          L11_2 = L11_2.machine
          if not L11_2 then
            L11_2 = L10_2
          end
        end
      end
    end
  end
  L12_2 = L10_2
  L13_2 = L11_2
  L14_2 = L2_2
  L15_2 = L3_2
  L16_2 = L5_2
  L17_2 = L4_2
  L18_2 = L6_2
  L19_2 = L7_2
  L20_2 = L8_2
  L21_2 = L9_2
  return L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
end

sysinfo = L16_1

function L16_1()
  local L0_2, L1_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.util
  L0_2 = L0_2.exec
  L1_2 = "logread"
  return L0_2(L1_2)
end

syslog = L16_1

function L16_1()
  local L0_2, L1_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.util
  L0_2 = L0_2.exec
  L1_2 = "dmesg"
  return L0_2(L1_2)
end

dmesg = L16_1

function L16_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.readfile
  L2_2 = "/dev/urandom"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L1_2 or L2_2
  if L1_2 then
    L2_2 = _UPVALUE1_
    L2_2 = L2_2.bin
    L2_2 = L2_2.hexlify
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
  end
  return L2_2
end

uniqueid = L16_1

function L16_1()
  local L0_2, L1_2
  L0_2 = _UPVALUE0_
  L0_2 = L0_2.sysinfo
  L0_2 = L0_2()
  L0_2 = L0_2.uptime
  return L0_2
end

uptime = L16_1
L16_1 = {}
net = L16_1
L16_1 = net

function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = _UPVALUE0_
  L5_2 = L5_2.access
  L6_2 = "/proc/net/arp"
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = L0_1
    L5_2 = L5_2.lines
    L6_2 = "/proc/net/arp"
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    for L8_2 in L5_2, L6_2, L7_2 do
      L9_2 = {}
      L10_2 = L4_2
      L11_2 = L8_2
      L10_2 = L8_2.gmatch
      L12_2 = "%S+"
      L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
      for L13_2 in L10_2, L11_2, L12_2 do
        L14_2 = #L9_2
        L14_2 = L14_2 + 1
        L9_2[L14_2] = L13_2
      end
      L10_2 = L9_2[1]
      if L10_2 ~= "IP" then
        L10_2 = {}
        L11_2 = L9_2[1]
        L10_2["IP address"] = L11_2
        L11_2 = L9_2[2]
        L10_2["HW type"] = L11_2
        L11_2 = L9_2[3]
        L10_2.Flags = L11_2
        L11_2 = L9_2[4]
        L10_2["HW address"] = L11_2
        L11_2 = L9_2[5]
        L10_2.Mask = L11_2
        L11_2 = L9_2[6]
        L10_2.Device = L11_2
        if A0_2 then
          L11_2 = A0_2
          L12_2 = L10_2
          L11_2(L12_2)
        else
          if not L1_2 then
            L11_2 = {}
            L1_2 = L11_2
          end
          L11_2 = #L1_2
          L11_2 = L11_2 + 1
          L1_2[L11_2] = L10_2
        end
      end
    end
  end
  return L1_2
end

L16_1.arptable = L17_1

function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L8_2 = _UPVALUE0_
  L8_2 = L8_2.cursor
  L8_2 = L8_2()
  L9_2 = {}
  L10_2 = {}
  
  function L11_2(A0_3, ...)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = _UPVALUE0_
    L3_3 = A0_3
    L4_3, L5_3, L6_3 = ...
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
    if L2_3 then
      L3_3 = _UPVALUE1_
      L3_3 = L3_3[L2_3]
      if not L3_3 then
        L3_3 = _UPVALUE1_
        L4_3 = {}
        L3_3[L2_3] = L4_3
      end
      L3_3 = _UPVALUE1_
      L3_3 = L3_3[L2_3]
      L4_3 = _UPVALUE0_
      L5_3 = 1
      L6_3 = ...
      L4_3 = L4_3(L5_3, L6_3)
      if not L4_3 then
        L4_3 = _UPVALUE1_
        L4_3 = L4_3[L2_3]
        L4_3 = L4_3[1]
      end
      L3_3[1] = L4_3
      L3_3 = _UPVALUE1_
      L3_3 = L3_3[L2_3]
      L4_3 = _UPVALUE0_
      L5_3 = 2
      L6_3 = ...
      L4_3 = L4_3(L5_3, L6_3)
      if not L4_3 then
        L4_3 = _UPVALUE1_
        L4_3 = L4_3[L2_3]
        L4_3 = L4_3[2]
      end
      L3_3[2] = L4_3
      L3_3 = _UPVALUE1_
      L3_3 = L3_3[L2_3]
      L4_3 = _UPVALUE0_
      L5_3 = 3
      L6_3 = ...
      L4_3 = L4_3(L5_3, L6_3)
      if not L4_3 then
        L4_3 = _UPVALUE1_
        L4_3 = L4_3[L2_3]
        L4_3 = L4_3[3]
      end
      L3_3[3] = L4_3
      L3_3 = _UPVALUE1_
      L3_3 = L3_3[L2_3]
      L4_3 = _UPVALUE0_
      L5_3 = 4
      L6_3 = ...
      L4_3 = L4_3(L5_3, L6_3)
      if not L4_3 then
        L4_3 = _UPVALUE1_
        L4_3 = L4_3[L2_3]
        L4_3 = L4_3[4]
      end
      L3_3[4] = L4_3
    end
  end
  
  L12_2 = _UPVALUE2_
  L12_2 = L12_2.access
  L13_2 = "/proc/net/arp"
  L12_2 = L12_2(L13_2)
  if L12_2 then
    L12_2 = L0_1
    L12_2 = L12_2.lines
    L13_2 = "/proc/net/arp"
    L12_2, L13_2, L14_2 = L12_2(L13_2)
    for L15_2 in L12_2, L13_2, L14_2 do
      L17_2 = L15_2
      L16_2 = L15_2.match
      L18_2 = "^([%d%.]+)%s+%S+%s+%S+%s+([a-fA-F0-9:]+)%s+"
      L16_2, L17_2 = L16_2(L17_2, L18_2)
      L5_2 = L17_2
      L6_2 = L16_2
      if L6_2 and L5_2 then
        L16_2 = L11_2
        L17_2 = A0_2
        L19_2 = L5_2
        L18_2 = L5_2.upper
        L18_2 = L18_2(L19_2)
        L19_2 = L6_2
        L20_2 = nil
        L21_2 = nil
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
      end
    end
  end
  L12_2 = _UPVALUE2_
  L12_2 = L12_2.access
  L13_2 = "/etc/ethers"
  L12_2 = L12_2(L13_2)
  if L12_2 then
    L12_2 = L0_1
    L12_2 = L12_2.lines
    L13_2 = "/etc/ethers"
    L12_2, L13_2, L14_2 = L12_2(L13_2)
    for L15_2 in L12_2, L13_2, L14_2 do
      L17_2 = L15_2
      L16_2 = L15_2.match
      L18_2 = "^([a-f0-9]%S+) (%S+)"
      L16_2, L17_2 = L16_2(L17_2, L18_2)
      L6_2 = L17_2
      L5_2 = L16_2
      if L5_2 and L6_2 then
        L16_2 = L11_2
        L17_2 = A0_2
        L19_2 = L5_2
        L18_2 = L5_2.upper
        L18_2 = L18_2(L19_2)
        L19_2 = L6_2
        L20_2 = nil
        L21_2 = nil
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
      end
    end
  end
  L12_2 = _UPVALUE2_
  L12_2 = L12_2.access
  L13_2 = "/var/dhcp.leases"
  L12_2 = L12_2(L13_2)
  if L12_2 then
    L12_2 = L0_1
    L12_2 = L12_2.lines
    L13_2 = "/var/dhcp.leases"
    L12_2, L13_2, L14_2 = L12_2(L13_2)
    for L15_2 in L12_2, L13_2, L14_2 do
      L17_2 = L15_2
      L16_2 = L15_2.match
      L18_2 = "^%d+ (%S+) (%S+) (%S+)"
      L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
      L7_2 = L18_2
      L6_2 = L17_2
      L5_2 = L16_2
      if L5_2 and L6_2 then
        L16_2 = L11_2
        L17_2 = A0_2
        L19_2 = L5_2
        L18_2 = L5_2.upper
        L18_2 = L18_2(L19_2)
        L19_2 = L6_2
        L20_2 = nil
        L21_2 = L7_2 ~= "*" and L21_2
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
      end
    end
  end
  L13_2 = L8_2
  L12_2 = L8_2.foreach
  L14_2 = "dhcp"
  L15_2 = "host"
  
  function L16_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.util
    L1_3 = L1_3.imatch
    L2_3 = A0_3.mac
    L1_3, L2_3, L3_3 = L1_3(L2_3)
    for L4_3 in L1_3, L2_3, L3_3 do
      L5_3 = _UPVALUE1_
      L6_3 = A0_2
      L8_3 = L4_3
      L7_3 = L4_3.upper
      L7_3 = L7_3(L8_3)
      L8_3 = A0_3.ip
      L9_3 = nil
      L10_3 = A0_3.name
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)
    end
  end
  
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = _UPVALUE5_
  L13_2 = _UPVALUE6_
  L13_2 = L13_2.getifaddrs
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L13_2()
  L12_2, L13_2, L14_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  for L15_2, L16_2 in L12_2, L13_2, L14_2 do
    L17_2 = L16_2.name
    if L17_2 ~= "lo" then
      L17_2 = L16_2.name
      L18_2 = L16_2.name
      L18_2 = L9_2[L18_2]
      if not L18_2 then
        L18_2 = {}
      end
      L9_2[L17_2] = L18_2
      L17_2 = L16_2.family
      if L17_2 == "packet" then
        L17_2 = L16_2.addr
        if L17_2 then
          L17_2 = L16_2.addr
          L17_2 = #L17_2
          if L17_2 == 17 then
            L17_2 = L16_2.name
            L17_2 = L9_2[L17_2]
            L18_2 = L16_2.addr
            L19_2 = L18_2
            L18_2 = L18_2.upper
            L18_2 = L18_2(L19_2)
            L17_2[1] = L18_2
        end
      end
      else
        L17_2 = L16_2.family
        if L17_2 == "inet" then
          L17_2 = L16_2.name
          L17_2 = L9_2[L17_2]
          L18_2 = L16_2.addr
          L17_2[2] = L18_2
        else
          L17_2 = L16_2.family
          if L17_2 == "inet6" then
            L17_2 = L16_2.name
            L17_2 = L9_2[L17_2]
            L18_2 = L16_2.addr
            L17_2[3] = L18_2
          end
        end
      end
    end
  end
  L12_2 = _UPVALUE7_
  L13_2 = L9_2
  L12_2, L13_2, L14_2 = L12_2(L13_2)
  for L15_2, L16_2 in L12_2, L13_2, L14_2 do
    L17_2 = L16_2[A0_2]
    if L17_2 then
      L17_2 = L16_2[2]
      if not L17_2 then
        L17_2 = L16_2[3]
        if not L17_2 then
          goto lbl_181
        end
      end
      L17_2 = L11_2
      L18_2 = A0_2
      L19_2 = L16_2[1]
      L20_2 = L16_2[2]
      L21_2 = L16_2[3]
      L22_2 = L16_2[4]
      L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
    end
    ::lbl_181::
  end
  L12_2 = _UPVALUE4_
  L12_2 = L12_2.util
  L12_2 = L12_2.kspairs
  L13_2 = L10_2
  L12_2, L13_2, L14_2 = L12_2(L13_2)
  for L15_2, L16_2 in L12_2, L13_2, L14_2 do
    L17_2 = A1_2
    L18_2 = L16_2[1]
    L19_2 = L16_2[2]
    L20_2 = L16_2[3]
    L21_2 = L16_2[4]
    L17_2(L18_2, L19_2, L20_2, L21_2)
  end
end

L17_1 = net

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = _UPVALUE0_
    L2_2 = 1
    
    function L3_2(A0_3, A1_3, A2_3, A3_3)
      local L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
      if not A3_3 then
        L4_3 = _UPVALUE0_
        L4_3 = L4_3.getnameinfo
        L5_3 = A1_3 or L5_3
        if not A1_3 then
          L5_3 = A2_3
        end
        L6_3 = nil
        L7_3 = 100
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        A3_3 = L4_3 or A3_3
        if not L4_3 then
          A3_3 = A1_3
        end
      end
      if A3_3 and A3_3 ~= A0_3 then
        L4_3 = A0_2
        L5_3 = A0_3
        L6_3 = A3_3 or L6_3
        if not A3_3 then
          L6_3 = _UPVALUE0_
          L6_3 = L6_3.getnameinfo
          L7_3 = A1_3 or L7_3
          if not A1_3 then
            L7_3 = A2_3
          end
          L8_3 = nil
          L9_3 = 100
          L6_3 = L6_3(L7_3, L8_3, L9_3)
          if not L6_3 then
            L6_3 = A1_3
          end
        end
        L4_3(L5_3, L6_3)
      end
    end
    
    L1_2(L2_2, L3_2)
  else
    L1_2 = {}
    L2_2 = _UPVALUE0_
    L3_2 = 1
    
    function L4_2(A0_3, A1_3, A2_3, A3_3)
      local L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
      if not A3_3 then
        L4_3 = _UPVALUE0_
        L4_3 = L4_3.getnameinfo
        L5_3 = A1_3 or L5_3
        if not A1_3 then
          L5_3 = A2_3
        end
        L6_3 = nil
        L7_3 = 100
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        A3_3 = L4_3 or A3_3
        if not L4_3 then
          A3_3 = A1_3
        end
      end
      if A3_3 and A3_3 ~= A0_3 then
        L4_3 = _UPVALUE1_
        L5_3 = _UPVALUE1_
        L5_3 = #L5_3
        L5_3 = L5_3 + 1
        L6_3 = {}
        L7_3 = A0_3
        L8_3 = A3_3 or L8_3
        if not A3_3 then
          L8_3 = _UPVALUE0_
          L8_3 = L8_3.getnameinfo
          L9_3 = A1_3 or L9_3
          if not A1_3 then
            L9_3 = A2_3
          end
          L10_3 = nil
          L11_3 = 100
          L8_3 = L8_3(L9_3, L10_3, L11_3)
          if not L8_3 then
            L8_3 = A1_3
          end
        end
        L6_3[1] = L7_3
        L6_3[2] = L8_3
        L4_3[L5_3] = L6_3
      end
    end
    
    L2_2(L3_2, L4_2)
    return L1_2
  end
end

L17_1.mac_hints = L18_1
L17_1 = net

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = _UPVALUE0_
    L2_2 = 2
    
    function L3_2(A0_3, A1_3, A2_3, A3_3)
      local L4_3, L5_3, L6_3, L7_3
      if not A3_3 then
        L4_3 = _UPVALUE0_
        L4_3 = L4_3.getnameinfo
        L5_3 = A1_3
        L6_3 = nil
        L7_3 = 100
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        A3_3 = L4_3 or A3_3
        if not L4_3 then
          A3_3 = A0_3
        end
      end
      if A3_3 and A3_3 ~= A1_3 then
        L4_3 = A0_2
        L5_3 = A1_3
        L6_3 = A3_3
        L4_3(L5_3, L6_3)
      end
    end
    
    L1_2(L2_2, L3_2)
  else
    L1_2 = {}
    L2_2 = _UPVALUE0_
    L3_2 = 2
    
    function L4_2(A0_3, A1_3, A2_3, A3_3)
      local L4_3, L5_3, L6_3, L7_3, L8_3
      if not A3_3 then
        L4_3 = _UPVALUE0_
        L4_3 = L4_3.getnameinfo
        L5_3 = A1_3
        L6_3 = nil
        L7_3 = 100
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        A3_3 = L4_3 or A3_3
        if not L4_3 then
          A3_3 = A0_3
        end
      end
      if A3_3 and A3_3 ~= A1_3 then
        L4_3 = _UPVALUE1_
        L5_3 = _UPVALUE1_
        L5_3 = #L5_3
        L5_3 = L5_3 + 1
        L6_3 = {}
        L7_3 = A1_3
        L8_3 = A3_3
        L6_3[1] = L7_3
        L6_3[2] = L8_3
        L4_3[L5_3] = L6_3
      end
    end
    
    L2_2(L3_2, L4_2)
    return L1_2
  end
end

L17_1.ipv4_hints = L18_1
L17_1 = net

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = _UPVALUE0_
    L2_2 = 3
    
    function L3_2(A0_3, A1_3, A2_3, A3_3)
      local L4_3, L5_3, L6_3, L7_3
      if not A3_3 then
        L4_3 = _UPVALUE0_
        L4_3 = L4_3.getnameinfo
        L5_3 = A2_3
        L6_3 = nil
        L7_3 = 100
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        A3_3 = L4_3 or A3_3
        if not L4_3 then
          A3_3 = A0_3
        end
      end
      if A3_3 and A3_3 ~= A2_3 then
        L4_3 = A0_2
        L5_3 = A2_3
        L6_3 = A3_3
        L4_3(L5_3, L6_3)
      end
    end
    
    L1_2(L2_2, L3_2)
  else
    L1_2 = {}
    L2_2 = _UPVALUE0_
    L3_2 = 3
    
    function L4_2(A0_3, A1_3, A2_3, A3_3)
      local L4_3, L5_3, L6_3, L7_3, L8_3
      if not A3_3 then
        L4_3 = _UPVALUE0_
        L4_3 = L4_3.getnameinfo
        L5_3 = A2_3
        L6_3 = nil
        L7_3 = 100
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        A3_3 = L4_3 or A3_3
        if not L4_3 then
          A3_3 = A0_3
        end
      end
      if A3_3 and A3_3 ~= A2_3 then
        L4_3 = _UPVALUE1_
        L5_3 = _UPVALUE1_
        L5_3 = #L5_3
        L5_3 = L5_3 + 1
        L6_3 = {}
        L7_3 = A2_3
        L8_3 = A3_3
        L6_3[1] = L7_3
        L6_3[2] = L8_3
        L4_3[L5_3] = L6_3
      end
    end
    
    L2_2(L3_2, L4_2)
    return L1_2
  end
end

L17_1.ipv6_hints = L18_1
L17_1 = net

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = {}
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.access
  L3_2 = "/proc/net/nf_conntrack"
  L4_2 = "r"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = L0_1
    L2_2 = L2_2.lines
    L3_2 = "/proc/net/nf_conntrack"
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2 in L2_2, L3_2, L4_2 do
      L7_2 = L5_2
      L6_2 = L5_2.match
      L8_2 = "^(.-( [^ =]+=).-)%2"
      L6_2 = L6_2(L7_2, L8_2)
      L5_2 = L6_2
      L6_2 = _parse_mixed_record
      L7_2 = L5_2
      L8_2 = " +"
      L6_2, L7_2 = L6_2(L7_2, L8_2)
      L8_2 = L7_2[6]
      if L8_2 ~= "TIME_WAIT" then
        L8_2 = L7_2[1]
        L6_2.layer3 = L8_2
        L8_2 = L7_2[3]
        L6_2.layer4 = L8_2
        L8_2 = 1
        L9_2 = #L6_2
        L10_2 = 1
        for L11_2 = L8_2, L9_2, L10_2 do
          L6_2[L11_2] = nil
        end
        if A0_2 then
          L8_2 = A0_2
          L9_2 = L6_2
          L8_2(L9_2)
        else
          L8_2 = #L1_2
          L8_2 = L8_2 + 1
          L1_2[L8_2] = L6_2
        end
      end
    end
  else
    L2_2 = _UPVALUE0_
    L2_2 = L2_2.access
    L3_2 = "/proc/net/ip_conntrack"
    L4_2 = "r"
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L2_2 = L0_1
      L2_2 = L2_2.lines
      L3_2 = "/proc/net/ip_conntrack"
      L2_2, L3_2, L4_2 = L2_2(L3_2)
      for L5_2 in L2_2, L3_2, L4_2 do
        L7_2 = L5_2
        L6_2 = L5_2.match
        L8_2 = "^(.-( [^ =]+=).-)%2"
        L6_2 = L6_2(L7_2, L8_2)
        L5_2 = L6_2
        L6_2 = _parse_mixed_record
        L7_2 = L5_2
        L8_2 = " +"
        L6_2, L7_2 = L6_2(L7_2, L8_2)
        L8_2 = L7_2[4]
        if L8_2 ~= "TIME_WAIT" then
          L6_2.layer3 = "ipv4"
          L8_2 = L7_2[1]
          L6_2.layer4 = L8_2
          L8_2 = 1
          L9_2 = #L6_2
          L10_2 = 1
          for L11_2 = L8_2, L9_2, L10_2 do
            L6_2[L11_2] = nil
          end
          if A0_2 then
            L8_2 = A0_2
            L9_2 = L6_2
            L8_2(L9_2)
          else
            L8_2 = #L1_2
            L8_2 = L8_2 + 1
            L1_2[L8_2] = L6_2
          end
        end
      end
    else
      L2_2 = nil
      return L2_2
    end
  end
  return L1_2
end

L17_1.conntrack = L18_1
L17_1 = net

function L18_1()
  local L0_2, L1_2, L2_2
  L1_2 = net
  L1_2 = L1_2.routes
  
  function L2_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.dest
    L2_3 = L1_3
    L1_3 = L1_3.prefix
    L1_3 = L1_3(L2_3)
    if L1_3 == 0 then
      L1_3 = L0_2
      if L1_3 then
        L1_3 = L0_2
        L1_3 = L1_3.metric
        L2_3 = A0_3.metric
        if not (L1_3 > L2_3) then
          goto lbl_15
        end
      end
      L0_2 = A0_3
    end
    ::lbl_15::
  end
  
  L1_2(L2_2)
  return L0_2
end

L17_1.defaultroute = L18_1
L17_1 = net

function L18_1()
  local L0_2, L1_2, L2_2, L3_2
  L1_2 = net
  L1_2 = L1_2.routes6
  
  function L2_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.dest
    L2_3 = L1_3
    L1_3 = L1_3.prefix
    L1_3 = L1_3(L2_3)
    if L1_3 == 0 then
      L1_3 = A0_3.device
      if L1_3 ~= "lo" then
        L1_3 = L0_2
        if L1_3 then
          L1_3 = L0_2
          L1_3 = L1_3.metric
          L2_3 = A0_3.metric
          if not (L1_3 > L2_3) then
            goto lbl_18
          end
        end
        L0_2 = A0_3
      end
    end
    ::lbl_18::
  end
  
  L1_2(L2_2)
  if not L0_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.ip
    L1_2 = L1_2.IPv6
    L2_2 = "2000::/3"
    L1_2 = L1_2(L2_2)
    L2_2 = net
    L2_2 = L2_2.routes6
    
    function L3_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = A0_3.dest
      L2_3 = L1_3
      L1_3 = L1_3.equal
      L3_3 = _UPVALUE0_
      L1_3 = L1_3(L2_3, L3_3)
      if L1_3 then
        L1_3 = L0_2
        if L1_3 then
          L1_3 = L0_2
          L1_3 = L1_3.metric
          L2_3 = A0_3.metric
          if not (L1_3 > L2_3) then
            goto lbl_16
          end
        end
        L0_2 = A0_3
      end
      ::lbl_16::
    end
    
    L2_2(L3_2)
  end
  return L0_2
end

L17_1.defaultroute6 = L18_1
L17_1 = net

function L18_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = {}
  L1_2 = _UPVALUE0_
  L2_2 = _UPVALUE1_
  L2_2 = L2_2.getifaddrs
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L2_2()
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L5_2.family
    if L6_2 == "packet" then
      L6_2 = #L0_2
      L6_2 = L6_2 + 1
      L7_2 = L5_2.name
      L0_2[L6_2] = L7_2
    end
  end
  return L0_2
end

L17_1.devices = L18_1
L17_1 = net

function L18_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = {}
  L1_2 = _UPVALUE0_
  L2_2 = _UPVALUE1_
  L2_2 = L2_2.getifaddrs
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L2_2()
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L5_2.family
    if L6_2 == "packet" then
      L6_2 = L5_2.data
      L7_2 = L6_2.rx_bytes
      L6_2[1] = L7_2
      L7_2 = L6_2.rx_packets
      L6_2[2] = L7_2
      L7_2 = L6_2.rx_errors
      L6_2[3] = L7_2
      L7_2 = L6_2.rx_dropped
      L6_2[4] = L7_2
      L6_2[5] = 0
      L6_2[6] = 0
      L6_2[7] = 0
      L7_2 = L6_2.multicast
      L6_2[8] = L7_2
      L7_2 = L6_2.tx_bytes
      L6_2[9] = L7_2
      L7_2 = L6_2.tx_packets
      L6_2[10] = L7_2
      L7_2 = L6_2.tx_errors
      L6_2[11] = L7_2
      L7_2 = L6_2.tx_dropped
      L6_2[12] = L7_2
      L6_2[13] = 0
      L7_2 = L6_2.collisions
      L6_2[14] = L7_2
      L6_2[15] = 0
      L6_2[16] = 0
      L7_2 = L5_2.name
      L0_2[L7_2] = L6_2
    end
  end
  return L0_2
end

L17_1.deviceinfo = L18_1
L17_1 = net

function L18_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = net
  L2_2 = L2_2.arptable
  
  function L3_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3["IP address"]
    L2_3 = A0_2
    if L1_3 == L2_3 then
      L1_3 = A0_3["HW address"]
      _UPVALUE1_ = L1_3
    end
  end
  
  L2_2(L3_2)
  return L1_2
end

L17_1.ip4mac = L18_1
L17_1 = net

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L1_2 = {}
  L2_2 = L0_1
  L2_2 = L2_2.lines
  L3_2 = "/proc/net/route"
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2 in L2_2, L3_2, L4_2 do
    L7_2 = L5_2
    L6_2 = L5_2.match
    L8_2 = "([^%s]+)\t([A-F0-9]+)\t([A-F0-9]+)\t([A-F0-9]+)\t"
    L9_2 = "(%d+)\t(%d+)\t(%d+)\t([A-F0-9]+)\t(%d+)\t(%d+)\t(%d+)"
    L8_2 = L8_2 .. L9_2
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L17_2 = _UPVALUE1_
      L17_2 = L17_2.ip
      L17_2 = L17_2.Hex
      L18_2 = L8_2
      L19_2 = 32
      L20_2 = _UPVALUE1_
      L20_2 = L20_2.ip
      L20_2 = L20_2.FAMILY_INET4
      L17_2 = L17_2(L18_2, L19_2, L20_2)
      L8_2 = L17_2
      L17_2 = _UPVALUE1_
      L17_2 = L17_2.ip
      L17_2 = L17_2.Hex
      L18_2 = L13_2
      L19_2 = 32
      L20_2 = _UPVALUE1_
      L20_2 = L20_2.ip
      L20_2 = L20_2.FAMILY_INET4
      L17_2 = L17_2(L18_2, L19_2, L20_2)
      L13_2 = L17_2
      L17_2 = _UPVALUE1_
      L17_2 = L17_2.ip
      L17_2 = L17_2.Hex
      L18_2 = L7_2
      L20_2 = L13_2
      L19_2 = L13_2.prefix
      L21_2 = L13_2
      L19_2 = L19_2(L20_2, L21_2)
      L20_2 = _UPVALUE1_
      L20_2 = L20_2.ip
      L20_2 = L20_2.FAMILY_INET4
      L17_2 = L17_2(L18_2, L19_2, L20_2)
      L7_2 = L17_2
      L17_2 = {}
      L17_2.dest = L7_2
      L17_2.gateway = L8_2
      L18_2 = _UPVALUE2_
      L19_2 = L12_2
      L18_2 = L18_2(L19_2)
      L17_2.metric = L18_2
      L18_2 = _UPVALUE2_
      L19_2 = L10_2
      L18_2 = L18_2(L19_2)
      L17_2.refcount = L18_2
      L18_2 = _UPVALUE2_
      L19_2 = L11_2
      L18_2 = L18_2(L19_2)
      L17_2.usecount = L18_2
      L18_2 = _UPVALUE2_
      L19_2 = L14_2
      L18_2 = L18_2(L19_2)
      L17_2.mtu = L18_2
      L18_2 = _UPVALUE2_
      L19_2 = window
      L18_2 = L18_2(L19_2)
      L17_2.window = L18_2
      L18_2 = _UPVALUE2_
      L19_2 = L16_2
      L18_2 = L18_2(L19_2)
      L17_2.irtt = L18_2
      L18_2 = _UPVALUE2_
      L19_2 = L9_2
      L20_2 = 16
      L18_2 = L18_2(L19_2, L20_2)
      L17_2.flags = L18_2
      L17_2.device = L6_2
      if A0_2 then
        L18_2 = A0_2
        L19_2 = L17_2
        L18_2(L19_2)
      else
        L18_2 = #L1_2
        L18_2 = L18_2 + 1
        L1_2[L18_2] = L17_2
      end
    end
  end
  return L1_2
end

L17_1.routes = L18_1
L17_1 = net

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.access
  L2_2 = "/proc/net/ipv6_route"
  L3_2 = "r"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = {}
    L2_2 = L0_1
    L2_2 = L2_2.lines
    L3_2 = "/proc/net/ipv6_route"
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2 in L2_2, L3_2, L4_2 do
      L7_2 = L5_2
      L6_2 = L5_2.match
      L8_2 = "([a-f0-9]+) ([a-f0-9]+) "
      L9_2 = "([a-f0-9]+) ([a-f0-9]+) "
      L10_2 = "([a-f0-9]+) ([a-f0-9]+) "
      L11_2 = "([a-f0-9]+) ([a-f0-9]+) "
      L12_2 = "([a-f0-9]+) +([^%s]+)"
      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2, L8_2)
      if L6_2 and L7_2 and L8_2 and L9_2 and L10_2 and L11_2 and L12_2 and L13_2 and L14_2 and L15_2 then
        L16_2 = _UPVALUE2_
        L16_2 = L16_2.ip
        L16_2 = L16_2.Hex
        L17_2 = L8_2
        L18_2 = _UPVALUE3_
        L19_2 = L9_2
        L20_2 = 16
        L18_2 = L18_2(L19_2, L20_2)
        L19_2 = _UPVALUE2_
        L19_2 = L19_2.ip
        L19_2 = L19_2.FAMILY_INET6
        L20_2 = false
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
        L8_2 = L16_2
        L16_2 = _UPVALUE2_
        L16_2 = L16_2.ip
        L16_2 = L16_2.Hex
        L17_2 = L6_2
        L18_2 = _UPVALUE3_
        L19_2 = L7_2
        L20_2 = 16
        L18_2 = L18_2(L19_2, L20_2)
        L19_2 = _UPVALUE2_
        L19_2 = L19_2.ip
        L19_2 = L19_2.FAMILY_INET6
        L20_2 = false
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
        L6_2 = L16_2
        L16_2 = _UPVALUE2_
        L16_2 = L16_2.ip
        L16_2 = L16_2.Hex
        L17_2 = L10_2
        L18_2 = 128
        L19_2 = _UPVALUE2_
        L19_2 = L19_2.ip
        L19_2 = L19_2.FAMILY_INET6
        L20_2 = false
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
        L10_2 = L16_2
        L16_2 = {}
        L16_2.source = L8_2
        L16_2.dest = L6_2
        L16_2.nexthop = L10_2
        L17_2 = _UPVALUE3_
        L18_2 = L11_2
        L19_2 = 16
        L17_2 = L17_2(L18_2, L19_2)
        L16_2.metric = L17_2
        L17_2 = _UPVALUE3_
        L18_2 = L12_2
        L19_2 = 16
        L17_2 = L17_2(L18_2, L19_2)
        L16_2.refcount = L17_2
        L17_2 = _UPVALUE3_
        L18_2 = L13_2
        L19_2 = 16
        L17_2 = L17_2(L18_2, L19_2)
        L16_2.usecount = L17_2
        L17_2 = _UPVALUE3_
        L18_2 = L14_2
        L19_2 = 16
        L17_2 = L17_2(L18_2, L19_2)
        L16_2.flags = L17_2
        L16_2.device = L15_2
        L16_2.metric_raw = L11_2
        if A0_2 then
          L17_2 = A0_2
          L18_2 = L16_2
          L17_2(L18_2)
        else
          L17_2 = #L1_2
          L17_2 = L17_2 + 1
          L1_2[L17_2] = L16_2
        end
      end
    end
    return L1_2
  end
end

L17_1.routes6 = L18_1
L17_1 = net

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.execute
  L2_2 = "ping -c1 '"
  L4_2 = A0_2
  L3_2 = A0_2.gsub
  L5_2 = "'"
  L6_2 = ""
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = "' >/dev/null 2>&1"
  L2_2 = L2_2 .. L3_2 .. L4_2
  return L1_2(L2_2)
end

L17_1.pingtest = L18_1
L17_1 = {}
process = L17_1
L17_1 = process

function L18_1(A0_2)
  local L1_2, L2_2
  L1_2 = {}
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.getuid
  L2_2 = L2_2()
  L1_2.uid = L2_2
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.getgid
  L2_2 = L2_2()
  L1_2.gid = L2_2
  L2_2 = L1_2 or L2_2
  if A0_2 or not L1_2 then
    L2_2 = L1_2[A0_2]
  end
  return L2_2
end

L17_1.info = L18_1
L17_1 = process

function L18_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = {}
  L1_2 = nil
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.util
  L2_2 = L2_2.execi
  L3_2 = "/bin/busybox top -bn1"
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L2_2
  L4_2 = nil
  L5_2 = nil
  for L6_2 in L3_2, L4_2, L5_2 do
    L8_2 = L6_2
    L7_2 = L6_2.match
    L9_2 = "^ *(%d+) +(%d+) +(%S.-%S) +([RSDZTW][W ][<N ]) +(%d+) +(%d+%%) +(%d+%%) +(.+)"
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2, L9_2)
    L15_2 = _UPVALUE1_
    L16_2 = L7_2
    L15_2 = L15_2(L16_2)
    if L15_2 then
      L16_2 = {}
      L16_2.PID = L7_2
      L16_2.PPID = L8_2
      L16_2.USER = L9_2
      L16_2.STAT = L10_2
      L16_2.VSZ = L11_2
      L16_2["%MEM"] = L12_2
      L16_2["%CPU"] = L13_2
      L16_2.COMMAND = L14_2
      L0_2[L15_2] = L16_2
    end
  end
  return L0_2
end

L17_1.list = L18_1
L17_1 = process

function L18_1(A0_2)
  local L1_2, L2_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.setgid
  L2_2 = A0_2
  return L1_2(L2_2)
end

L17_1.setgroup = L18_1
L17_1 = process

function L18_1(A0_2)
  local L1_2, L2_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.setuid
  L2_2 = A0_2
  return L1_2(L2_2)
end

L17_1.setuser = L18_1
L17_1 = process
L18_1 = L3_1.kill
L17_1.signal = L18_1
L17_1 = {}
user = L17_1
L17_1 = user
L18_1 = L3_1.getpw
L17_1.getuser = L18_1
L17_1 = user

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.getsp
  if L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.getsp
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_15
    end
  end
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.getpw
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  ::lbl_15::
  L2_2 = L1_2 or L2_2
  if L1_2 then
    L2_2 = L1_2.pwdp
    if not L2_2 then
      L2_2 = L1_2.passwd
    end
  end
  if L2_2 then
    L3_2 = #L2_2
    if not (L3_2 < 1) and L2_2 ~= "!" and L2_2 ~= "x" then
      goto lbl_34
    end
  end
  L3_2 = nil
  L4_2 = L1_2
  do return L3_2, L4_2 end
  goto lbl_37
  ::lbl_34::
  L3_2 = L2_2
  L4_2 = L1_2
  do return L3_2, L4_2 end
  ::lbl_37::
end

L17_1.getpasswd = L18_1
L17_1 = user

function L18_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = user
  L2_2 = L2_2.getpasswd
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  if L3_2 then
    L4_2 = L2_2 == nil
    return L4_2
  end
  L4_2 = false
  return L4_2
end

L17_1.checkpasswd = L18_1
L17_1 = user

function L18_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A1_2 then
    L3_2 = A1_2
    L2_2 = A1_2.gsub
    L4_2 = "'"
    L5_2 = "'\"'\"'"
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    A1_2 = L2_2
  end
  if A0_2 then
    L3_2 = A0_2
    L2_2 = A0_2.gsub
    L4_2 = "'"
    L5_2 = "'\"'\"'"
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    A0_2 = L2_2
  end
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.execute
  L3_2 = "(echo '"
  L4_2 = A1_2
  L5_2 = "'; sleep 1; echo '"
  L6_2 = A1_2
  L7_2 = "') | "
  L8_2 = "passwd '"
  L9_2 = A0_2
  L10_2 = "' >/dev/null 2>&1"
  L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
  return L2_2(L3_2)
end

L17_1.setpasswd = L18_1
L17_1 = {}
wifi = L17_1
L17_1 = wifi

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = _UPVALUE0_
  L2_2 = _UPVALUE1_
  L3_2 = "iwinfo"
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if A0_2 then
    L3_2 = 0
    L4_2 = _UPVALUE2_
    L4_2 = L4_2.cursor_state
    L4_2 = L4_2()
    L6_2 = A0_2
    L5_2 = A0_2.match
    L7_2 = "^(%w+)%.network(%d+)"
    L5_2, L6_2 = L5_2(L6_2, L7_2)
    if L5_2 and L6_2 then
      A0_2 = L5_2
      L7_2 = _UPVALUE3_
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      L6_2 = L7_2
      L8_2 = L4_2
      L7_2 = L4_2.foreach
      L9_2 = "wireless"
      L10_2 = "wifi-iface"
      
      function L11_2(A0_3)
        local L1_3, L2_3
        L1_3 = A0_3.device
        L2_3 = _UPVALUE0_
        if L1_3 == L2_3 then
          L1_3 = _UPVALUE1_
          L1_3 = L1_3 + 1
          _UPVALUE1_ = L1_3
          L1_3 = _UPVALUE1_
          L2_3 = _UPVALUE2_
          if L1_3 == L2_3 then
            L1_3 = A0_3.ifname
            if not L1_3 then
              L1_3 = A0_3.device
            end
            A0_2 = L1_3
            L1_3 = false
            return L1_3
          end
        end
      end
      
      L7_2(L8_2, L9_2, L10_2, L11_2)
    else
      L8_2 = L4_2
      L7_2 = L4_2.get
      L9_2 = "wireless"
      L10_2 = A0_2
      L7_2 = L7_2(L8_2, L9_2, L10_2)
      if L7_2 == "wifi-device" then
        L8_2 = L4_2
        L7_2 = L4_2.foreach
        L9_2 = "wireless"
        L10_2 = "wifi-iface"
        
        function L11_2(A0_3)
          local L1_3, L2_3
          L1_3 = A0_3.device
          L2_3 = A0_2
          if L1_3 == L2_3 then
            L1_3 = A0_3.ifname
            if L1_3 then
              L1_3 = A0_3.ifname
              A0_2 = L1_3
              L1_3 = false
              return L1_3
            end
          end
        end
        
        L7_2(L8_2, L9_2, L10_2, L11_2)
      end
    end
    L7_2 = L1_2 or L7_2
    if L1_2 then
      L7_2 = L2_2.type
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
    end
    if L7_2 then
      L8_2 = L2_2[L7_2]
      if L8_2 then
        goto lbl_56
      end
    end
    L8_2 = {}
    ::lbl_56::
    L9_2 = _UPVALUE4_
    L10_2 = {}
    L11_2 = {}
    
    function L12_2(A0_3, A1_3)
      local L2_3, L3_3
      if A1_3 == "ifname" then
        L2_3 = A0_2
        return L2_3
      else
        L2_3 = _UPVALUE1_
        L2_3 = L2_3[A1_3]
        if L2_3 then
          L2_3 = _UPVALUE1_
          L2_3 = L2_3[A1_3]
          L3_3 = A0_2
          return L2_3(L3_3)
        end
      end
    end
    
    L11_2.__index = L12_2
    return L9_2(L10_2, L11_2)
  end
end

L17_1.getiwinfo = L18_1
L17_1 = {}
init = L17_1
L17_1 = init
L17_1.dir = "/etc/init.d/"
L17_1 = init

function L18_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = {}
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.glob
  L2_2 = init
  L2_2 = L2_2.dir
  L3_2 = "*"
  L2_2 = L2_2 .. L3_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2 in L1_2, L2_2, L3_2 do
    L5_2 = #L0_2
    L5_2 = L5_2 + 1
    L6_2 = _UPVALUE0_
    L6_2 = L6_2.basename
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    L0_2[L5_2] = L6_2
  end
  return L0_2
end

L17_1.names = L18_1
L17_1 = init

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.access
  L2_2 = init
  L2_2 = L2_2.dir
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = call
    L2_2 = {}
    L3_2 = init
    L3_2 = L3_2.dir
    L4_2 = A0_2
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L2_2 = "env -i sh -c 'source %s%s enabled; exit ${START:-255}' >/dev/null" % L2_2
    return L1_2(L2_2)
  end
end

L17_1.index = L18_1

function L17_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = _UPVALUE0_
  L2_2 = L2_2.access
  L3_2 = init
  L3_2 = L3_2.dir
  L4_2 = A1_2
  L3_2 = L3_2 .. L4_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = call
    L3_2 = {}
    L4_2 = init
    L4_2 = L4_2.dir
    L5_2 = A1_2
    L6_2 = A0_2
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L3_2 = "env -i %s%s %s >/dev/null" % L3_2
    return L2_2(L3_2)
  end
end

L18_1 = init

function L19_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L2_2 = "enabled"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 == 0
  return L1_2
end

L18_1.enabled = L19_1
L18_1 = init

function L19_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L2_2 = "enable"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 == 1
  return L1_2
end

L18_1.enable = L19_1
L18_1 = init

function L19_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L2_2 = "disable"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 == 0
  return L1_2
end

L18_1.disable = L19_1
L18_1 = init

function L19_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L2_2 = "start"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 == 0
  return L1_2
end

L18_1.start = L19_1
L18_1 = init

function L19_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _UPVALUE0_
  L2_2 = "stop"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 == 0
  return L1_2
end

L18_1.stop = L19_1

function L18_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if not A1_2 then
    A1_2 = "  "
  end
  L2_2 = {}
  L3_2 = {}
  L4_2 = _UPVALUE0_
  L5_2 = _UPVALUE1_
  L5_2 = L5_2.util
  L5_2 = L5_2.split
  L6_2 = _UPVALUE1_
  L6_2 = L6_2.util
  L6_2 = L6_2.trim
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L7_2 = "\n"
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L5_2(L6_2, L7_2)
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = _UPVALUE0_
    L10_2 = _UPVALUE1_
    L10_2 = L10_2.util
    L10_2 = L10_2.split
    L11_2 = _UPVALUE1_
    L11_2 = L11_2.util
    L11_2 = L11_2.trim
    L12_2 = L8_2
    L11_2 = L11_2(L12_2)
    L12_2 = A1_2
    L13_2 = nil
    L14_2 = true
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
    L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    for L12_2, L13_2 in L9_2, L10_2, L11_2 do
      L15_2 = L13_2
      L14_2 = L13_2.match
      L16_2 = [[
([^%s][^:=]*) *([:=]*) *"*([^
"]*)"*]]
      L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
      if L14_2 then
        if L15_2 == "" then
          L17_2 = _UPVALUE2_
          L17_2 = L17_2.insert
          L18_2 = L3_2
          L19_2 = L14_2
          L17_2(L18_2, L19_2)
        else
          L2_2[L14_2] = L16_2
        end
      end
    end
  end
  L4_2 = L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end

_parse_mixed_record = L18_1
