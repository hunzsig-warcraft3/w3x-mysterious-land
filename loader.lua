-- 加载h-lua
require "h-lua"

-- 加载本地图的global
require "game.global"

-- 加载本地图的SLK系统
require "game.slk"

-- 加载test
require "game.test"

-- 预读 preread（为了有效您需要注意hRuntime.register.ability的初始化 abilitiesKV）
local u = cj.CreateUnit(hplayer.player_passive, hslk_global.unit_token, 0, 0, 0)
for id, _ in pairs(hslk_global.abilitiesKV) do
    cj.UnitAddAbility(u, id)
    cj.UnitRemoveAbility(u, id)
end
hunit.del(u)

-- 镜头模式
hcamera.setModel("normal")

-- 设定玩家
hplayer.qty_max = 7 -- 最大玩家数
hplayer.convert_ratio = 1000000 -- 换算比率，100金 -> 1木

-- 设定友军
game.ALLY_PLAYER = hplayer.players[12]

-- 设定敌军
henemy.setName("山海道兽")
-- henemy.setShareSight(true)
henemy.setColor(cj.ConvertPlayerColor(12)) -- black
henemy.setPlayer(hplayer.players[8])
henemy.setPlayer(hplayer.players[9])
henemy.setPlayer(hplayer.players[10])
henemy.setPlayer(hplayer.players[11])

-- 写点任务提醒玩家
hquest.create(
    {
        title = "群979487941",
        content = "有bug可以来群反馈，谢绝傻逼",
        icon = "ReplaceableTextures\\CommandButtons\\BTNPenguin.blp"
    }
)
hquest.create(
    {
        title = "极速入门",
        content = {
            " - 道非道，非常道，道法自然，领自然，方得力，始至终唤",
            " - 用你的英雄打败所有岛主，求得最终之道boss，击败他获得胜利",
            " - 英雄本体技能可以替换成具有特性的技能",
            " - 天赋技能可以在每个岛屿进行学习",
        },
        icon = "ReplaceableTextures\\CommandButtons\\BTNTomeRed.blp"
    }
)

-- 复活石、复活阵
for _, f in ipairs(game.rebornStone) do
    local id
    if (f.type == 1) then
        id = game.name2id.units["复活石(面向东南的)"]
    elseif (f.type == 2) then
        id = game.name2id.units["复活石(面向西南的)"]
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
            unitId = game.name2id.units["复活阵"],
            qty = 1,
            x = f.reborn[1],
            y = f.reborn[2]
        }
    )
end

-- 传送门
for _, f in ipairs(game.door) do
    local portal = hunit.create(
        {
            register = false,
            whichPlayer = game.ALLY_PLAYER,
            unitId = game.name2id.units["传送门"],
            qty = 1,
            x = f.from[1],
            y = f.from[2]
        }
    )
    hevent.onEnterUnitRange(portal, 50, function(evtData)
        local enterUnit = evtData.enterUnit
        cj.SetUnitPosition(enterUnit, f.to[2], f.to[3])
        hcamera.toXY(cj.GetOwningPlayer(enterUnit), 0, f.to[2], f.to[3])
    end)
end

-- 商店
--THIS_SHOPS = {}
--for spi, sp in ipairs(game.shopsConfig) do
--    THIS_SHOPS[spi] = hunit.create(
--        {
--            register = false,
--            whichPlayer = game.ALLY_PLAYER,
--            unitId = game.shops[sp[1]].UNIT_ID,
--            qty = 1,
--            x = sp[2][1],
--            y = sp[2][2]
--        }
--    )
--end

-- game start(这里需要用时间事件延时N秒，不然很多动作会在初始化失效)
--require "game.schedule"
