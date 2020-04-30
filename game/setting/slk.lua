--SLK系统

-- 信使
local courier = json.parse(cg.SLK_COURIER)
for _, v in ipairs(courier) do
    hRuntime.register.unit(v)
    game.name2id.courier[v.Name] = v.UNIT_ID
end
-- 信使技能
local courier_skill = json.parse(cg.SLK_COURIER_SKILL)
for _, v in ipairs(courier_skill) do
    hRuntime.register.ability(v)
end

-- 商店
local shop = json.parse(cg.SLK_SHOPS)
for _, v in ipairs(shop) do
    hRuntime.register.unit(v)
    game.name2id.shop[v.Name] = v.UNIT_ID
end

-- 敌人单位
local unit = json.parse(cg.SLK_UNITS)
for _, v in ipairs(unit) do
    hRuntime.register.unit(v)
    game.name2id.unit[v.Name] = v.UNIT_ID
end

-- 敌人单位
local enemy = json.parse(cg.SLK_ENEMY)
for _, v in ipairs(enemy) do
    hRuntime.register.unit(v)
    game.name2id.enemy[v.Name] = v.UNIT_ID
end

-- 敌人BOSS
local boss = json.parse(cg.SLK_BOSS)
for _, v in ipairs(boss) do
    hRuntime.register.unit(v)
    game.name2id.boss[v.Name] = v.UNIT_ID
end

-- 英雄
local heros = {
    json.parse(cg.SLK_HERO_MOUNTAIN_KING_BOL) --山丘之王
}
for _, v in ipairs(heros) do
    hRuntime.register.unit(v)
    game.name2id.hero[v.Name] = v.UNIT_ID
end