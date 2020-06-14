-- 测试代码
--henv.setFogStatus(HLUA_DEBUG ~= true, HLUA_DEBUG ~= true)

--- 英雄被选择
hevent.onPickHero(function(evtPickData)
    local newHero = evtPickData.triggerUnit
    local owner = hunit.getOwner(newHero)
    echo(hColor.green(hplayer.getName(owner)) .. "的英雄灵魂成为了" .. hColor.yellow("<" .. hunit.getName(newHero) .. ">"))
    local heroSlk = hunit.getSlk(newHero)
    -- 镜头
    hcamera.toUnit(owner, 0, newHero)
    -- 特性、技能、天赋
    if (heroSlk ~= nil) then
        local feature = heroSlk.CUSTOM_DATA.feature
        if (feature ~= nil) then
            feature = "特性 - " .. feature
            hskill.add(newHero, hslk_global.name2Value.ability[feature].ABILITY_ID)
        end
        local ability = heroSlk.CUSTOM_DATA.ability
        if (ability ~= nil) then
            for _, a in ipairs(ability) do
                hskill.add(newHero, hslk_global.name2Value.ability[a].ABILITY_ID)
            end
        end
        hskill.add(newHero, hslk_global.name2Value.ability["武 - 封印"].ABILITY_ID)
        hskill.add(newHero, hslk_global.name2Value.ability["御 - 封印"].ABILITY_ID)
        hskill.add(newHero, hslk_global.name2Value.ability["速 - 封印"].ABILITY_ID)
        hskill.add(newHero, hslk_global.name2Value.ability["奇 - 封印"].ABILITY_ID)
    end
    --- 经验收获
    hevent.onDamage(newHero, function(evtData)
        local exp = math.floor(evtData.damage * 0.1)
        haward.forUnitExp(evtData.triggerUnit, exp)
    end)
    --- 复活动作
    hevent.onDead(newHero, function(evtData)
        if (game.rebornQty <= 0) then
            local deadOwner = hunit.getOwner(evtData.triggerUnit)
            echo(hColor.red(hplayer.getName(deadOwner)) .. "的英雄不幸死亡了，他离开了我们")
            hplayer.defeat(deadOwner, "冒险失败")
            return
        end
        game.rebornQty = game.rebornQty - 1
        local rebornTime = 5
        echo(hColor.green(hplayer.getName(owner)) .. "的英雄死亡了，" .. hColor.yellow(rebornTime) .. '秒后复活')
        -- 血幕
        htexture.mark(htexture.DEFAULT_MARKS.DREAM, rebornTime, p, 255, 0, 0)
        hhero.rebornAtXY(
            evtData.triggerUnit, rebornTime, 3,
            hunit.x(evtData.triggerUnit), hunit.y(evtData.triggerUnit),
            true
        )
        -- 中途心跳声
        htime.setTimeout(2, function(heartTimer)
            htime.delTimer(heartTimer)
            hsound.sound2Player(cg.gg_snd_voice_heart_beat, owner)
        end)
    end)
    --- 检测环境音效
    htime.setInterval(3.5, function(curTimer)
        local p = hunit.getOwner(newHero)
        if (his.deleted(newHero)) then
            htime.delTimer(curTimer)
            hsound.bgmStop(p)
            return
        end
        if (his.death(newHero)) then
            hsound.bgmStop(p)
            return
        end
        local pi = hplayer.index(p)
        if (his.damaging(newHero) == true or his.beDamaging(newHero) == true) then
            if (hRuntime.sound[pi].prevBgm == nil) then
                hRuntime.sound[pi].prevBgm = hRuntime.sound[pi].currentBgm
            end
            hsound.bgm(cg.gg_snd_bgm_battle, p)
            return
        elseif (hRuntime.sound[pi].prevBgm ~= nil) then
            hsound.bgm(hRuntime.sound[pi].prevBgm, p)
            hRuntime.sound[pi].prevBgm = nil
            return
        end
        local bgm = cg.gg_snd_bgm_main
        for _, obj in ipairs(islands) do
            if (his.inRect(obj.rect, hunit.x(newHero), hunit.y(newHero)) == true) then
                if (obj.bgm == "nil") then
                    bgm = nil
                elseif (obj.bgm ~= nil) then
                    bgm = obj.bgm
                end
                break
            end
        end
        if (bgm == nil) then
            hsound.bgmStop(p)
        else
            hsound.bgm(bgm, p)
        end
    end)
end)

