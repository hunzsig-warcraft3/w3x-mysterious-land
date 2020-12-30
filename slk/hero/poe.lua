slkHelper.unit.hero({
    Name = "山丘之王",
    Propernames = "波尔",
    Ubertip = hColor.sky("特性：王权") .. "|n" .. hColor.grey("波尔是矮人族的暴力狂王者，大力无穷。在任期时常冲锋陷阵，开山劈海，所向披靡。在一次机缘之下，感悟雷电之力，可操纵雷鸣。"),
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
    race = "human",
    _hslk = {
        feature = "王权"
    },
})
