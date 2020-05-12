ENEMY_WATER = {}
local ENEMY_CONF = {
    {
        Name = "小鱼妖",
        file = "units\\creeps\\Murloc\\Murloc",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "murloc",

    },
    {
        Name = "青鱼妖",
        file = "units\\creeps\\MurlocMutant\\MurlocMutant",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "murloc",

    },
    {
        Name = "夜鱼妖",
        file = "units\\creeps\\MurlocFlesheater\\MurlocFlesheater",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "murloc",

    },
    {
        Name = "蟹妖",
        file = "units\\creeps\\SpiderCrabCreep\\SpiderCrabCreep",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "",

    },
    {
        Name = "小虾妖",
        file = "Units\\Creeps\\Lobstrokkred\\Lobstrokkred",
        modelScale = 0.35,
        scale = 1.00,
        unitSound = "Lobstrokk",
        weapTp1 = CONST_WEAPON_TYPE.normal.value,
    },
    {
        Name = "蓝虾妖",
        file = "Units\\Creeps\\Lobstrokkblue\\Lobstrokkblue",
        modelScale = 0.35,
        scale = 1.00,
        unitSound = "Lobstrokk",
        weapTp1 = CONST_WEAPON_TYPE.normal.value,
    },
    {
        Name = "绿虾妖",
        file = "Units\\Creeps\\Lobstrokkgreen\\Lobstrokkgreen",
        modelScale = 0.35,
        scale = 1.00,
        unitSound = "Lobstrokk",
        weapTp1 = CONST_WEAPON_TYPE.normal.value,
    },
    {
        Name = "水妖",
        file = "units\\human\\WaterElemental\\WaterElemental",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "WaterElemental",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl",
        movetp = CONST_MOVE_TYPE.amph.value,
    },
    {
        Name = "海妖",
        file = "Units\\Creeps\\SeaElemental\\SeaElemental",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "WaterElemental",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\SeaElementalMissile\\SeaElementalMissile.mdl",
        movetp = CONST_MOVE_TYPE.amph.value,
    },
}

-- enemys
for _, v in ipairs(ENEMY_CONF) do
    local obj = slk.unit.ogru:new("this_enemys_" .. v.Name)
    obj.Name = v.Name
    obj.abilList = ""
    obj.file = v.file
    obj.Art = "ReplaceableTextures\\CommandButtons\\BTNShade.blp"
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = 100
    obj.spd = 200
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
        obj.weapType1 = CONST_WEAPON_SOUND.WoodHeavyBash.value
    end
    table.insert(ENEMY_WATER, { UNIT_ID = obj:get_id(), Name = v.Name })
end