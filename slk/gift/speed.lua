local gift = {
    {
        Name = "封印",
        Desc = "[速]字技，在于加快英雄的速度|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = nil,
    },
    {
        Name = "虚幻之刀",
        Art = "war3mapImported\\icon_pas_ThrowingKnife_06.blp",
        ATTR = {
            attack_speed = "+45"
        },
    },
    {
        Name = "断臂之勇",
        Art = "war3mapImported\\icon_pas_Ability_Warrior_Intervene.blp",
        ATTR = {
            attack_green = "-45",
            attack_speed = "+55",
        },
    },
    {
        Name = "神行太保",
        Art = "war3mapImported\\icon_pas_Rogue_FleetFooted.blp",
        ATTR = {
            move = "+50",
            avoid = "+15"
        },
    },
    {
        Name = "猎豹拟态",
        Art = "war3mapImported\\icon_pas_Hunter_CatlikeReflexes.blp",
        ATTR = {
            agi_green = "+50",
            move = "+30",
        },
    },
    {
        Name = "飞火靴",
        Art = "war3mapImported\\icon_pas_Fire_BurningSpeed.blp",
        ATTR = {
            move = "+60",
            natural_fire_oppose = "+40",
        },
    },
    {
        Name = "远古弓术",
        Art = "war3mapImported\\icon_pas_Hunter_ZenArchery.blp",
        ATTR = {
            aim = "+15",
            attack_speed = "+45",
            avoid = "+5",
        },
    },
    {
        Name = "缥缈",
        Art = "war3mapImported\\icon_pas_Inextricable.blp",
        ATTR = {
            attack_speed = "+10",
            avoid = "+30",
            move = "+20",
        },
    },
    {
        Name = "瞄准",
        Art = "war3mapImported\\icon_pas_Ability_Hunter_SniperShot.blp",
        ATTR = {
            aim = "+30",
            attack_debuff = {
                {
                    attr = "avoid",
                    odds = 100,
                    val = 10,
                    during = 3
                },
            },
            attack_buff = {
                {
                    attr = "attack_speed",
                    odds = 100,
                    val = 10,
                    during = 3
                },
            },
        },
    },
}

for _, v in ipairs(gift) do
    slkHelper.ability.empty({
        Art = v.Art,
        Desc = v.Desc,
        ATTR = v.ATTR,
        Name = "速 - " .. v.Name,
        Buttonpos1 = 2,
        Buttonpos2 = 1,
        race = "human",
        ID_ARRAY = "gift_speed",
    })
end

for _, v in ipairs(gift) do
    if (v.ATTR ~= nil) then
        slkHelper.item.normal({
            Art = v.Art,
            ATTR_TXT = v.ATTR,
            Name = "秘笈：速 - " .. v.Name,
            ACTIVE = "使用习得[速技]：" .. v.Name,
            file = "Objects\\InventoryItems\\tomeBlue\\tomeBlue.mdl",
            race = "human",
            ID_ARRAY = "gift_speed",
            cooldown = 0,
            perishable = 1,
        })
    end
end
