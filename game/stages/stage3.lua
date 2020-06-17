stage3 = function()
    gameQuestEvent.state3()

    local fire = hunit.create({
        whichPlayer = game.ALLY_PLAYER,
        unitId = hslk_global.name2Value.unit["孤单的火窖"].UNIT_ID,
        x = -763,
        y = -8641,
        ATTR = {
            life = "=" .. (2900 + game.diff * 100),
            defend = "=20",
        }
    })
    local boss = henemy.create({
        unitId = hslk_global.name2Value.unit["伺妖怪人"].UNIT_ID,
        x = -761,
        y = -8191,
        ATTR = {
            attack_white = "=" .. 135 + game.diff * 15,
            move = "=180",
            life = "=" .. (17500 + game.diff * 2500),
            life_back = "=33",
            defend = "=" .. (3 + game.diff * 2),
        }
    })
    hunit.hide(boss)
    hevent.onDead(boss, function(evtData)
        stage_ttg(evtData.triggerUnit, "可恶!")
        local deadUnit = evtData.triggerUnit
        local killer = evtData.killer
        local exp = 8000 + 2000 * game.diff
        if (killer ~= nil) then
            haward.forGroupExp(killer, exp)
        end
        stage_fleeting(deadUnit, 32 + game.diff)
        stage4()
    end)

    local eCount = 0
    htime.setInterval(3, function(curTimer)
        local m = { "毒蝎子", "狗头人战士", "狗头人牧师" }
        local a = {
            {
                attack_white = "=" .. 51 + game.diff * 4,
                life = "=" .. 96 + game.diff * 4,
                move = "=90",
                attack_debuff = {
                    add = {
                        {
                            attr = "life_back",
                            odds = 50,
                            val = 3.5 + game.diff * 0.3,
                            during = 3
                        }
                    }
                }
            },
            {
                attack_white = "=" .. 47 + game.diff * 3,
                life = "=" .. 114 + game.diff * 6,
                move = "=95",
                toughness = "=10"
            },
            {
                attack_white = "=" .. 38 + game.diff * 2,
                life = "=" .. 105 + game.diff * 5,
                move = "=93",
                resistance = "=16"
            }
        }
        local mi = math.random(1, 3)
        local xy = { { -2016, -7799 }, { -1374, -7224 }, { -343, -7510 }, { 301, -7989 } }
        local xyt = table.random(xy)
        henemy.create({
            unitId = hslk_global.name2Value.unit[m[mi]].UNIT_ID,
            x = xyt[1],
            y = xyt[2],
            ATTR = a[mi],
            qty = 2,
            attackX = -763,
            attackY = -8641,
        })
        eCount = eCount + 1
        if (eCount > 60) then
            htime.delTimer(curTimer)
            echo("BOSS出现了！！！")
            hunit.show(boss)
            cj.IssuePointOrder(boss, "attack", -763, -8641)
        end
    end)

    for i = 1, hplayer.qty_max, 1 do
        if (his.playing(hplayer.players[i])) then
            local hero = hhero.player_heroes[i][1]
            hattr.set(hero, 0, {
                life_back = "-100",
                sight = "-600",
            })
        end
    end

    htime.setInterval(1.5, function(curTimer)
        if (his.death(boss) == true) then
            htime.delTimer(curTimer)
            for i = 1, hplayer.qty_max, 1 do
                if (his.playing(hplayer.players[i])) then
                    local hero = hhero.player_heroes[i][1]
                    hattr.set(hero, 0, {
                        life_back = "+100",
                        sight = "+600",
                    })
                end
            end
            return
        end
        if (his.alive(fire)) then
            for i = 1, hplayer.qty_max, 1 do
                if (his.playing(hplayer.players[i])) then
                    local hero = hhero.player_heroes[i][1]
                    if (math.getDistanceBetweenUnit(fire, hero) <= 700) then
                        hattr.set(hero, 2, { life_back = "+60" })
                        heffect.bindUnit(
                            "Abilities\\Spells\\Human\\Heal\\HealTarget.mdl",
                            hero, "origin", 1.5
                        )
                    end
                end
            end
        end
    end)
end