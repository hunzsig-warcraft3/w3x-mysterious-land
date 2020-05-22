local monster = {
    -- water
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
    -- jungle
    {
        Name = "剧毒蛛母",
        file = "war3mapImported\\unit_Dark_Spider.mdl",
        modelScale = 2.20,
        scale = 2.50,
        unitSound = "Spider",
    },
    -- ruins
    {
        Name = "九头蛇",
        file = "Units\\Creeps\\Hydra\\Hydra",
        modelScale = 1.30,
        scale = 2.50,
        unitSound = "AzureDragon",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl",
    },
    {
        Name = "紫蝎子",
        file = "Units\\Creeps\\Archnathidpurple\\Archnathidpurple",
        modelScale = 1.80,
        scale = 2.60,
        unitSound = "Archnathid",
    },
    {
        Name = "毁灭使者",
        file = "units\\demon\\DoomGuard\\DoomGuard",
        modelScale = 1.60,
        scale = 2.40,
        unitSound = "DoomGuard",
    },
    {
        Name = "恶魔守卫",
        file = "units\\demon\\Felgaurd\\Felgaurd",
        modelScale = 2.50,
        scale = 2.50,
        unitSound = "DoomGuard",
    },
    -- mountain
    {
        Name = "鹰女妖皇",
        file = "units\\creeps\\HarpyQueen\\HarpyQueen",
        modelScale = 2.00,
        scale = 2.00,
        unitSound = "Harpy",
        movetp = "fly",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\HarpyMissile\\HarpyMissile.mdl"
    },
    {
        Name = "沙人",
        file = "war3mapImported\\unit_SandElementalV9_Final.mdl",
        modelScale = 2.10,
        scale = 2.50,
        unitSound = "RockGolem",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\TreantMissile\\TreantMissile.mdl",
    },
    {
        Name = "滚动岩",
        file = "war3mapImported\\unit_Rock_Elemental.mdl",
        modelScale = 2.10,
        scale = 2.50,
        unitSound = "RockGolem",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "abilities\\weapons\\catapult\\catapultmissile.mdl",
    },
    -- snow
    {
        Name = "冰霜巨龙",
        file = "units\\undead\\FrostWyrm\\FrostWyrm",
        modelScale = 1.75,
        scale = 2.25,
        unitSound = "FrostWyrm",
        movetp = "fly",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl",
    },
    -- fire
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
    -- dark
    {
        Name = "淤泥怪",
        file = "units\\creeps\\SludgeMonster\\SludgeMonster",
        modelScale = 2.00,
        scale = 3.20,
        unitSound = "SludgeMonster",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\SludgeMissile\\SludgeMissile.mdl",
    },
}

for _, v in ipairs(monster) do
    v.Name = "[精英]" .. v.Name
    v.race = "undead"
    v.Art = "ReplaceableTextures\\CommandButtons\\BTNShade.blp"
    v.HP = 100
    v.spd = 255
    v.sight = 500
    v.nsight = 500
    v.weapsOn = 1
    if (v.movetp == "fly") then
        v.moveHeight = 230
    elseif (v.movetp == "hover") then
        v.moveHeight = 30
    end
    if (v.weapTp1 == CONST_WEAPON_TYPE.missile.value) then
        v.acquire = 500
        v.rangeN1 = 500
        v.Missileart = v.Missileart or "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl"
        v.Missilearc = 0.1
    else
        v.acquire = 300
        v.rangeN1 = 120
        v.weapType1 = CONST_WEAPON_SOUND.WoodHeavyBash.value
    end
    slkHelper.unit.normal(v)
end
