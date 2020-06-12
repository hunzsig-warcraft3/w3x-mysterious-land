stage3 = function()
    local quest = gameQuestEvent.state3()

    local fire = hunit.create({
        whichUnit = game.ALLY_PLAYER,
        unitId = hslk_global.name2Value.unit["孤单的火窖"].UNIT_ID,
        x = -763,
        y = -8641,
    })
end