-- 怪物点
monsterLocTotal = 0
monster = {
    {
        time = 0, -- 经过多少时间才有可能生成
        desc = "瀑布渊底被鱼虾入侵了",
        loc = { -768, -1648 },
        mon = { "小鱼人", "小虾", "小蓝虾", "小绿虾" },
        qty = { 3, 5 }, -- min -> max
        wave = 3,
        level = 0,
    },
    {
        time = 0,
        desc = "七峡湾被鱼虾入侵了",
        loc = { 676, -1212 },
        mon = { "小鱼人", "小虾", "小蓝虾", "小绿虾" },
        qty = { 4, 6 }, -- min -> max
        wave = 3,
        level = 0,
    },
}
-- 自动生成怪物
autoMonster = function(delay)
    htime.setTimeout(delay, function(curTimer)
        htime.delTimer(curTimer)
        if (monsterLocTotal > 14) then
            autoMonster(30)
            return
        end
        local oi = {}
        for mi, m in ipairs(monster) do
            if (m.creating ~= true and htime.count > m.time) then
                table.insert(oi, mi)
            end
        end
        if (#oi > 0) then
            local mi = table.random(oi)
            local m = monster[mi]
            local w = 0
            m.creating = true
            monsterLocTotal = monsterLocTotal + 1
            echo(m.desc)
            cj.PingMinimapEx(m.loc[1], m.loc[2], 3.00, 255, 0, 0, true)
            htime.setInterval(1, function(curTimer2)
                if (w >= m.wave) then
                    htime.delTimer(curTimer2)
                    m.creating = false
                    monsterLocTotal = monsterLocTotal - 1
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
                        hattr.set(u, 0, {
                            life = "=" .. (20 + game.diff) * (htime.min + m.level + 1),
                            attack_white = "=" .. (5 + game.diff) * (htime.min + m.level + 1),
                        })
                    end
                    w = w + 1
                end
            end)
        end
        autoMonster(10)
    end)
end

-- 第一次延时65秒
autoMonster(65)
