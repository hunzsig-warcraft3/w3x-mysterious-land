-- 怪物奖励
onEnemyAwardFleeting = function(fleetingData)
    if (his.deleted(fleetingData.centerUnit) == true) then
        return
    end
    local p = hunit.getOwner(fleetingData.enterUnit)
    if (his.allyPlayer(fleetingData.enterUnit, game.ALLY_PLAYER) and his.playing(p)) then
        local buffId = cj.GetUnitTypeId(fleetingData.centerUnit)
        hunit.del(fleetingData.centerUnit)
        if (buffId == hitem.FLEETING_IDS.GOLD) then
            haward.forUnitGold(fleetingData.enterUnit, math.random(10, 20))
            hsound.sound2Player(cg.gg_snd_ReceiveGold, p)
        elseif (buffId == hitem.FLEETING_IDS.LUMBER) then
            haward.forUnitLumber(fleetingData.enterUnit, 1)
            hsound.sound2Player(cg.gg_snd_BundleOfLumber, p)
        elseif (buffId == hitem.FLEETING_IDS.BOOK_RED) then
            hattr.set(fleetingData.enterUnit, 0, { str_green = "+1" })
            echo("获得了一本力量之书,力量临时+1", p)
        elseif (buffId == hitem.FLEETING_IDS.BOOK_GREEN) then
            hattr.set(fleetingData.enterUnit, 0, { agi_green = "+1" })
            echo("获得了一本敏捷之书,敏捷临时+1", p)
        elseif (buffId == hitem.FLEETING_IDS.BOOK_BLUE) then
            hattr.set(fleetingData.enterUnit, 0, { agi_green = "+1" })
            echo("获得了一本智力之书,智力临时+1", p)
        elseif (buffId == hitem.FLEETING_IDS.DOTA2_CURE) then
            hattr.set(fleetingData.enterUnit, 3, {
                life_back = "+100",
                life_mana = "+50",
            })
            heffect.bindUnit(
                "Abilities\\Spells\\Items\\ScrollOfRejuvenation\\ScrollManaHealth.mdl",
                fleetingData.enterUnit, "origin", 3
            )
        elseif (buffId == hitem.FLEETING_IDS.DOTA2_DAMAGE) then
            hattr.set(fleetingData.enterUnit, 15, {
                damage_extent = "+10",
            })
            heffect.bindUnit(
                "Abilities\\Spells\\Orc\\Bloodlust\\BloodlustTarget.mdl",
                fleetingData.enterUnit, "origin", 15
            )
        elseif (buffId == hitem.FLEETING_IDS.DOTA2_GOLD) then
            hplayer.addGoldRatio(p, 10, 40)
        elseif (buffId == hitem.FLEETING_IDS.DOTA2_SPEED) then
            hattr.set(fleetingData.enterUnit, 7, {
                attack_speed = "+25",
                move = "+120",
            })
            heffect.bindUnit(
                "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl",
                fleetingData.enterUnit, "origin", 7
            )
        elseif (buffId == hitem.FLEETING_IDS.DOTA2_INVISIBLE) then
            hskill.visible(fleetingData.enterUnit, 10, 0.3, nil)
        end
    end
end
onEnemyAward = function(evtData)
    local triggerUnit = evtData.triggerUnit
    local killer = evtData.killer
    local mi = hunit.getUserData(triggerUnit)
    local level = monsterEnemy[mi].level
    local gold = level * 5 + game.diff
    local exp = (level + monsterIntegral) * 5 + game.diff
    if (killer ~= nil) then
        haward.forUnit(killer, exp, gold, 0)
        local p = hunit.getOwner(killer)
        if (his.playing(p)) then
            local pIndex = hplayer.index(p)
            game.playerDZData.info[pIndex][2] = game.playerDZData.info[pIndex][2] + 50
        end
    end
    if (math.random(1, 50) == 26) then
        local buffs = {
            hitem.FLEETING_IDS.GOLD,
            hitem.FLEETING_IDS.LUMBER,
            hitem.FLEETING_IDS.BOOK_RED,
            hitem.FLEETING_IDS.BOOK_GREEN,
            hitem.FLEETING_IDS.BOOK_BLUE,
            hitem.FLEETING_IDS.DOTA2_CURE,
            hitem.FLEETING_IDS.DOTA2_DAMAGE,
            hitem.FLEETING_IDS.DOTA2_GOLD,
            hitem.FLEETING_IDS.DOTA2_SPEED,
            hitem.FLEETING_IDS.DOTA2_INVISIBLE,
        }
        local buff = table.random(buffs)
        hitem.fleeting(buff, hunit.x(triggerUnit), hunit.y(triggerUnit), 30, onEnemyAwardFleeting)
    end
end

onBossAward = function(evtData)
    local triggerUnit = evtData.triggerUnit
    local killer = evtData.killer
    local mi = math.floor(hunit.getUserData(triggerUnit) / 1000)
    local level = monsterBoss[mi].level
    local killerGold = level * 50 + game.diff * 10
    local killerExp = (level + monsterIntegral) * (10 + game.diff)
    local gold = level * 10 + game.diff * 2
    local exp = (level + monsterIntegral) * (20 + game.diff)
    monsterBoss[mi].creating = false
    if (killer ~= nil) then
        haward.forUnit(killer, killerExp, killerGold, 1) --杀手专有
        haward.forGroupExp(killer, exp) --大队经验
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