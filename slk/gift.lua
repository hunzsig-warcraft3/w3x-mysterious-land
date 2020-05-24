local keys = {"A","S","D","F"}

local gifts = {
    {
        Name = "铁剑精通",
        Art = "ReplaceableTextures\\CommandButtons\\BTNStormHammer.blp",
        ATTR = {
            attack_white = "+50",
        },
    },
}

for _, k in ipairs(keys) do
    for _, v in ipairs(gifts) do
        slkHelper.ability.empty({
            Art = v.Art,
            ATTR = v.ATTR,
            Name = "天赋 - " .. v.Name,
            race = v.race or "human",
            HotKey = k
        })
    end
end
