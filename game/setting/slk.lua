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
local enemyWater = json.parse(cg.SLK_ENEMY_WATER)
local enemyFire = json.parse(cg.SLK_ENEMY_FIRE)
local enemySnow = json.parse(cg.SLK_ENEMY_SNOW)
local enemyJungle = json.parse(cg.SLK_ENEMY_JUNGLE)
local enemyMountain = json.parse(cg.SLK_ENEMY_MOUNTAIN)
local enemyRuins = json.parse(cg.SLK_ENEMY_RUINS)
local enemyDark = json.parse(cg.SLK_ENEMY_DARK)
local enemy = table.merge(enemyWater, enemyFire, enemySnow, enemyJungle, enemyMountain, enemyRuins, enemyDark)
for _, v in ipairs(enemy) do
    hRuntime.register.unit(v)
    game.name2id.enemy[v.Name] = v.UNIT_ID
end

-- 敌人BOSS
local bossWater = json.parse(cg.SLK_BOSS_WATER)
local bossFire = json.parse(cg.SLK_BOSS_FIRE)
local bossSnow = json.parse(cg.SLK_BOSS_SNOW)
local bossJungle = json.parse(cg.SLK_BOSS_JUNGLE)
local bossMountain = json.parse(cg.SLK_BOSS_MOUNTAIN)
local bossRuins = json.parse(cg.SLK_BOSS_RUINS)
local bossDark = json.parse(cg.SLK_BOSS_DARK)
local boss = table.merge(bossWater, bossFire, bossSnow, bossJungle, bossMountain, bossRuins, bossDark)
for _, v in ipairs(boss) do
    hRuntime.register.unit(v)
    game.name2id.boss[v.Name] = v.UNIT_ID
end

-- 英雄
local SLK_HERO_BLADE_MASTER_WIND = json.parse(cg.SLK_HERO_BLADE_MASTER_WIND)
local SLK_HERO_MOUNTAIN_KING_BOL = json.parse(cg.SLK_HERO_MOUNTAIN_KING_BOL)
local heroes = {
    SLK_HERO_BLADE_MASTER_WIND, --疾风剑圣
    SLK_HERO_MOUNTAIN_KING_BOL, --山丘之王
}
for _, v in ipairs(heroes) do
    hRuntime.register.unit(v)
    game.name2id.hero[v.Name] = v.UNIT_ID
    table.insert(game.heroIds, v.UNIT_ID)
end