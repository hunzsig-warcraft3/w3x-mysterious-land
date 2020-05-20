-- 传送门
for _, f in ipairs(game.door) do
    local portal = hunit.create(
        {
            register = false,
            whichPlayer = game.ALLY_PLAYER,
            unitId = hslk_global.name2Value.unit["传送门"].UNIT_ID,
            qty = 1,
            x = f.from[1],
            y = f.from[2]
        }
    )
    hevent.onEnterUnitRange(portal, 50, function(evtData)
        local enterUnit = evtData.enterUnit
        hunit.portal(enterUnit, f.to[2], f.to[3])
        local owner = hunit.getOwner(enterUnit)
        hcamera.toXY(owner, 0, f.to[2], f.to[3])
        hsound.sound2Player(cg.gg_snd_voice_jump, owner)
    end)
end