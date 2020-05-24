local features = {
    {
        Name = "无惧",
        Desc = "会变得勇猛",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_white = "+13",
            defend = "+9",
            toughness = "+20",
        },
    },
    {
        Name = "游击",
        Desc = "对事物的判断会更加地精确",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_speed = "+15",
            aim = "+20",
            move = "+30",
        },
    },
    {
        Name = "魔力",
        Desc = "与魔力同在",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            int_white = "+40",
            resistance = "+10",
        },
    },
    {
        Name = "剑圣",
        Desc = "剑之圣者，一瞬断魂",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_speed = "+36",
            move = "+20",
            attack_effect = {
                {
                    attr = "knocking",
                    odds = 25,
                    percent = 75,
                },
            }
        },
    },
    {
        Name = "领袖",
        Desc = "大有王者之风",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            life = "+1000",
            life_back = "+22",
            sight = "+300",
        },
    },
    {
        Name = "暗夜精灵",
        Desc = "远古神秘的月夜精灵",
        Art = "ReplaceableTextures\\PassiveButtons\\PASBTNElunesBlessing.blp",
        ATTR = {
            sight = "+500",
            PASSIVE = "在夜晚每隔30秒自动获得隐身5秒的效果",
        },
    },
}

for _, v in ipairs(features) do
    v.Name = "特性 - " .. v.Name
    v.race = v.race or "human"
    v.Buttonpos1 = 3
    v.Buttonpos2 = 0
    slkHelper.ability.empty(v)
end

