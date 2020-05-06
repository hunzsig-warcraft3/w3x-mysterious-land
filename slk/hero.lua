HEROS = {}

local heros = {
    BLADE_MASTER_WIND = HERO_BLADE_MASTER_WIND,
    MOUNTAIN_KING_BOL = HERO_MOUNTAIN_KING_BOL,
}

for key, v in pairs(heros) do
    local thisIndex = v.Name
    -- 处理塔基数据
    local obj = slk.unit.Hpal:new("hero_" .. key)
    local Primary = v.Primary or "STR"
    local acquire = v.rangeN1 -- 警戒范围
    if (acquire < 1000) then
        acquire = 1000
    end
    local Ubertip = ""
    Ubertip = Ubertip .. hColor.sky("特征：" .. string.implode(",", v.Features))
    Ubertip = Ubertip .. "|n" .. hColor.red("攻击类型：" .. CONST_WEAPON_TYPE[v.weapTp1].label .. "(" .. v.cool1 .. "秒/击)")
    Ubertip = Ubertip .. "|n" .. hColor.redLight("基础攻击：" .. v.dmgplus1)
    Ubertip = Ubertip .. "|n" .. hColor.seaLight("攻击范围：" .. v.rangeN1)
    if (Primary == "STR") then
        Ubertip = Ubertip .. "|n" .. hColor.yellow("力量：" .. v.STR .. "(+" .. v.STRplus .. ")")
    else
        Ubertip = Ubertip .. "|n" .. hColor.yellowLight("力量：" .. v.STR .. "(+" .. v.STRplus .. ")")
    end
    if (Primary == "AGI") then
        Ubertip = Ubertip .. "|n" .. hColor.yellow("敏捷：" .. v.AGI .. "(+" .. v.AGIplus .. ")")
    else
        Ubertip = Ubertip .. "|n" .. hColor.yellowLight("敏捷：" .. v.AGI .. "(+" .. v.AGIplus .. ")")
    end
    if (Primary == "INT") then
        Ubertip = Ubertip .. "|n" .. hColor.yellow("智力：" .. v.INT .. "(+" .. v.INTplus .. ")")
    else
        Ubertip = Ubertip .. "|n" .. hColor.yellowLight("智力：" .. v.INT .. "(+" .. v.INTplus .. ")")
    end
    Ubertip = Ubertip .. "|n" .. hColor.greenLight("移动：" .. v.spd .. " " .. CONST_MOVE_TYPE[v.movetp].label)
    Ubertip = Ubertip .. "|n|n" .. hColor.grey(v.Ubertip)
    --
    obj.Hotkey = ""
    obj.tilesets = 1
    obj.hostilePal = 0
    obj.Requires = "" --需求,全部无限制，用代码限制
    obj.Requirescount = 1
    obj.Requires1 = ""
    obj.Requires2 = ""
    obj.upgrade = ""
    obj.unitShadow = "ShadowFlyer"
    obj.Buttonpos1 = 0
    obj.Buttonpos2 = 0
    obj.death = 0.10
    obj.turnRate = 1.00
    obj.acquire = acquire
    obj.weapsOn = 1
    obj.race = "human"
    obj.deathType = 0
    obj.fused = 0
    obj.sides1 = 5 --骰子面
    obj.dice1 = 2 --骰子数量
    obj.regenMana = 0.00
    obj.regenHP = 0.00
    obj.stockStart = 0
    obj.stockRegen = 0
    obj.stockMax = 1
    obj.collision = 32 --接触体积
    obj.def = v.def or 0.00 -- 护甲
    obj.sight = v.sight or 1000 -- 白天视野
    obj.nsight = v.nsight or 1000 -- 夜晚视野
    local targs1 = "vulnerable,ground,ward,structure,organic,mechanical,tree,debris,air" --攻击目标
    obj.targs1 = targs1
    obj.EditorSuffix = ""
    obj.Propernames = v.Propernames
    local abl = {}
    if (type(v.abilList) == "string") then
        abl = string.explode(',', abl)
    elseif (type(v.abilList) == "table") then
        for _, t in pairs(v.abilList) do
            table.insert(abl, t)
        end
    end
    table.insert(abl, "AInv")
    obj.abilList = string.implode(",", abl)
    obj.heroAbilList = ""
    obj.nameCount = v.nameCount or 1
    if (v.weapTp1 == "msplash" or v.weapTp1 == "artillery") then
        --溅射/炮火
        obj.Farea1 = v.Farea1 or 1
        obj.Qfact1 = v.Qfact1 or 0.05
        obj.Qarea1 = v.Qarea1 or 500
        obj.Hfact1 = v.Hfact1 or 0.15
        obj.Harea1 = v.Harea1 or 350
        obj.splashTargs1 = targs1 .. ",enemies"
    end
    if (v.weapTp1 == "mbounce") then
        --弹射
        obj.Farea1 = v.Farea1 or 450
        obj.targCount1 = v.targCount1 or 4
        obj.damageLoss1 = v.damageLoss1 or 0.3
        obj.splashTargs1 = targs1 .. ",enemies"
    end
    if (v.weapTp1 == "mline") then
        --穿透
        obj.spillRadius = v.spillRadius or 200
        obj.spillDist1 = v.spillDist1 or 450
        obj.damageLoss1 = v.damageLoss1 or 0.3
        obj.splashTargs1 = targs1 .. ",enemies"
    end
    if (v.weapTp1 == "aline") then
        --炮火穿透
        obj.Farea1 = v.Farea1 or 1
        obj.Qfact1 = v.Qfact1 or 0.05
        obj.Qarea1 = v.Qarea1 or 500
        obj.Hfact1 = v.Hfact1 or 0.15
        obj.Harea1 = v.Harea1 or 350
        obj.spillRadius = v.spillRadius or 200
        obj.spillDist1 = v.spillDist1 or 450
        obj.damageLoss1 = v.damageLoss1 or 0.3
        obj.splashTargs1 = targs1 .. ",enemies"
    end
    obj.Tip = "选择 " .. v.Name
    obj.Name = v.Name
    obj.Awakentip = "复活 " .. v.Name .. "：" .. v.Propernames
    obj.Revivetip = "复活 " .. v.Name .. "：" .. v.Propernames
    obj.Tip = "呼唤 " .. v.Name .. "：" .. v.Propernames
    obj.Ubertip = Ubertip
    obj.unitSound = v.unitSound -- 声音
    obj.modelScale = v.modelScale --模型缩放
    obj.file = v.file --模型
    obj.fileVerFlags = v.fileVerFlags or 0
    obj.Art = v.Art --头像
    obj.scale = v.scale or 1.00 --选择圈
    obj.movetp = v.movetp or "foot" --移动类型
    obj.moveHeight = v.moveHeight or 0 --移动高度
    obj.moveFloor = math.floor(v.moveHeight * 0.25) --最低高度
    obj.spd = v.spd
    obj.backSw1 = v.backSw1 or 0.500
    obj.dmgpt1 = v.dmgpt1 or 0.500
    obj.rangeN1 = v.rangeN1 or 100
    obj.cool1 = v.cool1 or 2.00
    obj.armor = "Flesh" -- 被击声音
    obj.targType = "ground" --作为目标类型
    obj.Missileart = v.Missileart -- 箭矢模型
    obj.Missilespeed = 1100 -- 箭矢速度
    obj.Missilearc = v.Missilearc or 0.05
    obj.weapTp1 = v.weapTp1 or "normal" --攻击类型
    obj.weapType1 = v.weapType1 or "" --攻击声音
    obj.Primary = Primary
    obj.dmgplus1 = v.dmgplus1 or 10 -- 基础攻击
    obj.showUI1 = 1 -- 显示攻击按钮
    obj.STR = v.STR
    obj.AGI = v.AGI
    obj.INT = v.INT
    obj.STRplus = v.STRplus
    obj.AGIplus = v.AGIplus
    obj.INTplus = v.INTplus
    obj.goldcost = 0
    obj.lumbercost = 0
    HEROS[key] = {
        UNIT_ID = obj:get_id(),
        Name = v.Name,
        Art = v.Art,
        Primary = Primary,
        Features = v.Features,
    }
end