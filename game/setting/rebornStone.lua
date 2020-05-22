-- 复活石、复活阵
for _, f in ipairs(game.rebornStone) do
    local id
    if (f.type == 1) then
        id = hslk_global.name2Value.unit["复活石(面向东南的)"].UNIT_ID
    elseif (f.type == 2) then
        id = hslk_global.name2Value.unit["复活石(面向西南的)"].UNIT_ID
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
            unitId = hslk_global.name2Value.unit["复活阵"].UNIT_ID,
            qty = 1,
            x = f.reborn[1],
            y = f.reborn[2]
        }
    )
    table.insert(game.rebornStonePoint, { stone = stone, point = rePoint, x = f.reborn[1], y = f.reborn[2], status = 1 })
    hevent.onEnterUnitRange(stone, 400, function(evtData)
        local centerUnit = evtData.centerUnit
        local enterUnit = evtData.enterUnit
        local UNIT_TYPE = hslk_global.id2Value.unit[hunit.getId(enterUnit)].UNIT_TYPE
        if (his.hero(enterUnit) and his.alive(centerUnit) and UNIT_TYPE == "hero") then
            local rePointIdx = 0
            for pi, p in ipairs(game.rebornStonePoint) do
                if (p.status == 1 and p.stone == centerUnit) then
                    rePointIdx = pi
                    break
                end
            end
            game.unitsReborn[enterUnit] = game.rebornStonePoint[rePointIdx]
            httg.create2Unit(enterUnit, "重生记录", 11, nil, 1, 1, 100)
            heffect.bindUnit("Abilities\\Spells\\Demon\\ReviveDemon\\ReviveDemon.mdl", enterUnit, "origin", 1)
            hsound.sound2Player(cg.gg_snd_voice_reborn_do, hunit.getOwner(enterUnit))
        end
    end)
end