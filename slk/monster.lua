local monster = {
    {
        Name = "秘地小傀儡",
        file = "units\\creeps\\GolemStatue\\GolemStatue",
        modelScale = 0.80,
        scale = 0.80,
        unitSound = "RockGolem",
    },
    {
        Name = "秘地傀儡",
        file = "units\\creeps\\GolemStatue\\GolemStatue",
        modelScale = 1.50,
        scale = 1.50,
        unitSound = "RockGolem",
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
    v.acquire = 800
    v.weapsOn = 1
    if (v.movetp == "fly") then
        v.moveHeight = 250
    elseif (v.movetp == "hover") then
        v.moveHeight = 30
    end
    if (v.weapTp1 == CONST_WEAPON_TYPE.missile.value) then
        v.rangeN1 = 600
        v.Missileart = v.Missileart or "Abilities\\Weapons\\WaterElementalMissile\\WaterElementalMissile.mdl"
        v.Missilearc = 0.1
    else
        v.rangeN1 = 130
        v.weapType1 = CONST_WEAPON_SOUND.WoodHeavyBash.value
    end
    slkHelper.unit.normal(v)
end
