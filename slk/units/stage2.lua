local items = {
    {
        Name = "医疗石",
        Desc = "免费采集到的有医疗效果的石头，吞食令人肚子痛",
        Art = "ReplaceableTextures\\CommandButtons\\BTNHealthStone.blp",
        goldcost = 0,
        lumbercost = 0,
        powerup = 0,
        sellable = 1,
        pawnable = 1,
        droppable = 1,
        cooldown = 70,
        ACTIVE = "使用后在10秒内持续恢复共200点生命",
        OVERLIE = 99,
        Hotkey = "Q",
    },
    {
        Name = "魔法石",
        Desc = "免费采集到的有智慧的石头，据说只有变态魔法师服用",
        Art = "ReplaceableTextures\\CommandButtons\\BTNManaStone.blp",
        goldcost = 0,
        lumbercost = 0,
        powerup = 0,
        sellable = 1,
        pawnable = 1,
        droppable = 1,
        cooldown = 70,
        ACTIVE = "使用后在10秒内持续恢复共150点魔法",
        OVERLIE = 99,
        Hotkey = "W",
    },
    {
        Name = "医疗剂",
        Desc = "轻松制得的医疗药水，奸商卖得并不便宜",
        Art = "ReplaceableTextures\\CommandButtons\\BTNHealingSalve.blp",
        goldcost = 70,
        lumbercost = 0,
        powerup = 0,
        sellable = 1,
        pawnable = 1,
        droppable = 1,
        cooldown = 40,
        ACTIVE = "使用后在6秒内持续恢复共500点生命",
        OVERLIE = 99,
        Hotkey = "E",
    },
    {
        Name = "魔法剂",
        Desc = "轻松制得的魔法药水，奸商卖得也不便宜",
        Art = "ReplaceableTextures\\CommandButtons\\BTNVialFull.blp",
        goldcost = 120,
        lumbercost = 0,
        powerup = 0,
        sellable = 1,
        pawnable = 1,
        droppable = 1,
        cooldown = 40,
        ACTIVE = "使用后在6秒内持续恢复共300点魔法",
        OVERLIE = 99,
        Hotkey = "R",
    },
    {
        Name = "神木枯枝",
        Desc = "一个小树枝",
        Art = "ReplaceableTextures\\CommandButtons\\BTNNatureTouchGrow.blp",
        goldcost = 150,
        lumbercost = 0,
        powerup = 0,
        sellable = 1,
        pawnable = 1,
        droppable = 1,
        OVERLIE = 1,
        Hotkey = "A",
        ATTR = {
            attack_green = "+5",
            str_green = "+5",
            agi_green = "+5",
            int_green = "+5",
        }
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
    Name = "小神木商店",
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