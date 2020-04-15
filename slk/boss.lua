BOSS = {}
BOSS_CONF = {
    {
        Name = "陨石火",
        file = "war3mapImported\\unit_abyssal_illidan.mdl",
        modelScale = 2.00,
        scale = 2.50,
    },
    {
        Name = "异动机车",
        file = "war3mapImported\\unit_Aestus.mdl",
        modelScale = 2.00,
        scale = 2.50,
    },
    {
        Name = "大气之灵",
        file = "war3mapImported\\unit_air.mdl",
        modelScale = 1.90,
        scale = 2.50,
    },
    {
        Name = "风暴之灵",
        file = "war3mapImported\\unit_AirElemental.mdl",
        modelScale = 2.60,
        scale = 2.50,
    },
    {
        Name = "钻石巨人",
        file = "war3mapImported\\unit_AncientOfStone(heavy).mdl",
        modelScale = 1.80,
        scale = 2.50,
    },
    {
        Name = "金属火",
        file = "war3mapImported\\unit_BrassInfernal.mdl",
        modelScale = 1.70,
        scale = 2.50,
    },
    {
        Name = "两级行刑人",
        file = "war3mapImported\\unit_Celsius.mdl",
        modelScale = 2.30,
        scale = 2.50,
    },
    {
        Name = "剧毒蜘蛛",
        file = "war3mapImported\\unit_Dark_Spider.mdl",
        modelScale = 2.20,
        scale = 2.50,
    },
    {
        Name = "幽火之灵",
        file = "war3mapImported\\unit_Dark1.mdl",
        modelScale = 2.70,
        scale = 2.50,
    },
}

for _, v in ipairs(BOSS_CONF) do
    local obj = slk.unit.ogru:new("this_enemys_boss_" .. v.Name)
    obj.Name = v.Name
    obj.abilList = ""
    obj.file = v.file
    obj.Art = "ReplaceableTextures\\CommandButtons\\BTNCarrionScarabs.blp"
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = 100
    obj.spd = 125
    obj.sight = 500
    obj.nsight = 500
    obj.unitSound = v.unitSound or ""
    obj.weapsOn = 0
    obj.movetp = v.movetp or "foot"--移动类型
    obj.moveHeight = v.moveHeight or 0 --移动高度
    obj.moveFloor = (v.moveHeight or 0) * 0.25 --最低高度
    obj.regenHP = 0
    obj.regenType = ""
    obj.def = 0
    obj.upgrades = ""
    obj.Builds = ""
    obj.fused = 0
    table.insert(BOSS, { UNIT_ID = obj:get_id(), Name = v.Name })
end