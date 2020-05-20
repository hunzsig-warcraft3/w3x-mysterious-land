-- 游戏任务（左边）
gameQuests = {
    pickHero = nil,
    stone = nil,
}
gameQuestFlash = function()
    hsound.sound(cg.gg_snd_voice_mission_start)
    hquest.flash()
end
gameQuestComplete = function(quest)
    hsound.sound(cg.gg_snd_voice_mission_end)
    hquest.setCompleted(quest)
end
gameQuestEvent = {
    pickHero = function()
        gameQuests.pickHero = hquest.create(
            {
                title = "[主线]七剑现世",
                icon = "ReplaceableTextures\\CommandButtons\\BTNArcaniteMelee.blp",
                content = {
                    "在20年前，这里还是一片大洋，一日大海翻腾，大地动摇，从海底冒出来了7个岛屿",
                    "而传说中的祸端再次于世降临！您就是其中一把剑，守护这片山海界",
                    "任务：",
                    hColor.green(" - 在[七灵岛]选择你的初始英雄"),
                    "失败：",
                    hColor.red(" - 超过30秒未选择英雄"),
                },
            }
        )
        gameQuestFlash()
    end,
    stone = function()
        gameQuests.stone = hquest.create(
            {
                title = "[主线]守护七灵神石",
                icon = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp",
                content = {
                    "七灵岛中央地区有座神灵塔，上面放置着一块传说中的七灵石",
                    "但灵石的力量已经分散到了各个复活石上，已经不再具有强大的攻击力量",
                    "而灵石对妖魔而言拥有着强大的吸引力，妖魔以打破灵石为荣！",
                    "它的力量已经极其微弱，但四周的妖魔时时刻刻都在盼望着恶魔的苏醒",
                    "任务：",
                    hColor.green(" - 不要让怪物攻击七灵石，七灵石被攻击怪物会变强！"),
                },
            }
        )
        gameQuestFlash()
    end
}