-- 复活石、复活阵
for _, f in ipairs(game.rebornStone) do
    local id
    if (f.type == 1) then
        id = game.name2id.unit["复活石(面向东南的)"]
    elseif (f.type == 2) then
        id = game.name2id.unit["复活石(面向西南的)"]
    end
    local stone = hunit.create(
        {
            register = false,
            whichPlayer = game.ALLY_PLAYER,
            unitId = id,
            qty = 1,
            x = f.loc[1],
            y = f.loc[2]
        }
    )
    local rePoint = hunit.create(
        {
            register = false,
            whichPlayer = game.ALLY_PLAYER,
            unitId = game.name2id.unit["复活阵"],
            qty = 1,
            x = f.reborn[1],
            y = f.reborn[2]
        }
    )
    game.unitsReborn[stone] = { x = f.reborn[1], y = f.reborn[1] }
    hevent.onEnterUnitRange(stone, 225, function(evtData)
        local centerUnit = evtData.centerUnit
        local enterUnit = evtData.enterUnit
        if (his.hero(enterUnit)) then
            game.unitsReborn[enterUnit] = game.unitsReborn[centerUnit]
            httg.create2Unit(enterUnit, "重生记录", 11, nil, 1, 1, 100)
            heffect.bindUnit("Abilities\\Spells\\Demon\\ReviveDemon\\ReviveDemon.mdl", enterUnit, "origin", 1)
        end
    end)
end