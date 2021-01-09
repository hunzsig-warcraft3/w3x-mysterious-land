local gift = {
    {
        Name = "封印",
        _desc = "[奇]字技，特别神奇且怪异的技能|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        _attr = nil,
    },
    {
        Name = "无我",
        Art = "war3mapImported\\icon_pas_Arcane_MindMastery.blp",
        _attr = {
            sight = "+500",
            damage_reduction = "+200",
        },
    },
    {
        Name = "醍醐点化",
        Art = "war3mapImported\\icon_pas_Holy_BlindingHeal.blp",
        _attr = {
            gold_ratio = "+50",
            exp_ratio = "+50",
        },
    },
    {
        Name = "勿想冥念",
        Art = "war3mapImported\\icon_pas_Arcane_StudentOfMagic.blp",
        _attr = {
            mana = "+1000",
            int_green = "+200",
        },
    },
    {
        Name = "神的使者",
        Art = "war3mapImported\\icon_pas_Holy_Absolution.blp",
        _attr = {
            e_god_attack = "+1",
            e_god = "+30",
            e_god_oppose = "+30",
        },
    },
}

for _, v in ipairs(gift) do
    slkHelper.ability.empty({
        Art = v.Art,
        Name = "奇 - " .. v.Name,
        Buttonpos1 = 3,
        Buttonpos2 = 1,
        race = "human",
        _desc = v._desc,
        _attr = v._attr,
        _hslk = {
            gift_type = "gift_tao",
        }
    })
end

for _, v in ipairs(gift) do
    if (v._attr ~= nil) then
        slkHelper.item.normal({
            Art = v.Art,
            Name = "秘笈：奇 - " .. v.Name,
            file = "Objects\\InventoryItems\\tomeBlue\\tomeBlue.mdl",
            race = "human",
            cooldown = 0,
            perishable = 1,
            _attr_txt = v._attr,
            _active = "使用习得[奇技]：" .. v.Name,
        })
    end
end
