local gift_weapon = {
    {
        Name = "尚未拥有",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
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
        HotKey = "S"
    })
end
