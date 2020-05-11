-- 怪物点
monsterIntegral = 0
monsterAutoEnemyCount = 0
monsterEnemy = {
    {
        time = 0, -- 多少时间才有可能生成
        desc = "瀑布渊底被鱼虾妖入侵了",
        loc = { -768, -1648 },
        mon = { "小鱼妖", "蟹妖", "小虾妖" },
        qty = { 3, 5 }, -- min -> max
        wave = 3,
        level = 1,
    },
    {
        time = 0,
        desc = "虎口湾忽然出现了一大片螃蟹",
        loc = { -1500, 840 },
        mon = { "蟹妖" },
        qty = { 10, 15 }, -- min -> max
        wave = 2,
        level = 1,
    },
    {
        time = 0,
        desc = "七峡湾被鱼虾妖入侵了",
        loc = { 676, -1212 },
        mon = { "小鱼妖", "青鱼妖", "蟹妖", "蓝虾妖" },
        qty = { 4, 6 }, -- min -> max
        wave = 3,
        level = 1,
    },
    {
        time = 0,
        desc = "七脚峡被虾妖入侵了",
        loc = { 689, -3000 },
        mon = { "小虾妖", "蓝虾妖", "绿虾妖" },
        qty = { 7, 10 }, -- min -> max
        wave = 3,
        level = 2,
    },
    {
        time = 0,
        desc = "七尖水道被鱼群入侵了",
        loc = { 822, 1446 },
        mon = { "小鱼妖", "青鱼妖", "夜鱼妖" },
        qty = { 7, 10 }, -- min -> max
        wave = 3,
        level = 3,
    },
}

-- 自动生成怪物
autoEnemy = function(delay)
    htime.setTimeout(delay, function(curTimer)
        htime.delTimer(curTimer)
        if (monsterAutoEnemyCount > 14) then
            autoEnemy(10)
            return
        end
        local oi = {}
        for mi, m in ipairs(monsterEnemy) do
            if (m.creating ~= true and htime.count > m.time) then
                table.insert(oi, mi)
            end
        end
        if (#oi > 0) then
            local mi = table.random(oi)
            local m = monsterEnemy[mi]
            local w = 0
            m.creating = true
            monsterAutoEnemyCount = monsterAutoEnemyCount + 1
            echo(m.desc)
            cj.PingMinimapEx(m.loc[1], m.loc[2], 3.00, 255, 0, 0, true)
            htime.setInterval(1.5, function(curTimer2)
                if (w >= m.wave) then
                    htime.delTimer(curTimer2)
                    m.creating = false
                    monsterAutoEnemyCount = monsterAutoEnemyCount - 1
                    monsterIntegral = monsterIntegral + 1
                    return
                end
                local g = hgroup.createByXY(m.loc[1], m.loc[2], 400, function(filterUnit)
                    return his.enemyPlayer(filterUnit, game.ALLY_PLAYER) and his.alive(filterUnit) and hunit.getUserData(filterUnit) == mi
                end)
                if (hgroup.count(g) <= 0) then
                    hgroup.clear(g, true, false)
                    local qty = math.random(m.qty[1], m.qty[2])
                    for _ = 1, qty, 1 do
                        local u = henemy.create({
                            unitId = game.name2id.enemy[table.random(m.mon)],
                            x = m.loc[1], --创建坐标X，可选
                            y = m.loc[2], --创建坐标Y，可选
                        })
                        hunit.setUserData(u, mi, 0)
                        local life = (20 + game.diff) * (monsterIntegral + m.level)
                        local attack_white = (5 + game.diff) * (monsterIntegral + m.level)
                        if (life > m.level * 300) then
                            life = m.level * 300
                        end
                        if (attack_white > m.level * 100) then
                            attack_white = m.level * 100
                        end
                        hattr.set(u, 0, {
                            life = "=" .. life,
                            attack_white = "=" .. attack_white,
                        })
                        hevent.onDead(u, onEnemyAward)
                    end
                    w = w + 1
                end
            end)
        end
        autoEnemy(10)
    end)
end

-- 第一次延时65秒
autoEnemy(65)