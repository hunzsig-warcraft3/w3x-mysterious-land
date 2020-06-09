local gift_weapon = {
    {
        Name = "封印",
        Desc = "[御]字技，在于巩固英雄的防御|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = {},
    },
    {
        Name = "铁盾修炼",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            defend = "+10",
        },
    },
}

for _, v in ipairs(gift_weapon) do
    slkHelper.ability.empty({
        Art = v.Art,
        ATTR = v.ATTR,
        Name = "御 - " .. v.Name,
        race = v.race or "human",
        Buttonpos1 = 1,
        Buttonpos2 = 1,
    })
end
