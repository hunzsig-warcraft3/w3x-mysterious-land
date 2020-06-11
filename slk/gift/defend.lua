local gift = {
    {
        Name = "封印",
        Desc = "[御]字技，在于巩固英雄的防御|n当前正处于封印状态",
        Art = "war3mapImported\\icon_pas_Slow_Grey.blp",
        ATTR = nil,
    },
    {
        Name = "蛮力抵抗",
        Art = "war3mapImported\\icon_pas_Ability_Warrior_ShieldGuard.blp",
        ATTR = {
            defend = "+15",
        },
    },
    {
        Name = "反射盾牌",
        Art = "war3mapImported\\icon_pas_Ability_Warrior_ShieldReflection.blp",
        ATTR = {
            damage_rebound = "+10",
            damage_rebound_oppose = "+10",
        },
    },
    {
        Name = "苦难之炼",
        Art = "war3mapImported\\icon_pas_Mage_MoltenArmor.blp",
        ATTR = {
            defend = "-25",
            damage_rebound = "+30",
        },
    },
    {
        Name = "胜者之盾",
        Art = "war3mapImported\\icon_pas_Invulnerable.blp",
        ATTR = {
            defend = "+20",
            invincible = "+10",
        },
    },
    {
        Name = "铁布衫",
        Art = "war3mapImported\\icon_pas_Spell_Holy_SpellWarding.blp",
        ATTR = {
            toughness = "+150",
        },
    },
}

for _, v in ipairs(gift) do
    slkHelper.ability.empty({
        Art = v.Art,
        Desc = v.Desc,
        ATTR = v.ATTR,
        Name = "御 - " .. v.Name,
        Buttonpos1 = 1,
        Buttonpos2 = 1,
        race = "human",
        ID_ARRAY = "gift_defend",
    })
end

for _, v in ipairs(gift) do
    if (v.ATTR ~= nil) then
        slkHelper.item.normal({
            Art = v.Art,
            ATTR_TXT = v.ATTR,
            Name = "秘笈：御 - " .. v.Name,
            ACTIVE = "使用习得[御技]：" .. v.Name,
            file = "Objects\\InventoryItems\\tomeBlue\\tomeBlue.mdl",
            race = "human",
            ID_ARRAY = "gift_defend",
            cooldown = 0,
            perishable = 1,
        })
    end
end
