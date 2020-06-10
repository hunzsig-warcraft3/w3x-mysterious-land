local gift = {
    {
        Name = "封印",
        Desc = "[御]字技，在于巩固英雄的防御|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = nil,
    },
    {
        Name = "铁盾修炼",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            defend = "+10",
        },
    },
}

for _, v in ipairs(gift) do
    v.Name = "御 - " .. v.Name
    v.Buttonpos1 = 1
    v.Buttonpos2 = 1
    v.race = "human"
    slkHelper.ability.empty(v)
end
