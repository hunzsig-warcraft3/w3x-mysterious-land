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
dzCurrent.doRecord = function(whichPlayer)
    local playerIndex = hplayer.index(whichPlayer)
    if (hhero.player_heroes[playerIndex][1] == nil or game.playerCourier[playerIndex] == nil) then
        return
    end
    -- hero
    local heroLv = hhero.getCurLevel(hhero.player_heroes[playerIndex][1])
    game.playerDZData.hero[playerIndex][1] = hunit.getName(hhero.player_heroes[playerIndex][1])
    game.playerDZData.hero[playerIndex][2] = heroLv
    -- courier
    local courierLv = hhero.getCurLevel(game.playerCourier[playerIndex])
    game.playerDZData.courier[playerIndex][1] = hunit.getName(game.playerCourier[playerIndex])
    game.playerDZData.courier[playerIndex][2] = courierLv

    local itLv = 0
    hitem.slotLoop(hhero.player_heroes[playerIndex][1], function(slotItem, slotIndex)
        if (slotItem ~= nil) then
            local charges = hitem.getCharges(slotItem)
            itLv = itLv + hitem.getLevel(slotItem) * (charges + 1)
            game.playerDZData.item.hero[playerIndex][slotIndex + 1] = {
                hitem.getName(slotItem),
                charges,
                slotIndex,
            }
        else
            game.playerDZData.item.hero[playerIndex][slotIndex + 1] = {}
        end
    end)
    hitem.slotLoop(game.playerCourier[playerIndex], function(slotItem, slotIndex)
        if (slotItem ~= nil) then
            local charges = hitem.getCharges(slotItem)
            game.playerDZData.item.courier[playerIndex][slotIndex + 1] = {
                hitem.getName(slotItem),
                charges,
                slotIndex,
            }
        else
            game.playerDZData.item.courier[playerIndex][slotIndex + 1] = {}
        end
    end)
    print_mbr(game.playerDZData.item)
    --
    game.playerDZData.gift[playerIndex] = {}
    -- 计算战力
    local power = math.floor((game.playerDZData.info[playerIndex][2] or 0) * 2
            + heroLv + courierLv
            + #game.playerDZData.gift[playerIndex] * 25
            + itLv)
    game.playerDZData.info[playerIndex][3] = math.integerFormat(power)
    game.playerDZData.info[playerIndex][4] = hplayer.getGold(whichPlayer)
    game.playerDZData.info[playerIndex][5] = hplayer.getLumber(whichPlayer)
    -- 计算称号
    local prestige = 1
    for pi, pm in ipairs(prestigeMap) do
        if (power >= pm.mark) then
            prestige = pi
        else
            break
        end
    end
    game.playerDZData.info[playerIndex][1] = prestige
    -- 写入服务器
    local jsonInfo = string.addslashes(json.stringify(game.playerDZData.info[playerIndex]))
    local jsonHero = string.addslashes(json.stringify(game.playerDZData.hero[playerIndex]))
    local jsonCourier = string.addslashes(json.stringify(game.playerDZData.courier[playerIndex]))
    local jsonGift = string.addslashes(json.stringify(game.playerDZData.gift[playerIndex]))
    print(string.len(jsonInfo))
    print_mb(jsonInfo)
    print(string.len(jsonHero))
    print_mb(jsonHero)
    print(string.len(jsonCourier))
    print_mb(jsonCourier)
    print(string.len(jsonGift))
    print_mb(jsonGift)
    hplayer.setPrestige(whichPlayer, prestigeMap[prestige].label)
    hdzapi.setRoomStat(whichPlayer, "prestige", prestigeMap[prestige].label) --房间称号
    hdzapi.setRoomStat(whichPlayer, "power", power) --房间战力
    hdzapi.server.set.str(whichPlayer, "info", jsonInfo)
    hdzapi.server.set.str(whichPlayer, "hero", jsonHero)
    hdzapi.server.set.str(whichPlayer, "courier", jsonCourier)
    hdzapi.server.set.str(whichPlayer, "gift", jsonGift)
    for i = 1, 6 do
        local jsonItem = string.addslashes(json.stringify(game.playerDZData.item.hero[playerIndex][i]))
        hdzapi.server.set.str(whichPlayer, "itemh" .. i, jsonItem)
        local jsonItem = string.addslashes(json.stringify(game.playerDZData.item.courier[playerIndex][i]))
        hdzapi.server.set.str(whichPlayer, "itemc" .. i, jsonItem)
    end
