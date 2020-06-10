local gift = {
    {
        Name = "封印",
        Desc = "[武]字技，在于加强英雄的战斗力|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = nil,
    },
    {
        Name = "小剑修炼",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_green = "+30",
        },
    },
    {
        Name = "铁剑修炼",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_green = "+50",
        },
    },
    {
        Name = "回音剑技",
        Art = "war3mapImported\\icon_pas_Warrior_WeaponMastery.blp",
        ATTR = {
            attack_green = "+90",
            attack_speed = "+25",
        },
    },
}

for _, v in ipairs(gift) do
    v.Name = "武 - " .. v.Name
    v.Buttonpos1 = 0
    v.Buttonpos2 = 1
    v.race = "human"
    slkHelper.ability.empty(v)
end
