game = {
    ALLY_PLAYER = nil,
    bossTips = {
        "大力点~",
        "不痛~",
        "嘿嘿没死~",
        "大难不死",
        "我浪故我在~",
        "我走啦~",
        "奥力给~",
        "噢不~",
        "我逃~",
        "我逃走~",
        "逃走~",
        "老是打我~",
        "lucky~",
        "飞毛腿~",
        "留得青山在...",
        "求心理阴影...",
        "加速~",
        "加速加速~",
        "可以可以~",
        "习惯就好~",
        "不痛不痒~",
        "WTF~"
    },
    running = true,
    diff = 0,
    unitsReborn = {},
    playerKnockdown = {},
    playerCourier = {},
    heroIds = {},
    name2id = {
        enemy = {},
        boss = {},
        shop = {},
        courier = {},
        unit = {},
        hero = {},
    },
    shopsConfig = {
        { "稀奇古怪黑科技", { -1088, 1088 } },
        { "稀奇古怪黑科技", { 1088, 1088 } },
        { "稀奇古怪黑科技", { 1088, -1088 } },
        { "稀奇古怪黑科技", { -1088, -1088 } },
        { "神秘之地", { 0, -512 } },
        --
        { "巫毒商店", { -512, 512 } },
        { "冷兵器磨坊", { 0, 512 } },
        { "火器铁铺", { -512, 0 } },
        { "科技车间", { -512, -512 } },
        --
        { "奇异屋", { 512, 512 } },
        { "铁箱子", { 512, 0 } },
        { "营地", { 512, -512 } }
    },
    -- 左上第一顺时针设定的
    rebornStone = {
        { type = 1, loc = { -1154, 247 }, reborn = { -195, 70 } }, -- 七灵岛
        { type = 2, loc = { -1740, -2900 }, reborn = { -1500, -3730 } }, -- 斑斓海
        { type = 2, loc = { -4095, 2550 }, reborn = { -4611, 2927 } }, -- 冰极雪原
        { type = 2, loc = { -425, 6227 }, reborn = { -800, 5907 } }, -- 火蛇岛
        { type = 1, loc = { -1700, 8284 }, reborn = { -1100, 8386 } }, -- 火蛇岛
        { type = 1, loc = { 4860, 2825 }, reborn = { 4612, 2302 } }, -- 铁环山
        { type = 2, loc = { 6274, -3830 }, reborn = { 5375, -4444 } }, -- 遗迹草原
        { type = 2, loc = { 2347, -5883 }, reborn = { 1800, -5400 } }, -- 秘潭幽林
    },
    door = {
        { from = { -2820, -2376 }, to = { "七灵岛", -951, -1639 } }, -- 斑斓海
        { from = { -2262, -7349 }, to = { "秘潭幽林", -1770, -7867 } }, -- 斑斓海
        { from = { -5384, -1402 }, to = { "冰极雪原", -5075, -40 } }, -- 斑斓海
        { from = { -3802, 5400 }, to = { "七灵岛", -518, 2048 } }, -- 冰极雪原
        { from = { -3238, 1320 }, to = { "七灵岛", -518, 2048 } }, -- 冰极雪原
        { from = { -5312, -616 }, to = { "斑斓海", -5303, -1827 } }, -- 冰极雪原
        { from = { -2119, 7811 }, to = { "火蛇岛", -1400, 7165 } }, -- 冰极雪原
        { from = { -1332, 4990 }, to = { "七灵岛", -518, 2048 } }, -- 火蛇岛
        { from = { -1786, 7419 }, to = { "冰极雪原", -2817, 8190 } }, -- 火蛇岛
        { from = { 4080, 2414 }, to = { "七灵岛", 2668, 510 } }, -- 铁环山
        { from = { 3921, -1537 }, to = { "七灵岛", 2362, -3500 } }, -- 铁环山
        { from = { 4758, -2980 }, to = { "七灵岛", 2362, -3500 } }, -- 遗迹草原
        { from = { 320, -4560 }, to = { "七灵岛", 1389, -3670 } }, -- 秘潭幽林
        { from = { 1992, -9437 }, to = { "遗迹草原", 4086, -9318 } }, -- 秘潭幽林
        { from = { 7070, 4979 }, to = { "火蛇岛", 5300, 4790 } }, -- 枯死岸
        { from = { 7938, 4112 }, to = { "铁环山", 8867, 3194 } }, -- 枯死岸
        -- 七灵岛
        { from = { -2935, -800 }, to = { "斑斓海", -3733, -1927 } },
        { from = { 1918, -4224 }, to = { "冰极雪原", 1912, -5223 } },
        { from = { -757, 3358 }, to = { "火蛇岛", -1096, 6042 } },
        { from = { 3646, 1150 }, to = { "铁环山", 4992, 1405 } },
        { from = { 2680, -2515 }, to = { "铁环山", 4536, -2030 } },
        { from = { 3050, -3388 }, to = { "遗迹草原", 4410, -4252 } },
        { from = { -1640, 2300 }, to = { "秘潭幽林", -3188, 3650 } },
        { from = { 5735, 4430 }, to = { "枯死岸", 6520, 6140 } },
    },
}
