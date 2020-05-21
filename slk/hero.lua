local heros = {
    {
        Name = "剑士",
        Propernames = "无名氏",
        Ubertip = hColor.sky("特征：战士") .. "|n" .. hColor.grey("身穿盔甲的战士，持剑作战，攻防兼备。"),
        Art = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp",
        file = "units\\human\\Footman\\Footman",
        unitSound = "Footman",
        movetp = "foot",
        moveHeight = 0.00,
        spd = 270, -- 移动速度
        rangeN1 = 125, -- 攻击范围
        dmgplus1 = 20, -- 基础攻击
        weapTp1 = CONST_WEAPON_TYPE.normal.value, -- 攻击类型
        weapType1 = CONST_WEAPON_SOUND.MetalMediumSlice.value, -- 攻击类型
        Missileart = "", -- 箭矢
        cool1 = 1.7, -- 攻击周期
        backSw1 = 0.5, -- 攻击后摇
        dmgpt1 = 0.5, -- 攻击前摇
        modelScale = 1.10,
        scale = 1.10,
        Primary = "AGI",
        STR = 24,
        AGI = 27,
        INT = 25,
        STRplus = 1.9,
        AGIplus = 2.3,
        INTplus = 2.1,
        goldcost = 0,
        CUSTOM_DATA = {
            features = "战士"
        },
    },
    {
        Name = "骑士",
        Propernames = "无名氏",
        Ubertip = hColor.sky("特征：战士") .. "|n" .. hColor.grey("骑架铁马的战士，冲锋陷阵，防御奇佳。"),
        Art = "ReplaceableTextures\\CommandButtons\\BTNKnight.blp",
        file = "units\\human\\Knight\\Knight",
        unitSound = "Knight",
        movetp = "horse",
        moveHeight = 0.00,
        spd = 290, -- 移动速度
        rangeN1 = 200, -- 攻击范围
        dmgplus1 = 18, -- 基础攻击
        weapTp1 = CONST_WEAPON_TYPE.normal.value, -- 攻击类型
        weapType1 = CONST_WEAPON_SOUND.MetalHeavySlice.value, -- 攻击类型
        Missileart = "", -- 箭矢
        cool1 = 1.7, -- 攻击周期
        backSw1 = 0.44, -- 攻击后摇
        dmgpt1 = 0.66, -- 攻击前摇
        modelScale = 1.10,
        scale = 1.10,
        Primary = "STR",
        STR = 30,
        AGI = 15,
        INT = 22,
        STRplus = 2.4,
        AGIplus = 1.7,
        INTplus = 2.0,
        goldcost = 0,
        CUSTOM_DATA = {
            features = "战士"
        },
    },
    {
        Name = "弓箭手",
        Propernames = "无名氏",
        Ubertip = hColor.sky("特征：射击手") .. "|n" .. hColor.grey("远程攻击手，在安全的地方妥善袭击，游击战斗。"),
        Art = "ReplaceableTextures\\CommandButtons\\BTNHighElvenArcher.blp",
        file = "units\\creeps\\HighElfArcher\\HighElfArcher",
        unitSound = "Archer",
        movetp = "foot",
        moveHeight = 0.00,
        spd = 270, -- 移动速度
        rangeN1 = 600, -- 攻击范围
        dmgplus1 = 17, -- 基础攻击
        weapTp1 = CONST_WEAPON_TYPE.missile.value, -- 攻击类型
        weapType1 = nil, -- 攻击类型
        Missileart = "Abilities\\Weapons\\Arrow\\ArrowMissile.mdl", -- 箭矢
        cool1 = 1.8, -- 攻击周期
        backSw1 = 0.28, -- 攻击后摇
        dmgpt1 = 0.72, -- 攻击前摇
        modelScale = 1.10,
        scale = 1.10,
        Primary = "AGI",
        STR = 19,
        AGI = 26,
        INT = 24,
        STRplus = 1.8,
        AGIplus = 2.3,
        INTplus = 2.2,
        goldcost = 0,
        CUSTOM_DATA = {
            features = "射击手"
        },
    },
    {
        Name = "魔法师",
        Propernames = "无名氏",
        Ubertip = hColor.sky("特征：魔导者") .. "|n" .. hColor.grey("神秘的魔法使用者，善用法术进行攻防。"),
        Art = "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp",
        file = "units\\creeps\\Medivh\\Medivh",
        unitSound = "Medivh",
        movetp = "foot",
        moveHeight = 0.00,
        spd = 255, -- 移动速度
        rangeN1 = 600, -- 攻击范围
        dmgplus1 = 10, -- 基础攻击
        weapTp1 = CONST_WEAPON_TYPE.missile.value, -- 攻击类型
        weapType1 = nil, -- 攻击类型
        Missileart = "Abilities\\Weapons\\DruidoftheTalonMissile\\DruidoftheTalonMissile.mdl", -- 箭矢
        cool1 = 1.8, -- 攻击周期
        backSw1 = 0.49, -- 攻击后摇
        dmgpt1 = 0.6, -- 攻击前摇
        modelScale = 1.10,
        scale = 1.10,
        Primary = "INT",
        STR = 15,
        AGI = 18,
        INT = 28,
        STRplus = 1.6,
        AGIplus = 1.7,
        INTplus = 2.6,
        goldcost = 1,
        lumbercost = 1,
        CUSTOM_DATA = {
            features = "魔导者"
        },
    },
    {
        Name = "疾风剑圣",
        Propernames = "逸风",
        Ubertip = hColor.sky("特征：剑圣") .. "|n" .. hColor.grey("无影无踪的剑圣，一人如同万军的神剑。在过去逃出生天后，开始在山海间游历。"),
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
        STR = 32,
        AGI = 41,
        INT = 35,
        STRplus = 2.5,
        AGIplus = 3.3,
        INTplus = 2.6,
        goldcost = 10000,
        CUSTOM_DATA = {
            features = "剑圣"
        },
    },
    {
        Name = "山丘之王",
        Propernames = "波尔",
        Ubertip = hColor.sky("特征：领袖") .. "|n" .. hColor.grey("波尔是矮人族的暴力狂王者，大力无穷。在任期时常冲锋陷阵，开山劈海，所向披靡。在一次机缘之下，感悟雷电之力，可操纵雷鸣。"),
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
        STR = 48,
        AGI = 26,
        INT = 37,
        STRplus = 4.0,
        AGIplus = 2.3,
        INTplus = 2.8,
        goldcost = 10000,
        CUSTOM_DATA = {
            features = "领袖"
        },
    },
}

for _, v in pairs(heros) do
    v.race = "human"
    slkHelper.unit.hero(v)
end