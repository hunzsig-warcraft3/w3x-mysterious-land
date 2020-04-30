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
    game.unitsReborn[evtData.triggerUnit] = FirstRebornPoint
    --- 复活动作
    hevent.onDead(evtData.triggerUnit, function(evtDeadData)
        local rebornTime = hhero.getCurLevel(evtDeadData.triggerUnit) * 3 + diff
        if (rebornTime > 90) then
            rebornTime = 90
        end
        hunit.rebornAtXY(
            evtDeadData.triggerUnit, rebornTime, 3,
            game.unitsReborn[evtDeadData.triggerUnit].x, game.unitsReborn[evtDeadData.triggerUnit].y,
            true
        )
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
        hsound.bgmStop(nil)
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
                if (btnIdx == "历险的山人") then
                    diff = 2
                    diffColor = hColor.green
                elseif (btnIdx == "无畏的达人") then
                    diff = 6
                    diffColor = hColor.yellow
                elseif (btnIdx == "绝境的勇士") then
                    diff = 13
                    diffColor = hColor.red
                end
                echo("选择了难度：" .. diffColor(btnIdx))
                game.diff = diff
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
                            { value = "状态", icon = nil },
                            { value = "英雄", icon = nil },
                            { value = "攻击", icon = nil },
                            { value = "攻速", icon = nil },
                            { value = "命中", icon = nil },
                            { value = "增幅", icon = nil },
                            { value = "护甲", icon = nil },
                            { value = "减伤", icon = nil },
                            { value = "魔抗", icon = nil },
                            { value = "回避", icon = nil }
                        })
                        --然后是form
                        for pi = 1, hplayer.qty_max, 1 do
                            local p = hplayer.players[pi]
                            if (his.playing(p)) then
                                local hero = "-"
                                local avatar = nil
                                local name = "-"
                                local attack = "-"
                                local attack_speed = "-"
                                local damage_extent = "-"
                                local aim = "-"
                                local defend = "-"
                                local toughness = "-"
                                local resistance = "-"
                                local avoid = "-"
                                hero = hhero.player_heroes[p][1]
                                if (hero ~= nil) then
                                    avatar = hunit.getAvatar(hero)
                                    name = hunit.getName(hero)
                                    attack = math.floor(hattr.get(hero, "attack_white") + hattr.get(hero, "attack_green"))
                                    attack_speed = math.round(hattr.get(hero, "attack_speed")) .. "%"
                                    damage_extent = math.round(hattr.get(hero, "damage_extent")) .. "%"
                                    aim = math.round(hattr.get(hero, "aim")) .. "%"
                                    defend = math.floor(hattr.get(hero, "defend"))
                                    toughness = math.round(hattr.get(hero, "toughness"))
                                    resistance = math.round(hattr.get(hero, "resistance")) .. "%"
                                    avoid = math.round(hattr.get(hero, "avoid")) .. "%"
                                end
                                table.insert(data, {
                                    { value = cj.GetPlayerName(p), icon = nil },
                                    { value = hplayer.getStatus(p), icon = nil },
                                    { value = name, icon = avatar },
                                    { value = attack, icon = nil },
                                    { value = attack_speed, icon = nil },
                                    { value = aim, icon = nil },
                                    { value = damage_extent, icon = nil },
                                    { value = defend, icon = nil },
                                    { value = toughness, icon = nil },
                                    { value = resistance, icon = nil },
                                    { value = avoid, icon = nil }
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
