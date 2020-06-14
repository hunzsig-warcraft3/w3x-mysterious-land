hitem.matchUsed({
    {
        "秘笈：.+",
        function(evtData)
            local triggerUnit = evtData.triggerUnit
            local triggerItem = evtData.triggerItem
            local playerIndex = hplayer.index(hunit.getOwner(triggerUnit))
            local hero = hhero.player_heroes[playerIndex][1] -- 兼容信使
            if (hero == nil or his.deleted(hero)) then
                return
            end
            local itemName = hitem.getName(triggerItem)
            local abName = string.gsub(itemName, "秘笈：", "")
            local abSlk = hslk_global.name2Value.ability[abName]
            local abid = abSlk.ABILITY_ID
            local id_array = abSlk.ID_ARRAY
            if (id_array == "gift_weapon" and hskill.has(hero, hslk_global.name2Value.ability["武 - 封印"].ABILITY_ID)) then
                hskill.del(hero, hslk_global.name2Value.ability["武 - 封印"].ABILITY_ID)
            elseif (id_array == "gift_defend" and hskill.has(hero, hslk_global.name2Value.ability["御 - 封印"].ABILITY_ID)) then
                hskill.del(hero, hslk_global.name2Value.ability["御 - 封印"].ABILITY_ID)
            elseif (id_array == "gift_speed" and hskill.has(hero, hslk_global.name2Value.ability["速 - 封印"].ABILITY_ID)) then
                hskill.del(hero, hslk_global.name2Value.ability["速 - 封印"].ABILITY_ID)
            elseif (id_array == "gift_tao" and hskill.has(hero, hslk_global.name2Value.ability["奇 - 封印"].ABILITY_ID)) then
                hskill.del(hero, hslk_global.name2Value.ability["奇 - 封印"].ABILITY_ID)
            end
            if (game.playerData.gift[playerIndex][id_array] ~= nil) then
                hskill.del(hero, game.playerData.gift[playerIndex][id_array])
            end
            hskill.add(hero, abid)
            game.playerData.gift[playerIndex][id_array] = abid
            heffect.toUnit("Abilities\\Spells\\Items\\AIem\\AIemTarget.mdl", hero)
            echo("学会了[" .. hColor.green(abName) .. "]")
        end
    },
    {
        "医疗石",
        function(evtData)
            local triggerUnit = evtData.triggerUnit
            heffect.bindUnit(
                "Abilities\\Spells\\Human\\Heal\\HealTarget.mdl",
                triggerUnit, "origin", 10
            )
            hattr.set(triggerUnit, 10, {
                life_back = "+20",
            })
        end
    },
    {
        "医疗剂",
        function(evtData)
            local triggerUnit = evtData.triggerUnit
            heffect.bindUnit(
                "Abilities\\Spells\\Items\\HealingSalve\\HealingSalveTarget.mdl",
                triggerUnit, "origin", 6
            )
            hattr.set(triggerUnit, 6, {
                life_back = "+83.34",
            })
        end
    },
    {
        "魔法石",
        function(evtData)
            local triggerUnit = evtData.triggerUnit
            heffect.bindUnit(
                "Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl",
                triggerUnit, "origin", 10
            )
            hattr.set(triggerUnit, 10, {
                mana_back = "+15",
            })
        end
    },
    {
        "魔法剂",
        function(evtData)
            local triggerUnit = evtData.triggerUnit
            heffect.bindUnit(
                "Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl",
                triggerUnit, "origin", 6
            )
            hattr.set(triggerUnit, 6, {
                mana_back = "+50",
            })
        end
    },
})