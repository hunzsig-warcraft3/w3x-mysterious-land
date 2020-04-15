ENEMY = {}
ENEMY_CONF = {
    {
        Name = "鬼影",
        file = "units\\undead\\Shade\\Shade",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Shade",
        movetp = "hover",
        moveHeight = 50,
    },
    {
        Name = "食尸鬼",
        file = "units\\undead\\Ghoul\\Ghoul",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Ghoul",
    },
    {
        Name = "憎恶",
        file = "units\\undead\\Abomination\\Abomination",
        modelScale = 0.90,
        scale = 2.10,
        unitSound = "Abomination",
    },
    {
        Name = "绞肉车",
        file = "units\\undead\\MeatWagon\\MeatWagon",
        modelScale = 0.90,
        scale = 2.40,
        unitSound = "MeatWagon",
    },
    {
        Name = "穴居恶魔",
        file = "units\\undead\\CryptFiend\\CryptFiend",
        modelScale = 0.90,
        scale = 1.90,
        unitSound = "CryptFiend",
    },
    {
        Name = "石像鬼",
        file = "units\\undead\\Gargoyle\\Gargoyle",
        modelScale = 1.00,
        scale = 1.25,
        unitSound = "Gargoyle",
        movetp = "fly",
        moveHeight = 150,
    },
    {
        Name = "女妖",
        file = "units\\undead\\Banshee\\Banshee",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Banshee",
        movetp = "hover",
        moveHeight = 50,
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
    obj.spd = 220
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
    table.insert(ENEMY, { UNIT_ID = id, Name = v.Name })
end