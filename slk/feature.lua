local features = {
    {
        Name = "典雅之月",
        Desc = "在月光下行动的精灵使者，灵动而又不惧怕黑暗魔法",
        Art = "ReplaceableTextures\\PassiveButtons\\PASBTNElunesBlessing.blp",
        ATTR = {
            attack_speed = "+13",
            resistance = "+16",
            natural_dark_oppose = "+10"
        },
    },
    {
        Name = "剑圣",
        Desc = "剑之圣者，一瞬断魂",
        Art = "ReplaceableTextures\\PassiveButtons\\PASBTNCriticalStrike.blp",
        ATTR = {
            attack_speed = "+24",
            move = "+20",
            attack_effect = {
                {
                    attr = "knocking",
                    odds = 20,
                    percent = 75,
                },
            }
        },
    },
    {
        Name = "王权",
        Desc = "身为领袖之人，具有王者气派",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            life = "+600",
            life_back = "+20",
            sight = "+300",
            gold_ratio = "+5"
        },
    },
    {
        Name = "暗夜精灵",
        Desc = "远古神秘的暗夜精灵",
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

