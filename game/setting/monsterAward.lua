-- 怪物奖励
onEnemyAward = function(evtData)
    local triggerUnit = evtData.triggerUnit
    local killer = evtData.killer
    local mi = hunit.getUserData(triggerUnit)
    local level = monsterEnemy[mi].level
    local gold = level * 5
    local exp = (level + monsterIntegral) * 5
    if (killer ~= nil) then
        haward.forUnitExp(killer, exp)
    end
    hitem.fleeting(
        hitem.FLEETING_IDS.GOLD,
        hunit.x(triggerUnit),
        hunit.y(triggerUnit),
        30,
        function(fleetingData)
            if (his.deleted(fleetingData.centerUnit) == true) then
                return
            end
            local p = hunit.getOwner(fleetingData.enterUnit)
            if (his.allyPlayer(fleetingData.enterUnit, game.ALLY_PLAYER) and his.playing(p)) then
                hunit.del(fleetingData.centerUnit)
                haward.forUnitGold(fleetingData.enterUnit, gold)
                hsound.sound2Player(cg.gg_snd_ReceiveGold, p)
            end
        end
    )
end

onBossAward = function(evtData)
    local triggerUnit = evtData.triggerUnit
    local killer = evtData.killer
    local mi = math.floor(hunit.getUserData(triggerUnit) / 1000)
    local level = monsterBoss[mi].level
    local gold = level * 25
    local exp = (level + monsterIntegral) * 40
    monsterBoss[mi].creating = false
    if (killer ~= nil) then
        haward.forGroupExp(killer, exp)
        local p = hunit.getOwner(killer)
        if (his.playing(p)) then
            local pIndex = hplayer.index(p)
            game.playerDZData.info[pIndex][2] = game.playerDZData.info[pIndex][2] + 1
        end
    end
    for _ = 1, (9 + level) do
        hitem.fleeting(
            hitem.FLEETING_IDS.GOLD,
            hunit.x(triggerUnit) + math.random(0, 200),
            hunit.y(triggerUnit) + math.random(0, 200),
            30,
            function(fleetingData)
                if (his.deleted(fleetingData.centerUnit) == true) then
                    return
                end
                local p = hunit.getOwner(fleetingData.enterUnit)
                if (his.allyPlayer(fleetingData.enterUnit, game.ALLY_PLAYER) and his.playing(p)) then
                    hunit.del(fleetingData.centerUnit)
                    haward.forUnitGold(fleetingData.enterUnit, gold)
                    hsound.sound2Player(cg.gg_snd_ReceiveGold, p)
                end
            end
        )
    end
end