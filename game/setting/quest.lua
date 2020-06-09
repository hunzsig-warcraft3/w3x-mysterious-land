-- 游戏任务（左边）
gameQuests = {
    state1 = nil,
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
    state1 = function()
        gameQuests.state1 = hquest.create(
            {
                title = "[主线]土匪 x 秘地傀儡",
                icon = "ReplaceableTextures\\CommandButtons\\BTNArmorGolem.blp",
                content = {
                    "又来到了神奇的秘地，这次一定要得悉最终的奥秘！",
                    "有几个[土匪]在早前先来搜刮财宝了，先把他们干掉吧。",
                    "可能还会有行动缓慢而又强大的守护者[秘地傀儡]",
                    "它被激怒时会渐渐强力反击，请小心",
                    "任务：" .. hColor.yellow(" - 击败秘地傀儡"),
                    "成功：" .. hColor.green(" - 秘地傀儡死亡"),
                    "失败：" .. hColor.red(" - 复活耗光且死亡"),
                },
            }
        )
        gameQuestFlash()
    end,
    state2 = function()
        gameQuests.state1 = hquest.create(
            {
                title = "[主线]钢门后的鱼妖群",
                icon = "ReplaceableTextures\\CommandButtons\\BTNMurloc.blp",
                content = {
                    "终于打败了秘地傀儡，门后出现了一大片鱼妖",
                    "虽然鱼妖不强，但是这么多还是挺危险的，先把它们干掉吧~",
                    "任务：" .. hColor.yellow(" - 到达小神木"),
                    "成功：" .. hColor.green(" - 到达小神木"),
                    "失败：" .. hColor.red(" - 复活耗光且死亡"),
                },
            }
        )
        gameQuestFlash()
    end,
}