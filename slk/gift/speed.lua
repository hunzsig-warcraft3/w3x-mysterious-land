local gift = {
    {
        Name = "封印",
        _desc = "[速]字技，在于加快英雄的速度|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        _attr = nil,
    },
    {
        Name = "虚幻之刀",
        Art = "war3mapImported\\icon_pas_ThrowingKnife_06.blp",
        _attr = {
            attack_speed = "+45"
        },
    },
    {
        Name = "断臂之勇",
        Art = "war3mapImported\\icon_pas_Ability_Warrior_Intervene.blp",
        _attr = {
            attack_green = "-45",
            attack_speed = "+55",
        },
    },
    {
        Name = "神行太保",
        Art = "war3mapImported\\icon_pas_Rogue_FleetFooted.blp",
        _attr = {
            move = "+50",
            avoid = "+15"
        },
    },
    {
        Name = "猎豹拟态",
        Art = "war3mapImported\\icon_pas_Hunter_CatlikeReflexes.blp",
        _attr = {
            agi_green = "+50",
            move = "+30",
        },
    },
    {
        Name = "飞火靴",
        Art = "war3mapImported\\icon_pas_Fire_BurningSpeed.blp",
        _attr = {
            move = "+60",
            e_fire_oppose = "+40",
        },
    },
    {
        Name = "远古弓术",
        Art = "war3mapImported\\icon_pas_Hunter_ZenArchery.blp",
        _attr = {
            aim = "+15",
            attack_speed = "+45",
            avoid = "+5",
        },
    },
    {
        Name = "缥缈",
        Art = "war3mapImported\\icon_pas_Inextricable.blp",
        _attr = {
            attack_speed = "+10",
            avoid = "+30",
            move = "+20",
        },
    },
    {
        Name = "瞄准",
        Art = "war3mapImported\\icon_pas_Ability_Hunter_SniperShot.blp",
        _attr = {
            aim = "+30",
            xtras = {
                { on = CONST_EVENT.attack, action = "targetUnit.attr.avoid", val = -10, odds = 100, during = 3, effect = nil },
                { on = CONST_EVENT.attack, action = "triggerUnit.attr.attack_speed", val = 10, odds = 100, during = 3, effect = nil },
            },
        },
    },
}

for _, v in ipairs(gift) do
    slkHelper.ability.empty({
        Art = v.Art,
        _desc = v._desc,
        _attr = v._attr,
        Name = "速 - " .. v.Name,
        Buttonpos1 = 2,
        Buttonpos2 = 1,
        race = "human",
        _hslk = {
            gift_type = "gift_speed",
        }
    })
end

for _, v in ipairs(gift) do
    if (v._attr ~= nil) then
        slkHelper.item.normal({
            Art = v.Art,
            Name = "秘笈：速 - " .. v.Name,
            file = "Objects\\InventoryItems\\tomeBlue\\tomeBlue.mdl",
            race = "human",
            cooldown = 0,
            perishable = 1,
            _attr_txt = v._attr,
            _active = "使用习得[速技]：" .. v.Name,
        })
    end
end
