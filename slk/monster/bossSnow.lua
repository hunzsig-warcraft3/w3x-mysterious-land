BOSS_SNOW = {}
BOSS_CONF = {
    {
        Name = "冰霜巨龙",
        file = "units\\undead\\FrostWyrm\\FrostWyrm",
        modelScale = 1.75,
        scale = 2.25,
        unitSound = "FrostWyrm",
        movetp = "fly",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl",
    },
    {
        Name = "冰元神",
        file = "war3mapImported\\unit_FrostTitan.mdl",
        modelScale = 1.70,
        scale = 2.50,
        unitSound = "Infernal",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl",
    },
    {
        Name = "冰魔神",
        file = "war3mapImported\\unit_iceElemental.mdl",
        modelScale = 1.70,
        scale = 2.50,
        unitSound = "Infernal",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",
    },
    {
        Name = "霜殇巫妖",
        file = "war3mapImported\\unit_Kelthuzad_Lich.mdl",
        modelScale = 2.30,
        scale = 2.50,
        unitSound = "Banshee",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",
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
    table.insert(BOSS_SNOW, { UNIT_ID = obj:get_id(), Name = Name })
end
