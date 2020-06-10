local gift = {
    {
        Name = "封印",
        Desc = "[速]字技，在于加快英雄的速度|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = nil,
    },
    {
        Name = "神行太保",
        Art = "war3mapImported\\icon_pas_Rogue_FleetFooted.blp",
        ATTR = {
            move = "+50",
            avoid = "+15"
        },
    },
}

for _, v in ipairs(gift) do
    v.Name = "速 - " .. v.Name
    v.Buttonpos1 = 2
    v.Buttonpos2 = 1
    v.race = "human"
    slkHelper.ability.empty(v)
end