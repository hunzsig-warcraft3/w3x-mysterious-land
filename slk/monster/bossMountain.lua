BOSS_MOUNTAIN = {}
BOSS_CONF = {
    {
        Name = "鹰女妖皇",
        file = "units\\creeps\\HarpyQueen\\HarpyQueen",
        modelScale = 2.00,
        scale = 2.00,
        unitSound = "Harpy",
        movetp = "fly",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\HarpyMissile\\HarpyMissile.mdl"
    },
    {
        Name = "沙人",
        file = "war3mapImported\\unit_SandElementalV9_Final.mdl",
        modelScale = 2.10,
        scale = 2.50,
        unitSound = "RockGolem",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\TreantMissile\\TreantMissile.mdl",
    },
    {
        Name = "滚动岩",
        file = "war3mapImported\\unit_Rock_Elemental.mdl",
        modelScale = 2.10,
        scale = 2.50,
        unitSound = "RockGolem",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "abilities\\weapons\\catapult\\catapultmissile.mdl",
    },
    {
        Name = "泥漠魔神",
        file = "war3mapImported\\unit_EarthLich.mdl",
        modelScale = 2.60,
        scale = 2.25,
        unitSound = "RockGolem",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\TreantMissile\\TreantMissile.mdl",
    },
}

for _, v in ipairs(BOSS_CONF) do
    if (v.movetp == "fly") then
        v.moveHeight = 250
    elseif (v.movetp == "hover") then
        v.moveHeight = 30
    end
    local Name = "BOSS-" .. v.Name
    local obj = slk.unit.ogru:new("this_boss_" .. v.Name)
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
    table.insert(BOSS_MOUNTAIN, { UNIT_ID = obj:get_id(), Name = Name })
end
