-- env岛屿环境
islands = {
    {
        name = "七灵岛",
        rect = hrect.create(1024, 1024, 4096, 5120, "七灵岛"),
        env = nil,
        color = hColor.gold,
        voice = nil,
        allowWeather = {
            { weather = "time", desc = "悠然自在~" },
        },
    },
    {
        name = "斑斓海",
        rect = hrect.create(-5520, -5200, 5800, 7300, "斑斓海"),
        env = "sea",
        color = hColor.sea,
        voice = cg.gg_snd_voice_sea,
        allowWeather = {
            { weather = "time", desc = "风光无限好" },
            { weather = hweather.rain, desc = "忽然下起了小雨" },
            { weather = hweather.rainstorm, desc = "下起了暴雨，波涛汹涌" },
            { weather = hweather.snow, desc = "受到了北方冷空气的影响，奇妙地下起了雪" },
        },
    },
    {
        name = "冰极雪原",
        rect = hrect.create(-6640, 5100, 5120, 7700, "冰极雪原"),
        env = "winterDeep",
        color = hColor.sky,
        voice = nil,
        allowWeather = {
            { weather = hweather.rain, desc = "下起了冻雨" },
            { weather = hweather.snow, desc = "下起了雪，冰封大地" },
            { weather = hweather.snowstorm, desc = "受到暴雪的侵袭，险象迭生" },
            { weather = hweather.mistwhite, desc = "冰消泛起了白雾，影响了视野" },
        },
    },
    {
        name = "火蛇岛",
        rect = hrect.create(2030, 5888, 4096, 4096, "火蛇岛"),
        env = "fire",
        color = hColor.red,
        voice = nil,
        allowWeather = {
            { weather = hweather.mistred, desc = "天火坠落，危险万分" },
            { weather = hweather.wind, desc = "刮起了风，火星满天，小心热火焚身" },
        },
    },
    {
        name = "铁环山",
        rect = hrect.create(6970, 0, 4096, 4300, "铁环山"),
        env = "poor",
        color = hColor.yellow,
        voice = nil,
        allowWeather = {
            { weather = "time", desc = "一派大好河山的景象" },
            { weather = hweather.rain, desc = "小雨冲刷着历史的痕迹" },
            { weather = hweather.wind, desc = "起风了，山体和风犹如铁笼枷锁" },
            { weather = hweather.windstorm, desc = "暴风侵袭，令人生怕" },
        },
    },
    {
        name = "遗迹草原",
        rect = hrect.create(6788, -6781, 4608, 5120, "遗迹草原"),
        env = "ruins",
        color = hColor.greenLight,
        voice = nil,
        allowWeather = {
            { weather = "time", desc = "展现原野靓景" },
            { weather = hweather.rain, desc = "小雨冲刷着历史的痕迹" },
            { weather = hweather.rainstorm, desc = "大雨疯狂地从天而降" },
            { weather = hweather.wind, desc = "吹起了风，遗迹更添哀愁" },
            { weather = hweather.windstorm, desc = "狂风卷裂青空像夺命的鞭子" },
        },
    },
    {
        name = "秘潭幽林",
        rect = hrect.create(400, -6900, 2900, 3900, "秘潭幽林"),
        env = "summer",
        color = hColor.green,
        voice = nil,
        allowWeather = {
            { weather = "time", desc = "万物逗趣，生机勃勃" },
            { weather = hweather.rain, desc = "下雨了，空气十分凉爽" },
            { weather = hweather.rainstorm, desc = "下起了蹉跎大雨，天空乌云密布" },
        },
    },
    {
        name = "枯死岸",
        rect = hrect.create(7544, 6759, 3800, 4608, "枯死岸"),
        env = "dark",
        color = hColor.purple,
        voice = nil,
        allowWeather = {
            { weather = hweather.shield, desc = "可看到紫色灵魂升天的奇象" },
            { weather = hweather.mistgreen, desc = "毒雾弥漫，注意小心" },
            { weather = hweather.mistblue, desc = "迷惑蓝烟处处，困惑人心" },
            { weather = hweather.rain, desc = "下起了令人生怯的小雨" },
        },
    },
}
-- 自动天气
autoWeather = function(obj)
    local during = math.random(120, 300)
    if (#obj.allowWeather > 0) then
        local which = obj.allowWeather[math.random(1, #obj.allowWeather)]
        if (which.weather == "time") then
            if (his.day()) then
                during = (18 - cj.GetFloatGameState(GAME_STATE_TIME_OF_DAY)) * 20
                if (during > 60) then
                    during = math.random(60, during)
                end
                which.weather = hweather.sun
                which.desc = "阳光灿烂，" .. which.desc
            else
                if (cj.GetFloatGameState(GAME_STATE_TIME_OF_DAY) < 6.00) then
                    during = (6 - cj.GetFloatGameState(GAME_STATE_TIME_OF_DAY)) * 20
                else
                    during = (24 - cj.GetFloatGameState(GAME_STATE_TIME_OF_DAY)) * 20
                end
                if (during > 60) then
                    during = math.random(60, during)
                end
                which.weather = hweather.moon
                which.desc = "月色照耀，" .. which.desc
            end
        end
        game.island[obj.name] = which.weather
        echo(obj.color(obj.name) .. "此时" .. which.desc)
        hweather.create({
            whichRect = obj.rect,
            type = which.weather,
            during = during
        })
        local dur = 0
        htime.setInterval(3, function(t)
            dur = dur + 3
            if (dur >= during) then
                htime.delTimer(t)
                autoWeather(obj)
                return
            end
            if (which.weather == hweather.sun) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 3) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "阳光回照", 10, "FFD700", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.bindUnit(
                            "Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl",
                            enumUnit, "origin", 5
                        )
                        hattr.set(enumUnit, 5, {
                            life_back = "+" .. (75 - 2 * game.diff),
                        })
                    end
                end, true)
            elseif (which.weather == hweather.moon) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 3) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "月光护佑", 10, "00BFFF", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.bindUnit(
                            "Abilities\\Spells\\Items\\ClarityPotion\\ClarityTarget.mdl",
                            enumUnit, "origin", 5
                        )
                        hattr.set(enumUnit, 5, {
                            mana_back = "+" .. (60 - 2 * game.diff),
                        })
                    end
                end, true)
            elseif (which.weather == hweather.rain) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 3) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "雨水浸透", 10, "87CEFA", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.bindUnit(
                            "Abilities\\Spells\\Other\\AcidBomb\\BottleImpact.mdl",
                            enumUnit, "origin", 5
                        )
                        hattr.set(enumUnit, 5, {
                            move = "-" .. (20 + game.diff),
                            defend = "-" .. (1 + game.diff),
                        })
                    end
                end, true)
            elseif (which.weather == hweather.rainstorm) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 3) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "大雨蹉跎", 10, "4682B4", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.bindUnit(
                            "Abilities\\Spells\\Other\\AcidBomb\\BottleImpact.mdl",
                            enumUnit, "origin", 7
                        )
                        hattr.set(enumUnit, 7, {
                            attack_speed = "-" .. (10 + game.diff),
                            move = "-" .. (30 + game.diff),
                            defend = "-" .. (3 + game.diff),
                        })
                    end
                end, true)
                -- 雷暴
                for i = 1, (5 + game.diff) do
                    htime.setTimeout(i * 0.1, function(ti)
                        htime.delTimer(ti)
                        local x = math.random(hrect.getStartX(obj.rect), hrect.getEndX(obj.rect))
                        local y = math.random(hrect.getStartY(obj.rect), hrect.getEndY(obj.rect))
                        local radius = 120 + 10 * game.diff
                        htexture.alertCircle(radius * 2, x, y, 2)
                        htime.setTimeout(2, function(tl)
                            htime.delTimer(tl)
                            heffect.toXY("Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl", x, y)
                            local g2 = hgroup.createByXY(x, y, radius, function(filterUnit)
                                return his.hero(filterUnit) and his.alive(filterUnit)
                            end)
                            hgroup.loop(g2, function(enumUnit)
                                hskill.swim({
                                    whichUnit = enumUnit,
                                    damage = (0.35 + 0.05 * game.diff) * hunit.getCurLife(enumUnit),
                                    during = 2 + 0.3 * game.diff,
                                    odds = 100,
                                    effect = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl",
                                    damageKind = CONST_DAMAGE_KIND.special,
                                    damageType = { CONST_DAMAGE_TYPE.thunder }
                                })
                                local duri = 7
                                heffect.bindUnit(
                                    "Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl",
                                    enumUnit, "origin", duri
                                )
                                hattr.set(enumUnit, duri, {
                                    attack_speed = "-" .. (20 + game.diff),
                                    move = "-" .. (100 + game.diff),
                                })
                                htexture.mark(htexture.DEFAULT_MARKS.DIAGONAL_SLASH, duri, cj.GetOwningPlayer(enumUnit), 0, 0, 255)
                                hsound.sound2Player(cg.gg_snd_voice_thunder, cj.GetOwningPlayer(enumUnit))
                            end, true)
                        end)
                    end)
                end
            elseif (which.weather == hweather.snow) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 3) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "飘雪冻结", 10, "F0FFFF", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.toUnit("Abilities\\Spells\\Human\\Blizzard\\BlizzardTarget.mdl", enumUnit)
                        heffect.bindUnit(
                            "Abilities\\Spells\\Undead\\FrostArmor\\FrostArmorDamage.mdl",
                            enumUnit, "origin", 12
                        )
                        hattr.set(enumUnit, 12, {
                            attack_speed = "-" .. (4 + game.diff),
                            move = "-" .. (15 + game.diff),
                        })
                    end
                end, true)
            elseif (which.weather == hweather.snowstorm) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 2) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "雪崩", 10, "F0FFFF", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.toUnit("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", enumUnit)
                        heffect.bindUnit(
                            "Abilities\\Spells\\Undead\\FrostArmor\\FrostArmorDamage.mdl",
                            enumUnit, "origin", 12
                        )
                        hattr.set(enumUnit, 12, {
                            attack_speed = "-" .. (6 + game.diff),
                            move = "-" .. (18 + game.diff),
                            defend = "-" .. game.diff,
                        })
                    end
                end, true)
            elseif (which.weather == hweather.wind) then
                if (obj.name == "火蛇岛") then
                    local g = hgroup.createByRect(obj.rect, function(filterUnit)
                        local playerIndex = hplayer.index(cj.GetOwningPlayer(filterUnit))
                        return his.hero(filterUnit) and his.alive(filterUnit) and hRuntime.player[playerIndex].marking ~= true
                    end)
                    hgroup.loop(g, function(enumUnit)
                        httg.style(
                            httg.create2Unit(enumUnit, "山火焚身", 10, "FF6347", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.bindUnit("Environment\\LargeBuildingFire\\LargeBuildingFire0.mdl", enumUnit, "origin", 7)
                        local burn = 250 * game.diff
                        local oppose = hattr.get(enumUnit, "natural_fire_oppose") or 0
                        burn = math.round(burn * (1 - oppose * 0.01))
                        if (burn > 0) then
                            hattr.set(enumUnit, 5, {
                                life_back = "-" .. burn,
                            })
                        end
                    end, true)
                else
                    local g = hgroup.createByRect(obj.rect, function(filterUnit)
                        return his.hero(filterUnit) and his.alive(filterUnit)
                    end)
                    hgroup.loop(g, function(enumUnit)
                        if (math.random(1, 3) == 1) then
                            httg.style(
                                httg.create2Unit(enumUnit, "大风吹刮", 10, "7FFFAA", 1, 2, 50),
                                'scale', 0, 0.05
                            )
                            heffect.toUnit("Abilities\\Spells\\Other\\Tornado\\TornadoElementalSmall.mdl", enumUnit, 1)
                            hskill.crackFly({
                                whichUnit = enumUnit,
                                damage = 0,
                                odds = 100,
                                distance = 200,
                                high = 0,
                                during = 1.0,
                            })
                            hattr.set(enumUnit, 2.5, {
                                move = "-" .. (30 + game.diff),
                            })
                            hsound.sound2Player(cg.gg_snd_voice_wind, cj.GetOwningPlayer(enumUnit))
                        end
                    end, true)
                end
            elseif (which.weather == hweather.windstorm) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 3) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "狂风割裂", 10, "00FA9A", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.toUnit("Abilities\\Spells\\NightElf\\Cyclone\\CycloneTarget.mdl", enumUnit, 1)
                        hskill.crackFly({
                            whichUnit = enumUnit,
                            damage = 0,
                            odds = 100,
                            distance = 350,
                            high = 100,
                            during = 1.4,
                        })
                        hattr.set(enumUnit, 2.5, {
                            move = "-" .. (50 + game.diff),
                        })
                        hsound.sound2Player(cg.gg_snd_voice_wind, cj.GetOwningPlayer(enumUnit))
                    end
                end, true)
            elseif (which.weather == hweather.mistwhite) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    local playerIndex = hplayer.index(cj.GetOwningPlayer(filterUnit))
                    return his.hero(filterUnit) and his.alive(filterUnit) and hRuntime.player[playerIndex].marking ~= true
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 2) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "白雾蔽目", 10, "F5FFFA", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        local duri = 7
                        heffect.bindUnit("Abilities\\Spells\\Undead\\Cripple\\CrippleTarget.mdl", enumUnit, "head", duri)
                        hattr.set(enumUnit, duri, {
                            sight = "-" .. (300 + 75 * game.diff),
                        })
                        htexture.mark(htexture.DEFAULT_MARKS.DREAM, duri, cj.GetOwningPlayer(enumUnit), 255, 255, 255)
                    end
                end, true)
            elseif (which.weather == hweather.mistred) then
                -- 陨石
                for i = 1, (3 + game.diff) do
                    htime.setTimeout(i * 0.1, function(ti)
                        htime.delTimer(ti)
                        local x = math.random(hrect.getStartX(obj.rect), hrect.getEndX(obj.rect))
                        local y = math.random(hrect.getStartY(obj.rect), hrect.getEndY(obj.rect))
                        local radius = 180 + 10 * game.diff
                        htexture.alertCircle(radius * 2, x, y, 2)
                        heffect.toXY("Units\\Demon\\Infernal\\InfernalBirth.mdl", x, y)
                        htime.setTimeout(0.8, function(tl)
                            htime.delTimer(tl)
                            local g2 = hgroup.createByXY(x, y, radius, function(filterUnit)
                                return his.hero(filterUnit) and his.alive(filterUnit)
                            end)
                            hgroup.loop(g2, function(enumUnit)
                                hskill.swim({
                                    whichUnit = enumUnit,
                                    damage = (0.5 + 0.1 * game.diff) * hunit.getCurLife(enumUnit),
                                    during = 1.6 + 0.2 * game.diff,
                                    odds = 100,
                                    effect = "Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl",
                                    damageKind = CONST_DAMAGE_KIND.special,
                                    damageType = { CONST_DAMAGE_TYPE.fire, CONST_DAMAGE_TYPE.real }
                                })
                            end, true)
                        end)
                    end)
                end
            elseif (which.weather == hweather.mistgreen) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    httg.style(
                        httg.create2Unit(enumUnit, "毒雾侵蚀", 10, "7FFF00", 1, 2, 50),
                        'scale', 0, 0.05
                    )
                    heffect.bindUnit("Abilities\\Spells\\Human\\Banish\\BanishTarget.mdl", enumUnit, "origin", 7)
                    local poison = 500 * game.diff
                    local oppose = hattr.get(enumUnit, "natural_poison_oppose") or 0
                    poison = math.round(poison * (1 - oppose * 0.01))
                    if (poison > 0) then
                        hattr.set(enumUnit, 5, {
                            life_back = "-" .. poison,
                        })
                    end
                end, true)
            elseif (which.weather == hweather.mistblue) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    httg.style(
                        httg.create2Unit(enumUnit, "蛊惑蓝烟", 10, "4169E1", 1, 2, 50),
                        'scale', 0, 0.05
                    )
                    hskill.swim({
                        whichUnit = enumUnit,
                        damage = 50 * game.diff,
                        during = 1.0 + 0.25 * game.diff,
                        odds = 100,
                        effect = "Abilities\\Spells\\Human\\Polymorph\\PolyMorphDoneGround.mdl",
                        damageKind = CONST_DAMAGE_KIND.special,
                        damageType = { CONST_DAMAGE_TYPE.dark }
                    })
                end, true)
            elseif (which.weather == hweather.shield) then
                -- 紫光爆炸
                for i = 1, (8 + game.diff) do
                    htime.setTimeout(i * 0.3, function(ti)
                        htime.delTimer(ti)
                        local x = math.random(hrect.getStartX(obj.rect), hrect.getEndX(obj.rect))
                        local y = math.random(hrect.getStartY(obj.rect), hrect.getEndY(obj.rect))
                        local radius = 150 + 10 * game.diff
                        htexture.alertCircle(radius * 2, x, y, 2)
                        htime.setTimeout(2, function(tl)
                            htime.delTimer(tl)
                            heffect.toXY("Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl", x, y)
                            local g2 = hgroup.createByXY(x, y, radius, function(filterUnit)
                                return his.hero(filterUnit) and his.alive(filterUnit)
                            end)
                            hgroup.loop(g2, function(enumUnit)
                                hskill.swim({
                                    whichUnit = enumUnit,
                                    damage = (0.4 + 0.05 * game.diff) * hunit.getMaxLife(enumUnit),
                                    during = 2 + 0.3 * game.diff,
                                    odds = 100,
                                    effect = "Abilities\\Spells\\NightElf\\shadowstrike\\shadowstrike.mdl",
                                    damageKind = CONST_DAMAGE_KIND.special,
                                    damageType = { CONST_DAMAGE_TYPE.thunder }
                                })
                                heffect.bindUnit(
                                    "Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl",
                                    enumUnit, "origin", 7
                                )
                                hattr.set(enumUnit, 7, {
                                    defend = "-" .. (5 + 2 * game.diff),
                                })
                            end, true)
                        end)
                    end)
                end
            end
        end)
    end
end

for _, v in ipairs(islands) do
    -- 随机装饰
    if (v.env ~= nil) then
        henv.random(v.rect, v.env, false, false)
    end
    -- 天气
    htime.setTimeout(math.random(20, 30), function(t)
        htime.delTimer(t)
        autoWeather(v)
    end)
    -- 环境音效
    if (v.voice ~= nil) then
        hsound.sound2Rect(v.voice, v.rect)
    end
end