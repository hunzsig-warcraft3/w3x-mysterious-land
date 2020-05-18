BOSS_FIRE = {}
BOSS_CONF = {
    {
        Name = "赤炎飞龙",
        file = "units\\creeps\\RedDragon\\RedDragon",
        modelScale = 1.75,
        scale = 2.25,
        unitSound = "AzureDragon",
        movetp = "fly",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl",
    },
    {
        Name = "陨石火",
        file = "war3mapImported\\unit_abyssal_illidan.mdl",
        modelScale = 2.00,
        scale = 2.50,
        unitSound = "Infernal",
    },
    {
        Name = "逗趣火炎蜥",
        file = "war3mapImported\\unit_FireElemental.mdl",
        modelScale = 2.00,
        scale = 2.50,
        unitSound = "LavaSpawn",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl",
    },
    {
        Name = "火焰狱监妖",
        file = "war3mapImported\\unit_FireTempleKeeperElemental.mdl",
        modelScale = 1.60,
        scale = 2.50,
        unitSound = "Infernal",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl",
    },
    {
        Name = "火爆锤魔",
        file = "war3mapImported\\unit_MoargOverlord1.mdl",
        modelScale = 1.60,
        scale = 2.50,
        unitSound = "Infernal",
    },
    {
        Name = "熔炉恶魔",
        file = "war3mapImported\\unit_ObsidianGolem.mdl",
        modelScale = 1.60,
        scale = 2.50,
        unitSound = "Infernal",
    },
    {
        Name = "两级行刑人",
        file = "war3mapImported\\unit_Celsius.mdl",
        modelScale = 2.30,
        scale = 2.50,
        unitSound = "Acolyte",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl",
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
    obj.spd = 165
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
    table.insert(BOSS_FIRE, { UNIT_ID = obj:get_id(), Name = Name })
end
