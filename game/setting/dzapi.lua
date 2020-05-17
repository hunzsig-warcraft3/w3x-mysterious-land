--- boss击杀计算
dzCurrent = {}
dzCurrent.doRecord = function(whichPlayer)
    if (hhero.player_heroes[whichPlayer][1] == nil) then
        return
    end
    local heroLv = hhero.getCurLevel(hhero.player_heroes[whichPlayer][1])
    game.playerDZData.hero[whichPlayer].d = hunit.getId(hhero.player_heroes[whichPlayer][1])
    game.playerDZData.hero[whichPlayer].l = heroLv
    local its = {}
    local itLv = 0
    hitem.slotLoop(hhero.player_heroes[whichPlayer][1], function(slotItem, slotIndex)
        local charges = hitem.getCharges(slotItem)
        itLv = hitem.getLevel(slotItem) * (charges + 1)
        table.insert(its, {
            d = hitem.getId(slotItem),
            c = charges,
            i = slotIndex,
        })
    end)
    game.playerDZData.hero[whichPlayer].t = its
    --
    game.playerDZData.ability[whichPlayer] = {
        g = {},
        s = {},
    }
    -- 计算称号
    local kd = game.playerDZData.info[whichPlayer].k
    local prestige = game.playerDZData.info[whichPlayer].r
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
    end
    hplayer.setPrestige(whichPlayer, prestige)
    game.playerDZData.info[whichPlayer].r = prestige
    -- 计算战力
    local power = kd * 3 + heroLv * 1 + #game.playerDZData.ability.g * 20 + itLv
    game.playerDZData.info[whichPlayer].p = math.numberFormat(power)
    hdzapi.setRoomStat(whichPlayer, "prestige", prestige) --房间称号
    hdzapi.setRoomStat(whichPlayer, "power", power) --房间战力
    -- 写入服务器

end

dzCurrent.enableRecord = function(whichPlayer)
    if (whichPlayer == nil or his.playing(whichPlayer)) then
        return
    end
    game.playerDZData.info[whichPlayer] = hdzapi.server.get.str(p, "info")
    game.playerDZData.hero[whichPlayer] = hdzapi.server.get.str(p, "hero")
    game.playerDZData.ability[whichPlayer] = hdzapi.server.get.str(p, "ability")
    if (game.playerDZData.info[whichPlayer] == "") then
        game.playerDZData.info[whichPlayer] = {
            l = hdzapi.mapLv(whichPlayer), --地图等级
            p = 0, --战力
            k = 0, --击杀boss数
            r = "初出茅庐" --称号
        }
    else
        game.playerDZData.info[whichPlayer] = json.parse(game.playerDZData.info[whichPlayer])
    end
    if (game.playerDZData.hero[whichPlayer] == "") then
        game.playerDZData.hero[whichPlayer] = {
            d = "", --英雄种类
            i = 0, --英雄等级
            t = {}, --物品栏
        }
    else
        game.playerDZData.hero[whichPlayer] = json.parse(game.playerDZData.hero[whichPlayer])
    end
    if (game.playerDZData.ability[whichPlayer] == "") then
        game.playerDZData.ability[whichPlayer] = {
            g = {}, --天赋4个
            s = {}, --本体技能4个
        }
    else
        game.playerDZData.ability[whichPlayer] = json.parse(game.playerDZData.ability[whichPlayer])
    end
    -- 10秒一次，自动检测玩家数据并保存,以2秒隔开每个玩家，不同时请求服务器
    htime.setInterval(15, function()
        local clk = 0
        for i = 1, hplayer.qty_max, 1 do
            if (his.playing(hplayer.players[i])) then
                htime.setTimeout(clk, function(curTimer)
                    htime.delTimer(curTimer)
                    dzCurrent.doRecord(hplayer.players[i])
                end)
                clk = clk + 2
            end
        end
    end)
    -- 主动保存
    for i = 1, hplayer.qty_max, 1 do
        hevent.onChat(hplayer.players[i], "-save", true, function(evtData)
            dzCurrent.doRecord(evtData.triggerPlayer)
        end)
    end
end
dzCurrent.checkReady = function()
    for i = 1, hplayer.qty_max, 1 do
        if (hdzapi.server.ready(hplayer.players[i]) == false) then
            hplayer.defeat(hplayer.players[i], "网易服务器崩溃")
        else
            dzCurrent.enableRecord(hplayer.players[i])
        end
    end
end
dzCurrentSetKnockdown = function(p)
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