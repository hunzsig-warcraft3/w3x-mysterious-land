-- 游戏任务（左边）
gameQuests = {
    pickHero = nil,
    demon = nil,
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
                    "在20年前，这里还是一片大洋",
                    "一日忽然大海翻腾，从海底冒出来了7个岛屿",
                    "而传说中的祸端再次于世降临！您就是其中一把剑，守护这片山海界",
                    "任务：",
                    hColor.green(" - 在[七灵岛]选择你的英雄"),
                    "失败：",
                    hColor.red(" - 超过时限未选择英雄"),
                },
            }
        )
        gameQuestFlash()
    end,
    demon = function()
        gameQuests.demon = hquest.create(
            {
                title = "[主线]封印的堕落恶魔",
                icon = "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp",
                content = {
                    "100年前一位可怜的猎手被侵染堕落成真正的末日恶魔",
                    "而它就被封印在七灵岛的正中央，一息尚存",
                    "它的力量已经极其微弱，但四周的妖魔时时刻刻都在盼望着恶魔的苏醒",
                    "任务：",
                    hColor.green(" - 不要让怪物靠近恶魔，恶魔被靠近会吸收妖魔回复力量！"),
                    "失败：",
                    hColor.red(" - 恶魔复活！"),
                },
            }
        )
        gameQuestFlash()
    end
}