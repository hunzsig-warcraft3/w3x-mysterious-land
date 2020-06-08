local gift_weapon = {
    {
        Name = "尚未拥有",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {},
    },
    {
        Name = "神行太保",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            move = "+50",
            avoid = "+15"
        },
    },
}

for _, v in ipairs(gift_weapon) do
    slkHelper.ability.empty({
        Art = v.Art,
        ATTR = v.ATTR,
        Name = "速 - " .. v.Name,
        race = v.race or "human",
        HotKey = "D"
    })
end
