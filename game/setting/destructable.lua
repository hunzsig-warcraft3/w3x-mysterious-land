onMapDestructableDestroy = function()
    hevent.onMapDestructableDestroy(function(evtData)
        local dest = evtData.triggerDestructable
        local destId = string.id2char(cj.GetDestructableTypeId(dest))
        print(destId)
        if (destId == 'FTtw' or destId == 'LTlt') then
            -- 树木，给1木材
            hitem.fleeting(
                hitem.FLEETING_IDS.LUMBER,
                cj.GetDestructableX(dest),
                cj.GetDestructableY(dest),
                20,
                function(fleetingData)
                    if (his.deleted(fleetingData.centerUnit) == true) then
                        return
                    end
                    local p = hunit.getOwner(fleetingData.enterUnit)
                    if (his.allyPlayer(fleetingData.enterUnit, game.ALLY_PLAYER) and his.playing(p) and his.computer(p) == false) then
                        hunit.del(fleetingData.centerUnit)
                        haward.forUnitLumber(fleetingData.enterUnit, 1)
                    end
                end
            )
            htime.setTimeout(3, function(curTimer)
                cj.DestructableRestoreLife(dest, cj.GetDestructableMaxLife(dest), true)
            end)
        elseif (destId == 'LTba' and math.random(1, 3) == 2) then
            -- 路障，50%给10木材
            item.fleeting(
                hitem.FLEETING_IDS.LUMBER,
                cj.GetDestructableX(dest),
                cj.GetDestructableY(dest),
                20,
                function(fleetingData)
                    if (his.deleted(fleetingData.centerUnit) == true) then
                        return
                    end
                    local p = hunit.getOwner(fleetingData.enterUnit)
                    if (his.allyPlayer(fleetingData.enterUnit, game.ALLY_PLAYER) and his.playing(p) and his.computer(p) == false) then
                        hunit.del(fleetingData.centerUnit)
                        haward.forUnitLumber(fleetingData.enterUnit, 10)
                    end
                end
            )
        elseif (destId == 'LTcr') then
            -- 木箱，给黄金
            item.fleeting(
                hitem.FLEETING_IDS.GOLD,
                cj.GetDestructableX(dest),
                cj.GetDestructableY(dest),
                20,
                function(fleetingData)
                    if (his.deleted(fleetingData.centerUnit) == true) then
                        return
                    end
                    local p = hunit.getOwner(fleetingData.enterUnit)
                    if (his.allyPlayer(fleetingData.enterUnit, game.ALLY_PLAYER) and his.playing(p) and his.computer(p) == false) then
                        hunit.del(fleetingData.centerUnit)
                        haward.forUnitGold(fleetingData.enterUnit, math.random(10, 100))
                    end
                end
            )
        elseif (destId == 'LTbs' or destId == 'LTbr' or destId == 'LTbx') then
        end
    end)
end