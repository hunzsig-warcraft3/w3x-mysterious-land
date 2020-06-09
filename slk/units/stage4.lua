local items = {
    {
        Name = "医疗剂",
        Desc = "轻松制得的医疗药水，效果不佳但是免费",
        Art = "ReplaceableTextures\\CommandButtons\\BTNHealingSalve.blp",
        goldcost = 0,
        lumbercost = 0,
        powerup = 0,
        sellable = 1,
        pawnable = 1,
        droppable = 1,
        cooldown = 50,
        ACTIVE = "使用后在10秒内持续恢复共300点生命",
        OVERLIE = 99,
        Hotkey = "Q",
    },
    {
        Name = "魔法剂",
        Desc = "轻松制得的魔法药水，效果不佳但是免费",
        Art = "ReplaceableTextures\\CommandButtons\\BTNHealingSalve.blp",
        goldcost = 0,
        lumbercost = 0,
        powerup = 0,
        sellable = 1,
        pawnable = 1,
        droppable = 1,
        cooldown = 50,
        ACTIVE = "使用后在10秒内持续恢复共250点魔法",
        OVERLIE = 99,
        Hotkey = "W",
    },
}
local ids = ""
for _, v in ipairs(items) do
    local id = slkHelper.item.normal(v)
    if (ids == "") then
        ids = id
    else
        ids = ids .. "," .. id
    end
end

slkHelper.unit.shop({
    Name = "小神木",
    abilList = "Avul,Apit,Aneu",
    file = "Doodads\\Cinematic\\RessurectionStoneSE\\RessurectionStoneSE",
    Art = "ReplaceableTextures\\CommandButtons\\BTNResStone.blp",
    modelScale = 0.70,
    scale = 2.20,
    HP = 100,
    spd = 0,
    sight = 500,
    nsight = 500,
    unitSound = "",
    weapsOn = 0,
    race = "human",
    Sellitems = ids,
})

local units = {
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
    slkHelper.unit.shop(v)
end

