-- 加载h-lua
HLUA_DEBUG = true
require "h-lua"

-- 设定玩家
hplayer.qty_max = 7 -- 最大玩家数
hplayer.convert_ratio = 1000000 -- 换算比率，100金 -> 1木

-- 设定敌军
henemy.set("怪物", CONST_PLAYER_COLOR.BLACK, { 8, 9, 10, 11 })

--- 设定获得黄金木头特效
hevent.onPlayerResourceChange(function(evtData)
    if (evtData.triggerUnit ~= nil and evtData.value > 0) then
        local u = evtData.triggerUnit
        local val = math.floor(evtData.value)
        if (evtData.type == 'gold') then
            htextTag.style(htextTag.create2Unit(u, "+" .. val .. " 万担金", 6, "ffcc00", 1, 1.70, 60.00), "toggle", 0, 0.20)
            hsound.voice2Unit(cg.gg_snd_ReceiveGold, 100, u)
        elseif (evtData.type == 'lumber') then
            htextTag.style(htextTag.create2Unit(u, "+" .. val .. " 精选木", 7, "80ff80", 1, 1.70, 60.00), "toggle", 0, 0.20)
            hsound.voice2Unit(cg.gg_snd_BundleOfLumber, 100, u)
        end
    end
end)

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
