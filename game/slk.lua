--SLK系统

-- 信使
game.courier = json.parse(cg.SLK_COURIER)
for _, v in ipairs(game.courier) do
    hRuntime.register.unit(v)
end
-- 信使技能
local courier_skill = json.parse(cg.SLK_COURIER_SKILL)
for _, v in ipairs(courier_skill) do
    hRuntime.register.ability(v)
end

-- 商店
game.shops = json.parse(cg.SLK_SHOPS)
for _, v in ipairs(game.shops) do
    hRuntime.register.unit(v)
end

-- 敌人单位
local units = json.parse(cg.SLK_UNITS)
for _, v in ipairs(units) do
    hRuntime.register.unit(v)
    game.name2id.units[v.Name] = v.UNIT_ID
end

-- 敌人单位
game.enemy = json.parse(cg.SLK_ENEMY)
for _, v in ipairs(game.enemy) do
    hRuntime.register.unit(v)
end

-- 敌人BOSS
game.boss = json.parse(cg.SLK_BOSS)
for _, v in ipairs(game.boss) do
    hRuntime.register.unit(v)
end