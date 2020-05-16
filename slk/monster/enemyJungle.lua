ENEMY_JUNGLE = {}
local ENEMY_CONF = {
    {
        Name = "树精",
        file = "units\\nightelf\\Ent\\Ent",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Ent",
    },
    {
        Name = "丛林怪人",
        file = "units\\creeps\\JungleBeast\\JungleBeast",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Wendigo",
    },
    {
        Name = "树魔狂战士",
        file = "units\\creeps\\ForestTroll\\ForestTroll",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "ForestTroll",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\Axe\\AxeMissile.mdl"
    },
    {
        Name = "树魔猎手",
        file = "units\\creeps\\ForestTrollTrapper\\ForestTrollTrapper",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "ForestTroll",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\Axe\\AxeMissile.mdl"
    },
    {
        Name = "树魔牧师",
        file = "units\\creeps\\ForestTrollShadowPriest\\ForestTrollShadowPriest",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "ForestTrollShadowPriest",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FireballMissile\\FireballMissile.mdl"
    },
    {
        Name = "豺狼",
        file = "units\\creeps\\Gnoll\\Gnoll",
        modelScale = 1.20,
        scale = 1.00,
        unitSound = "Gnoll",
    },
    {
        Name = "豺狼射手",
        file = "units\\creeps\\GnollArcher\\GnollArcher",
        modelScale = 1.30,
        scale = 1.00,
        unitSound = "GnollArcher",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\PoisonArrow\\PoisonArrowMissile.mdl"
    },
    {
        Name = "灰狼",
        file = "units\\creeps\\TimberWolf\\TimberWolf",
        modelScale = 0.75,
        scale = 1.10,
        unitSound = "SpiritWolf",
    },
    {
        Name = "小蜘蛛",
        file = "units\\creeps\\Spider\\Spider",
        modelScale = 0.50,
        scale = 1.10,
        unitSound = "Spider",
    },
    {
        Name = "森林蜘蛛",
        file = "units\\creeps\\SpiderGreen\\SpiderGreen",
        modelScale = 0.60,
        scale = 1.50,
        unitSound = "Spider",
    },
}

-- enemys
for _, v in ipairs(ENEMY_CONF) do
    if (v.movetp == "fly") then
        v.moveHeight = 200
    elseif (v.movetp == "hover") then
        v.moveHeight = 20
    end
    local obj = slk.unit.ogru:new("this_enemys_" .. v.Name)
    obj.Name = v.Name
    obj.abilList = ""
    obj.file = v.file
    obj.Art = "ReplaceableTextures\\CommandButtons\\BTNShade.blp"
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = 100
    obj.spd = 220
    obj.sight = 300
    obj.nsight = 300
    obj.unitSound = v.unitSound or ""
    obj.weapsOn = 1
    obj.movetp = v.movetp or "foot"--移动类型
    obj.moveHeight = v.moveHeight or 0 --移动高度
    obj.moveFloor = (v.moveHeight or 0) * 0.25 --最低高度
    obj.regenHP = 0
    obj.regenType = ""
    obj.def = 0
    obj.upgrades = ""
    obj.Builds = ""
    obj.fused = 0
    obj.dmgplus1 = 1
    obj.cool1 = 1.5
    obj.dmgpt1 = 0.5
    obj.backSw1 = 0.5
    if (obj.weapTp1 == CONST_WEAPON_TYPE.missile.value) then
        obj.acquire = 300
        obj.rangeN1 = 300
        obj.Missileart = v.Missileart or "Abilities\\Weapons\\SpiritOfVengeanceMissile\\SpiritOfVengeanceMissile.mdl"
        obj.Missilearc = 0.1
    else
        obj.acquire = 200
        obj.rangeN1 = 110
        obj.weapType1 = CONST_WEAPON_SOUND.RockHeavyBash.value
    end
    table.insert(ENEMY_JUNGLE, { UNIT_ID = obj:get_id(), Name = v.Name })
end
