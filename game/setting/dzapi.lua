local prestigeMap = {
    { qty = 0, label = "初出茅庐" },
    { qty = 5, label = "略有小成" },
    { qty = 10, label = "初露锋芒" },
    { qty = 20, label = "游刃有余" },
    { qty = 30, label = "一剑成名" },
    { qty = 40, label = "名扬山海" },
    { qty = 50, label = "当世英豪" },
    { qty = 70, label = "登峰造极" },
    { qty = 90, label = "天选之人" },
    { qty = 100, label = "修真始体" },
    { qty = 130, label = "身越七魄" },
    { qty = 180, label = "灵通三魂" },
    { qty = 200, label = "神游山海" },
    { qty = 250, label = "灭劫星窍" },
    { qty = 300, label = "得道金仙" },
    { qty = 400, label = "六御天帝" },
    { qty = 500, label = "三清天尊" },
    { qty = 999, label = "九天至尊" },
}
dzCurrent = {}
dzCurrent.doRecord = function(whichPlayer)
    local playerIndex = hplayer.index(whichPlayer)
    if (hhero.player_heroes[playerIndex][1] == nil) then
        return
    end
    local heroLv = hhero.getCurLevel(hhero.player_heroes[playerIndex][1])
    game.playerDZData.hero[playerIndex][1] = hunit.getId(hhero.player_heroes[playerIndex][1])
    game.playerDZData.hero[playerIndex][2] = heroLv
    -- 计算称号
    local kd = game.playerDZData.info[playerIndex][2] or 0
    local prestige = 1
    for pi, pm in ipairs(prestigeMap) do
        if (kd >= pm.qty) then
            prestige = pi
        else
            break
        end
    end
    game.playerDZData.info[playerIndex][1] = prestige
    local its = {}
    local itLv = 0
    hitem.slotLoop(hhero.player_heroes[playerIndex][1], function(slotItem, slotIndex)
        local charges = hitem.getCharges(slotItem)
        itLv = hitem.getLevel(slotItem) * (charges + 1)
        table.insert(its, {
            hitem.getId(slotItem),
            charges,
            slotIndex,
        })
    end)
    game.playerDZData.item[playerIndex] = its
    --
    game.playerDZData.ability[playerIndex] = {}
    game.playerDZData.gift[playerIndex] = {}
    -- 计算战力
    local power = math.floor(kd * 3
        + heroLv * 1
        + #game.playerDZData.ability[playerIndex] * 20
        + #game.playerDZData.gift[playerIndex] * 30
        + itLv)
    game.playerDZData.info[playerIndex][3] = math.integerFormat(power)
    game.playerDZData.info[playerIndex][4] = hplayer.getGold(whichPlayer)
    game.playerDZData.info[playerIndex][5] = hplayer.getLumber(whichPlayer)
    -- 写入服务器
    local jsonInfo = string.addslashes(json.stringify(game.playerDZData.info[playerIndex]))
    local jsonHero = string.addslashes(json.stringify(game.playerDZData.hero[playerIndex]))
    local jsonItem = string.addslashes(json.stringify(game.playerDZData.item[playerIndex]))
    local jsonAbility = string.addslashes(json.stringify(game.playerDZData.ability[playerIndex]))
    local jsonGift = string.addslashes(json.stringify(game.playerDZData.gift[playerIndex]))
    print(string.len(jsonInfo), jsonInfo)
    print(string.len(jsonHero), jsonHero)
    print(string.len(jsonItem), jsonItem)
    print(string.len(jsonAbility), jsonAbility)
    print(string.len(jsonGift), jsonGift)
    hplayer.setPrestige(whichPlayer, prestigeMap[prestige].label)
    hdzapi.setRoomStat(whichPlayer, "prestige", prestigeMap[prestige].label) --房间称号
    hdzapi.setRoomStat(whichPlayer, "power", power) --房间战力
    hdzapi.server.set.str(whichPlayer, "info", jsonInfo)
    hdzapi.server.set.str(whichPlayer, "hero", jsonHero)
    hdzapi.server.set.str(whichPlayer, "item", jsonItem)
    hdzapi.server.set.str(whichPlayer, "ability", jsonAbility)
    hdzapi.server.set.str(whichPlayer, "gift", jsonGift)
end

dzCurrent.enableRecord = function(whichPlayer)
    --hdzapi.server.clear.str(whichPlayer, "info")
    --hdzapi.server.clear.str(whichPlayer, "hero")
    --hdzapi.server.clear.str(whichPlayer, "item")
    --hdzapi.server.clear.str(whichPlayer, "ability")
    --hdzapi.server.clear.str(whichPlayer, "gift")
    if (whichPlayer == nil or his.playing(whichPlayer) == false) then
        return
    end
    local playerIndex = hplayer.index(whichPlayer)
    game.playerDZData.info[playerIndex] = hdzapi.server.get.str(whichPlayer, "info")
    game.playerDZData.hero[playerIndex] = hdzapi.server.get.str(whichPlayer, "hero")
    game.playerDZData.item[playerIndex] = hdzapi.server.get.str(whichPlayer, "item")
    game.playerDZData.ability[playerIndex] = hdzapi.server.get.str(whichPlayer, "ability")
    game.playerDZData.gift[playerIndex] = hdzapi.server.get.str(whichPlayer, "gift")
    if (game.playerDZData.info[playerIndex] == "") then
        game.playerDZData.info[playerIndex] = {
            1, --称号
            0, --击杀boss数
            0, --战力
            0, --黄金
            0, --木头
        }
    else
        game.playerDZData.info[playerIndex] = json.parse(string.stripslashes(game.playerDZData.info[playerIndex]))
    end
    if (game.playerDZData.hero[playerIndex] == "") then
        game.playerDZData.hero[playerIndex] = {
            "", --英雄种类
            0, --英雄等级
        }
    else
        game.playerDZData.hero[playerIndex] = json.parse(string.stripslashes(game.playerDZData.hero[playerIndex]))
    end
    if (game.playerDZData.item[playerIndex] == "") then
        game.playerDZData.item[playerIndex] = {}
    else
        game.playerDZData.item[playerIndex] = json.parse(string.stripslashes(game.playerDZData.item[playerIndex]))
    end
    if (game.playerDZData.ability[playerIndex] == "") then
        game.playerDZData.ability[playerIndex] = {}
    else
        game.playerDZData.ability[playerIndex] = json.parse(string.stripslashes(game.playerDZData.ability[playerIndex]))
    end
    if (game.playerDZData.gift[playerIndex] == "") then
        game.playerDZData.gift[playerIndex] = {}
    else
        game.playerDZData.gift[playerIndex] = json.parse(string.stripslashes(game.playerDZData.gift[playerIndex]))
    end
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