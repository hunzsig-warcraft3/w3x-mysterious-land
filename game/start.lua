if (HLUA_DEBUG == true) then
    henv.setFogStatus(false, false)
else
    henv.setFogStatus(true, true)
end

--- 英雄被选择
pickHero = function(whichHero)
    --- 默认给个复活石
    if (game.unitsReborn[whichHero] == nil) then
        game.unitsReborn[whichHero] = game.rebornStonePoint[1]
    end
    local heroSlk = hunit.getSlk(whichHero)
    if (heroSlk ~= nil) then
        -- 特性
        local feature = heroSlk.CUSTOM_DATA.feature
        if(feature ~= nil)then
            local feature = "特性 - " .. feature
            hskill.add(whichHero, hslk_global.name2Value.ability[feature].ABILITY_ID)
        end
    end
    local ownerIndex = hplayer.index(hunit.getOwner(whichHero))
    -- 英雄物品
    if (#game.playerDZData.item.hero[ownerIndex] > 0)then
        for _,itemVal in ipairs(game.playerDZData.item.hero[ownerIndex]) do
            if(itemVal ~= nil and #itemVal > 0)then
                hitem.create({
                    itemId = hslk_global.name2Value.item[itemVal[1]].ITEM_ID,
                    charges = itemVal[2] or 1,
                    whichUnit = lastHero,
                    slotIndex = itemVal[3],
                })
            end
        end
    end
    -- 英雄天赋
    if (#game.playerDZData.gift[ownerIndex] > 0)then
        for _,g in ipairs(game.playerDZData.gift[ownerIndex]) do
            if(g ~= nil)then
                local data = hslk_global.name2Value.ability[g]
                hskill.add(lastHero, data.ABILITY_ID, 0)
            end
        end
    end
    --- 复活动作
    hevent.onDead(whichHero, function(evtData)
        if (game.unitsReborn[evtData.triggerUnit] == nil or game.unitsReborn[evtData.triggerUnit] == -1) then
            echo(hColor.red("所有复活石已经崩坏！你已永久逝去！"), hunit.getOwner(evtData.triggerUnit))
            -- 检查是否全员失败
            local defeatQty = 0
            for playerIndex = 1, hplayer.qty_max, 1 do
                if (his.playing(hplayer.players[playerIndex]) == false) then
                    defeatQty = defeatQty + 1
                elseif (hhero.player_heroes[playerIndex][1] == nil) then
                    defeatQty = defeatQty + 1
                elseif (his.alive(hhero.player_heroes[playerIndex][1]) == false) then
                    defeatQty = defeatQty + 1
                end
            end
            if (defeatQty == hplayer.qty_max) then
                echo(hColor.red("复活石已不复存在，所有人的英雄灵魂也永远迷失在混沌之中"))
                htime.setTimeout(10, function(curTimer)
                    htime.delTimer(curTimer)
                    for playerIndex = 1, hplayer.qty_max, 1 do
                        hplayer.defeat(hplayer.players[playerIndex], "冒险失败")
                    end
                end)
            end
            return
        end
        local stone = game.unitsReborn[evtData.triggerUnit].stone
        local p = hunit.getOwner(evtData.triggerUnit)
        if (hunit.getCurLife(stone) < 2) then
            hunit.del(stone, 0)
            hunit.del(game.unitsReborn[evtData.triggerUnit].point, 0)
            for _, p in ipairs(game.rebornStonePoint) do
                if (p.status == 1 and p.stone == stone) then
                    p.status = 0
                    break
                end
            end
            local rePointIdx = 0
            for pi, p in ipairs(game.rebornStonePoint) do
                if (p.status == 1) then
                    rePointIdx = pi
                    break
                end
            end
            if (rePointIdx > 0) then
                game.unitsReborn[evtData.triggerUnit] = game.rebornStonePoint[rePointIdx]
                echo(hColor.yellow("一个复活石复生多次已经消亡，余下的复活石肩负起了复活英雄的责任"), p)
            else
                game.unitsReborn[evtData.triggerUnit] = -1
                echo(hColor.red("所有复活石已经崩坏！山海力量已无法帮助英雄复活"))
                -- 检查是否全员失败
                local defeatQty = 0
                for playerIndex = 1, hplayer.qty_max, 1 do
                    if (his.playing(hplayer.players[playerIndex]) == false) then
                        defeatQty = defeatQty + 1
                    elseif (hhero.player_heroes[hplayer.players[playerIndex]][1] == nil) then
                        defeatQty = defeatQty + 1
                    elseif (his.alive(hhero.player_heroes[hplayer.players[playerIndex]][1]) == false) then
                        defeatQty = defeatQty + 1
                    end
                end
                if (defeatQty == hplayer.qty_max) then
                    echo(hColor.red("复活石已不复存在，你们的英雄灵魂也永远迷失在混沌之中"))
                    htime.setTimeout(10, function(curTimer)
                        htime.delTimer(curTimer)
                        for playerIndex = 1, hplayer.qty_max, 1 do
                            hplayer.defeat(hplayer.players[playerIndex], "冒险失败")
                        end
                    end)
                end
                return
            end
        else
            hunit.subCurLife(stone, 1.0000)
        end
        local rebornTime = 10
        -- 血幕
        htexture.mark(htexture.DEFAULT_MARKS.DREAM, rebornTime, p, 255, 0, 0)
        hhero.rebornAtXY(
            evtData.triggerUnit, rebornTime, 3,
            game.unitsReborn[evtData.triggerUnit].x, game.unitsReborn[evtData.triggerUnit].y,
            true
        )
        -- 中途心跳声
        htime.setTimeout(4, function(heartTimer)
            htime.delTimer(heartTimer)
            hsound.sound2Player(cg.gg_snd_voice_heart_beat, p)
        end)
    end)
    --- 每秒检测音效
    htime.setInterval(1.5, function(curTimer)
        local p = hunit.getOwner(whichHero)
        if (his.deleted(whichHero)) then
            htime.delTimer(curTimer)
            hsound.bgmStop(p)
            return
        end
        if (his.death(whichHero)) then
            hsound.bgmStop(p)
            return
        end
        local pi = hplayer.index(p)
        if (his.damaging(whichHero) == true) then
            if (hRuntime.sound[pi].prevBgm == nil) then
                hRuntime.sound[pi].prevBgm = hRuntime.sound[pi].currentBgm
            end
            hsound.bgm(cg.gg_snd_bgm_battle, p)
            return
        elseif (hRuntime.sound[pi].prevBgm ~= nil) then
            hsound.bgm(hRuntime.sound[pi].prevBgm, p)
            hRuntime.sound[pi].prevBgm = nil
            return
        end
        for _, obj in ipairs(islands) do
            if (his.inRect(obj.rect, hunit.x(whichHero), hunit.y(whichHero)) == true) then
                if (obj.name == "七灵岛") then
                    hsound.bgm(cg.gg_snd_bgm_seven, p)
                else
                    local weather = game.island[obj.name]
                    if (weather == hweather.sun) then
                        hsound.bgm(cg.gg_snd_bgm_sun, p)
                    elseif (weather == hweather.moon) then
                        hsound.bgm(cg.gg_snd_bgm_moon, p)
                    elseif (weather == hweather.rainstorm) then
                        hsound.bgm(cg.gg_snd_bgm_thunder, p)
                    elseif (weather == hweather.wind or weather == hweather.windstorm) then
                        hsound.bgm(cg.gg_snd_bgm_wind, p)
                    else
                        hsound.bgmStop(p)
                    end
                end
                break
            end
        end
    end)
end

courierPick = function(newCourier)
    local owner = hunit.getOwner(newCourier)
    local playerIndex = hplayer.index(owner)
    if (game.playerCourier[playerIndex] ~= nil) then
        local prevCourier = game.playerCourier[playerIndex]
        if (his.alive(prevCourier)) then
            if (hunit.getId(newCourier) == hunit.getId(prevCourier)) then
                local unitValue = hunit.getSlk(newCourier)
                if (unitValue.goldcost > 0) then
                    hplayer.addGold(owner, unitValue.goldcost)
                end
                if (unitValue.lumbercost > 0) then
                    hplayer.addLumber(owner, unitValue.lumbercost)
                end
                hunit.del(newCourier)
                return
            end
        end
        hunit.hide(prevCourier)
        hitem.slotLoop(prevCourier, function(slotItem, slotIndex)
            if (slotItem ~= nil) then
                local charges = hitem.getCharges(slotItem)
                game.playerDZData.item.courier[playerIndex][slotIndex + 1] = {
                    hitem.getName(slotItem),
                    charges,
                    slotIndex,
                }
            else
                game.playerDZData.item.hero[playerIndex][slotIndex + 1] = {}
            end
        end)
        hunit.portal(newCourier, hunit.x(prevCourier), hunit.y(prevCourier), hunit.getFacing(prevCourier))
        hunit.del(prevCourier)
    end
    game.playerCourier[playerIndex] = newCourier
    echo(hColor.green(hplayer.getName(owner)) .. "获得了信使" .. hColor.yellow("<" .. hunit.getName(newCourier) .. ">"))
    hhero.formatHero(newCourier)
    hevent.onDead(game.playerCourier[playerIndex], function(evtData)
        local courier = evtData.triggerUnit
        local courierId = hunit.getId(courier)
        local newCourier = hunit.create({
            whichPlayer = hplayer.players[playerIndex],
            unitId = courierId,
            x = hhero.bornX,
            y = hhero.bornY,
        })
        courierPick(newCourier)
    end)
    -- 过去的信使物品
    for _,itemVal in ipairs(game.playerDZData.item.courier[playerIndex]) do
        if(itemVal ~= nil and #itemVal > 0)then
            hitem.create({
                itemId = hslk_global.name2Value.item[itemVal[1]].ITEM_ID,
                charges = itemVal[2] or 1,
                whichUnit = newCourier,
                slotIndex = itemVal[3],
            })
        end
    end
end

local startTrigger = cj.CreateTrigger()
cj.TriggerRegisterTimerEvent(startTrigger, 1.0, false)
cj.TriggerAddAction(
    startTrigger,
    function()
        cj.DisableTrigger(cj.GetTriggeringTrigger())
        cj.DestroyTrigger(cj.GetTriggeringTrigger())
        --[[
            这里开始游戏正式开始了
            发挥你的想象力吧~
        ]]
        hsound.bgmStop()
        -- 检查服务器状态，不行直接退出
        -- 成功时会返回服务器数据（其实服务器数据在进图时已经保存在本地了，并不是实时的）
        dzCurrent.checkReady()
        -- hello world
        echo("^_^ 您来到了山海灵界，请在七灵岛，选择" .. hColor.yellow("你的英雄"))
        -- 玩家配置
        for i = 1, hplayer.qty_max, 1 do
            if (his.playing(hplayer.players[i])) then
                hplayer.setAllowCameraDistance(hplayer.players[i], true)
                hplayer.setGold(hplayer.players[i], game.playerDZData.info[i][4])
                hplayer.setLumber(hplayer.players[i], game.playerDZData.info[i][5])
            end
        end
        --设置三围基础
        hattr.setThreeBuff({
            primary = 1,
            str = {
                life = 16,
                life_back = 0.03,
                toughness = 0.02,
                aim = 0.003
            },
            agi = {
                attack_speed = 0.01,
                avoid = 0.003
            },
            int = {
                mana = 8,
                mana_back = 0.02
            }
        })
        -- 第 1 玩家选择模式
        echo("第一位玩家正在选择难度", nil, 10)
        hdialog.create(
            nil,
            {
                title = "选择历练深度|n越深层次难度越大，收获也越多",
                buttons = {
                    "探索的新手",
                    "历险的山人",
                    "无惧的武者",
                    "绝境的勇士",
                }
            },
            function(btnIdx)
                local diff = 1
                local diffColor = hColor.sky
                local rebornLife = 100
                if (btnIdx == "历险的山人") then
                    diff = 3
                    diffColor = hColor.green
                    rebornLife = 30
                elseif (btnIdx == "无惧的武者") then
                    diff = 7
                    diffColor = hColor.yellow
                    rebornLife = 10
                elseif (btnIdx == "绝境的勇士") then
                    diff = 15
                    diffColor = hColor.red
                    rebornLife = 4
                end
                echo("选择了历练：" .. diffColor(btnIdx))
                game.diff = diff
                --- 修改复活石生命
                for _, s in ipairs(game.rebornStonePoint) do
                    hattr.set(s.stone, 0, {
                        life = "=" .. rebornLife
                    })
                end
                -- 七灵石
                gameQuestEvent.stone()
                game.sevenStone = hunit.create({
                    whichPlayer = game.ALLY_PLAYER,
                    unitId = hslk_global.name2Value.unit["七灵神石"].UNIT_ID,
                    facing = 45,
                    opacity = 200,
                    x = -235,
                    y = 25,
                })
                hevent.onDead(game.sevenStone, function()
                    echo("七灵石破碎了！")
                    for i = 1, hplayer.qty_max, 1 do
                        hplayer.defeat(hplayer.players[i], "七灵石破碎了")
                    end
                end)
                --- 英雄选择
                --- 检查玩家是否已经选择过英雄（服务器数据）没有则对话框选择职业
                --- 已经有英雄则直接创建旧英雄和配置物品
                hhero.setBornXY(900, 384)
                --- 酒馆商店
                hhero.buildSelector({
                    during = -1,
                    type = "tavern",
                    buildX = 512, -- 构建点X
                    buildY = 640, -- 构建点Y
                    buildDistance = 256,
                    direct = { 1, -1 },
                    buildRowQty = 5,
                    tavernUnitQty = 12, -- 酒馆模式下，一个酒馆最多拥有几种单位
                    onUnitSell = function(evtData)
                        local p = hunit.getOwner(evtData.buyingUnit)
                        local playerIndex = hplayer.index(p)
                        local soldUnit = evtData.soldUnit
                        local soldUid = hunit.getId(soldUnit)
                        hunit.del(soldUnit, 0)
                        if (hhero.player_heroes[playerIndex][1] == "") then
                            return
                        end
                        local unitValue = hslk_global.id2Value.unit[soldUid]
                        local prevHero = hhero.player_heroes[playerIndex][1]
                        if (soldUid == hunit.getId(prevHero)) then
                            if (unitValue.goldcost > 0) then
                                hplayer.addGold(p, unitValue.goldcost)
                            end
                            if (unitValue.lumbercost > 0) then
                                hplayer.addLumber(p, unitValue.lumbercost)
                            end
                            return
                        end
                        hitem.slotLoop(prevHero, function(slotItem, slotIndex)
                            if (slotItem ~= nil) then
                                local charges = hitem.getCharges(slotItem)
                                game.playerDZData.item.hero[playerIndex][slotIndex + 1] = {
                                    hitem.getName(slotItem),
                                    charges,
                                    slotIndex,
                                }
                            else
                                game.playerDZData.item.hero[playerIndex][slotIndex + 1] = {}
                            end
                        end)
                        hunit.hide(prevHero)
                        ---
                        local newHero = hunit.create({
                            whichPlayer = p,
                            unitId = soldUid,
                            facing = hunit.getFacing(prevHero),
                            x = hunit.x(prevHero),
                            y = hunit.y(prevHero),
                        })
                        hhero.setCurLevel(newHero, hhero.getCurLevel(prevHero), false)
                        hhero.player_heroes[playerIndex][1] = newHero
                        hunit.del(prevHero, 0)
                        echo(hColor.green(hplayer.getName(p)) .. "的英雄灵魂成为了" .. hColor.yellow("<" .. unitValue.Name .. ">"))
                        -- 触发英雄被选择事件(全局)
                        hevent.triggerEvent(
                            "global",
                            CONST_EVENT.pickHero,
                            {
                                triggerPlayer = p,
                                triggerUnit = newHero
                            }
                        )
                    end
                })
                --- 信使商店
                hhero.buildSelector({
                    during = -1,
                    type = "tavern",
                    buildX = 1152, -- 构建点X
                    buildY = -384, -- 构建点Y
                    buildDistance = 256,
                    buildRowQty = 1,
                    tavernUnitQty = 11, -- 酒馆模式下，一个酒馆最多拥有几种单位
                    tavernId = hslk_global.name2Value.unit["信使之笼"].UNIT_ID,
                    heroes = {
                        hslk_global.name2Value.unit["小饥鸡"].UNIT_ID,
                        hslk_global.name2Value.unit["冷静的绵羊"].UNIT_ID,
                        hslk_global.name2Value.unit["依诺吸吸"].UNIT_ID,
                        hslk_global.name2Value.unit["野狗"].UNIT_ID,
                        hslk_global.name2Value.unit["树精"].UNIT_ID,
                        hslk_global.name2Value.unit["熊妖"].UNIT_ID,
                        hslk_global.name2Value.unit["阴影之狼"].UNIT_ID,
                        hslk_global.name2Value.unit["炎魔"].UNIT_ID,
                        hslk_global.name2Value.unit["毁灭守卫"].UNIT_ID,
                        hslk_global.name2Value.unit["烈火凤凰"].UNIT_ID,
                        hslk_global.name2Value.unit["冰戟幻灵"].UNIT_ID,
                    },
                    onUnitSell = function(evtData)
                        local p = hunit.getOwner(evtData.buyingUnit)
                        local playerIndex = hplayer.index(p)
                        local soldUnit = evtData.soldUnit
                        if (game.playerCourier[playerIndex] == nil) then
                            hunit.del(soldUnit, 0)
                            return
                        end
                        courierPick(soldUnit)
                    end
                })
                for i = 1, hplayer.qty_max, 1 do
                    if (his.playing(hplayer.players[i])) then
                        hplayer.setAllowCommandPick(hplayer.players[i], false)
                        --- 新玩家
                        if (game.playerDZData.hero[i][1] == "") then
                            hdialog.create(hplayer.players[i], {
                                title = "你的初始人物是？|n后面可在中央酒馆购买换英雄",
                                buttons = { "剑士", "骑士", "弓箭手", "魔法师" }
                            }, function(clickName)
                                local value = hslk_global.name2Value.unit[clickName]
                                local firstHero = hunit.create({
                                    whichPlayer = hplayer.players[i],
                                    unitId = value.UNIT_ID,
                                    x = hhero.bornX,
                                    y = hhero.bornY,
                                })
                                table.insert(hhero.player_heroes[i], firstHero)
                                -- 触发英雄被选择事件(全局)
                                hevent.triggerEvent(
                                    "global",
                                    CONST_EVENT.pickHero,
                                    {
                                        triggerPlayer = hplayer.players[i],
                                        triggerUnit = firstHero
                                    }
                                )
                                -- 初始信使
                                local firstCourier = hunit.create({
                                    whichPlayer = hplayer.players[i],
                                    unitId = hslk_global.name2Value.unit["小饥鸡"].UNIT_ID,
                                    x = hhero.bornX,
                                    y = hhero.bornY,
                                })
                                courierPick(firstCourier)
                            end)
                        else
                            local lastHeroName = game.playerDZData.hero[i][1]
                            local lastHero = hunit.create({
                                whichPlayer = hplayer.players[i],
                                unitId = hslk_global.name2Value.unit[lastHeroName].UNIT_ID,
                                x = hhero.bornX,
                                y = hhero.bornY,
                            })
                            table.insert(hhero.player_heroes[i], lastHero)
                            hhero.setCurLevel(lastHero, game.playerDZData.hero[i][2], false)
                            -- 触发英雄被选择事件(全局)
                            hevent.triggerEvent(
                                "global",
                                CONST_EVENT.pickHero,
                                {
                                    triggerPlayer = hplayer.players[i],
                                    triggerUnit = lastHero
                                }
                            )
                            -- 最后的信使
                            local lastCourierName = "小饥鸡"
                            if (game.playerDZData.courier[i] ~= nil) then
                                lastCourierName = game.playerDZData.courier[i][1]
                            end
                            local lastCourier = hunit.create({
                                whichPlayer = hplayer.players[i],
                                unitId = hslk_global.name2Value.unit[lastCourierName].UNIT_ID,
                                x = hhero.bornX,
                                y = hhero.bornY,
                            })
                            courierPick(lastCourier)
                        end
                    end
                end
                --- 创建多面板
                hmultiBoard.create(
                    "player",
                    1.5,
                    function(mb)
                        --拼凑多面板数据，二维数组，行列模式
                        hmultiBoard.setTitle(mb, "山海游人誌")
                        --开始当然是title了
                        local data = {}
                        table.insert(data, {
                            { value = "山海人", icon = nil },
                            { value = "称号", icon = nil },
                            { value = "战力", icon = nil },
                            { value = "英雄", icon = nil },
                            { value = "回血", icon = nil },
                            { value = "回魔", icon = nil },
                            { value = "攻速", icon = nil },
                            { value = "命中", icon = nil },
                            { value = "增幅", icon = nil },
                            { value = "减伤", icon = nil },
                            { value = "魔抗", icon = nil },
                            { value = "回避", icon = nil },
                            { value = "背包", icon = nil },
                            { value = "攻效", icon = nil },
                        })
                        --然后是form
                        for pi = 1, hplayer.qty_max, 1 do
                            local p = hplayer.players[pi]
                            if (his.playing(p)) then
                                local hero = "-"
                                local prestige = "-"
                                local power = "-"
                                local avatar = nil
                                local name = "-"
                                local life_back = "-"
                                local mana_back = "-"
                                local attack_speed = "-"
                                local damage_extent = "-"
                                local aim = "-"
                                local toughness = "-"
                                local resistance = "-"
                                local avoid = "-"
                                local weight = "-"
                                local attack_damage_type = "-"
                                hero = hhero.player_heroes[pi][1]
                                if (hero ~= nil) then
                                    avatar = hunit.getAvatar(hero)
                                    name = hunit.getName(hero)
                                    prestige = hplayer.getPrestige(p)
                                    power = game.playerDZData.info[pi][3]
                                    life_back = math.round(hattr.get(hero, "life_back")) .. "/秒"
                                    mana_back = math.round(hattr.get(hero, "mana_back")) .. "/秒"
                                    attack_speed = math.round(100 + hattr.get(hero, "attack_speed")) .. "%"
                                    damage_extent = math.round(hattr.get(hero, "damage_extent")) .. "%"
                                    aim = math.round(hattr.get(hero, "aim")) .. "%"
                                    toughness = math.round(hattr.get(hero, "toughness"))
                                    resistance = math.round(hattr.get(hero, "resistance")) .. "%"
                                    avoid = math.round(hattr.get(hero, "avoid")) .. "%"
                                    weight = math.round(hattr.get(hero, "weight_current")) .. "/"
                                        .. math.round(hattr.get(hero, "weight")) .. "Kg"
                                    local adt = {}
                                    for _, v in ipairs(hattr.get(hero, "attack_damage_type")) do
                                        local label = CONST_ATTR[v]
                                        if (table.includes(label, adt) == false) then
                                            table.insert(adt, label)
                                        end
                                    end
                                    attack_damage_type = string.implode('、', adt)
                                end
                                table.insert(data, {
                                    { value = "[" .. hplayer.getStatus(p) .. "]" .. cj.GetPlayerName(p), icon = nil },
                                    { value = prestige, icon = nil },
                                    { value = power, icon = nil },
                                    { value = name, icon = avatar },
                                    { value = life_back, icon = nil },
                                    { value = mana_back, icon = nil },
                                    { value = attack_speed, icon = nil },
                                    { value = aim, icon = nil },
                                    { value = damage_extent, icon = nil },
                                    { value = toughness, icon = nil },
                                    { value = resistance, icon = nil },
                                    { value = avoid, icon = nil },
                                    { value = weight, icon = nil },
                                    { value = attack_damage_type, icon = nil },
                                })
                            end
                        end
                        return data
                    end
                )
            end
        )
    end
)
