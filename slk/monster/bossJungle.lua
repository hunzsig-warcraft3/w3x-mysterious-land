BOSS_JUNGLE = {}
BOSS_CONF = {
    {
        Name = "剧毒蛛母",
        file = "war3mapImported\\unit_Dark_Spider.mdl",
        modelScale = 2.20,
        scale = 2.50,
        unitSound = "Spider",
    },
    {
        Name = "闪电之灵",
        file = "war3mapImported\\unit_LightningTitan.mdl",
        modelScale = 1.60,
        scale = 2.50,
        unitSound = "",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",
    },
    {
        Name = "电光三叉体",
        file = "war3mapImported\\unit_NakedLightning.mdl",
        modelScale = 1.60,
        scale = 2.50,
        unitSound = "",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",
        abilList = "Alit",
    },
    {
        Name = "大气之灵",
        file = "war3mapImported\\unit_air.mdl",
        modelScale = 1.90,
        scale = 2.50,
        unitSound = "",
        movetp = "hover",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",
    },
    {
        Name = "风暴之灵",
        file = "war3mapImported\\unit_AirElemental.mdl",
        modelScale = 1.90,
        scale = 2.50,
        unitSound = "",
        movetp = "hover",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",
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
    obj.abilList = v.abilList or ""
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
    table.insert(BOSS_JUNGLE, { UNIT_ID = obj:get_id(), Name = Name })
end