end

dzCurrent.enableRecord = function(whichPlayer)
    hdzapi.server.clear.str(whichPlayer, "info")
    hdzapi.server.clear.str(whichPlayer, "hero")
    hdzapi.server.clear.str(whichPlayer, "courier")
    hdzapi.server.clear.str(whichPlayer, "gift")
    hdzapi.server.clear.str(whichPlayer, "itemh1")
    hdzapi.server.clear.str(whichPlayer, "itemh2")
    hdzapi.server.clear.str(whichPlayer, "itemh3")
    hdzapi.server.clear.str(whichPlayer, "itemh4")
    hdzapi.server.clear.str(whichPlayer, "itemh5")
    hdzapi.server.clear.str(whichPlayer, "itemh6")
    hdzapi.server.clear.str(whichPlayer, "itemc1")
    hdzapi.server.clear.str(whichPlayer, "itemc2")
    hdzapi.server.clear.str(whichPlayer, "itemc3")
    hdzapi.server.clear.str(whichPlayer, "itemc4")
    hdzapi.server.clear.str(whichPlayer, "itemc5")
    hdzapi.server.clear.str(whichPlayer, "itemc6")
    if (whichPlayer == nil or his.playing(whichPlayer) == false) then
        return
    end
    local playerIndex = hplayer.index(whichPlayer)
    -- init
    game.playerDZData.info[playerIndex] = {
        1, --称号
        0, --击杀boss数
        0, --战力
        0, --黄金
        0, --木头
    }
    game.playerDZData.hero[playerIndex] = {
        "", --英雄种类
        0, --英雄等级
    }
    game.playerDZData.courier[playerIndex] = {
        "", --信使种类
        0, --信使等级
    }
    game.playerDZData.gift[playerIndex] = {}
    game.playerDZData.item.hero[playerIndex] = { {}, {}, {}, {}, {}, {} }
    game.playerDZData.item.courier[playerIndex] = { {}, {}, {}, {}, {}, {} }
    --
    local info = hdzapi.server.get.str(whichPlayer, "info")
    local hero = hdzapi.server.get.str(whichPlayer, "hero")
    local courier = hdzapi.server.get.str(whichPlayer, "courier")
    local gift = hdzapi.server.get.str(whichPlayer, "gift")
    if (info ~= "") then
        game.playerDZData.info[playerIndex] = json.parse(string.stripslashes(info))
    end
    if (hero ~= "") then
        game.playerDZData.hero[playerIndex] = json.parse(string.stripslashes(hero))
    end
    if (courier ~= "") then
        game.playerDZData.courier[playerIndex] = json.parse(string.stripslashes(courier))
    end
    if (gift ~= "") then
        game.playerDZData.gift[playerIndex] = json.parse(string.stripslashes(gift))
    end
    for i = 1, 6 do
        local hit = hdzapi.server.get.str(whichPlayer, "itemh" .. i)
        if (hit ~= "") then
            game.playerDZData.item.hero[playerIndex][i] = json.parse(string.stripslashes(hit))
        end
        local cit = hdzapi.server.get.str(whichPlayer, "itemc" .. i)
        if (cit ~= "") then
            game.playerDZData.item.courier[playerIndex][i] = json.parse(string.stripslashes(cit))
        end
    end
    hplayer.setPrestige(hplayer.players[playerIndex], prestigeMap[game.playerDZData.info[playerIndex][1]].label)
    -- 20秒一次，自动检测玩家数据并保存,以2秒隔开每个玩家，不同时请求服务器
    htime.setInterval(20, function()
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