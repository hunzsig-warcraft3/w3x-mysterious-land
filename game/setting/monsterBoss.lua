monsterAutoBossCount = 0
monsterBoss = {
    {
        time = 0, -- 多少时间才有可能生成
        desc = "瀑布渊底被鱼虾入侵了",
        loc = { -768, -1648 },
        mon = { "小鱼人", "小虾", "小蓝虾", "小绿虾" },
        level = 1,
    },
    {
        time = 0,
        desc = "七峡湾被鱼虾入侵了",
        loc = { 676, -1212 },
        mon = { "小鱼人", "小虾", "小蓝虾", "小绿虾" },
        level = 1,
    },
    {
        time = 0,
        desc = "七脚峡被虾群入侵了",
        loc = { 676, -1212 },
        mon = { "小虾", "小蓝虾", "小绿虾" },
        level = 2,
    },
}

-- 自动生成BOSS
autoBoss = function(delay)
    htime.setTimeout(delay, function(curTimer)
        htime.delTimer(curTimer)
        if (monsterAutoBossCount > 14) then
            autoEnemy(10)
            return
        end
        local oi = {}
        for mi, m in ipairs(monsterBoss) do
            if (m.creating ~= true and htime.count > m.time) then
                table.insert(oi, mi)
            end
        end
        if (#oi > 0) then
            local mi = table.random(oi)
            local m = monsterBoss[mi]
            local w = 0
            m.creating = true
            monsterAutoBossCount = monsterAutoBossCount + 1
            echo(m.desc)
            cj.PingMinimapEx(m.loc[1], m.loc[2], 3.00, 255, 0, 0, false)
            local u = henemy.create({
                unitId = game.name2id.enemy[table.random(m.mon)],
                x = m.loc[1], --创建坐标X，可选
                y = m.loc[2], --创建坐标Y，可选
            })
            hunit.setUserData(u, 1000 * mi, 0)
            local life = (20 + game.diff) * (monsterIntegral + m.level)
            local attack_white = (5 + game.diff) * (monsterIntegral + m.level)
            if (life > m.level * 300) then
                life = m.level * 300
            end
            if (attack_white > m.level * 500) then
                attack_white = m.level * 500
            end
            hattr.set(u, 0, {
                life = "=" .. life,
                defend = "=" .. game.diff + monsterIntegral,
                attack_white = "=" .. attack_white,
            })
            hevent.onDead(u, onBossAward)
        end
        autoEnemy(10)
    end)
end

-- 第一次BOSS延时180秒
autoBoss(180)