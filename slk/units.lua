local rebornItems = {
    {
        Name = "医疗剂",
        _desc = "轻松制得的医疗药水，效果不佳当免费",
        Art = "ReplaceableTextures\\CommandButtons\\BTNHealingSalve.blp",
        goldcost = 0,
        lumbercost = 0,
        powerup = 0,
        sellable = 1,
        pawnable = 1,
        droppable = 1,
        cooldown = 45,
        _active = "使用后在10秒内持续恢复共500点生命",
        _overlie = 99,
        Hotkey = "Q",
    },
}
local ids = ""
for _, v in ipairs(rebornItems) do
    local id = slkHelper.item.normal(v)
    if (ids == "") then
        ids = id
    else
        ids = ids .. "," .. id
    end
end

local units = {
    {
        Name = "复活石(面向东南的)",
        abilList = "Avul,Apit,Aneu",
        file = "Doodads\\Cinematic\\RessurectionStoneSE\\RessurectionStoneSE",
        modelScale = 1.20,
        scale = 3.60,
        HP = 100,
        spd = 0,
        sight = 1000,
        nsight = 1000,
        unitSound = "",
        weapsOn = 0,
        Sellitems = ids,
    },
    {
        Name = "复活石(面向西南的)",
        abilList = "Avul,Apit,Aneu",
        file = "Doodads\\Cinematic\\RessurectionStoneSW\\RessurectionStoneSW",
        modelScale = 1.20,
        scale = 3.60,
        HP = 100,
        spd = 0,
        sight = 1000,
        nsight = 1000,
        unitSound = "",
        weapsOn = 0,
        Sellitems = ids,
    },
    {
        Name = "复活阵",
        abilList = "Avul,Aloc",
        file = "Abilities\\Spells\\NightElf\\FaerieFire\\FaerieFireTarget.mdl",
        modelScale = 2,
        scale = 1.00,
        HP = 99999,
        spd = 0,
        sight = 500,
        nsight = 500,
        unitSound = "",
        weapsOn = 0,
    },
    {
        Name = "传送门",
        abilList = "Avul,Aloc",
        file = "Abilities\\Spells\\Other\\GeneralAuraTarget\\GeneralAuraTarget.mdl",
        modelScale = 4.00,
        scale = 1.00,
        HP = 99999,
        spd = 0,
        sight = 800,
        nsight = 800,
        unitSound = "",
        weapsOn = 0,
    },
    {
        Name = "七灵神石",
        abilList = "",
        file = "buildings\\other\\BridgeObelisk\\BridgeObelisk",
        modelScale = 1.4,
        scale = 2.5,
        HP = 100000,
        regenHP = 1,
        regenType = 'always',
        spd = 0,
        sight = 0,
        nsight = 0,
        unitSound = "",
        weapsOn = 1,
        rangeN1 = 550, -- 攻击范围
        dmgplus1 = 99, -- 基础攻击
        weapTp1 = CONST_WEAPON_TYPE.missile.value, -- 攻击类型
        Missileart = "Abilities\\Weapons\\SorceressMissile\\SorceressMissile.mdl", -- 箭矢
        cool1 = 2.0, -- 攻击周期
        backSw1 = 0, -- 攻击后摇
        dmgpt1 = 0, -- 攻击前摇
    },
    {
        Name = "遗迹废墟",
        abilList = "Avul",
        file = "Doodads\\Ashenvale\\Structures\\PillarsRuined\\PillarsRuined.mdl",
        modelScale = 1.10,
        scale = 4.00,
        HP = 100000,
        spd = 0,
        sight = 0,
        nsight = 0,
        unitSound = "",
        weapsOn = 0,
    },
}

for _, v in pairs(units) do
    v.race = v.race or "human"
    v.Art = v.Art or "ReplaceableTextures\\CommandButtons\\BTNResStone.blp"
    slkHelper.unit.normal(v)
end

