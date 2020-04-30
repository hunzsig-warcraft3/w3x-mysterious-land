-- 传送门
for _, f in ipairs(game.door) do
    local portal = hunit.create(
        {
            register = false,
            whichPlayer = game.ALLY_PLAYER,
            unitId = game.name2id.unit["传送门"],
            qty = 1,
            x = f.from[1],
            y = f.from[2]
        }
    )
    hevent.onEnterUnitRange(portal, 50, function(evtData)
        local enterUnit = evtData.enterUnit
        cj.SetUnitPosition(enterUnit, f.to[2], f.to[3])
        hcamera.toXY(cj.GetOwningPlayer(enterUnit), 0, f.to[2], f.to[3])
    end)
end