UNITS = {} --to vjass

UNITS_CONF = {
    {
        Name = "复活石(面向东南的)",
        abilList = "Avul",
        file = "Doodads\\Cinematic\\RessurectionStoneSE\\RessurectionStoneSE",
        Art = "ReplaceableTextures\\CommandButtons\\BTNResStone.blp",
        modelScale = 1.20,
        scale = 3.60,
        HP = 100,
        spd = 0,
        sight = 1000,
        nsight = 1000,
        unitSound = "",
        weapsOn = 0,
    },
    {
        Name = "复活石(面向西南的)",
        abilList = "Avul",
        file = "Doodads\\Cinematic\\RessurectionStoneSW\\RessurectionStoneSW",
        Art = "ReplaceableTextures\\CommandButtons\\BTNResStone.blp",
        modelScale = 1.20,
        scale = 3.60,
        HP = 100,
        spd = 0,
        sight = 1000,
        nsight = 1000,
        unitSound = "",
        weapsOn = 0,
    },
    {
        Name = "复活阵",
        abilList = "Avul,Aloc",
        file = "Abilities\\Spells\\NightElf\\FaerieFire\\FaerieFireTarget.mdl",
        Art = "ReplaceableTextures\\CommandButtons\\BTNResStone.blp",
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
        Art = "ReplaceableTextures\\PassiveButtons\\PASBTNElunesBlessing.blp",
        modelScale = 4.00,
        scale = 1.00,
        HP = 99999,
        spd = 0,
        sight = 800,
        nsight = 800,
        unitSound = "",
        weapsOn = 0,
    },
}

-- units
for _, v in ipairs(UNITS_CONF) do
    local obj = slk.unit.ogru:new("this_units_" .. v.Name)
    obj.Name = v.Name
    obj.abilList = v.abilList or ""
    obj.upgrades = ""
    obj.file = v.file
    obj.Art = v.Art
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = v.HP
    obj.spd = v.spd or 0
    obj.sight = v.sight
    obj.nsight = v.nsight
    obj.unitSound = v.unitSound or ""
    obj.weapsOn = v.weapsOn or 0
    obj.unitShadow = ""
    obj.regenHP = 0
    obj.regenType = ""
    obj.fused = 0
    table.insert(UNITS, { UNIT_ID = obj:get_id(), Name = v.Name })
end
