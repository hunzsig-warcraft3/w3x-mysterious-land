local heros = {
    {
        Name = "月白虎祭祀",
        Propernames = "米拉",
        Ubertip = hColor.sky("特性：月的使者") .. "|n" .. hColor.grey("侍奉月神的骑虎女弓手，在月光的照耀下优雅游击战斗"),
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
        CUSTOM_DATA = {
            feature = "月的使者"
        },
    },
    {
        Name = "疾风剑圣",
        Propernames = "逸风",
        Ubertip = hColor.sky("特性：剑圣") .. "|n" .. hColor.grey("无影无踪的剑圣，一人如同万军的神剑。在过去逃出生天后，开始在山海间游历。"),
        Art = "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp",
        file = "units\\orc\\HeroBladeMaster\\HeroBladeMaster",
        unitSound = "HeroBladeMaster",
        movetp = "foot",
        moveHeight = 0.00,
        spd = 300, -- 移动速度
        rangeN1 = 125, -- 攻击范围
        dmgplus1 = 33, -- 基础攻击
        weapTp1 = CONST_WEAPON_TYPE.normal.value, -- 攻击类型
        weapType1 = CONST_WEAPON_SOUND.MetalMediumSlice.value, -- 攻击类型
        Missileart = "", -- 箭矢
        cool1 = 1.5, -- 攻击周期
        backSw1 = 0.84, -- 攻击后摇
        dmgpt1 = 0.33, -- 攻击前摇
        modelScale = 1.10,
        scale = 1.10,
        Primary = "AGI",
        STR = 23,
        AGI = 36,
        INT = 22,
        STRplus = 2.2,
        AGIplus = 3.1,
        INTplus = 2.0,
        CUSTOM_DATA = {
            feature = "剑圣"
        },
    },
    {
        Name = "山丘之王",
        Propernames = "波尔",
        Ubertip = hColor.sky("特性：领袖") .. "|n" .. hColor.grey("波尔是矮人族的暴力狂王者，大力无穷。在任期时常冲锋陷阵，开山劈海，所向披靡。在一次机缘之下，感悟雷电之力，可操纵雷鸣。"),
        Art = "ReplaceableTextures\\CommandButtons\\BTNHeroMountainKing.blp",
        file = "units\\human\\HeroMountainKing\\HeroMountainKing",
        unitSound = "HeroMountainKing",
        movetp = "foot",
        moveHeight = 0.00,
        spd = 270, -- 移动速度
        rangeN1 = 125, -- 攻击范围
        dmgplus1 = 40, -- 基础攻击
        weapTp1 = CONST_WEAPON_TYPE.normal.value, -- 攻击类型
        weapType1 = CONST_WEAPON_SOUND.MetalHeavyBash.value, -- 攻击声音
        Missileart = "", -- 箭矢
        cool1 = 1.8, -- 攻击周期
        backSw1 = 0.65, -- 攻击后摇
        dmgpt1 = 0.35, -- 攻击前摇
        modelScale = 1.30,
        scale = 1.30,
        Primary = "STR",
        STR = 40,
        AGI = 13,
        INT = 24,
        STRplus = 3.6,
        AGIplus = 1.5,
        INTplus = 1.6,
        CUSTOM_DATA = {
            feature = "领袖"
        },
    },
}

for _, v in pairs(heros) do
    v.race = "human"
    slkHelper.unit.hero(v)
end
