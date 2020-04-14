COURIERS = {} --to vjass

COURIERS_CONF = {
    {
        Name = "呆萌的青蛙",
        unitSound = "Frog",
        file = "units\\critters\\Frog\\Frog",
        Art = "ReplaceableTextures\\CommandButtons\\BTNHex.blp",
        modelScale = 1.50,
        scale = 1.20,
        moveHeight = 0,
        targType = "ground",
        armor = "Flesh",
        lumbercost = 1
    },
    {
        Name = "冷静的绵羊",
        unitSound = "Sheep",
        file = "units\\critters\\Sheep\\Sheep",
        Art = "ReplaceableTextures\\CommandButtons\\BTNSheep.blp",
        modelScale = 1.50,
        scale = 1.20,
        moveHeight = 0,
        targType = "ground",
        armor = "Flesh",
        lumbercost = 15
    },
    {
        Name = "小饥鸡",
        unitSound = "Chicken",
        file = "units\\critters\\EasterChicken\\EasterChicken",
        Art = "ReplaceableTextures\\CommandButtons\\BTNCritterChicken.blp",
        modelScale = 1.40,
        scale = 1.20,
        moveHeight = 0,
        targType = "ground",
        armor = "Flesh",
        lumbercost = 20
    },
    {
        Name = "依诺吸吸",
        unitSound = "QuillBeast",
        file = "units\\critters\\Felboar\\Felboar",
        Art = "ReplaceableTextures\\CommandButtons\\BTNFelBoar.blp",
        modelScale = 1.40,
        scale = 1.20,
        moveHeight = 0,
        targType = "ground",
        armor = "Flesh",
        lumbercost = 25
    },
    {
        Name = "灵动的雪鹰",
        unitSound = "SnowOwl",
        file = "units\\critters\\SnowOwl\\SnowOwl",
        Art = "ReplaceableTextures\\CommandButtons\\BTNSnowOwl.blp",
        modelScale = 1.20,
        scale = 1.20,
        movetp = "fly",
        moveHeight = 225.00,
        spd = 450,
        targType = "air",
        armor = "Flesh",
        lumbercost = 30
    },
}

-- courier
COURIERS_SKILL = {}
COURIERS_SKILL_IDS = {}

--一般闪烁
local obj = slk.ability.AEbl:new("couriers_sk_blink_all")
local Name = "闪烁"
local Tip = "闪烁(" .. hColor.greenLight("Q") .. ")"
obj.Name = Name
obj.Tip = Tip
obj.Hotkey = "Q"
obj.Ubertip = "可以闪烁到地图的任何地方"
obj.Buttonpos1 = 0
obj.Buttonpos2 = 0
obj.hero = 0
obj.levels = 1
obj.DataA1 = 99999
obj.DataB1 = 0
obj.Cool1 = 3
obj.Cost1 = 0
obj.Art = "ReplaceableTextures\\CommandButtons\\BTNBlink.blp"
obj.SpecialArt = "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl"
obj.Areaeffectart = "Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl"
local id = obj:get_id()
table.insert(COURIERS_SKILL_IDS, id)
table.insert(COURIERS_SKILL, { ABILITY_ID = id, Name = Name })

--一键拾取
obj = slk.ability.ANcl:new("couriers_sk_pick_all")
Name = "拾取"
Tip = "拾取(" .. hColor.greenLight("R") .. ")"
obj.Order = "manaburn"
obj.DataF1 = "manaburn"
obj.Name = Name
obj.Tip = Tip
obj.Hotkey = "R"
obj.Ubertip = "将附近地上的物品拾取到身上"
obj.Buttonpos1 = 3
obj.Buttonpos2 = 0
obj.hero = 0
obj.levels = 1
obj.DataA1 = 0
obj.DataB1 = 0
obj.DataC1 = 1
obj.DataD1 = 0.01
obj.Cool1 = 1
obj.Cost1 = 0
obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPickUpItem.blp"
obj.CasterArt = ""
obj.EffectArt = ""
obj.TargetArt = ""
id = obj:get_id()
table.insert(COURIERS_SKILL_IDS, id)
table.insert(COURIERS_SKILL, { ABILITY_ID = id, Name = Name })

