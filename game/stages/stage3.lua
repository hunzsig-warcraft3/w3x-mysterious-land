stage3 = function()
    local quest = gameQuestEvent.state3()

    local fire = hunit.create({
        whichUnit = game.ALLY_PLAYER,
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

    htime.setInterval(2, function(curTimer)
        local m = { "毒蝎子", "狗头人战士", "狗头人牧师" }
        local a = {
            {
                attack_white = "=" .. 51 + game.diff * 4,
                life = "=" .. 116 + game.diff * 4,
                move = "=115",
                attack_debuff = {
                    add = {
                        {
                            attr = "life_back",
                            odds = 50,
                            val = 4.5 + game.diff * 0.5,
                            during = 3
                        }
                    }
                }
            },
            {
                attack_white = "=" .. 47 + game.diff * 3,
                life = "=" .. 144 + game.diff * 6,
                move = "=150",
                toughness = "=18"
            },
            {
                attack_white = "=" .. 38 + game.diff * 2,
                life = "=" .. 125 + game.diff * 5,
                move = "=130",
                resistance = "=35"
            }
        }
        local mi = math.random(1, 3)
        local xy = { { -2016, -7799 }, { -1374, -7224 }, { -343, -7510 }, { 301, -7989 } }
        local xyt = table.random(xy)
        henemy.create({
            unitId = hslk_global.name2Value.unit[m[mi]].UNIT_ID,
            x = xyt[1],
            y = xyt[2],
            ATTR = a[mi]
        })
    end)

    htime.setInterval(1.5, function(curTimer)
        if (his.death(boss) == true) then
            htime.delTimer(curTimer)
            return
        end
        for i = 1, hplayer.qty_max, 1 do
            if (his.playing(hplayer.players[i])) then
                local hero = hhero.player_heroes[i][1]
                if (math.getDistanceBetweenUnit(fire, hero) <= 700) then
                    hattr.set(hero, 2, { life_back = "+10" })
                    heffect.bindUnit(
                        "Abilities\\Spells\\Human\\Heal\\HealTarget.mdl",
                        hero, "origin", 1.5
                    )
                else
                    hattr.set(hero, 1, { life_back = "-100" })
                end
            end
        end
    end)
end