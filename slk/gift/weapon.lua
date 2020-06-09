local gift_weapon = {
    {
        Name = "封印",
        Desc = "[武]字技，在于加强英雄的战斗力|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = {},
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

for _, v in ipairs(gift_weapon) do
    slkHelper.ability.empty({
        Art = v.Art,
        ATTR = v.ATTR,
        Name = "武 - " .. v.Name,
        race = v.race or "human",
        Buttonpos1 = 0,
        Buttonpos2 = 1,
    })
end
