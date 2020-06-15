local monster = {
    {
        Name = "毒蝎子",
        file = "Units\\Creeps\\ArchnathidGreen\\ArchnathidGreen",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Archnathid",
    },
    {
        Name = "狗头人战士",
        file = "units\\creeps\\Kobold\\Kobold",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Kobold",
    },
    {
        Name = "狗头人牧师",
        file = "units\\creeps\\KoboldGeomancer\\KoboldGeomancer",
        modelScale = 1.00,
        scale = 1.00,
        unitSound = "Kobold",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",
    },
    {
        Name = "伺妖怪人",
        file = "Units\\Creeps\\Hydra\\Hydra",
        modelScale = 2.00,
        scale = 2.00,
        unitSound = "Hydra",
        weapTp1 = CONST_WEAPON_TYPE.missile.value,
        Missileart = "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl",
        rangeN1 = 350,
    },
}

for _, v in ipairs(monster) do
    v.Name = v.Name
    v.race = "undead"
    v.Art = "ReplaceableTextures\\CommandButtons\\BTNShade.blp"
    v.HP = 100
    v.spd = 100
    v.sight = 1000
    v.nsight = 800
    v.acquire = 1000
    v.weapsOn = 1
    if (v.movetp == "fly") then
        v.moveHeight = 250
    elseif (v.movetp == "hover") then
        v.moveHeight = 30
    end
    if (v.weapTp1 == CONST_WEAPON_TYPE.missile.value) then
        v.rangeN1 = v.rangeN1 or 450
        v.Missileart = v.Missileart or "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl"
        v.Missilearc = 0.1
    else
        v.rangeN1 = v.rangeN1 or 110
        v.weapType1 = CONST_WEAPON_SOUND.WoodHeavyBash.value
    end
    slkHelper.unit.normal(v)
end
