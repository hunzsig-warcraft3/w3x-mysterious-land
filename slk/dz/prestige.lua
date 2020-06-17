local items = {
    {
        prestige = "冒险者",
        ATTR = {
            life = "+50",
            attack_green = "+10",
        }
    },
    {
        prestige = "历险者",
        ATTR = {
            life = "+100",
            attack_green = "+30",
        }
    },
    {
        prestige = "先驱者",
        ATTR = {
            life = "+150",
            attack_green = "+50",
            attack_speed = "+4",
        }
    },
    {
        prestige = "千军勇士",
        ATTR = {
            life = "+250",
            attack_green = "+80",
            attack_speed = "+6",
        }
    },
    {
        prestige = "神武飞将",
        ATTR = {
            life = "+350",
            attack_green = "+120",
            attack_speed = "+8",
            punish = "+200",
        }
    },
    {
        prestige = "天绝斗者",
        ATTR = {
            life = "+400",
            attack_green = "+150",
            attack_speed = "+12",
            punish = "+400",
        }
    },
    {
        prestige = "灭劫霸王",
        ATTR = {
            life = "+500",
            attack_green = "+200",
            attack_speed = "+16",
            punish = "+600",
            weight = "+10",
        }
    },
    {
        prestige = "六御武帝",
        ATTR = {
            life = "+600",
            attack_green = "+250",
            attack_speed = "+20",
            punish = "+800",
            weight = "+20",
            damage_extent = "+6",
        }
    },
    {
        prestige = "九苍武神",
        ATTR = {
            life = "+900",
            attack_green = "+300",
            attack_speed = "+30",
            punish = "+1000",
            weight = "+30",
            damage_extent = "+10",
            hemophagia = "+20",
            hemophagia_skill = "+20",
        }
    },
}

for _, v in ipairs(items) do
    v.Name = "诀尊阳钥[" .. v.prestige .. "专享]"
    v.Desc = v.prestige .. "专用的太阳神钥匙"
    v.Art = "ReplaceableTextures\\CommandButtons\\BTNSunKey.blp"
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
