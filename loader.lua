-- 加载h-lua
require "h-lua"

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
-- 可破坏物
require "game.setting.destructable"
-- 设定友军
game.ALLY_PLAYER = hplayer.players[12]
require "game.setting.f9"
-- H-LUA F9提示
hLuaF9({ 'all' })
require "game.setting.quest"
-- 物品匹配使用
require "game.setting.itemMatchUsed"
-- stage
require "game.stages.common"
require "game.stages.stage1"
require "game.stages.stage2"
require "game.stages.stage3"
require "game.stages.stage4"
require "game.stages.stage5"
require "game.stages.stage6"
require "game.stages.stage7"
require "game.stages.stage8"
require "game.stages.stage9"

-- game start(这里需要用时间事件延时N秒，不然很多动作会在初始化失效)
require "game.start"
