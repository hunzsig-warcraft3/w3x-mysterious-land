BOSS_WATER = {}
BOSS_CONF = {
    {
        Name = "狂暴海妖",
        file = "Units\\Creeps\\SeaElemental\\SeaElemental",
        modelScale = 2.00,
        scale = 2.00,
        unitSound = "WaterElemental",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\SeaElementalMissile\\SeaElementalMissile.mdl",
        movetp = CONST_MOVE_TYPE.amph.value,
    },
    {
        Name = "深海猎人",
        file = "Units\\Creeps\\SeaGiantGreen\\SeaGiantGreen",
        modelScale = 2.00,
        scale = 2.00,
        unitSound = "SeaGiant",
    },
    {
        Name = "大龙龟",
        file = "Units\\Creeps\\DragonSeaTurtle\\DragonSeaTurtle",
        modelScale = 1.50,
        scale = 5.00,
        unitSound = "GiantSeaTurtle",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl",
    },
    {
        Name = "水之领主",
        file = "war3mapImported\\unit_WaterElemental.mdl",
        modelScale = 2.00,
        scale = 2.50,
        unitSound = "WaterElemental",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl",
    },
    {
        Name = "水魔神",
        file = "war3mapImported\\unit_Waterlord.mdl",
        modelScale = 1.60,
        scale = 2.50,
        unitSound = "WaterElemental",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl",
    },
}

for _, v in ipairs(BOSS_CONF) do
    local Name = "BOSS-" .. v.Name
    local obj = slk.unit.ogru:new("this_boss_" .. v.Name)
    if (v.movetp == "fly") then
        v.moveHeight = 250
    elseif (v.movetp == "hover") then
        v.moveHeight = 30
    end
    obj.Name = Name
    obj.abilList = ""
    obj.file = v.file
    obj.Art = "ReplaceableTextures\\CommandButtons\\BTNCarrionScarabs.blp"
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = 100
    obj.spd = 125
    obj.sight = 500
    obj.nsight = 500
    obj.unitSound = v.unitSound or ""
    obj.weapsOn = 0
    obj.movetp = v.movetp or "foot"--移动类型
    obj.moveHeight = v.moveHeight or 0 --移动高度
    obj.moveFloor = (v.moveHeight or 0) * 0.25 --最低高度
    obj.regenHP = 0
    obj.regenType = ""
    obj.def = 0
    obj.upgrades = ""
    obj.Builds = ""
    obj.fused = 0
    table.insert(BOSS_WATER, { UNIT_ID = obj:get_id(), Name = Name })
end
