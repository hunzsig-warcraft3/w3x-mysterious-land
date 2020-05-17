--- boss击杀计算
dzCurrent = {}
dzCurrent.enableRecord = function(whichPlayer)
    if (whichPlayer == nil or his.playing(whichPlayer)) then
        return
    end
    game.playerDZData.info[whichPlayer] = hdzapi.server.get.int(p, "hero") or 0
    game.playerDZData.hero[whichPlayer] = hdzapi.server.get.int(p, "hero") or 0
    game.playerDZData.ability[whichPlayer] = hdzapi.server.get.int(p, "ability") or 0
    game.playerDZData.addition[whichPlayer] = hdzapi.server.get.int(p, "addition") or 0
end
dzCurrent.checkReady = function()
    for i = 1, hplayer.qty_max, 1 do
        if (hdzapi.server.ready(hplayer.player[i]) == false) then
            hplayer.defeat(hplayer.player[i], "网易服务器崩溃")
        else
            dzCurrent.enableRecord(hplayer.player[i])
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