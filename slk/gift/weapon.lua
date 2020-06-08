local gift_weapon = {
    {
        Name = "尚未拥有",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {},
    },
    {
        Name = "小剑修炼",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_white = "+30",
        },
    },
    {
        Name = "铁剑修炼",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_white = "+50",
        },
    },
    {
        Name = "钢剑修炼",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_white = "+90",
        },
    },
}

for _, v in ipairs(gift_weapon) do
    slkHelper.ability.empty({
        Art = v.Art,
        ATTR = v.ATTR,
        Name = "武 - " .. v.Name,
        race = v.race or "human",
        HotKey = "A"
    })
end
