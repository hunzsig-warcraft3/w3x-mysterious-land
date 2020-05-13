BOSS_DARK = {}
BOSS_CONF = {
    {
        Name = "淤泥怪",
        file = "units\\creeps\\SludgeMonster\\SludgeMonster",
        modelScale = 2.00,
        scale = 3.20,
        unitSound = "SludgeMonster",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\SludgeMissile\\SludgeMissile.mdl",
    },
    {
        Name = "骨魔",
        file = "war3mapImported\\unit_Banisher.mdl",
        modelScale = 2.00,
        scale = 2.50,
        unitSound = "Skeleton",
    },
    {
        Name = "暗黑巨魔",
        file = "war3mapImported\\unit_ShadowInfernal.mdl",
        modelScale = 1.50,
        scale = 2.30,
        unitSound = "",
    },
    {
        Name = "暗黑魔神",
        file = "war3mapImported\\unit_ShadowInfernal2.mdl",
        modelScale = 1.65,
        scale = 2.50,
        unitSound = "",
    },
    {
        Name = "南瓜妖魔",
        file = "war3mapImported\\unit_JackONightmare.mdl",
        modelScale = 2.50,
        scale = 2.50,
        unitSound = "",
    },
    {
        Name = "轮回魔神",
        file = "war3mapImported\\unit_Mindflayer.mdl",
        modelScale = 2.30,
        scale = 2.50,
        unitSound = "",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\SludgeMissile\\SludgeMissile.mdl",
    },
}

for _, v in ipairs(BOSS_CONF) do
    local Name = "BOSS-" .. v.Name
    local obj = slk.unit.ogru:new("this_boss_" .. v.Name)
    if (v.movetp == "fly") then
        v.moveHeight = 250
    elseif (v.movetp == "hover") then
        v.moveHeight = 30
    end
    obj.Name = Name
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
    table.insert(BOSS_DARK, { UNIT_ID = obj:get_id(), Name = Name })
end
