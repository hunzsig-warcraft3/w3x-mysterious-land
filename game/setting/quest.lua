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
                title = "[主线]击倒秘地傀儡",
                icon = "ReplaceableTextures\\CommandButtons\\BTNArmorGolem.blp",
                content = {
                    "又来到了神奇的秘地，这次一定要得悉最终的奥秘！",
                    "但一开始就遇到了强大的守护者[秘地傀儡]",
                    "小心谨慎地将它击倒吧，秘地傀儡虽然结实攻高但行动缓慢",
                    "但它被激怒时会渐渐强力反击，请小心",
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
                title = "[主线]击倒秘地傀儡",
                icon = "ReplaceableTextures\\CommandButtons\\BTNArmorGolem.blp",
                content = {
                    "又来到了神奇的秘地，这次一定要得悉最终的奥秘！",
                    "但一开始就遇到了强大的守护者[秘地傀儡]",
                    "小心谨慎地将它击倒吧，秘地傀儡虽然结实攻高但行动缓慢",
                    "但它被激怒时会渐渐强力反击，请小心",
                    "任务：" .. hColor.yellow(" - 击败秘地傀儡"),
                    "成功：" .. hColor.green(" - 秘地傀儡死亡"),
                    "失败：" .. hColor.red(" - 复活耗光且死亡"),
                },
            }
        )
        gameQuestFlash()
    end,
}