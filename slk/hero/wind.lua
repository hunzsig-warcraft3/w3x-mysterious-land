slkHelper.unit.hero({
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
    race = "human",
    CUSTOM_DATA = {
        feature = "剑圣"
    },
})