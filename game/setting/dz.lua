local prestigeMap = {
    { mark = 0, label = "冒险者" },
    { mark = 100, label = "历险者" },
    { mark = 500, label = "先驱者" },
    { mark = 1000, label = "千军勇士" },
    { mark = 2500, label = "神武飞将" },
    { mark = 5000, label = "天绝斗者" },
    { mark = 10000, label = "灭劫霸王" },
    { mark = 60000, label = "六御武帝" },
    { mark = 99999, label = "九天武神" },
}
dzCurrent = {}
dzCurrent.calePrestige = function(power)
    local prestige = 1
    for pi, pm in ipairs(prestigeMap) do
        if (power >= pm.mark) then
            prestige = pi
        else
            break
        end
    end
    return prestigeMap[prestige].label
end
dzCurrent.doRecord = function(whichPlayer)
    local playerIndex = hplayer.index(whichPlayer)
    if (hhero.player_heroes[playerIndex][1] == nil) then
        return
    end
    -- hero
    local heroLv = hhero.getCurLevel(hhero.player_heroes[playerIndex][1])
    -- item
    local itLv = 0
    hitem.slotLoop(hhero.player_heroes[playerIndex][1], function(slotItem)
        if (slotItem ~= nil) then
            itLv = itLv + hitem.getLevel(slotItem) * (hitem.getCharges(slotItem) + 1)
        end
    end)
    -- 杀敌
    local kill = hplayer.getKill(whichPlayer)
    -- 计算战力
    game.playerData.power[playerIndex] = kill + heroLv * 2 + itLv + #game.playerData.gift[playerIndex] * 100
    -- 计算称号
    local prestigeLabel = dzCurrent.calePrestige(game.playerData.power[playerIndex])
    hplayer.setPrestige(whichPlayer, prestigeLabel)
    -- 写入服务器
    hdzapi.server.set.int(whichPlayer, "power", game.playerData.power)
    hdzapi.server.set.int(whichPlayer, "kill", kill)
    if (game.playerData.power[playerIndex] > game.playerData.prevPower[playerIndex]) then
        hdzapi.setRoomStat(whichPlayer, "prestige", prestigeLabel) --房间称号
        hdzapi.setRoomStat(whichPlayer, "power", math.integerFormat(game.playerData.power[playerIndex])) --房间战力
    end
    if (kill > game.playerData.prevKill[playerIndex]) then
        hdzapi.setRoomStat(whichPlayer, "kill", math.integerFormat(kill)) --杀敌
    end
end

dzCurrent.enableRecord = function(whichPlayer)
    -- hdzapi.setRoomStat(whichPlayer, "prestige", '')
    -- hdzapi.setRoomStat(whichPlayer, "power", '0')
    -- hdzapi.setRoomStat(whichPlayer, "kill", '0')
    -- hdzapi.server.clear.int(whichPlayer, "power")
    -- hdzapi.server.clear.int(whichPlayer, "kill")
    if (whichPlayer == nil or his.playing(whichPlayer) == false) then
        return
    end
    local playerIndex = hplayer.index(whichPlayer)
    -- init
    game.playerData.prevPower[playerIndex] = hdzapi.server.get.int(whichPlayer, "power")
    game.playerData.prevKill[playerIndex] = hdzapi.server.get.int(whichPlayer, "kill")
    local prestigeLabel = dzCurrent.calePrestige(game.playerData.prevPower[playerIndex])
    hplayer.setPrestige(whichPlayer, prestigeLabel)
    -- 10秒一次，自动检测玩家数据并保存,以1.7秒隔开每个玩家，不同时请求服务器
    htime.setInterval(10, function()
        local clk = 0
        for i = 1, hplayer.qty_max, 1 do
            if (his.playing(hplayer.players[i])) then
                htime.setTimeout(clk, function(curTimer)
                    htime.delTimer(curTimer)
                    dzCurrent.doRecord(hplayer.players[i])
                end)
                clk = clk + 1.7
            end
        end
    end)
end
