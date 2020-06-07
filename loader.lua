-- 加载h-lua
require "h-lua"

-- 镜头模式
hcamera.setModel("normal")

-- 设定玩家
hplayer.qty_max = 7 -- 最大玩家数
hplayer.convert_ratio = 1000000 -- 换算比率，100金 -> 1木

-- 设定敌军
henemy.setName("怪物")
-- henemy.setShareSight(true)
henemy.setColor(cj.ConvertPlayerColor(12)) -- black
henemy.setPlayer(hplayer.players[8])
henemy.setPlayer(hplayer.players[9])
henemy.setPlayer(hplayer.players[10])
henemy.setPlayer(hplayer.players[11])

-- 加载本地图的设置
require "game.setting.global"
require "game.setting.dz"
require "game.setting.env"
-- 设定友军
game.ALLY_PLAYER = hplayer.players[12]
require "game.setting.f9"
--H-LUA F9提示
hLuaF9({ 'all' })
require "game.monster.1"
require "game.setting.quest"

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
require "game.start"
