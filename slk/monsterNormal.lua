local monster = {
    -- water
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
        Name = "小龟",
        file = "Units\\Creeps\\SeaTurtleRange\\SeaTurtleRange",
        modelScale = 0.4,
        scale = 1.40,
        unitSound = "GiantSeaTurtle",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl",
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
    -- jungle
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
    -- ruins
    {
        Name = "强盗",
        file = "ReplaceableTextures\\CommandButtons\\BTNBandit.blp",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Bandit",
    },
    {
        Name = "遗迹傀儡",
        file = "units\\creeps\\GolemStatue\\GolemStatue",
        modelScale = 1.50,
        scale = 1.50,
        unitSound = "RockGolem",
    },
    {
        Name = "灰蝎妖",
        file = "Units\\Creeps\\Archnathid\\Archnathid",
        modelScale = 0.65,
        scale = 1.40,
        unitSound = "Archnathid",
    },
    {
        Name = "毒蝎妖",
        file = "Units\\Creeps\\ArchnathidGreen\\ArchnathidGreen",
        modelScale = 0.65,
        scale = 1.40,
        unitSound = "Archnathid",
    },
    -- mountain
    {
        Name = "石头人",
        file = "units\\creeps\\RockGolem\\RockGolem",
        modelScale = 0.80,
        scale = 1.50,
        unitSound = "RockGolem",
    },
    {
        Name = "投石头石头人",
        file = "units\\creeps\\Harpy\\Harpy",
        modelScale = 0.80,
        scale = 1.50,
        unitSound = "RockGolem",
        movetp = "fly",
        rangeN1 = 800,
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl"
    },
    {
        Name = "土色奥加",
        file = "units\\creeps\\Ogre\\Ogre",
        modelScale = 1.00,
        scale = 1.10,
        unitSound = "Ogre",
    },
    {
        Name = "天色奥加",
        file = "units\\creeps\\OgreMagi\\OgreMagi",
        modelScale = 1.00,
        scale = 1.10,
        unitSound = "Ogre",
    },
    {
        Name = "鹰女妖",
        file = "units\\creeps\\Harpy\\Harpy",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Harpy",
        movetp = "fly",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\HarpyMissile\\HarpyMissile.mdl"
    },
    -- snow
    {
        Name = "北极熊",
        file = "units\\creeps\\PolarBear\\PolarBear",
        modelScale = 0.90,
        scale = 1.70,
        unitSound = "GrizzlyBear",
    },
    {
        Name = "雪怪",
        file = "units\\creeps\\Wendigo\\Wendigo",
        modelScale = 0.90,
        scale = 1.20,
        unitSound = "Wendigo",
    },
    {
        Name = "海豹妖精",
        file = "Units\\Creeps\\tuskar\\tuskar",
        modelScale = 0.75,
        scale = 1.25,
        unitSound = "Tuskarr",
    },
    -- fire
    {
        Name = "火蜥蜴",
        file = "units\\creeps\\ThunderLizardSalamander\\ThunderLizardSalamander",
        modelScale = 0.60,
        scale = 2.50,
        unitSound = "KotoBeastNoRider",
    },
    {
        Name = "小火妖",
        file = "Units\\Creeps\\LavaSpawn\\LavaSpawn",
        modelScale = 0.80,
        scale = 1.60,
        unitSound = "LavaSpawn",
    },
    {
        Name = "地狱火",
        file = "units\\demon\\Infernal\\Infernal",
        modelScale = 1.30,
        scale = 2.30,
        unitSound = "Infernal",
    },
    {
        Name = "小火龙",
        file = "units\\creeps\\RedDragonWelp\\RedDragonWelp",
        modelScale = 0.7,
        scale = 1.70,
        unitSound = "AzureDragon",
        movetp = "fly",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl",
    },
    -- dark
    {
        Name = "僵尸仔",
        file = "units\\other\\DalaranMutant\\DalaranMutant",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Zombie",

    },
    {
        Name = "骷髅兵",
        file = "units\\undead\\Skeleton\\Skeleton",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Skeleton",
    },
    {
        Name = "堕落树精",
        file = "units\\creeps\\CorruptedEnt\\CorruptedEnt",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "CorruptedEnt",
    },
    {
        Name = "骷髅弓手",
        file = "units\\creeps\\SkeletonArcher\\SkeletonArcher",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "SkeletonArcher",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\Arrow\\ArrowMissile.mdl",
    },
    {
        Name = "骷髅巨兵",
        file = "units\\creeps\\SkeletonOrc\\SkeletonOrc",
        modelScale = 1.10,
        scale = 1.00,
        unitSound = "Skeleton",
    },
}

for _, v in ipairs(monster) do
    v.Name = "[小怪]" .. v.Name
    v.race = "undead"
    v.Art = "ReplaceableTextures\\CommandButtons\\BTNShade.blp"
    v.HP = 100
    v.spd = 200
    v.sight = 300
    v.nsight = 300
    if (v.movetp == "fly") then
        v.moveHeight = 200
    elseif (v.movetp == "hover") then
        v.moveHeight = 20
    end
    if (v.weapTp1 == CONST_WEAPON_TYPE.missile.value) then
        v.acquire = 300
        v.rangeN1 = 300
        v.Missileart = v.Missileart or "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl"
        v.Missilearc = 0.1
    else
        v.acquire = 200
        v.rangeN1 = 100
        v.weapType1 = CONST_WEAPON_SOUND.WoodHeavyBash.value
    end
    slkHelper.unit.normal(v)
end