pickCourier = function(newCourier)
    local owner = hunit.getOwner(newCourier)
    local playerIndex = hplayer.index(owner)
    if (game.playerData.courier[playerIndex] ~= nil) then
        local prevCourier = game.playerData.courier[playerIndex]
        hunit.hide(prevCourier)
        hitem.copy(prevCourier, newCourier)
        hunit.del(prevCourier)
    end
    game.playerData.courier[playerIndex] = newCourier
    echo(hColor.green(hplayer.getName(owner)) .. "得到了宠物" .. hColor.yellow("<" .. hunit.getName(newCourier) .. ">"))
    hevent.onDead(newCourier, function(evtData)
        local courierId = hunit.getId(evtData.triggerUnit)
        local nc = hunit.create({
            whichPlayer = hplayer.players[playerIndex],
            unitId = courierId,
            x = hunit.x(evtData.triggerUnit),
            y = hunit.y(evtData.triggerUnit),
            facing = hunit.getFacing(evtData.triggerUnit),
        })
        pickCourier(nc)
    end)
end

local startTrigger = cj.CreateTrigger()
cj.TriggerRegisterTimerEvent(startTrigger, 1.0, false)
cj.TriggerAddAction(
    startTrigger,
    function()
        cj.DisableTrigger(cj.GetTriggeringTrigger())
        cj.DestroyTrigger(cj.GetTriggeringTrigger())
        --[[
            这里开始游戏正式开始了
            发挥你的想象力吧~
        ]]
        hsound.bgmStop()
        -- hello
        echo("^_^ 您来到了秘境，请选择" .. hColor.yellow("你的英雄"))
        -- 可破坏物
        htime.setTimeout(20, function(curTimer)
            htime.delTimer(curTimer)
            onMapDestructableDestroy()
        end)
        -- 玩家配置
        for i = 1, hplayer.qty_max, 1 do
            if (his.playing(hplayer.players[i])) then
                -- 允许调节镜头
                hplayer.setAllowCameraDistance(hplayer.players[i], true)
                -- 使用random、repick
                hplayer.setAllowCommandPick(hplayer.players[i], true)
                -- 称号
                hplayer.setPrestige(hplayer.players[i], "冒险者")
                --
                dzCurrent.enableRecord(hplayer.players[i])
            end
        end
        --设置三围基础
        hattr.setThreeBuff({
            primary = 1,
            str = {
                life = 16,
                life_back = 0.03,
                toughness = 0.02,
                aim = 0.003
            },
            agi = {
                attack_speed = 0.01,
                avoid = 0.003
            },
            int = {
                mana = 8,
                mana_back = 0.02
            }
        })
        -- 第 1 玩家选择模式
        echo("第1位玩家正在选择难度", nil, 10)
        hdialog.create(
            nil,
            {
                title = "选择难度",
                buttons = {
                    "一般困难",
                    "非常困难",
                    "极其困难",
                    "破天荒难",
                }
            },
            function(btnIdx)
                local diff = 1
                local diffColor = hColor.yellowLight
                local rebornQty = 20
                if (btnIdx == "非常困难") then
                    diff = 5
                    diffColor = hColor.yellow
                    rebornQty = 10
                elseif (btnIdx == "极其困难") then
                    diff = 20
                    diffColor = hColor.red
                    rebornQty = 3
                elseif (btnIdx == "破天荒难") then
                    diff = 50
                    diffColor = hColor.black
                    rebornQty = 1
                end
                game.diff = diff
                game.rebornQty = hplayer.qty_current * rebornQty
                echo("选择了：" .. diffColor(btnIdx) .. ",全体复活次数有：" .. hColor.green(game.rebornQty) .. "次")
                --- 英雄选择
                hhero.setBornXY(-7044, -8965)
                --- 酒馆商店
                hhero.buildSelector({
                    during = 60,
                    type = "tavern",
                    buildX = -8704, -- 构建点X
                    buildY = -9216, -- 构建点Y
                    buildDistance = 256,
                    direct = { 1, -1 },
                    buildRowQty = 4,
                    tavernUnitQty = 12
                })
                for i = 1, hplayer.qty_max, 1 do
                    if (his.playing(hplayer.players[i])) then
                        local c = hunit.create({
                            whichPlayer = hplayer.players[i],
                            unitId = hslk_global.name2Value.unit["小饥鸡"].UNIT_ID,
                            x = hhero.bornX,
                            y = hhero.bornY,
                        })
                        pickCourier(c)
                    end
                end
                stage1()
                --- 创建多面板
                hmultiBoard.create(
                    "player",
                    1.5,
                    function(mb)
                        --拼凑多面板数据，二维数组，行列模式
                        hmultiBoard.setTitle(mb, "秘地探索誌[剩余复活: " .. hColor.green(game.rebornQty) .. " 次]")
                        --开始当然是title了
                        local data = {}
                        table.insert(data, {
                            { value = "探人", icon = nil },
                            { value = "巅峰称号", icon = nil },
                            { value = "战力", icon = nil },
                            { value = "杀敌", icon = nil },
                            { value = "英雄", icon = nil },
                            { value = "回血", icon = nil },
                            { value = "回魔", icon = nil },
                            { value = "攻速", icon = nil },
                            { value = "命中", icon = nil },
                            { value = "增幅", icon = nil },
                            { value = "减伤", icon = nil },
                            { value = "魔抗", icon = nil },
                            { value = "回避", icon = nil },
                            { value = "背包", icon = nil },
                            { value = "攻效", icon = nil },
                        })
                        --然后是form
                        for pi = 1, hplayer.qty_max, 1 do
                            local p = hplayer.players[pi]
                            if (his.playing(p)) then
                                local hero = "-"
                                local prestige = "-"
                                local power = "-"
                                local kill = "-"
                                local avatar = nil
                                local name = "-"
                                local life_back = "-"
                                local mana_back = "-"
                                local attack_speed = "-"
                                local damage_extent = "-"
                                local aim = "-"
                                local toughness = "-"
                                local resistance = "-"
                                local avoid = "-"
                                local weight = "-"
                                local attack_damage_type = "-"
                                hero = hhero.player_heroes[pi][1]
                                if (hero ~= nil) then
                                    avatar = hunit.getAvatar(hero)
                                    name = hunit.getName(hero)
                                    prestige = hplayer.getPrestige(p)
                                    power = math.integerFormat(game.playerData.power[pi] or 0)
                                    kill = math.integerFormat(hplayer.getKill(p))
                                    life_back = math.round(hattr.get(hero, "life_back")) .. "/秒"
                                    mana_back = math.round(hattr.get(hero, "mana_back")) .. "/秒"
                                    attack_speed = math.round(100 + hattr.get(hero, "attack_speed")) .. "%"
                                    damage_extent = math.round(hattr.get(hero, "damage_extent")) .. "%"
                                    aim = math.round(hattr.get(hero, "aim")) .. "%"
                                    toughness = math.round(hattr.get(hero, "toughness"))
                                    resistance = math.round(hattr.get(hero, "resistance")) .. "%"
                                    avoid = math.round(hattr.get(hero, "avoid")) .. "%"
                                    weight = math.round(hattr.get(hero, "weight_current")) .. "/"
                                        .. math.round(hattr.get(hero, "weight")) .. "Kg"
                                    local adt = {}
                                    for _, v in ipairs(hattr.get(hero, "attack_damage_type")) do
                                        local label = CONST_ATTR[v]
                                        if (table.includes(label, adt) == false) then
                                            table.insert(adt, label)
                                        end
                                    end
                                    attack_damage_type = string.implode('、', adt)
                                end
                                table.insert(data, {
                                    { value = "[" .. hplayer.getStatus(p) .. "]" .. cj.GetPlayerName(p), icon = nil },
                                    { value = prestige, icon = nil },
                                    { value = power, icon = nil },
                                    { value = kill, icon = nil },
                                    { value = name, icon = avatar },
                                    { value = life_back, icon = nil },
                                    { value = mana_back, icon = nil },
                                    { value = attack_speed, icon = nil },
                                    { value = aim, icon = nil },
                                    { value = damage_extent, icon = nil },
                                    { value = toughness, icon = nil },
                                    { value = resistance, icon = nil },
                                    { value = avoid, icon = nil },
                                    { value = weight, icon = nil },
                                    { value = attack_damage_type, icon = nil },
                                })
                            end
                        end
                        return data
                    end
                )
            end
        )
    end
)
