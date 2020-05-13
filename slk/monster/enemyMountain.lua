ENEMY_MOUNTAIN = {}
local ENEMY_CONF = {
    {
        Name = "石头人形",
        file = "units\\creeps\\RockGolem\\RockGolem",
        modelScale = 0.50,
        scale = 1.50,
        unitSound = "RockGolem",
    },
    {
        Name = "土色奥加",
        file = "units\\creeps\\Ogre\\Ogre",
        modelScale = 1.00,
        scale = 1.10,
        unitSound = "Ogre",
    },
    {
        Name = "天色奥加",
        file = "units\\creeps\\OgreMagi\\OgreMagi",
        modelScale = 1.00,
        scale = 1.10,
        unitSound = "Ogre",
    },
    {
        Name = "鹰女妖",
        file = "units\\creeps\\Harpy\\Harpy",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Harpy",
        movetp = "fly",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\HarpyMissile\\HarpyMissile.mdl"
    },
}

-- enemys
for _, v in ipairs(ENEMY_CONF) do
    if (v.movetp == "fly") then
        v.moveHeight = 200
    elseif (v.movetp == "hover") then
        v.moveHeight = 20
    end
    local obj = slk.unit.ogru:new("this_enemys_" .. v.Name)
    obj.Name = v.Name
    obj.abilList = ""
    obj.file = v.file
    obj.Art = "ReplaceableTextures\\CommandButtons\\BTNShade.blp"
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = 100
    obj.spd = 200
    obj.sight = 300
    obj.nsight = 300
    obj.unitSound = v.unitSound or ""
    obj.weapsOn = 1
    obj.movetp = v.movetp or "foot"--移动类型
    obj.moveHeight = v.moveHeight or 0 --移动高度
    obj.moveFloor = (v.moveHeight or 0) * 0.25 --最低高度
    obj.regenHP = 0
    obj.regenType = ""
    obj.def = 0
    obj.upgrades = ""
    obj.Builds = ""
    obj.fused = 0
    obj.dmgplus1 = 1
    obj.cool1 = 1.5
    obj.dmgpt1 = 0.5
    obj.backSw1 = 0.5
    if (obj.weapTp1 == CONST_WEAPON_TYPE.missile.value) then
        obj.acquire = 300
        obj.rangeN1 = 300
        obj.Missileart = v.Missileart or "Abilities\\Weapons\\SpiritOfVengeanceMissile\\SpiritOfVengeanceMissile.mdl"
        obj.Missilearc = 0.1
    else
        obj.acquire = 200
        obj.rangeN1 = 110
        obj.weapType1 = CONST_WEAPON_SOUND.RockHeavyBash.value
    end
    table.insert(ENEMY_MOUNTAIN, { UNIT_ID = obj:get_id(), Name = v.Name })
end