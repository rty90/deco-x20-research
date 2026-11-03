local L0_1, L1_1, L2_1
L0_1 = module
L1_1 = "luci.controller.admin.index"
L2_1 = package
L2_1 = L2_1.seeall
L0_1(L1_1, L2_1)

function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = require
  L1_2 = "luci.http"
  L0_2 = L0_2(L1_2)
  L1_2 = L0_2.status
  L2_2 = 403
  L3_2 = "Forbidden"
  L1_2(L2_2, L3_2)
  L1_2 = L0_2.prepare_content
  L2_2 = "text/plain"
  L1_2(L2_2)
  L1_2 = L0_2.write
  L2_2 = "Forbidden"
  L1_2(L2_2)
end

function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = node
  L0_2 = L0_2()
  L1_2 = L0_1
  L0_2.target = L1_2
  L1_2 = node
  L2_2 = "admin"
  L1_2 = L1_2(L2_2)
  L2_2 = L0_1
  L1_2.target = L2_2
  L1_2.sysauth = true
  L1_2.ucidata = true
end

index = L1_1
