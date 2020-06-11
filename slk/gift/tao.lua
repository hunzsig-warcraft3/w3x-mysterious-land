local gift = {
    {
        Name = "封印",
        Desc = "[奇]字技，特别神奇且怪异的技能|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = nil,
    },
    {
        Name = "无我",
        Art = "war3mapImported\\icon_pas_Arcane_MindMastery.blp",
        ATTR = {
            sight = "+500",
            toughness = "+200",
        },
    },
    {
        Name = "醍醐点化",
        Art = "war3mapImported\\icon_pas_Holy_BlindingHeal.blp",
        ATTR = {
            gold_ratio = "+50",
            exp_ratio = "+50",
        },
    },
    {
        Name = "勿想冥念",
        Art = "war3mapImported\\icon_pas_Arcane_StudentOfMagic.blp",
        ATTR = {
            mana = "+1000",
            int_green = "+200",
        },
    },
    {
        Name = "神的使者",
        Art = "war3mapImported\\icon_pas_Holy_Absolution.blp",
        ATTR = {
            attack_damage_type = "+god",
            natural_god = "+30",
            natural_god_oppose = "+30",
        },
    },
}

for _, v in ipairs(gift) do
    slkHelper.ability.empty({
        Art = v.Art,
        Desc = v.Desc,
        ATTR = v.ATTR,
        Name = "奇 - " .. v.Name,
        Buttonpos1 = 3,
        Buttonpos2 = 1,
        race = "human",
        ID_ARRAY = "gift_tao",
    })
end

for _, v in ipairs(gift) do
    if (v.ATTR ~= nil) then
        slkHelper.item.normal({
            Art = v.Art,
            ATTR_TXT = v.ATTR,
            Name = "秘笈：奇 - " .. v.Name,
            ACTIVE = "使用习得[奇技]：" .. v.Name,
            file = "Objects\\InventoryItems\\tomeBlue\\tomeBlue.mdl",
            race = "human",
            ID_ARRAY = "gift_tao",
            cooldown = 0,
            perishable = 1,
        })
    end
end
