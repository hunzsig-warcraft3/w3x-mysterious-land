local gift = {
    {
        Name = "封印",
        Desc = "[气]字技，特别而神秘|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = nil,
    },
    {
        Name = "无我",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            aim = "+30",
            toughness = "+100",
        },
    },
    {
        Name = "化金手",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            gold_ratio = "+30",
        },
    },
    {
        Name = "冥念",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            int = "+100",
        },
    },
}

for _, v in ipairs(gift) do
    v.Name = "气 - " .. v.Name
    v.Buttonpos1 = 3
    v.Buttonpos2 = 1
    v.race = "human"
    slkHelper.ability.empty(v)
end