--木换金
obj = slk.ability.ANcl:new("couriers_sk_l2g")
Name = "开心金箱子"
Tip = "开心金箱子(" .. hColor.greenLight("D") .. ") - " .. hColor.green("30木头")
obj.Order = "ancestralspirittarget"
obj.DataF1 = "ancestralspirittarget"
obj.Name = Name
obj.Tip = Tip
obj.Hotkey = "D"
obj.Ubertip = "花费30木头即可来一次开心抽金箱子哦~"
    .. "|n" .. hColor.green("木头免费的哟：每局玩都累计：地图等级+过关数")
    .. "|n" .. hColor.green("对战模式胜利者更有额外100木头(AI也有哦~)")
    .. "|n" .. hColor.redLight("特等赏：黄金8888")
    .. "|n" .. hColor.yellow("一等赏：黄金1888")
    .. "|n" .. hColor.yellowLight("二等赏：黄金888")
    .. "|n" .. hColor.greenLight("三等赏：黄金388")
    .. "|n" .. hColor.skyLight("安慰奖：谢谢惠顾 ^_^")
obj.Buttonpos1 = 2
obj.Buttonpos2 = 1
obj.hero = 0
obj.levels = 1
obj.DataA1 = 0
obj.DataB1 = 0
obj.DataC1 = 1
obj.DataD1 = 0.01
obj.DataE1 = 0
obj.Cool1 = 0
obj.Cost1 = 0
obj.Art = "ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp"
obj.CasterArt = "Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl"
obj.EffectArt = ""
obj.TargetArt = ""
id = obj:get_id()
table.insert(COURIERS_SKILL_IDS, id)
table.insert(COURIERS_SKILL, { ABILITY_ID = id, Name = Name })

-- courier
for _, v in ipairs(COURIERS_CONF) do
    -- 处理信使数据
    local Ubertip = "召唤：" .. v.Name
    obj = slk.unit.ogru:new("couriers_" .. v.Name)
    obj.type = "Peon"
    obj.upgrades = ""
    obj.weapsOn = 0
    obj.Hotkey = ""
    obj.tilesets = 1
    obj.hostilePal = 0
    obj.Requires = "" --需求,全部无限制，用代码限制
    obj.Requirescount = 1
    obj.Requires1 = ""
    obj.Requires2 = ""
    obj.upgrade = ""
    obj.collision = 0.00
    obj.unitShadow = "ShadowFlyer"
    obj.Buttonpos1 = 0
    obj.Buttonpos2 = 0
    obj.death = 0.10
    obj.turnRate = 1.00
    obj.acquire = 1000.00
    obj.race = "human"
    obj.deathType = 0
    obj.fused = 0
    obj.sides1 = 5 --骰子面
    obj.dice1 = 1 --骰子数量
    obj.regenMana = 0.00
    obj.HP = 99999
    obj.regenHP = 99999
    obj.stockStart = 0
    obj.stockRegen = 0
    obj.stockMax = 1
    obj.collision = 0 --接触体积
    obj.def = v.def or 0.00 -- 护甲
    obj.sight = v.sight or 1000 -- 白天视野
    obj.nsight = v.nsight or 1000 -- 夜晚视野
    obj.nameCount = v.nameCount or 1
    obj.Tip = "选择 " .. v.Name
    obj.Name = "[信使]" .. v.Name
    obj.Awakentip = "复活 " .. v.Name
    obj.Revivetip = "复活 " .. v.Name
    obj.Tip = "召唤 " .. v.Name
    obj.Ubertip = Ubertip
    obj.unitSound = v.unitSound -- 声音
    obj.modelScale = v.modelScale --模型缩放
    obj.file = v.file --模型
    obj.Art = v.Art --头像
    obj.scale = v.scale --选择圈
    obj.movetp = v.movetp or "" --移动类型
    obj.moveHeight = v.moveHeight --移动高度
    obj.moveFloor = v.moveHeight * 0.25 --最低高度
    obj.spd = 522
    obj.armor = v.armor -- 被击声音
    obj.targType = v.targType --作为目标类型
    obj.upgrades = ""
    obj.Builds = ""
    obj.fused = 0
    obj.abilList = "AInv," .. string.implode(',', COURIERS_SKILL_IDS)
    table.insert(COURIERS, { UNIT_ID = obj:get_id(), Name = Name })
end