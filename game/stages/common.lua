stage_ttg = function(whichUnit, message)
    htextTag.style(
        htextTag.create2Unit(whichUnit, message, 8, nil, 1, 1, 50),
        "toggle", 0, 0.05
    )
end

stage_fleeting = function(deadUnit, gold)
    for _ = 1, (9 + game.diff + hplayer.qty_current) do
        hitem.fleeting(
            hitem.FLEETING_IDS.GOLD,
            hunit.x(deadUnit) + math.random(0, 200),
            hunit.y(deadUnit) + math.random(0, 200),
            30,
            function(fleetingData)
                if (his.deleted(fleetingData.centerUnit) == true) then
                    return
                end
                local p = hunit.getOwner(fleetingData.enterUnit)
                if (his.allyPlayer(fleetingData.enterUnit, game.ALLY_PLAYER) and his.playing(p) and his.computer(p) == false) then
                    hunit.del(fleetingData.centerUnit)
                    haward.forUnitGold(fleetingData.enterUnit, gold)
                end
            end
        )
    end
end