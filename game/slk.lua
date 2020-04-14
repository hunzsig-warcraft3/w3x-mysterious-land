--SLK系统

--shop
local len = cj.LoadInteger(cg.hash_myslk, cj.StringHash("shops"), -1)
for i = 1, len, 1 do
    local v = cj.LoadStr(cg.hash_myslk, cj.StringHash("shops"), i)
    local jv = json.parse(v)
    hRuntime.register.unit(jv)
    game.shops[jv.Name] = jv
end

-- courier 信使
game.courier = json.parse(cg.SLK_COURIER)
game.courier = json.parse(cg.SLK_COURIER)
for _, v in ipairs(game.courier) do
    hRuntime.register.unit(v)
end
--信使技能
local len = cj.LoadInteger(cg.hash_myslk, cj.StringHash("couriers_ab"), -1)
for i = 1, len, 1 do
    local v = cj.LoadStr(cg.hash_myslk, cj.StringHash("couriers_ab"), i)
    local jv = json.parse(v)
    hRuntime.register.ability(jv)
end

-- enemy 敌人单位
game.thisEnemysLen = cj.LoadInteger(cg.hash_myslk, cj.StringHash("thisenemys"), -1)
for k = 1, game.thisEnemysLen, 1 do
    local v = cj.LoadStr(cg.hash_myslk, cj.StringHash("thisenemys"), k)
    local jv = json.parse(v)
    hRuntime.register.unit(jv)
    game.thisEnemys[k] = jv
end

-- enemy boss 敌人BOSS
game.thisEnemysBossLen = cj.LoadInteger(cg.hash_myslk, cj.StringHash("thisenemysboss"), -1)
for k = 1, game.thisEnemysBossLen, 1 do
    local v = cj.LoadStr(cg.hash_myslk, cj.StringHash("thisenemysboss"), k)
    local jv = json.parse(v)
    hRuntime.register.unit(jv)
    game.thisEnemysBoss[k] = jv
end