SUMMON = {}
SUMMON_CONF = {
    {
        Name = "蛇棒",
        file = "units\\orc\\SerpentWard\\SerpentWard",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "",
        spd = 0,
        weapTp1 = "missile",
        Missileart = "Abilities\\Weapons\\SerpentWardMissile\\SerpentWardMissile.mdl",
    },
    {
        Name = "骷髅兵",
        file = "units\\undead\\Skeleton\\Skeleton",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Skeleton",
        spd = 250,
        weapTp1 = "normal",
        weapType1 = "MetalHeavySlice"
    },
    {
        Name = "灰熊",
        file = "units\\creeps\\GrizzlyBear\\GrizzlyBear",
        modelScale = 0.90,
        scale = 1.10,
        unitSound = "GrizzlyBear",
        spd = 250,
        weapTp1 = "normal",
        weapType1 = "WoodMediumBash"
    },
    {
        Name = "炎魔",
        file = "Units\\Creeps\\LavaSpawn\\LavaSpawn",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "LavaSpawn",
        spd = 250,
        weapTp1 = "missile",
        Missileart = "Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnMissile.mdl"
    },
}

-- TOWER_SUMMON
for _, v in ipairs(SUMMON_CONF) do
    local obj = slk.unit.ogru:new("tower_summon_" .. v.Name)
    obj.Name = "[召唤]" .. v.Name
    obj.abilList = ""
    obj.upgrades = ""
    obj.file = v.file
    obj.Art = "ReplaceableTextures\\CommandButtons\\BTNSentryWard.blp"
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = 100
    obj.spd = v.spd or 0
    obj.sight = 500
    obj.nsight = 500
    obj.unitSound = v.unitSound or ""
    obj.weapsOn = 1
    obj.movetp = "foot"
    obj.moveHeight = 0
    obj.moveFloor = 0
    obj.regenHP = 0
    obj.regenType = ""
    obj.def = 0
    obj.cool1 = 1.50
    obj.fused = 0
    obj.weapTp1 = v.weapTp1 or "normal" --攻击类型
    if (v.weapTp1 == "normal") then
        obj.weapType1 = v.weapType1 --攻击声音
    elseif (v.weapTp1 == "missile") then
        obj.Missileart = v.Missileart -- 箭矢模型
        obj.Missilespeed = 900 -- 箭矢速度
        obj.Missilearc = 0.05
        obj.RangeN1 = 500
    end
    table.insert(SUMMON, { UNIT_ID = obj:get_id(), Name = v.Name })
end


