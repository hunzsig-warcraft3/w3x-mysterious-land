local gift = {
    {
        Name = "封印",
        _desc = "[武]字技，在于加强英雄的战斗力|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        _attr = nil,
    },
    {
        Name = "大剑修炼",
        Art = "war3mapImported\\icon_pas_Ability_Rogue_BladeTwisting.blp",
        _attr = {
            attack_green = "+70",
        },
    },
    {
        Name = "回音剑技",
        Art = "war3mapImported\\icon_pas_Warrior_WeaponMastery.blp",
        _attr = {
            attack_green = "+90",
            attack_speed = "+25",
        },
    },
    {
        Name = "嗜血割裂",
        Art = "war3mapImported\\icon_pas_Ability_Gouge.blp",
        _attr = {
            attack_green = "+40",
            hemophagia = "+5",
            attack_debuff = {
                {
                    attr = "life_back",
                    odds = 50,
                    val = 2.5,
                    during = 3
                },
                {
                    attr = "defend",
                    odds = 50,
                    val = 1,
                    during = 3
                },
            },
        },
    },
    {
        Name = "淬火铁手",
        Art = "war3mapImported\\icon_pas_AdvancedUnholyStrength.blp",
        _attr = {
            attack_enchant = "+fire",
            str_green = "+180",
            natural_fire = "+20",
        },
    },
    {
        Name = "心碎",
        Art = "war3mapImported\\icon_pas_BrokenHeart.blp",
        _attr = {
            attack_debuff = {
                {
                    attr = "life_back",
                    odds = 50,
                    val = 3.5,
                    during = 4
                },
                {
                    attr = "move",
                    odds = 50,
                    val = 5,
                    during = 4
                },
            },
        },
    },
    {
        Name = "贤者之剑",
        Art = "war3mapImported\\icon_pas_Holy_PersuitofJustice.blp",
        _attr = {
            attack_enchant = "+magic",
            int_green = "+30",
            attack_effect = {
                {
                    attr = "violence",
                    odds = 60,
                    percent = 35
                },
            },
        },
    },
}

for _, v in ipairs(gift) do
    slkHelper.ability.empty({
        Art = v.Art,
        _desc = v._desc,
        _attr = v._attr,
        Name = "武 - " .. v.Name,
        Buttonpos1 = 0,
        Buttonpos2 = 1,
        race = "human",
        _hslk = {
            gift_type = "gift_weapon",
        }
    })
end

for _, v in ipairs(gift) do
    if (v._attr ~= nil) then
        slkHelper.item.normal({
            Art = v.Art,
            _attr_txt = v._attr,
            Name = "秘笈：武 - " .. v.Name,
            _active = "使用习得[武技]：" .. v.Name,
            file = "Objects\\InventoryItems\\tomeBlue\\tomeBlue.mdl",
            race = "human",
            cooldown = 0,
            perishable = 1,
        })
    end
end
