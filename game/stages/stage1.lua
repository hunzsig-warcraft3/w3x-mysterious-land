stage1 = function()
    local quest = gameQuestEvent.state1()
    -- 土匪
    henemy.create({
        unitId = hslk_global.name2Value.unit["土匪"].UNIT_ID,
        x = -6057,
        y = -8706,
        facing = 180,
        qty = 10,
        attr = {
            attack_white = "=" .. 5 + game.diff * 5,
            attack_speed = "-20",
            life = "=" .. 50 + game.diff * 25,
            move = "=150",
        }
    })
    -- boss
    local boss = henemy.create({
        unitId = hslk_global.name2Value.unit["秘地傀儡"].UNIT_ID,
        x = -5036,
        y = -8908,
        facing = 180,
        attr = {
            attack_white = "=" .. 100 + game.diff * 10,
            life = "=" .. 1500 + game.diff * 500,
            life_back = "=10",
            move = "=" .. (50 + game.diff),
            avoid = "=" .. (game.diff - 20),
        }
    })
    -- 区域陷阱
    local trap1 = hrect.create(-5183, -8893, 384, 700, "trap1")
    --
    hevent.onAttack(boss, function(evtData)
        stage_ttg(evtData.attacker, "越战越强")
        heffect.bindUnit("Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl", evtData.attacker, "weapon", 3)
        hattr.set(evtData.attacker, 3, {
            attack_white = "+" .. math.floor(hattr.get(evtData.attacker, "attack_white") * 0.2),
            move = "+5",
        })
        henemy.create({
            unitId = hslk_global.name2Value.unit["秘地小傀儡"].UNIT_ID,
            x = hunit.x(evtData.attacker),
            y = hunit.y(evtData.attacker),
            facing = hunit.getFacing(evtData.attacker),
            attr = {
                attack_white = "=" .. 10 + game.diff,
                life = "=50",
                move = "=110",
            }
        })
    end)
    hevent.onBeDamage(boss, function(evtData)
        stage_ttg(evtData.triggerUnit, "继续打我呀")
        hattr.set(evtData.triggerUnit, 5, {
            move = "+70",
        })
        if (math.random(1, 2) == 1) then
            cj.IssueTargetOrder(evtData.triggerUnit, "attack", evtData.sourceUnit)
        end
    end)
    hevent.onDead(boss, function(evtData)
        hrect.del(trap1)
        hquest.setCompleted(quest)
        stage2()
        stage_ttg(evtData.triggerUnit, "竟然...!")
        local deadUnit = evtData.triggerUnit
        local killer = evtData.killer
        local exp = 10000 * game.diff
        if (killer ~= nil) then
            haward.forGroupExp(killer, exp)
        end
        stage_fleeting(deadUnit, 25 + game.diff * 5)
    end)
    hevent.onEnterRect(trap1, function(evtData)
        if (his.alive(boss) and his.allyPlayer(evtData.triggerUnit, game.ALLY_PLAYER)) then
            hattr.set(boss, 10, {
                attack_white = "+10000",
                move = "+522",
            })
            cj.IssueTargetOrder(boss, "attack", evtData.triggerUnit)
            stage_ttg(boss, "敢硬闯?!")
        end
    end)
    hevent.onDestructableDestroy(cg.gg_dest_DTg7_0109, function(evtData)
        henv.delDestructable(evtData.triggerDestructable)
        hunit.kill(boss, 0)
    end)
end