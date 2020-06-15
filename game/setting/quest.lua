-- 游戏任务（左边）
gameQuests = {
    state1 = nil, state2 = nil,
    state3 = nil, state4 = nil,
    state5 = nil, state6 = nil,
    state7 = nil, state8 = nil,
    state9 = nil
}
gameQuestFlash = function(tit)
    echo(hColor.green("#发现了新的事件：<" .. tit .. ">"))
    hquest.flash()
end
gameQuestComplete = function(quest)
    hquest.setCompleted(quest)
end
gameQuestEvent = {
    state1 = function()
        local tit = "[主线]土匪 x 秘地傀儡"
        gameQuests.state1 = hquest.create(
            {
                title = tit,
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
        gameQuestFlash(tit)
    end,
    state2 = function()
        local tit = "[主线]寻找小神木商店"
        gameQuests.state2 = hquest.create(
            {
                title = tit,
                icon = "ReplaceableTextures\\CommandButtons\\BTNMurloc.blp",
                content = {
                    "终于打败了秘地傀儡，门后出现了一大片鱼妖",
                    "虽然鱼妖不强，但是这么多还是挺危险的，先把它们干掉吧~",
                    "任务：" .. hColor.yellow(" - 到达小神木"),
                    "成功：" .. hColor.green(" - 到达小神木（小神木后斜坡进入第3关）"),
                    "失败：" .. hColor.red(" - 复活耗光且死亡"),
                },
            }
        )
        gameQuestFlash(tit)
    end,
    state3 = function()
        local tit = "[主线]依靠篝火！勇战洞妖"
        gameQuests.state3 = hquest.create(
            {
                title = tit,
                icon = "ReplaceableTextures\\CommandButtons\\BTNFire.blp",
                content = {
                    "越过鱼妖，进入到了一个低地势山地，有4个山洞",
                    "山洞吹出奇怪的风，让人窒息，肯定是有妖魔在作祟",
                    "虽然可以不管继续前行，但[妖风]威力实在太强，只有在[篝火]旁才能歇息作战",
                    "任务：" .. hColor.yellow(" - 保护[篝火]并打败洞穴boss"),
                    "成功：" .. hColor.green(" - 打败洞穴boss"),
                    "失败：" .. hColor.red(" - 复活耗光且死亡"),
                },
            }
        )
        gameQuestFlash(tit)
    end,
    state4 = function()
        local tit = "[主线]寻找入海口"
        gameQuests.state4 = hquest.create(
            {
                title = tit,
                icon = "ReplaceableTextures\\CommandButtons\\BTNSummonWaterElemental.blp",
                content = {
                    "山洞boss真不好对付，终于可以进入森林",
                    "森林里有很多敌人和机关，小心应付",
                    "任务：" .. hColor.yellow(" - 打败森林boss"),
                    "成功：" .. hColor.green(" - 打败boss后到达入海口"),
                    "失败：" .. hColor.red(" - 复活耗光且死亡"),
                },
            }
        )
        gameQuestFlash(tit)
    end,
    state5 = function()
    end,
    state6 = function()
    end,
    state7 = function()
    end,
    state8 = function()
    end,
    state9 = function()
    end,
}