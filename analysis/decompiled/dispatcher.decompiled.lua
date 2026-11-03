local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = require
L1_1 = "nixio.fs"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "luci.sys"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "luci.init"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "luci.util"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "luci.http"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "nixio"
L5_1 = L5_1(L6_1)
L6_1 = require
L7_1 = "nixio.util"
L6_1(L7_1)
L6_1 = module
L7_1 = "luci.dispatcher"
L8_1 = package
L8_1 = L8_1.seeall
L6_1(L7_1, L8_1)
L6_1 = L3_1.threadlocal
L6_1 = L6_1()
context = L6_1
L6_1 = require
L7_1 = "luci.model.uci"
L6_1 = L6_1(L7_1)
uci = L6_1
L6_1 = require
L7_1 = "luci.i18n"
L6_1 = L6_1(L7_1)
i18n = L6_1
L6_1 = _M
L6_1.fs = L0_1
L6_1 = {}
authenticator = L6_1
L6_1 = nil
L7_1 = nil

function L8_1(...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = ...
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L1_2[9] = L10_2
  L1_2[10] = L11_2
  L1_2[11] = L12_2
  L1_2[12] = L13_2
  L2_2 = {}
  L3_2 = _UPVALUE0_
  L3_2 = L3_2.getenv
  L4_2 = "SCRIPT_NAME"
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = ""
  end
  L2_2[1] = L3_2
  L3_2 = nil
  L4_2 = nil
  L5_2 = pairs
  L6_2 = context
  L6_2 = L6_2.urltoken
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = #L2_2
    L10_2 = L10_2 + 1
    L2_2[L10_2] = "/;"
    L10_2 = #L2_2
    L10_2 = L10_2 + 1
    L11_2 = _UPVALUE0_
    L11_2 = L11_2.urlencode
    L12_2 = L8_2
    L11_2 = L11_2(L12_2)
    L2_2[L10_2] = L11_2
    L10_2 = #L2_2
    L10_2 = L10_2 + 1
    L2_2[L10_2] = "="
    L10_2 = #L2_2
    L10_2 = L10_2 + 1
    L11_2 = _UPVALUE0_
    L11_2 = L11_2.urlencode
    L12_2 = L9_2
    L11_2 = L11_2(L12_2)
    L2_2[L10_2] = L11_2
  end
  L5_2 = nil
  L6_2 = ipairs
  L7_2 = L1_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L12_2 = L10_2
    L11_2 = L10_2.match
    L13_2 = "^[a-zA-Z0-9_%-%.%%/,;]+$"
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L11_2 = #L2_2
      L11_2 = L11_2 + 1
      L2_2[L11_2] = "/"
      L11_2 = #L2_2
      L11_2 = L11_2 + 1
      L2_2[L11_2] = L10_2
    end
  end
  L6_2 = table
  L6_2 = L6_2.concat
  L7_2 = L2_2
  L8_2 = ""
  return L6_2(L7_2, L8_2)
end

build_url = L8_1

function L8_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = A0_2.title
    L1_2 = A0_2.title
    L1_2 = #L1_2
    L1_2 = A0_2.target
    L1_2 = A0_2.hidden
    L1_2 = type
    L2_2 = A0_2.target
    L1_2 = L1_2(L2_2)
    L1_2 = A0_2.target
    L1_2 = L1_2.type
    L1_2 = type
    L2_2 = A0_2.nodes
    L1_2 = L1_2(L2_2)
    L1_2 = next
    L2_2 = A0_2.nodes
    L1_2 = L1_2(L2_2)
    L1_2 = not L1_2
    L1_2 = L1_2 and L1_2
    return L1_2
  end
  L1_2 = false
  return L1_2
end

node_visible = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  if A0_2 then
    L2_2 = nil
    L3_2 = nil
    L4_2 = _UPVALUE0_
    L4_2 = L4_2.spairs
    L5_2 = A0_2.nodes
    
    function L6_2(A0_3, A1_3)
      local L2_3, L3_3
      L2_3 = A0_2
      L2_3 = L2_3.nodes
      L2_3 = L2_3[A0_3]
      L2_3 = L2_3.order
      if not L2_3 then
        L2_3 = 100
      end
      L3_3 = A0_2
      L3_3 = L3_3.nodes
      L3_3 = L3_3[A1_3]
      L3_3 = L3_3.order
      if not L3_3 then
        L3_3 = 100
      end
      L2_3 = L2_3 < L3_3
      return L2_3
    end
    
    L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = node_visible
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        L9_2 = #L1_2
        L9_2 = L9_2 + 1
        L1_2[L9_2] = L7_2
      end
    end
  end
  return L1_2
end

node_childs = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = luci
  L1_2 = L1_2.http
  L1_2 = L1_2.status
  L2_2 = 404
  L3_2 = "Not Found"
  L1_2(L2_2, L3_2)
  if not A0_2 then
    A0_2 = "Not Found"
  end
  L1_2 = require
  L2_2 = "luci.template"
  L1_2(L2_2)
  L1_2 = luci
  L1_2 = L1_2.util
  L1_2 = L1_2.copcall
  L2_2 = luci
  L2_2 = L2_2.template
  L2_2 = L2_2.render
  L3_2 = "error404"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = luci
    L1_2 = L1_2.http
    L1_2 = L1_2.prepare_content
    L2_2 = "text/plain"
    L1_2(L2_2)
    L1_2 = luci
    L1_2 = L1_2.http
    L1_2 = L1_2.write
    L2_2 = A0_2
    L1_2(L2_2)
  end
  L1_2 = false
  return L1_2
end

error404 = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = luci
  L1_2 = L1_2.util
  L1_2 = L1_2.perror
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = context
  L1_2 = L1_2.template_header_sent
  if not L1_2 then
    L1_2 = luci
    L1_2 = L1_2.http
    L1_2 = L1_2.status
    L2_2 = 500
    L3_2 = "Internal Server Error"
    L1_2(L2_2, L3_2)
    L1_2 = luci
    L1_2 = L1_2.http
    L1_2 = L1_2.prepare_content
    L2_2 = "text/plain"
    L1_2(L2_2)
    L1_2 = luci
    L1_2 = L1_2.http
    L1_2 = L1_2.write
    L2_2 = A0_2
    L1_2(L2_2)
  else
    L1_2 = require
    L2_2 = "luci.template"
    L1_2(L2_2)
    L1_2 = luci
    L1_2 = L1_2.util
    L1_2 = L1_2.copcall
    L2_2 = luci
    L2_2 = L2_2.template
    L2_2 = L2_2.render
    L3_2 = "error500"
    L4_2 = {}
    L4_2.message = A0_2
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    if not L1_2 then
      L1_2 = luci
      L1_2 = L1_2.http
      L1_2 = L1_2.prepare_content
      L2_2 = "text/plain"
      L1_2(L2_2)
      L1_2 = luci
      L1_2 = L1_2.http
      L1_2 = L1_2.write
      L2_2 = A0_2
      L1_2(L2_2)
    end
  end
  L1_2 = false
  return L1_2
end

error500 = L8_1
L8_1 = authenticator

function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = luci
  L3_2 = L3_2.http
  L3_2 = L3_2.formvalue
  L4_2 = "username"
  L3_2 = L3_2(L4_2)
  L4_2 = luci
  L4_2 = L4_2.http
  L4_2 = L4_2.formvalue
  L5_2 = "password"
  L4_2 = L4_2(L5_2)
  if L3_2 then
    L5_2 = A0_2
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      return L3_2
    end
  end
  L5_2 = require
  L6_2 = "luci.i18n"
  L5_2(L6_2)
  L5_2 = require
  L6_2 = "luci.template"
  L5_2(L6_2)
  L5_2 = context
  L6_2 = {}
  L5_2.path = L6_2
  L5_2 = luci
  L5_2 = L5_2.template
  L5_2 = L5_2.render
  L6_2 = "sysauth"
  L7_2 = {}
  L7_2.duser = A2_2
  L7_2.fuser = L3_2
  L5_2(L6_2, L7_2)
  L5_2 = false
  return L5_2
end

L8_1.htmlauth = L9_1

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = luci
  L2_2 = L2_2.http
  L2_2 = L2_2.context
  L2_2.request = A0_2
  L2_2 = {}
  L3_2 = context
  L3_2.request = L2_2
  L3_2 = context
  L4_2 = {}
  L3_2.urltoken = L4_2
  L3_2 = _UPVALUE0_
  L3_2 = L3_2.urldecode
  L5_2 = A0_2
  L4_2 = A0_2.getenv
  L6_2 = "PATH_INFO"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = ""
  end
  L5_2 = true
  L3_2 = L3_2(L4_2, L5_2)
  if A1_2 then
    L4_2 = ipairs
    L5_2 = A1_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = #L2_2
      L9_2 = L9_2 + 1
      L2_2[L9_2] = L8_2
    end
  end
  L4_2 = true
  L6_2 = L3_2
  L5_2 = L3_2.gmatch
  L7_2 = "[^/]+"
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  for L8_2 in L5_2, L6_2, L7_2 do
    L9_2 = nil
    L10_2 = nil
    if L4_2 then
      L12_2 = L8_2
      L11_2 = L8_2.match
      L13_2 = ";(%w+)=([a-fA-F0-9]*)"
      L11_2, L12_2 = L11_2(L12_2, L13_2)
      L10_2 = L12_2
      L9_2 = L11_2
    end
    if L9_2 then
      L11_2 = context
      L11_2 = L11_2.urltoken
      L11_2[L9_2] = L10_2
    else
      L4_2 = false
      L11_2 = #L2_2
      L11_2 = L11_2 + 1
      L2_2[L11_2] = L8_2
    end
  end
  L5_2 = require
  L6_2 = "luci.service"
  L5_2 = L5_2(L6_2)
  L6_2 = require
  L7_2 = "luci.sauth"
  L6_2 = L6_2(L7_2)
  L7_2 = table
  L7_2 = L7_2.concat
  L8_2 = context
  L8_2 = L8_2.request
  L9_2 = "."
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = _UPVALUE0_
  L8_2 = L8_2.formvalue
  L9_2 = "form"
  L10_2 = true
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = L5_2.data_need_encrypt
  L10_2 = L7_2
  L11_2 = L8_2
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L5_2.data_renew_aeskey
  L11_2 = L7_2
  L12_2 = L8_2
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = _UPVALUE0_
  L11_2 = L11_2.set_encryptflag
  L12_2 = L9_2
  L11_2(L12_2)
  L11_2 = _UPVALUE0_
  L11_2 = L11_2.set_renewaeskey
  L12_2 = L10_2
  L11_2(L12_2)
  if L9_2 then
    L11_2 = luci
    L11_2 = L11_2.http
    L11_2 = L11_2.getcookie
    L12_2 = "sysauth"
    L11_2 = L11_2(L12_2)
    if L11_2 then
      L13_2 = L11_2
      L12_2 = L11_2.match
      L14_2 = "^[a-f0-9]*$"
      L12_2 = L12_2(L13_2, L14_2)
      L11_2 = L12_2
    end
    L12_2 = L6_2.read
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if L12_2 then
      L13_2 = _UPVALUE0_
      L13_2 = L13_2.set_aeskey
      L14_2 = {}
      L15_2 = L12_2.aeskey
      L14_2.key = L15_2
      L15_2 = L12_2.aesiv
      L14_2.iv = L15_2
      L13_2(L14_2)
      L13_2 = _UPVALUE0_
      L13_2 = L13_2.set_seqnum
      L14_2 = L12_2.seqnum
      L13_2(L14_2)
    end
  end
  L11_2 = _UPVALUE1_
  L11_2 = L11_2.coxpcall
  
  function L12_2()
    local L0_3, L1_3
    L0_3 = dispatch
    L1_3 = context
    L1_3 = L1_3.request
    L0_3(L1_3)
  end
  
  L13_2 = error500
  L11_2, L12_2 = L11_2(L12_2, L13_2)
  L13_2 = luci
  L13_2 = L13_2.http
  L13_2 = L13_2.close
  L13_2()
end

httpdispatch = L8_1

function L8_1(A0_2)
  local L1_2, L2_2
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.prepare_content
  L2_2 = "application/json"
  L1_2(L2_2)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.write_json
  L2_2 = {}
  L2_2.success = false
  L2_2.errorcode = A0_2
  L1_2(L2_2)
end

error_json = L8_1

function L8_1(A0_2)
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

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L1_2 = context
  L1_2.path = A0_2
  L2_2 = require
  L3_2 = "luci.config"
  L2_2 = L2_2(L3_2)
  L3_2 = assert
  L4_2 = L2_2.main
  L5_2 = "/etc/config/luci seems to be corrupt, unable to find section 'main'"
  L3_2(L4_2, L5_2)
  L3_2 = L2_2.main
  L3_2 = L3_2.lang
  if not L3_2 then
    L3_2 = "auto"
  end
  if L3_2 == "auto" then
    L4_2 = _UPVALUE0_
    L4_2 = L4_2.getenv
    L5_2 = "HTTP_ACCEPT_LANGUAGE"
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L4_2 = ""
    end
    L6_2 = L4_2
    L5_2 = L4_2.gmatch
    L7_2 = "[%w-]+"
    L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
    for L8_2 in L5_2, L6_2, L7_2 do
      if L8_2 then
        L10_2 = L8_2
        L9_2 = L8_2.gsub
        L11_2 = "-"
        L12_2 = "_"
        L9_2 = L9_2(L10_2, L11_2, L12_2)
        L8_2 = L9_2
      end
      L9_2 = L2_2.languages
      L9_2 = L9_2[L8_2]
      if L9_2 then
        L3_2 = L8_2
        break
      end
    end
  end
  L4_2 = require
  L5_2 = "luci.i18n"
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2.setlanguage
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = L1_2.tree
  L5_2 = nil
  if not L4_2 then
    L6_2 = createtree
    L6_2 = L6_2()
    L4_2 = L6_2
  end
  L6_2 = {}
  L7_2 = {}
  L1_2.args = L7_2
  L8_2 = L1_2.requestargs
  if not L8_2 then
    L8_2 = L7_2
  end
  L1_2.requestargs = L8_2
  L8_2 = nil
  L9_2 = L1_2.urltoken
  L10_2 = {}
  L11_2 = {}
  L12_2 = ipairs
  L13_2 = A0_2
  L12_2, L13_2, L14_2 = L12_2(L13_2)
  for L15_2, L16_2 in L12_2, L13_2, L14_2 do
    L17_2 = #L10_2
    L17_2 = L17_2 + 1
    L10_2[L17_2] = L16_2
    L17_2 = #L11_2
    L17_2 = L17_2 + 1
    L11_2[L17_2] = L16_2
    L17_2 = L4_2.nodes
    L4_2 = L17_2[L16_2]
    L8_2 = L15_2
    if not L4_2 then
      break
    end
    L17_2 = _UPVALUE1_
    L17_2 = L17_2.update
    L18_2 = L6_2
    L19_2 = L4_2
    L17_2(L18_2, L19_2)
    L17_2 = L4_2.leaf
    if L17_2 then
      break
    end
  end
  if L4_2 then
    L12_2 = L4_2.leaf
    if L12_2 then
      L12_2 = L8_2 + 1
      L13_2 = #A0_2
      L14_2 = 1
      for L15_2 = L12_2, L13_2, L14_2 do
        L16_2 = #L7_2
        L16_2 = L16_2 + 1
        L17_2 = A0_2[L15_2]
        L7_2[L16_2] = L17_2
        L16_2 = #L11_2
        L16_2 = L16_2 + 1
        L17_2 = A0_2[L15_2]
        L11_2[L16_2] = L17_2
      end
    end
  end
  L12_2 = L1_2.requestpath
  if not L12_2 then
    L12_2 = L11_2
  end
  L1_2.requestpath = L12_2
  L1_2.path = L10_2
  L12_2 = L6_2.i18n
  if L12_2 then
    L12_2 = i18n
    L12_2 = L12_2.loadc
    L13_2 = L6_2.i18n
    L12_2(L13_2)
  end
  if L4_2 then
    L12_2 = L4_2.index
    if L12_2 then
      goto lbl_134
    end
  end
  L12_2 = L6_2.forcetemplate
  ::lbl_134::
  if L12_2 then
    L12_2 = require
    L13_2 = "luci.template"
    L12_2 = L12_2(L13_2)
    L13_2 = L6_2.mediaurlbase
    if not L13_2 then
      L13_2 = luci
      L13_2 = L13_2.config
      L13_2 = L13_2.main
      L13_2 = L13_2.mediaurlbase
    end
    L14_2 = pcall
    L15_2 = L12_2.Template
    L16_2 = L0_1
    L16_2 = L16_2.basename
    L17_2 = L13_2
    L16_2 = L16_2(L17_2)
    L16_2 = "themes/%s/header" % L16_2
    L14_2 = L14_2(L15_2, L16_2)
    if not L14_2 then
      L13_2 = nil
      L14_2 = pairs
      L15_2 = luci
      L15_2 = L15_2.config
      L15_2 = L15_2.themes
      L14_2, L15_2, L16_2 = L14_2(L15_2)
      for L17_2, L18_2 in L14_2, L15_2, L16_2 do
        L20_2 = L17_2
        L19_2 = L17_2.sub
        L21_2 = 1
        L22_2 = 1
        L19_2 = L19_2(L20_2, L21_2, L22_2)
        if L19_2 ~= "." then
          L19_2 = pcall
          L20_2 = L12_2.Template
          L21_2 = L0_1
          L21_2 = L21_2.basename
          L22_2 = L18_2
          L21_2 = L21_2(L22_2)
          L21_2 = "themes/%s/header" % L21_2
          L19_2 = L19_2(L20_2, L21_2)
          if L19_2 then
            L13_2 = L18_2
          end
        end
      end
      L14_2 = assert
      L15_2 = L13_2
      L16_2 = "No valid theme found"
      L14_2(L15_2, L16_2)
    end
    
    function L14_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
      if A0_3 then
        L3_3 = getfenv
        L4_3 = 3
        L3_3 = L3_3(L4_3)
        L4_3 = type
        L5_3 = L3_3.self
        L4_3 = L4_3(L5_3)
        L4_3 = L4_3 == "table" and L4_3
        L5_3 = string
        L5_3 = L5_3.format
        L6_3 = " %s=\"%s\""
        L7_3 = tostring
        L8_3 = A1_3
        L7_3 = L7_3(L8_3)
        L8_3 = luci
        L8_3 = L8_3.util
        L8_3 = L8_3.pcdata
        L9_3 = tostring
        L10_3 = A2_3 or L10_3
        if not A2_3 then
          L10_3 = type
          L11_3 = L3_3[A1_3]
          L10_3 = L10_3(L11_3)
          if L10_3 ~= "function" then
            L10_3 = L3_3[A1_3]
            if L10_3 then
              goto lbl_46
            end
          end
          if L4_3 then
            L10_3 = type
            L11_3 = L4_3[A1_3]
            L10_3 = L10_3(L11_3)
            if L10_3 ~= "function" then
              L10_3 = L4_3[A1_3]
              if L10_3 then
                goto lbl_46
              end
            end
          end
          L10_3 = ""
        end
        ::lbl_46::
        L9_3, L10_3, L11_3 = L9_3(L10_3)
        L8_3, L9_3, L10_3, L11_3 = L8_3(L9_3, L10_3, L11_3)
        return L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
      else
        L3_3 = ""
        return L3_3
      end
    end
    
    L15_2 = L12_2.context
    L16_2 = setmetatable
    L17_2 = {}
    L18_2 = luci
    L18_2 = L18_2.http
    L18_2 = L18_2.write
    L17_2.write = L18_2
    
    function L18_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3
      L1_3 = _UPVALUE0_
      L1_3 = L1_3.Template
      L2_3 = A0_3
      L1_3 = L1_3(L2_3)
      L2_3 = L1_3
      L1_3 = L1_3.render
      L3_3 = getfenv
      L4_3 = 2
      L3_3, L4_3 = L3_3(L4_3)
      L1_3(L2_3, L3_3, L4_3)
    end
    
    L17_2.include = L18_2
    L18_2 = i18n
    L18_2 = L18_2.translate
    L17_2.translate = L18_2
    L18_2 = i18n
    L18_2 = L18_2.translatef
    L17_2.translatef = L18_2
    
    function L18_2(A0_3, A1_3)
      local L2_3
      L2_3 = _UPVALUE0_
      L2_3 = L2_3.context
      L2_3 = L2_3.viewns
      L2_3 = L2_3[A0_3]
      if L2_3 == nil then
        L2_3 = _UPVALUE0_
        L2_3 = L2_3.context
        L2_3 = L2_3.viewns
        L2_3[A0_3] = A1_3
      end
    end
    
    L17_2.export = L18_2
    L18_2 = _UPVALUE1_
    L18_2 = L18_2.striptags
    L17_2.striptags = L18_2
    L18_2 = _UPVALUE1_
    L18_2 = L18_2.pcdata
    L17_2.pcdata = L18_2
    L17_2.media = L13_2
    L18_2 = L0_1
    L18_2 = L18_2.basename
    L19_2 = L13_2
    L18_2 = L18_2(L19_2)
    L17_2.theme = L18_2
    L18_2 = luci
    L18_2 = L18_2.config
    L18_2 = L18_2.main
    L18_2 = L18_2.resourcebase
    L17_2.resource = L18_2
    
    function L18_2(...)
      local L1_3, L2_3
      L1_3 = _UPVALUE0_
      L2_3 = ...
      return L1_3(L2_3)
    end
    
    L17_2.ifattr = L18_2
    
    function L18_2(...)
      local L1_3, L2_3, L3_3
      L1_3 = _UPVALUE0_
      L2_3 = true
      L3_3 = ...
      return L1_3(L2_3, L3_3)
    end
    
    L17_2.attr = L18_2
    L18_2 = {}
    
    function L19_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3
      if A1_3 == "controller" then
        L2_3 = build_url
        return L2_3()
      elseif A1_3 == "stok_key" then
        L2_3 = _UPVALUE0_
        L2_3 = L2_3.urltoken
        L2_3 = L2_3.stok
        return L2_3
      elseif A1_3 == "REQUEST_URI" then
        L2_3 = build_url
        L3_3 = unpack
        L4_3 = _UPVALUE0_
        L4_3 = L4_3.requestpath
        L3_3, L4_3 = L3_3(L4_3)
        return L2_3(L3_3, L4_3)
      else
        L2_3 = rawget
        L3_3 = A0_3
        L4_3 = A1_3
        L2_3 = L2_3(L3_3, L4_3)
        if not L2_3 then
          L2_3 = _G
          L2_3 = L2_3[A1_3]
        end
        return L2_3
      end
    end
    
    L18_2.__index = L19_2
    L16_2 = L16_2(L17_2, L18_2)
    L15_2.viewns = L16_2
  end
  L12_2 = L6_2.dependent
  L12_2 = L12_2 ~= false
  L6_2.dependent = L12_2
  L12_2 = assert
  L13_2 = L6_2.dependent
  L13_2 = L6_2.auto
  L13_2 = not L13_2 or L13_2
  L14_2 = [[
Access Violation
The page at ']]
  L15_2 = table
  L15_2 = L15_2.concat
  L16_2 = A0_2
  L17_2 = "/"
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = "/' "
  L17_2 = "has no parent node so the access to this location has been denied.\n"
  L18_2 = "This is a software bug, please report this message at "
  L19_2 = "http://luci.subsignal.org/trac/newticket"
  L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
  L12_2(L13_2, L14_2)
  L12_2 = L6_2.sysauth
  if L12_2 then
    L12_2 = require
    L13_2 = "luci.sauth"
    L12_2 = L12_2(L13_2)
    L13_2 = require
    L14_2 = "luci.model.accountmgnt"
    L13_2 = L13_2(L14_2)
    L14_2 = type
    L15_2 = L6_2.sysauth_authenticator
    L14_2 = L14_2(L15_2)
    if L14_2 == "function" then
      L14_2 = L6_2.sysauth_authenticator
      if L14_2 then
        goto lbl_281
      end
    end
    L14_2 = authenticator
    L15_2 = L6_2.sysauth_authenticator
    L14_2 = L14_2[L15_2]
    ::lbl_281::
    L15_2 = type
    L16_2 = L6_2.sysauth
    L15_2 = L15_2(L16_2)
    L15_2 = L15_2 == "string" and L15_2
    L16_2 = L1_2.authsession
    L17_2 = false
    if not L16_2 then
      L18_2 = luci
      L18_2 = L18_2.http
      L18_2 = L18_2.getcookie
      L19_2 = "sysauth"
      L18_2 = L18_2(L19_2)
      L16_2 = L18_2
      if L16_2 then
        L19_2 = L16_2
        L18_2 = L16_2.match
        L20_2 = "^[a-f0-9]*$"
        L18_2 = L18_2(L19_2, L20_2)
        L16_2 = L18_2
      end
      L17_2 = true
    end
    L18_2 = L12_2.read
    L19_2 = L16_2
    L18_2 = L18_2(L19_2)
    L19_2 = nil
    if L18_2 then
      if not L17_2 then
        L19_2 = L18_2.user
      else
        L20_2 = L1_2.urltoken
        L20_2 = L20_2.stok
        L21_2 = L18_2.token
        if L20_2 == L21_2 then
          L20_2 = require
          L21_2 = "luci.model.checktypes"
          L20_2 = L20_2(L21_2)
          L21_2 = _UPVALUE3_
          L21_2 = L21_2.getenv
          L22_2 = "REMOTE_ADDR"
          L21_2 = L21_2(L22_2)
          L22_2 = L20_2.check_ip_in_lan
          L23_2 = L21_2
          L22_2 = L22_2(L23_2)
          L22_2 = not L22_2
          L23_2 = L18_2.remote
          if L22_2 == L23_2 then
            if L22_2 then
              L23_2 = L18_2.addr
              if L23_2 == L21_2 then
                L23_2 = L20_2.check_safe_request
                L24_2 = L1_2.request
                L23_2 = L23_2(L24_2)
                if L23_2 then
                  L19_2 = L18_2.user
                else
                  L23_2 = error_json
                  L24_2 = "permission denied"
                  return L23_2(L24_2)
                end
              end
            else
              L23_2 = require
              L24_2 = "luci.model.app_clientmgmt"
              L23_2 = L23_2(L24_2)
              L24_2 = L23_2.get_mac_by_ip
              L25_2 = L21_2
              L24_2 = L24_2(L25_2)
              if not L24_2 then
                L25_2 = _UPVALUE4_
                L26_2 = L21_2
                L25_2 = L25_2(L26_2)
                L24_2 = L25_2
              end
              L25_2 = assert
              L26_2 = L24_2
              L27_2 = "lan mac is nil!"
              L25_2(L26_2, L27_2)
              L25_2 = L18_2.addr
              if L25_2 == L24_2 then
                L19_2 = L18_2.user
              end
            end
          end
        end
      end
    else
      L20_2 = _UPVALUE0_
      L20_2 = L20_2.getenv
      L21_2 = "HTTP_AUTH_USER"
      L20_2 = L20_2(L21_2)
      L21_2 = _UPVALUE0_
      L21_2 = L21_2.getenv
      L22_2 = "HTTP_AUTH_PASS"
      L21_2 = L21_2(L22_2)
      if L20_2 and L21_2 then
        L22_2 = L13_2.acc_check
        L23_2 = L20_2
        L24_2 = L21_2
        L22_2 = L22_2(L23_2, L24_2)
        if L22_2 then
          L19_2 = L20_2
        end
      end
    end
    if not L19_2 then
      L20_2 = error_json
      L21_2 = "timeout"
      return L20_2(L21_2)
    else
      L20_2 = L12_2.touch
      L21_2 = L16_2
      L22_2 = L18_2
      L20_2(L21_2, L22_2)
      L1_2.authsession = L16_2
      L1_2.authuser = L19_2
    end
  end
  L12_2 = L6_2.setgroup
  if L12_2 then
    L12_2 = luci
    L12_2 = L12_2.sys
    L12_2 = L12_2.process
    L12_2 = L12_2.setgroup
    L13_2 = L6_2.setgroup
    L12_2(L13_2)
  end
  L12_2 = L6_2.setuser
  if L12_2 then
    L12_2 = luci
    L12_2 = L12_2.sys
    L12_2 = L12_2.process
    L12_2 = L12_2.setuser
    L13_2 = L6_2.setuser
    L12_2(L13_2)
  end
  L12_2 = nil
  if L4_2 then
    L13_2 = type
    L14_2 = L4_2.target
    L13_2 = L13_2(L14_2)
    if L13_2 == "function" then
      L12_2 = L4_2.target
    else
      L13_2 = type
      L14_2 = L4_2.target
      L13_2 = L13_2(L14_2)
      if L13_2 == "table" then
        L13_2 = L4_2.target
        L12_2 = L13_2.target
      end
    end
  end
  if L4_2 then
    L13_2 = L4_2.index
    if not L13_2 then
      L13_2 = type
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      if L13_2 ~= "function" then
        goto lbl_457
      end
    end
    L1_2.dispatched = L4_2
    L13_2 = L1_2.requested
    if not L13_2 then
      L13_2 = L1_2.dispatched
    end
    L1_2.requested = L13_2
  end
  ::lbl_457::
  if L4_2 then
    L13_2 = L4_2.index
    if L13_2 then
      L13_2 = require
      L14_2 = "luci.template"
      L13_2 = L13_2(L14_2)
      L14_2 = _UPVALUE1_
      L14_2 = L14_2.copcall
      L15_2 = L13_2.render
      L16_2 = "indexer"
      L17_2 = {}
      L14_2 = L14_2(L15_2, L16_2, L17_2)
      if L14_2 then
        L14_2 = true
        return L14_2
      end
    end
  end
  L13_2 = type
  L14_2 = L12_2
  L13_2 = L13_2(L14_2)
  if L13_2 == "function" then
    L13_2 = _UPVALUE1_
    L13_2 = L13_2.copcall
    
    function L14_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = getfenv
      L1_3 = _UPVALUE0_
      L0_3 = L0_3(L1_3)
      L1_3 = require
      L2_3 = _UPVALUE1_
      L2_3 = L2_3.module
      L1_3 = L1_3(L2_3)
      L2_3 = setmetatable
      L3_3 = {}
      L4_3 = {}
      
      function L5_3(A0_4, A1_4)
        local L2_4, L3_4, L4_4
        L2_4 = rawget
        L3_4 = A0_4
        L4_4 = A1_4
        L2_4 = L2_4(L3_4, L4_4)
        if not L2_4 then
          L2_4 = _UPVALUE0_
          L2_4 = L2_4[A1_4]
          if not L2_4 then
            L2_4 = L0_3
            L2_4 = L2_4[A1_4]
          end
        end
        return L2_4
      end
      
      L4_3.__index = L5_3
      L2_3 = L2_3(L3_3, L4_3)
      L3_3 = setfenv
      L4_3 = _UPVALUE0_
      L5_3 = L2_3
      L3_3(L4_3, L5_3)
    end
    
    L13_2(L14_2)
    L13_2 = nil
    L14_2 = nil
    L15_2 = type
    L16_2 = L4_2.target
    L15_2 = L15_2(L16_2)
    if L15_2 == "table" then
      L15_2 = _UPVALUE1_
      L15_2 = L15_2.copcall
      L16_2 = L12_2
      L17_2 = L4_2.target
      L18_2 = unpack
      L19_2 = L7_2
      L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L18_2(L19_2)
      L15_2, L16_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
      L14_2 = L16_2
      L13_2 = L15_2
    else
      L15_2 = _UPVALUE1_
      L15_2 = L15_2.copcall
      L16_2 = L12_2
      L17_2 = unpack
      L18_2 = L7_2
      L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L17_2(L18_2)
      L15_2, L16_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
      L14_2 = L16_2
      L13_2 = L15_2
    end
    L15_2 = assert
    L16_2 = L13_2
    L17_2 = "Failed to execute "
    L18_2 = type
    L19_2 = L4_2.target
    L18_2 = L18_2(L19_2)
    if L18_2 == "function" then
      L18_2 = "function"
      if L18_2 then
        goto lbl_528
      end
    end
    L18_2 = L4_2.target
    L18_2 = L18_2.type
    if not L18_2 then
      L18_2 = "unknown"
    end
    ::lbl_528::
    L19_2 = " dispatcher target for entry '/"
    L20_2 = table
    L20_2 = L20_2.concat
    L21_2 = A0_2
    L22_2 = "/"
    L20_2 = L20_2(L21_2, L22_2)
    L21_2 = "'.\n"
    L22_2 = "The called action terminated with an exception:\n"
    L23_2 = tostring
    L24_2 = L14_2 or L24_2
    if not L14_2 then
      L24_2 = "(unknown)"
    end
    L23_2 = L23_2(L24_2)
    L17_2 = L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2
    L15_2(L16_2, L17_2)
  else
    L13_2 = node
    L13_2 = L13_2()
    if L13_2 then
      L14_2 = L13_2.target
      if L14_2 then
        goto lbl_558
      end
    end
    L14_2 = error404
    L15_2 = "No root node was registered, this usually happens if no module was installed.\n"
    L16_2 = "Install luci-mod-admin-full and retry. "
    L17_2 = "If the module is already installed, try removing the /tmp/luci-indexcache file."
    L15_2 = L15_2 .. L16_2 .. L17_2
    L14_2(L15_2)
    goto lbl_570
    ::lbl_558::
    L14_2 = error404
    L15_2 = "No page is registered at '/"
    L16_2 = table
    L16_2 = L16_2.concat
    L17_2 = A0_2
    L18_2 = "/"
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = "'.\n"
    L18_2 = "If this url belongs to an extension, make sure it is properly installed.\n"
    L19_2 = "If the extension was recently installed, try removing the /tmp/luci-indexcache file."
    L15_2 = L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
    L14_2(L15_2)
  end
  ::lbl_570::
end

dispatch = L9_1

function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = luci
  L0_2 = L0_2.util
  L0_2 = L0_2.libpath
  L0_2 = L0_2()
  L1_2 = "/controller/"
  L0_2 = L0_2 .. L1_2
  L1_2 = {}
  L2_2 = ".lua"
  L3_2 = ".lua.gz"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L2_2 = luci
  L2_2 = L2_2.util
  L2_2 = L2_2.copcall
  L3_2 = require
  L4_2 = "luci.fastindex"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = createindex_fastindex
    L3_2 = L0_2
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
  else
    L2_2 = createindex_plain
    L3_2 = L0_2
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
  end
end

createindex = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = {}
  _UPVALUE0_ = L2_2
  L2_2 = _UPVALUE1_
  if not L2_2 then
    L2_2 = luci
    L2_2 = L2_2.fastindex
    L2_2 = L2_2.new
    L3_2 = "index"
    L2_2 = L2_2(L3_2)
    _UPVALUE1_ = L2_2
    L2_2 = ipairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      L7_2 = _UPVALUE1_
      L7_2 = L7_2.add
      L8_2 = A0_2
      L9_2 = "*"
      L10_2 = L6_2
      L8_2 = L8_2 .. L9_2 .. L10_2
      L7_2(L8_2)
      L7_2 = _UPVALUE1_
      L7_2 = L7_2.add
      L8_2 = A0_2
      L9_2 = "*/*"
      L10_2 = L6_2
      L8_2 = L8_2 .. L9_2 .. L10_2
      L7_2(L8_2)
    end
  end
  L2_2 = _UPVALUE1_
  L2_2 = L2_2.scan
  L2_2()
  L2_2 = pairs
  L3_2 = _UPVALUE1_
  L3_2 = L3_2.indexes
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = _UPVALUE0_
    L8_2 = L6_2[2]
    L9_2 = L6_2[1]
    L7_2[L8_2] = L9_2
  end
end

createindex_fastindex = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = _UPVALUE0_
    L8_2 = L8_2.util
    L8_2 = L8_2.consume
    L9_2 = L0_1
    L9_2 = L9_2.glob
    L10_2 = A0_2
    L11_2 = "*"
    L12_2 = L7_2
    L10_2 = L10_2 .. L11_2 .. L12_2
    L9_2 = L9_2(L10_2)
    L10_2 = L2_2
    L8_2(L9_2, L10_2)
    L8_2 = _UPVALUE0_
    L8_2 = L8_2.util
    L8_2 = L8_2.consume
    L9_2 = L0_1
    L9_2 = L9_2.glob
    L10_2 = A0_2
    L11_2 = "*/*"
    L12_2 = L7_2
    L10_2 = L10_2 .. L11_2 .. L12_2
    L9_2 = L9_2(L10_2)
    L10_2 = L2_2
    L8_2(L9_2, L10_2)
  end
  L3_2 = indexcache
  if L3_2 then
    L3_2 = L0_1
    L3_2 = L3_2.access
    L4_2 = indexcache
    L5_2 = "r"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = loadfile
      L4_2 = indexcache
      L3_2 = L3_2(L4_2)
      L3_2 = L3_2()
      _UPVALUE2_ = L3_2
      L3_2 = _UPVALUE2_
      return L3_2
    end
  end
  L3_2 = {}
  _UPVALUE2_ = L3_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = "luci.controller."
    L10_2 = L7_2
    L9_2 = L7_2.sub
    L11_2 = #A0_2
    L11_2 = L11_2 + 1
    L12_2 = #L7_2
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L10_2 = L9_2
    L9_2 = L9_2.gsub
    L11_2 = "/"
    L12_2 = "."
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L8_2 = L8_2 .. L9_2
    L9_2 = ipairs
    L10_2 = A1_2
    L9_2, L10_2, L11_2 = L9_2(L10_2)
    for L12_2, L13_2 in L9_2, L10_2, L11_2 do
      L15_2 = L8_2
      L14_2 = L8_2.gsub
      L16_2 = L13_2
      L17_2 = "$"
      L16_2 = L16_2 .. L17_2
      L17_2 = ""
      L14_2 = L14_2(L15_2, L16_2, L17_2)
      L8_2 = L14_2
    end
    L9_2 = require
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    L10_2 = assert
    L11_2 = L9_2 ~= true
    L12_2 = "Invalid controller file found\n"
    L13_2 = "The file '"
    L14_2 = L7_2
    L15_2 = "' contains an invalid module line.\n"
    L16_2 = "Please verify whether the module name is set to '"
    L17_2 = L8_2
    L18_2 = "' - It must correspond to the file path!"
    L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
    L10_2(L11_2, L12_2)
    L10_2 = L9_2.index
    L11_2 = assert
    L12_2 = type
    L13_2 = L10_2
    L12_2 = L12_2(L13_2)
    L12_2 = L12_2 == "function"
    L13_2 = "Invalid controller file found\n"
    L14_2 = "The file '"
    L15_2 = L7_2
    L16_2 = "' contains no index() function.\n"
    L17_2 = "Please make sure that the controller contains a valid "
    L18_2 = "index function and verify the spelling!"
    L13_2 = L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
    L11_2(L12_2, L13_2)
    L11_2 = _UPVALUE2_
    L11_2[L8_2] = L10_2
  end
  L3_2 = indexcache
  if L3_2 then
    L3_2 = _UPVALUE0_
    L3_2 = L3_2.open
    L4_2 = indexcache
    L5_2 = "w"
    L6_2 = 600
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L5_2 = L3_2
    L4_2 = L3_2.writeall
    L6_2 = _UPVALUE3_
    L6_2 = L6_2.get_bytecode
    L7_2 = _UPVALUE2_
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L6_2(L7_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
    L5_2 = L3_2
    L4_2 = L3_2.close
    L4_2(L5_2)
  end
end

createindex_plain = L9_1

function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = _UPVALUE0_
  if not L0_2 then
    L0_2 = createindex
    L0_2()
  end
  L0_2 = context
  L1_2 = {}
  L2_2 = {}
  L1_2.nodes = L2_2
  L1_2.inreq = true
  L2_2 = {}
  L3_2 = setmetatable
  L4_2 = {}
  L5_2 = {}
  L5_2.__mode = "v"
  L3_2 = L3_2(L4_2, L5_2)
  L0_2.treecache = L3_2
  L0_2.tree = L1_2
  L0_2.modifiers = L2_2
  L3_2 = require
  L4_2 = "luci.i18n"
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.loadc
  L4_2 = "base"
  L3_2(L4_2)
  L3_2 = setmetatable
  L4_2 = {}
  L5_2 = {}
  L6_2 = luci
  L6_2 = L6_2.dispatcher
  L5_2.__index = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = pairs
  L5_2 = _UPVALUE0_
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L3_2._NAME = L7_2
    L9_2 = setfenv
    L10_2 = L8_2
    L11_2 = L3_2
    L9_2(L10_2, L11_2)
    L9_2 = L8_2
    L9_2()
  end
  
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = _UPVALUE0_
    L2_3 = L2_3[A0_3]
    L2_3 = L2_3.order
    L3_3 = _UPVALUE0_
    L3_3 = L3_3[A1_3]
    L3_3 = L3_3.order
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  
  L5_2 = _UPVALUE1_
  L5_2 = L5_2.spairs
  L6_2 = L2_2
  L7_2 = L4_2
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = L9_2.module
    L3_2._NAME = L10_2
    L10_2 = setfenv
    L11_2 = L9_2.func
    L12_2 = L3_2
    L10_2(L11_2, L12_2)
    L10_2 = L9_2.func
    L10_2()
  end
  return L1_2
end

createtree = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = context
  L2_2 = L2_2.modifiers
  L3_2 = context
  L3_2 = L3_2.modifiers
  L3_2 = #L3_2
  L3_2 = L3_2 + 1
  L4_2 = {}
  L4_2.func = A0_2
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = 0
  end
  L4_2.order = L5_2
  L5_2 = getfenv
  L6_2 = 2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2._NAME
  L4_2.module = L5_2
  L2_2[L3_2] = L4_2
end

modifier = L9_1

function L9_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = node
  L5_2 = unpack
  L6_2 = A0_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2.nodes = nil
  L4_2.module = nil
  L4_2.title = A2_2
  L4_2.order = A3_2
  L5_2 = setmetatable
  L6_2 = L4_2
  L7_2 = {}
  L8_2 = _create_node
  L9_2 = A1_2
  L8_2 = L8_2(L9_2)
  L7_2.__index = L8_2
  L5_2(L6_2, L7_2)
  return L4_2
end

assign = L9_1

function L9_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = node
  L5_2 = unpack
  L6_2 = A0_2
  L5_2, L6_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2)
  L4_2.target = A1_2
  L4_2.title = A2_2
  L4_2.order = A3_2
  L5_2 = getfenv
  L6_2 = 2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2._NAME
  L4_2.module = L5_2
  return L4_2
end

entry = L9_1

function L9_1(...)
  local L1_2, L2_2, L3_2
  L1_2 = _create_node
  L2_2 = {}
  L3_2 = ...
  L2_2[1] = L3_2
  return L1_2(L2_2)
end

get = L9_1

function L9_1(...)
  local L1_2, L2_2, L3_2
  L1_2 = _create_node
  L2_2 = {}
  L3_2 = ...
  L2_2[1] = L3_2
  L1_2 = L1_2(L2_2)
  L2_2 = getfenv
  L3_2 = 2
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2._NAME
  L1_2.module = L2_2
  L1_2.auto = nil
  return L1_2
end

node = L9_1

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = #A0_2
  if L1_2 == 0 then
    L1_2 = context
    L1_2 = L1_2.tree
    return L1_2
  end
  L1_2 = table
  L1_2 = L1_2.concat
  L2_2 = A0_2
  L3_2 = "."
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = context
  L2_2 = L2_2.treecache
  L2_2 = L2_2[L1_2]
  if not L2_2 then
    L3_2 = table
    L3_2 = L3_2.remove
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = _create_node
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L5_2 = {}
    L6_2 = {}
    L5_2.nodes = L6_2
    L5_2.auto = true
    L2_2 = L5_2
    L5_2 = L4_2.inreq
    if L5_2 then
      L5_2 = context
      L5_2 = L5_2.path
      L6_2 = #A0_2
      L6_2 = L6_2 + 1
      L5_2 = L5_2[L6_2]
      if L5_2 == L3_2 then
        L2_2.inreq = true
      end
    end
    L5_2 = L4_2.nodes
    L5_2[L3_2] = L2_2
    L5_2 = context
    L5_2 = L5_2.treecache
    L5_2[L1_2] = L2_2
  end
  return L2_2
end

_create_node = L9_1

function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = {}
  L1_2 = unpack
  L2_2 = context
  L2_2 = L2_2.path
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L1_2(L2_2)
  L0_2[1] = L1_2
  L0_2[2] = L2_2
  L0_2[3] = L3_2
  L0_2[4] = L4_2
  L0_2[5] = L5_2
  L0_2[6] = L6_2
  L0_2[7] = L7_2
  L0_2[8] = L8_2
  L0_2[9] = L9_2
  L0_2[10] = L10_2
  L0_2[11] = L11_2
  L0_2[12] = L12_2
  L1_2 = table
  L1_2 = L1_2.concat
  L2_2 = L0_2
  L3_2 = "."
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = context
  L2_2 = L2_2.treecache
  L2_2 = L2_2[L1_2]
  L3_2 = nil
  if L2_2 then
    L4_2 = L2_2.nodes
    if L4_2 then
      L4_2 = next
      L5_2 = L2_2.nodes
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L4_2 = nil
        L5_2 = nil
        L6_2 = pairs
        L7_2 = L2_2.nodes
        L6_2, L7_2, L8_2 = L6_2(L7_2)
        for L9_2, L10_2 in L6_2, L7_2, L8_2 do
          if L3_2 then
            L11_2 = L10_2.order
            if not L11_2 then
              L11_2 = 100
            end
            L12_2 = L2_2.nodes
            L12_2 = L12_2[L3_2]
            L12_2 = L12_2.order
            if not L12_2 then
              L12_2 = 100
            end
            if not (L11_2 < L12_2) then
              goto lbl_46
            end
          end
          L3_2 = L9_2
          ::lbl_46::
        end
      end
    end
  end
  L4_2 = assert
  L5_2 = L3_2 ~= nil
  L6_2 = "The requested node contains no childs, unable to redispatch"
  L4_2(L5_2, L6_2)
  L4_2 = #L0_2
  L4_2 = L4_2 + 1
  L0_2[L4_2] = L3_2
  L4_2 = dispatch
  L5_2 = L0_2
  L4_2(L5_2)
end

_firstchild = L9_1

function L9_1()
  local L0_2, L1_2
  L0_2 = {}
  L0_2.type = "firstchild"
  L1_2 = _firstchild
  L0_2.target = L1_2
  return L0_2
end

firstchild = L9_1

function L9_1(...)
  local L1_2, L2_2
  L1_2 = {}
  L2_2 = ...
  L1_2[1] = L2_2
  
  function L2_2(...)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = ipairs
    L2_3 = {}
    L3_3, L4_3, L5_3, L6_3, L7_3 = ...
    L2_3[1] = L3_3
    L2_3[2] = L4_3
    L2_3[3] = L5_3
    L2_3[4] = L6_3
    L2_3[5] = L7_3
    L1_3, L2_3, L3_3 = L1_3(L2_3)
    for L4_3, L5_3 in L1_3, L2_3, L3_3 do
      L6_3 = _UPVALUE0_
      L7_3 = _UPVALUE0_
      L7_3 = #L7_3
      L7_3 = L7_3 + 1
      L6_3[L7_3] = L5_3
    end
    L1_3 = dispatch
    L2_3 = _UPVALUE0_
    L1_3(L2_3)
  end
  
  return L2_2
end

alias = L9_1

function L9_1(A0_2, ...)
  local L2_2, L3_2
  L2_2 = {}
  L3_2 = ...
  L2_2[1] = L3_2
  
  function L3_2(...)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = _UPVALUE0_
    L1_3 = L1_3.clone
    L2_3 = context
    L2_3 = L2_3.dispatched
    L1_3 = L1_3(L2_3)
    L2_3 = 1
    L3_3 = A0_2
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = table
      L6_3 = L6_3.remove
      L7_3 = L1_3
      L8_3 = 1
      L6_3(L7_3, L8_3)
    end
    L2_3 = ipairs
    L3_3 = _UPVALUE2_
    L2_3, L3_3, L4_3 = L2_3(L3_3)
    for L5_3, L6_3 in L2_3, L3_3, L4_3 do
      L7_3 = table
      L7_3 = L7_3.insert
      L8_3 = L1_3
      L9_3 = L5_3
      L10_3 = L6_3
      L7_3(L8_3, L9_3, L10_3)
    end
    L2_3 = ipairs
    L3_3 = {}
    L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = ...
    L3_3[1] = L4_3
    L3_3[2] = L5_3
    L3_3[3] = L6_3
    L3_3[4] = L7_3
    L3_3[5] = L8_3
    L3_3[6] = L9_3
    L3_3[7] = L10_3
    L2_3, L3_3, L4_3 = L2_3(L3_3)
    for L5_3, L6_3 in L2_3, L3_3, L4_3 do
      L7_3 = #L1_3
      L7_3 = L7_3 + 1
      L1_3[L7_3] = L6_3
    end
    L2_3 = dispatch
    L3_3 = L1_3
    L2_3(L3_3)
  end
  
  return L3_2
end

rewrite = L9_1

function L9_1(A0_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = getfenv
  L2_2 = L2_2()
  L3_2 = A0_2.name
  L2_2 = L2_2[L3_2]
  L3_2 = assert
  L4_2 = L2_2 ~= nil
  L5_2 = "Cannot resolve function \""
  L6_2 = A0_2.name
  L7_2 = "\". Is it misspelled or local?"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L3_2(L4_2, L5_2)
  L3_2 = assert
  L4_2 = type
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 == "function"
  L5_2 = "The symbol \""
  L6_2 = A0_2.name
  L7_2 = "\" does not refer to a function but data "
  L8_2 = "of type \""
  L9_2 = type
  L10_2 = L2_2
  L9_2 = L9_2(L10_2)
  L10_2 = "\"."
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
  L3_2(L4_2, L5_2)
  L3_2 = A0_2.argv
  L3_2 = #L3_2
  if 0 < L3_2 then
    L3_2 = L2_2
    L4_2 = unpack
    L5_2 = A0_2.argv
    L4_2 = L4_2(L5_2)
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = ...
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  else
    L3_2 = L2_2
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = ...
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  end
end

function L10_1(A0_2, ...)
  local L2_2, L3_2, L4_2
  L2_2 = {}
  L2_2.type = "call"
  L3_2 = {}
  L4_2 = ...
  L3_2[1] = L4_2
  L2_2.argv = L3_2
  L2_2.name = A0_2
  L3_2 = _UPVALUE0_
  L2_2.target = L3_2
  return L2_2
end

call = L10_1

function L10_1(A0_2, ...)
  local L2_2, L3_2
  L2_2 = require
  L3_2 = "luci.template"
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.render
  L3_2 = A0_2.view
  L2_2(L3_2)
end

function L11_1(A0_2)
  local L1_2, L2_2
  L1_2 = {}
  L1_2.type = "template"
  L1_2.view = A0_2
  L2_2 = _UPVALUE0_
  L1_2.target = L2_2
  return L1_2
end

template = L11_1

function L11_1(A0_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L2_2 = require
  L3_2 = "luci.cbi"
  L2_2 = L2_2(L3_2)
  L3_2 = require
  L4_2 = "luci.template"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "luci.http"
  L4_2 = L4_2(L5_2)
  L5_2 = A0_2.config
  if not L5_2 then
    L5_2 = {}
  end
  L6_2 = L2_2.load
  L7_2 = A0_2.model
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = ...
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  L7_2 = nil
  L8_2 = ipairs
  L9_2 = L6_2
  L8_2, L9_2, L10_2 = L8_2(L9_2)
  for L11_2, L12_2 in L8_2, L9_2, L10_2 do
    L12_2.flow = L5_2
    L14_2 = L12_2
    L13_2 = L12_2.parse
    L13_2 = L13_2(L14_2)
    if L13_2 and (not L7_2 or L7_2 > L13_2) then
      L7_2 = L13_2
    end
  end
  
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = type
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if L1_3 == "table" then
      L1_3 = build_url
      L2_3 = unpack
      L3_3 = A0_3
      L2_3, L3_3 = L2_3(L3_3)
      L1_3 = L1_3(L2_3, L3_3)
      if L1_3 then
        goto lbl_14
      end
    end
    L1_3 = A0_3
    ::lbl_14::
    return L1_3
  end
  
  L9_2 = L5_2.on_valid_to
  if L9_2 and L7_2 and 0 < L7_2 and L7_2 < 2 then
    L9_2 = L4_2.redirect
    L10_2 = L8_2
    L11_2 = L5_2.on_valid_to
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L10_2(L11_2)
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    return
  end
  L9_2 = L5_2.on_changed_to
  if L9_2 and L7_2 and 1 < L7_2 then
    L9_2 = L4_2.redirect
    L10_2 = L8_2
    L11_2 = L5_2.on_changed_to
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L10_2(L11_2)
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    return
  end
  L9_2 = L5_2.on_success_to
  if L9_2 and L7_2 and 0 < L7_2 then
    L9_2 = L4_2.redirect
    L10_2 = L8_2
    L11_2 = L5_2.on_success_to
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L10_2(L11_2)
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    return
  end
  L9_2 = L5_2.state_handler
  if L9_2 then
    L9_2 = L5_2.state_handler
    L10_2 = L7_2
    L11_2 = L6_2
    L9_2 = L9_2(L10_2, L11_2)
    if not L9_2 then
      return
    end
  end
  L9_2 = L4_2.header
  L10_2 = "X-CBI-State"
  L11_2 = L7_2 or L11_2
  if not L7_2 then
    L11_2 = 0
  end
  L9_2(L10_2, L11_2)
  L9_2 = L5_2.noheader
  if not L9_2 then
    L9_2 = L3_2.render
    L10_2 = "cbi/header"
    L11_2 = {}
    L11_2.state = L7_2
    L9_2(L10_2, L11_2)
  end
  L9_2 = nil
  L10_2 = nil
  L11_2 = false
  L12_2 = true
  L13_2 = {}
  L14_2 = ipairs
  L15_2 = L6_2
  L14_2, L15_2, L16_2 = L14_2(L15_2)
  for L17_2, L18_2 in L14_2, L15_2, L16_2 do
    L19_2 = L18_2.apply_needed
    if L19_2 then
      L19_2 = L18_2.parsechain
      if L19_2 then
        L19_2 = nil
        L20_2 = ipairs
        L21_2 = L18_2.parsechain
        L20_2, L21_2, L22_2 = L20_2(L21_2)
        for L23_2, L24_2 in L20_2, L21_2, L22_2 do
          L25_2 = #L13_2
          L25_2 = L25_2 + 1
          L13_2[L25_2] = L24_2
        end
        L11_2 = true
      end
    end
    L19_2 = L18_2.redirect
    if L19_2 and not L9_2 then
      L9_2 = L18_2.redirect
    end
    L19_2 = L18_2.pageaction
    if L19_2 == false then
      L12_2 = false
    end
    L19_2 = L18_2.message
    if L19_2 then
      if not L10_2 then
        L19_2 = {}
        L10_2 = L19_2
      end
      L19_2 = #L10_2
      L19_2 = L19_2 + 1
      L20_2 = L18_2.message
      L10_2[L19_2] = L20_2
    end
  end
  L14_2 = ipairs
  L15_2 = L6_2
  L14_2, L15_2, L16_2 = L14_2(L15_2)
  for L17_2, L18_2 in L14_2, L15_2, L16_2 do
    L20_2 = L18_2
    L19_2 = L18_2.render
    L21_2 = {}
    L22_2 = L17_2 == 1
    L21_2.firstmap = L22_2
    L21_2.applymap = L11_2
    L21_2.redirect = L9_2
    L21_2.messages = L10_2
    L21_2.pageaction = L12_2
    L21_2.parsechain = L13_2
    L19_2(L20_2, L21_2)
  end
  L14_2 = L5_2.nofooter
  if not L14_2 then
    L14_2 = L3_2.render
    L15_2 = "cbi/footer"
    L16_2 = {}
    L16_2.flow = L5_2
    L16_2.pageaction = L12_2
    L16_2.redirect = L9_2
    L16_2.state = L7_2
    L17_2 = L5_2.autoapply
    L16_2.autoapply = L17_2
    L14_2(L15_2, L16_2)
  end
end

function L12_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = {}
  L2_2.type = "cbi"
  L2_2.config = A1_2
  L2_2.model = A0_2
  L3_2 = _UPVALUE0_
  L2_2.target = L3_2
  return L2_2
end

cbi = L12_1

function L12_1(A0_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = {}
  L3_2, L4_2, L5_2, L6_2, L7_2 = ...
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L3_2 = #L2_2
  if 0 < L3_2 then
    L3_2 = A0_2.targets
    L3_2 = L3_2[2]
    if L3_2 then
      goto lbl_13
    end
  end
  L3_2 = A0_2.targets
  L3_2 = L3_2[1]
  ::lbl_13::
  L4_2 = setfenv
  L5_2 = L3_2.target
  L6_2 = A0_2.env
  L4_2(L5_2, L6_2)
  L5_2 = L3_2
  L4_2 = L3_2.target
  L6_2 = unpack
  L7_2 = L2_2
  L6_2, L7_2 = L6_2(L7_2)
  L4_2(L5_2, L6_2, L7_2)
end

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = {}
  L2_2.type = "arcombine"
  L3_2 = getfenv
  L3_2 = L3_2()
  L2_2.env = L3_2
  L3_2 = _UPVALUE0_
  L2_2.target = L3_2
  L3_2 = {}
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L2_2.targets = L3_2
  return L2_2
end

arcombine = L13_1

function L13_1(A0_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = require
  L3_2 = "luci.cbi"
  L2_2 = L2_2(L3_2)
  L3_2 = require
  L4_2 = "luci.template"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "luci.http"
  L4_2 = L4_2(L5_2)
  L5_2 = luci
  L5_2 = L5_2.cbi
  L5_2 = L5_2.load
  L6_2 = A0_2.model
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = ...
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2 = nil
  L7_2 = ipairs
  L8_2 = L5_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L13_2 = L11_2
    L12_2 = L11_2.parse
    L12_2 = L12_2(L13_2)
    if L12_2 and (not L6_2 or L6_2 > L12_2) then
      L6_2 = L12_2
    end
  end
  L7_2 = L4_2.header
  L8_2 = "X-CBI-State"
  L9_2 = L6_2 or L9_2
  if not L6_2 then
    L9_2 = 0
  end
  L7_2(L8_2, L9_2)
  L7_2 = L3_2.render
  L8_2 = "header"
  L7_2(L8_2)
  L7_2 = ipairs
  L8_2 = L5_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L13_2 = L11_2
    L12_2 = L11_2.render
    L12_2(L13_2)
  end
  L7_2 = L3_2.render
  L8_2 = "footer"
  L7_2(L8_2)
end

function L14_1(A0_2)
  local L1_2, L2_2
  L1_2 = {}
  L1_2.type = "cbi"
  L1_2.model = A0_2
  L2_2 = _UPVALUE0_
  L1_2.target = L2_2
  return L1_2
end

form = L14_1
L14_1 = i18n
L14_1 = L14_1.translate
translate = L14_1

function L14_1(A0_2)
  local L1_2
  return A0_2
end

_ = L14_1
