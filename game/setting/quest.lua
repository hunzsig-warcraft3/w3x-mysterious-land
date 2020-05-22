-- 游戏任务（左边）
gameQuests = {
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
                    "任务：" .. hColor.yellow(" - 不要让怪物攻击七灵石"),
                    "成功：" .. hColor.green(" - 坚守七灵石"),
                    "失败：" .. hColor.red(" - 七灵石破碎"),
                },
            }
        )
        gameQuestFlash()
    end,
    demon = function()
        gameQuests.stone = hquest.create(
            {
                title = "[主线]恶魔苏生",
                icon = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp",
                content = {
                    "异界恶魔重现人间！将它击败获得胜利吧！",
                    "恶魔[地狱魔神]在[枯死岛]，凭借死灵力量非常地强，请小心应付！",
                    "任务：" .. hColor.yellow(" - 击杀[枯死岛]恶魔[地狱魔神]"),
                    "成功：" .. hColor.green(" - 恶魔[地狱魔神]死亡"),
                    "失败：" .. hColor.red(" - 复活石全部消失且英雄死亡"),
                },
            }
        )
        gameQuestFlash()
    end,
}