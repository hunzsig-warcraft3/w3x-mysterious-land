-- courier
couriersShopIds = {}
for i, v in ipairs(couriers) do
    -- 处理信使数据
    local Ubertip = "召唤：" .. v.Name
    local obj = slk.unit.ogru:new("couriers_" .. v.Name)
    obj.type = "Peon"
    obj.upgrades = ""
    obj.weapsOn = 0
    obj.Hotkey = ""
    obj.tilesets = 1
    obj.hostilePal = 0
    obj.Requires = "" --需求,全部无限制，用代码限制
    obj.Requirescount = 1
    obj.Requires1 = ""
    obj.Requires2 = ""
    obj.upgrade = ""
    obj.collision = 0.00
    obj.unitShadow = "ShadowFlyer"
    obj.Buttonpos1 = 0
    obj.Buttonpos2 = 0
    obj.death = 0.10
    obj.turnRate = 1.00
    obj.acquire = 1000.00
    obj.race = "human"
    obj.deathType = 0
    obj.fused = 0
    obj.sides1 = 5 --骰子面
    obj.dice1 = 1 --骰子数量
    obj.regenMana = 0.00
    obj.HP = 99999
    obj.regenHP = 99999
    obj.stockStart = 0
    obj.stockRegen = 0
    obj.stockMax = 1
    obj.collision = 0 --接触体积
    obj.def = v.def or 0.00 -- 护甲
    obj.sight = v.sight or 1000 -- 白天视野
    obj.nsight = v.nsight or 1000 -- 夜晚视野
    obj.nameCount = v.nameCount or 1
    obj.Tip = "选择 " .. v.Name
    obj.Name = "[信使]" .. v.Name
    obj.Awakentip = "复活 " .. v.Name
    obj.Revivetip = "复活 " .. v.Name
    obj.Tip = "召唤 " .. v.Name
    obj.Ubertip = Ubertip
    obj.unitSound = v.unitSound -- 声音
    obj.modelScale = v.modelScale --模型缩放
    obj.file = v.file --模型
    obj.Art = v.Art --头像
    obj.scale = v.scale --选择圈
    obj.movetp = v.movetp or "" --移动类型
    obj.moveHeight = v.moveHeight --移动高度
    obj.moveFloor = v.moveHeight * 0.25 --最低高度
    obj.spd = 522
    obj.armor = v.armor -- 被击声音
    obj.targType = v.targType --作为目标类型
    obj.upgrades = ""
    obj.Builds = ""
    obj.fused = 0
    local x = "AInv,"
    if(v.Name == "涅槃火凤凰")then
        obj.abilList = x .. string.implode(',',couriersSkillsPhoenix)
    elseif(v.Name == "冰戟剑灵")then
        obj.abilList = x .. string.implode(',',couriersSkillsIce)
    else
        obj.abilList = x .. string.implode(',',couriersSkills)
    end
    v.INDEX = v.Name
    v.UNIT_ID = obj:get_id()
    ?>
    call SaveStr(hash_myslk, StringHash("couriers"), <?=i?>, "<?=string.addslashes(json.stringify(v))?>")
    <?
end
?>
call SaveInteger(hash_myslk, StringHash("couriers"), -1, <?=#couriers?>)
<?