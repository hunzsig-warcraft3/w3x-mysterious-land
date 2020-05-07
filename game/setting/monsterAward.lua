-- 怪物奖励
onEnemyAward = function(evtData)
    local triggerUnit = evtData.triggerUnit
    local killer = evtData.killer
    if (killer == nil) then
        return
    end
    local mi = hunit.getUserData(triggerUnit)
    local level = monster[mi].level
    local gold = level * 5
    local exp = level * 10
    haward.forUnitExp(killer, exp)
    hitem.fleeting(
        hitem.FLEETING_IDS.GOLD,
        cj.GetUnitX(triggerUnit),
        cj.GetUnitY(triggerUnit),
        30,
        function(fleetingData)
            if (his.deleted(fleetingData.centerUnit) == true) then
                return
            end
            local p = cj.GetOwningPlayer(fleetingData.enterUnit)
            if (his.allyPlayer(fleetingData.enterUnit, game.ALLY_PLAYER) and his.playing(p)) then
                hunit.del(fleetingData.centerUnit)
                haward.forUnitGold(fleetingData.enterUnit, gold)
                hsound.sound2Player(cg.gg_snd_ReceiveGold, p)
            end
        end
    )
end