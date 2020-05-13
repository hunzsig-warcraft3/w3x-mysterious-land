BOSS_RUINS = {}
BOSS_CONF = {
    {
        Name = "九头蛇",
        file = "Units\\Creeps\\Hydra\\Hydra",
        modelScale = 1.30,
        scale = 2.50,
        unitSound = "AzureDragon",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl",
    },
    {
        Name = "紫蝎子",
        file = "Units\\Creeps\\Archnathidpurple\\Archnathidpurple",
        modelScale = 1.80,
        scale = 2.60,
        unitSound = "Archnathid",
    },
    {
        Name = "毁灭使者",
        file = "units\\demon\\DoomGuard\\DoomGuard",
        modelScale = 1.60,
        scale = 2.40,
        unitSound = "DoomGuard",
    },
    {
        Name = "恶魔守卫",
        file = "units\\demon\\Felgaurd\\Felgaurd",
        modelScale = 2.50,
        scale = 2.50,
        unitSound = "DoomGuard",
    },
    {
        Name = "风魔神",
        file = "war3mapImported\\unit_WindElemental.mdl",
        modelScale = 1.80,
        scale = 2.50,
        unitSound = "",
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
    table.insert(BOSS_RUINS, { UNIT_ID = obj:get_id(), Name = Name })
end
