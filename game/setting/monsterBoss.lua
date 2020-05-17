monsterAutoBossCount = 0
monsterBossAttackPoint = {
    { x = -1465, y = -7471, facing = 10 },
    { x = 0, y = 0, facing = 0 },
    { x = 0, y = 0, facing = 0 },
    { x = 0, y = 0, facing = 0 },
}
monsterBoss = {
    -- 七灵 1
    {
        time = 120, -- 多少时间才有可能生成
        desc = "七灵东湾",
        loc = { 1787, -1538 },
        mon = { "大龙龟" },
        level = 1,
    },
    {
        time = 120, -- 多少时间才有可能生成
        desc = "七灵北湾",
        loc = { 1280, -1654 },
        mon = { "大龙龟" },
        level = 1,
    },
    -- 斑斓海 2-5
    {
        time = 120, -- 多少时间才有可能生成
        desc = "斑斓海入海口",
        loc = { -2400, -3875 },
        mon = { "大龙龟" },
        level = 2,
    },
    --{
    --    time = 120, -- 多少时间才有可能生成
    --    desc = "秘潭湖中央",
    --    loc = { -75, -7655 },
    --    mon = { "小鱼妖", "蟹妖", "小虾妖" },
    --    level = 1,
    --},
}

-- 自动生成BOSS
autoBoss = function(delay)
    htime.setTimeout(delay, function(curTimer)
        htime.delTimer(curTimer)
        if (monsterAutoBossCount > 15) then
            autoBoss(30)
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
            m.creating = true
            monsterAutoBossCount = monsterAutoBossCount + 1
            cj.PingMinimapEx(m.loc[1], m.loc[2], 3.00, 255, 0, 0, false)
            local u = henemy.create({
                unitId = game.name2id.enemy[table.random(m.mon)],
                x = m.loc[1], --创建坐标X，可选
                y = m.loc[2], --创建坐标Y，可选
            })
            local name = "<" .. hunit.getName(u) .. ">"
            if (m.level <= 2) then
                name = hColor.white(name)
            elseif (m.level <= 4) then
                name = hColor.greenLight(name)
            elseif (m.level <= 6) then
                name = hColor.green(name)
            elseif (m.level <= 8) then
                name = hColor.yellowLight(name)
            elseif (m.level <= 11) then
                name = hColor.yellow(name)
            elseif (m.level <= 15) then
                name = hColor.redLight(name)
            else
                name = hColor.red(name)
            end
            echo(m.desc .. "出现BOSS：" .. name .. " (" .. m.loc[1] .. "," .. m.loc[2] .. ")")
            hunit.setUserData(u, 1000 * mi, 0)
            local life = (25 + game.diff * 5) * (monsterIntegral + m.level) + 300
            local attack_white = (5 + game.diff) * (monsterIntegral + m.level)
            if (life > m.level * 3000) then
                life = m.level * 3000
            end
            if (attack_white > m.level * (500 + game.diff * 50)) then
                attack_white = m.level * (500 + game.diff * 50)
            end
            hattr.set(u, 0, {
                life = "=" .. life,
                defend = "=" .. game.diff + monsterIntegral,
                attack_white = "=" .. attack_white,
            })
            hevent.onDead(u, onBossAward)
            -- 设置boss没受伤时多少秒后找寻恶魔
            htime.setTimeout(
                m.level * 180,
                function(bossTimer)
                    htime.delTimer(bossTimer)
                    if (his.alive(u) and hunit.getCurLifePercent(u) > 99.99) then
                        local point = table.random(monsterBossAttackPoint)
                        hunit.portal(u, point.x, point.y, point.facing)
                        cj.IssuePointOrder(u, "move", cj.GetUnitX(game.demon), cj.GetUnitY(game.demon))
                        echo("BOSS：" .. name .. "发现了恶魔的存在！")
                    end
                end,
                hunit.getName(u)
            )
        end
        autoEnemy(40)
    end)
end

-- 第一次BOSS延时120秒
autoBoss(120)