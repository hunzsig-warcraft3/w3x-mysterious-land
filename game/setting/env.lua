-- env岛屿环境
local islands = {
    {
        name = "斑斓海",
        rect = hrect.create(-5520, -5200, 5800, 7300),
        env = "sea",
        color = hColor.sea,
        allowWeather = {
            { weather = "time", desc = "风光无限好" },
            { weather = hweather.rain, desc = "忽然下起了小雨" },
            { weather = hweather.rainstorm, desc = "下起了暴雨，波涛汹涌" },
            { weather = hweather.snow, desc = "受到了北方冷空气的影响，奇妙地下起了雪" },
        },
    },
    {
        name = "冰极雪原",
        rect = hrect.create(-6640, 5100, 5120, 7700),
        env = "winterDeep",
        color = hColor.sky,
        allowWeather = {
            { weather = hweather.rain, desc = "下起了冻雨" },
            { weather = hweather.snow, desc = "下起了雪，冰封大地" },
            { weather = hweather.snowstorm, desc = "受到暴雪的侵袭，险象迭生" },
            { weather = hweather.mistwhite, desc = "冰消泛起了白雾，影响了视野" },
        },
    },
    {
        name = "火蛇岛",
        rect = hrect.create(2030, 5888, 4096, 4096),
        env = "fire",
        color = hColor.red,
        allowWeather = {
            { weather = hweather.mistred, desc = "热火焚身，天火遍野" },
            { weather = hweather.wind, desc = "刮起了风，带了一丝清凉" },
        },
    },
    {
        name = "铁环山",
        rect = hrect.create(6970, 0, 4096, 4096),
        env = "poor",
        color = hColor.yellow,
        allowWeather = {
            { weather = "time", desc = "一派大好河山的景象" },
            { weather = hweather.rain, desc = "小雨冲刷着历史的痕迹" },
            { weather = hweather.wind, desc = "吹起了风，遗迹更添哀愁" },
        },
    },
    {
        name = "遗迹草原",
        rect = hrect.create(6788, -6781, 4608, 5120),
        env = "ruins",
        color = hColor.greenLight,
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
        rect = hrect.create(400, -6900, 2816, 3800),
        env = "summer",
        color = hColor.green,
        allowWeather = {
            { weather = "time", desc = "万物逗趣，生机勃勃" },
            { weather = hweather.rain, desc = "下雨了，空气十分凉爽" },
            { weather = hweather.rainstorm, desc = "下起了蹉跎大雨，天空乌云密布" },
        },
    },
    {
        name = "枯死岸",
        rect = hrect.create(7544, 6759, 3800, 4608),
        env = "dark",
        color = hColor.purple,
        allowWeather = {
            { weather = hweather.shield, desc = "可看到紫色灵魂升天的奇象" },
            { weather = hweather.mistgreen, desc = "毒雾弥漫，注意小心" },
            { weather = hweather.mistblue, desc = "迷惑蓝烟处处，困惑人心" },
            { weather = hweather.rain, desc = "下起了令人生怯的小雨" },
        },
    },
}
-- 自动天气
autoWeather = function(obj, during)
    if (#obj.allowWeather > 0) then
        local which = obj.allowWeather[math.random(1, #obj.allowWeather)]
        if (which.weather == "time") then
            if (his.day()) then
                which.weather = hweather.sun
                which.desc = "阳光灿烂，" .. which.desc
            else
                which.weather = hweather.moon
                which.desc = "月色照耀，" .. which.desc
            end
        end
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
                autoWeather(obj, math.random(120, 300))
                return
            end
            if (which.weather == hweather.sun) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 5) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "阳光回照", 10, "FFD700", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.bindUnit(
                            "Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl",
                            enumUnit, "origin", 5
                        )
                        hattr.set(enumUnit, 5, {
                            mana_back = "+" .. (75 - 2 * game.diff),
                        })
                    end
                end, true)
            elseif (which.weather == hweather.moon) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 5) == 1) then
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
                for _ = 1, (3 + game.diff) do
                    local x = math.random(hrect.getStartX(obj.rect), hrect.getEndX(obj.rect))
                    local y = math.random(hrect.getStartY(obj.rect), hrect.getEndY(obj.rect))
                    local radius = 256
                    htexture.alertCircle(radius, x, y, 2)
                    htime.setTimeout(2, function(t2)
                        htime.delTimer(t2)
                        heffect.toXY("Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl", x, y)
                        local g2 = hgroup.createByXY(x, y, radius, function(filterUnit)
                            return his.hero(filterUnit) and his.alive(filterUnit)
                        end)
                        hgroup.loop(g2, function(enumUnit)
                            hskill.swim({
                                whichUnit = enumUnit,
                                during = 0.5 + 0.1 * game.diff,
                                odds = 100,
                                effect = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl",
                                damageKind = CONST_DAMAGE_KIND.special,
                                damageType = { CONST_DAMAGE_TYPE.thunder }
                            })
                            hunit.subCurLife(enumUnit, (0.35 + 0.05 * game.diff) * hunit.getCurLife(enumUnit))
                            heffect.bindUnit(
                                "Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl",
                                enumUnit, "origin", 7
                            )
                            hattr.set(enumUnit, 10, {
                                attack_speed = "-" .. (20 + game.diff),
                                move = "-" .. (100 + game.diff),
                            })
                        end, true)
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
            elseif (which.weather == hweather.wind and math.random(1, 3) == 1) then
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
                    end
                end, true)
            elseif (which.weather == hweather.windstorm and math.random(1, 3) == 1) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 3) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "狂风割裂", 10, "00FA9A", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.toUnit("Abilities\\Spells\\Other\\Tornado\\TornadoElementalSmall.mdl", enumUnit, 1)
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
                    end
                end, true)
            elseif (which.weather == hweather.mistwhite and math.random(1, 3) == 1) then
                local g = hgroup.createByRect(obj.rect, function(filterUnit)
                    return his.hero(filterUnit) and his.alive(filterUnit)
                end)
                hgroup.loop(g, function(enumUnit)
                    if (math.random(1, 2) == 1) then
                        httg.style(
                            httg.create2Unit(enumUnit, "白雾蔽目", 10, "F5FFFA", 1, 2, 50),
                            'scale', 0, 0.05
                        )
                        heffect.bindUnit("Abilities\\Spells\\Undead\\Cripple\\CrippleTarget.mdl", enumUnit, "head", 7)
                        hattr.set(enumUnit, 7, {
                            sight = "-" .. (300 + 50 * game.diff),
                        })
                    end
                end, true)
            end
        end)
    end
end

for _, v in ipairs(islands) do
    henv.random(v.rect, v.env, false, false)
    htime.setTimeout(math.random(20, 30), function(t)
        htime.delTimer(t)
        autoWeather(v, math.random(120, 300))
    end)

end