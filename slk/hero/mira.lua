slkHelper.ability.ring({
    Name = "月神强击",
    Art = "ReplaceableTextures\\PassiveButtons\\PASBTNTrueShot.blp",
    TargetArt = "Abilities\\Spells\\NightElf\\TrueshotAura\\TrueshotAura.mdl",
    Area1 = 600,
    Hotkey = "E",
    race = "human",
    _ring = {
        attr = {
            attack_green = "+90",
            aim = "+20"
        },
    },
})

slkHelper.unit.hero({
    Name = "白虎女祭祀",
    Propernames = "米拉",
    Ubertip = hcolor.sky("特性：典雅之月") .. "|n" .. hcolor.grey("侍奉月神的骑白虎女弓手，在月光的照耀下优雅游击战斗"),
    Art = "ReplaceableTextures\\CommandButtons\\BTNPriestessOfTheMoon.blp",
    file = "units\\nightelf\\HeroMoonPriestess\\HeroMoonPriestess",
    unitSound = "HeroMoonPriestess",
    movetp = "foot",
    moveHeight = 0.00,
    spd = 290, -- 移动速度
    rangeN1 = 600, -- 攻击范围
    dmgplus1 = 21, -- 基础攻击
    weapTp1 = CONST_WEAPON_TYPE.missile.value, -- 攻击类型
    weapType1 = nil, -- 攻击类型
    Missileart = "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl", -- 箭矢
    cool1 = 1.7, -- 攻击周期
    backSw1 = 0.7, -- 攻击后摇
    dmgpt1 = 0.3, -- 攻击前摇
    modelScale = 1.00,
    scale = 2.25,
    Primary = "INT",
    STR = 22,
    AGI = 30,
    INT = 30,
    STRplus = 2.1,
    AGIplus = 2.5,
    INTplus = 2.5,
    race = "human",
    _hslk = {
        feature = "典雅之月",
        ability = { "月神强击E" }
    },
})
