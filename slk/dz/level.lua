local items = {
    {
        ATTR = {
            life = "+30",
        }
    },
    {
        ATTR = {
            life = "+40",
            life_back = "+0.5",
        }
    },
    {
        ATTR = {
            life = "+50",
            life_back = "+1.0",
            defend = "+2",
        }
    },
    {
        ATTR = {
            life = "+70",
            life_back = "+1.2",
            mana = "+50",
            defend = "+2",
        }
    },
    {
        ATTR = {
            life = "+100",
            life_back = "+1.6",
            mana = "+70",
            mana_back = "+0.6",
            defend = "+4",
        }
    },
    {
        ATTR = {
            life = "+130",
            life_back = "+2.0",
            mana = "+90",
            mana_back = "+0.8",
            defend = "+4",
            move = "+10",
        }
    },
    {
        ATTR = {
            life = "+150",
            life_back = "+2.2",
            mana = "+100",
            mana_back = "+1.0",
            defend = "+6",
            move = "+20",
            aim = "+10",
        }
    },
    {
        ATTR = {
            life = "+180",
            life_back = "+2.5",
            mana = "+120",
            mana_back = "+1.3",
            defend = "+6",
            move = "+30",
            aim = "+12",
        }
    },
    {
        ATTR = {
            life = "+200",
            life_back = "+2.8",
            mana = "+150",
            mana_back = "+1.5",
            defend = "+8",
            move = "+40",
            aim = "+16",
            toughness = "+10",
        }
    },
    {
        ATTR = {
            life = "+300",
            life_back = "+3.0",
            mana = "+200",
            mana_back = "+2.0",
            defend = "+10",
            move = "+50",
            aim = "+20",
            toughness = "+20",
            sight = "+200",
        }
    },
}

for k, v in ipairs(items) do
    if (k == #items) then
        v.Name = "初始月钥-Max"
    else
        v.Name = "初始月钥-Lv" .. k
    end
    v.Art = "ReplaceableTextures\\CommandButtons\\BTNMoonKey.blp"
    v.ACTIVE = "使用消耗钥匙并获得50%的属性"
    v.OVERLIE = 1
    v.WEIGHT = 0
    v.goldcost = 0
    v.lumbercost = 0
    v.powerup = 0
    v.sellable = 0
    v.pawnable = 0
    v.droppable = 0
    v.cooldown = 0
    slkHelper.item.normal(v)
end
