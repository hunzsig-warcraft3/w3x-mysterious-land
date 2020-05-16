if (HLUA_DEBUG == true) then
    henv.setFogStatus(false, false)
else
    henv.setFogStatus(true, true)
end

--- boss击杀计算
dzSetKnockdown = function(p)
    if (game.playerKnockdown[p] == nil) then
        game.playerKnockdown[p] = hdzapi.server.get.int(p, "knockdown") or 0
    else
        game.playerKnockdown[p] = game.playerKnockdown[p] + 1
    end
    local kd = game.playerKnockdown[p]
    hdzapi.server.set.int(p, "knockdown", kd)
    local prestige
    if (kd >= 999) then
        prestige = "九天至尊"
    elseif (kd >= 500) then
        prestige = "三清天尊"
    elseif (kd >= 400) then
        prestige = "六御天帝"
    elseif (kd >= 300) then
        prestige = "得道金仙"
    elseif (kd >= 250) then
        prestige = "灭劫星窍"
    elseif (kd >= 200) then
        prestige = "神游山海"
    elseif (kd >= 180) then
        prestige = "灵通三魂"
    elseif (kd >= 130) then
        prestige = "身越七魄"
    elseif (kd >= 100) then
        prestige = "修真始体"
    elseif (kd >= 90) then
        prestige = "天选之人"
    elseif (kd >= 70) then
        prestige = "登峰造极"
    elseif (kd >= 50) then
        prestige = "当世英豪"
    elseif (kd >= 40) then
        prestige = "名扬山海"
    elseif (kd >= 30) then
        prestige = "一战成名"
    elseif (kd >= 20) then
        prestige = "游刃有余"
    elseif (kd >= 10) then
        prestige = "初露锋芒"
    elseif (kd >= 5) then
        prestige = "略有小成"
    else
        prestige = "初出茅庐"
    end
    hplayer.setPrestige(p, prestige)
    hdzapi.setRoomStat(p, "prestige", prestige)
end

--- 英雄被选择
hevent.onPickHero(function(evtData)
    --- 默认给个复活石
    game.unitsReborn[evtData.triggerUnit] = game.rebornStonePoint[1]
    --- 复活动作
    hevent.onDead(evtData.triggerUnit, function(evtDeadData)
        if (game.unitsReborn[evtDeadData.triggerUnit] == nil) then
            echo(hColor.red("所有复活石已经崩坏！山海力量已无法帮助英雄复活"), hunit.getOwner(evtDeadData.triggerUnit))
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
        local stone = game.unitsReborn[evtDeadData.triggerUnit].stone
        if (hunit.getCurLife(stone) < 2) then
            hunit.del(stone, 0)
            hunit.del(game.unitsReborn[evtDeadData.triggerUnit].point, 0)
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
                game.unitsReborn[evtDeadData.triggerUnit] = game.rebornStonePoint[rePointIdx]
                echo(hColor.yellow("一个复活石复生多次已经消亡，余下的复活石肩负起了复活英雄的责任"), hunit.getOwner(evtDeadData.triggerUnit))
            else
                game.unitsReborn[evtDeadData.triggerUnit] = nil
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
        htexture.mark(htexture.DEFAULT_MARKS.DREAM, rebornTime, hunit.getOwner(evtDeadData.triggerUnit), 255, 0, 0)
        hhero.rebornAtXY(
            evtDeadData.triggerUnit, rebornTime, 3,
            game.unitsReborn[evtDeadData.triggerUnit].x, game.unitsReborn[evtDeadData.triggerUnit].y,
            true
        )
        -- 中途心跳声
        htime.setTimeout(4, function(heartTimer)
            htime.delTimer(heartTimer)
            hsound.sound2Player(cg.gg_snd_voice_heart_beat, hunit.getOwner(evtDeadData.triggerUnit))
        end)
    end)
    --- 每秒检测音效
    htime.setInterval(1.5, function(curTimer)
        local p = hunit.getOwner(evtData.triggerUnit)
        if (his.deleted(evtData.triggerUnit)) then
            htime.delTimer(curTimer)
            hsound.bgmStop(p)
            return
        end
        if (his.death(evtData.triggerUnit)) then
            hsound.bgmStop(p)
            return
        end
        local pi = hplayer.index(p)
        if (his.damaging(evtData.triggerUnit) == true) then
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
            if (his.inRect(obj.rect, cj.GetUnitX(evtData.triggerUnit), cj.GetUnitY(evtData.triggerUnit)) == true) then
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
end)

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
        echo("^_^ 您来到了山海灵界，请在七灵岛，选择" .. hColor.yellow("你的英雄"))
        for i = 1, hplayer.qty_max, 1 do
            dzSetKnockdown(hplayer.players[i])
            hplayer.setAllowCameraDistance(hplayer.players[i], true)
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
                title = "选择难度",
                buttons = {
                    "探索的新人",
                    "历险的山人",
                    "无畏的达人",
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
                elseif (btnIdx == "无畏的达人") then
                    diff = 7
                    diffColor = hColor.yellow
                    rebornLife = 10
                elseif (btnIdx == "绝境的勇士") then
                    diff = 15
                    diffColor = hColor.red
                    rebornLife = 4
                end
                echo("选择了难度：" .. diffColor(btnIdx))
                game.diff = diff
                --- 修改复活石生命
                for _, s in ipairs(game.rebornStonePoint) do
                    hattr.set(s.stone, 0, {
                        life = "=" .. rebornLife
                    })
                end
                --- 英雄选择
                hhero.setBornXY(0, 0)
                hhero.setHeroIds(game.heroIds)
                hhero.buildSelector({
                    during = 60,
                    type = "tavern",
                    buildX = -517, -- 构建点X
                    buildY = 314, -- 构建点Y
                    buildDistance = 256,
                    buildRowQty = 2,
                    buildTavernQty = 10, -- 酒馆模式下，一个酒馆最多拥有几种单位
                })
                gameQuestEvent.pickHero()
                htime.setTimeout(61, function(curTimer)
                    htime.delTimer(curTimer)
                    gameQuestComplete(gameQuests.pickHero)
                    game.demon = henemy.create({
                        unitId = game.name2id.unit["被封印的堕落恶魔"],
                        facing = 270,
                        opacity = 50,
                        x = -150,
                        y = 0,
                    })
                    hunit.setCurLife(game.demon, 666)
                    gameQuestEvent.demon()
                end)
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
                                hero = hhero.player_heroes[p][1]
                                if (hero ~= nil) then
                                    avatar = hunit.getAvatar(hero)
                                    name = hunit.getName(hero)
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
