stage2 = function()
    local quest = gameQuestEvent.state2()
    -- 小神木商店
    hunit.create({
        whichPlayer = game.ALLY_PLAYER,
        unitId = hslk_global.name2Value.unit["小神木商店"].UNIT_ID,
        x = -2432,
        y = -8448,
        facing = 270,
    })
    -- 小鱼
    henemy.create({
        unitId = hslk_global.name2Value.unit["小鱼妖"].UNIT_ID,
        x = -3917,
        y = -9323,
        facing = 0,
        qty = 6,
        attr = {
            attack_white = "=" .. 20 + game.diff * 10,
            life = "=" .. 100 + game.diff * 35,
            move = "=120",
        }
    })
    henemy.create({
        unitId = hslk_global.name2Value.unit["青鱼妖"].UNIT_ID,
        x = -3800,
        y = -8858,
        facing = 0,
        qty = 7,
        attr = {
            attack_white = "=" .. 25 + game.diff * 13,
            life = "=" .. 120 + game.diff * 40,
            move = "=125",
        }
    })
    henemy.create({
        unitId = hslk_global.name2Value.unit["夜鱼妖"].UNIT_ID,
        x = -4000,
        y = -8400,
        facing = 0,
        qty = 8,
        attr = {
            attack_white = "=" .. 30 + game.diff * 15,
            life = "=" .. 130 + game.diff * 45,
            move = "=130",
        }
    })
end