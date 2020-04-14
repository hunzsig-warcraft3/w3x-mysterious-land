-- courier
local COURIERS_SKILL = {}
local COURIERS_SKILL_IDS = {}

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
table.insert(COURIERS_SKILL_IDS, obj:get_id())
table.insert(COURIERS_SKILL, { Name = Name, ABILITY_ID = obj:get_id() })

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
table.insert(COURIERS_SKILL_IDS, obj:get_id())
table.insert(COURIERS_SKILL, { Name = Name, ABILITY_ID = obj:get_id() })

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
table.insert(COURIERS_SKILL_IDS, obj:get_id())
table.insert(COURIERS_SKILL, { Name = Name, ABILITY_ID = obj:get_id() })