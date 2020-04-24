-- 加载h-lua
require "h-lua"

-- 加载本地图的global
require "game.global"

-- 加载本地图的SLK系统
require "game.slk"

-- 加载test
require "game.test"

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
    game.unitsReborn[stone] = { x = f.reborn[1], y = f.reborn[1] }
    hevent.onEnterUnitRange(stone, 150, function(evtData)
        local centerUnit = evtData.centerUnit
        local enterUnit = evtData.enterUnit
        if (his.hero(enterUnit)) then
            game.unitsReborn[enterUnit] = game.unitsReborn[centerUnit]
            httg.create2Unit(enterUnit, "重生记录", 11, nil, 1, 1, 100)
            heffect.bindUnit("Abilities\\Spells\\Demon\\ReviveDemon\\ReviveDemon.mdl", enterUnit, "origin", 1)
        end
    end)
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

-- env岛屿环境
local islands = {
    {
        name = "斑斓海",
        rect = hrect.create(-5520, -5200, 5800, 7300),
        env = "sea",
        color = hColor.sea,
        weather = nil,
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
        weather = nil,
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
        weather = nil,
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
        weather = nil,
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
        weather = nil,
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
        weather = nil,
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
        weather = nil,
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
    if (obj.weather ~= nil) then
        hweather.del(obj.weather)
    end
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
        obj.weather = hweather.create({
            whichRect = obj.rect,
            type = which.weather
        })
    end
    htime.setTimeout(math.random(120, 300), function(t)
        htime.delTimer(t)
        autoWeather(obj)
    end)
end

for _, v in ipairs(islands) do
    henv.random(v.rect, v.env, nil, nil, false)
    henv.random(v.rect, v.env, nil, nil, false)
    htime.setTimeout(math.random(20, 30), function(t)
        htime.delTimer(t)
        autoWeather(v)
    end)
end

-- game start(这里需要用时间事件延时N秒，不然很多动作会在初始化失效)
require "game.schedule"
