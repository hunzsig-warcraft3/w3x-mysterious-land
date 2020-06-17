local items = {
    {
        Name = "初始装备-Lv1",
        ATTR = {
            life = "+30",
        }
    },
    {
        Name = "初始装备-Lv2",
        ATTR = {
            life = "+30",
        }
    },
}

for _, v in ipairs(items) do
    v.Art = "ReplaceableTextures\\CommandButtons\\BTNMedalionOfCourage.blp"
    v.ACTIVE = "使用永久获得一半的属性"
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