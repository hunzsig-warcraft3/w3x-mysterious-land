-- enemys
for k, v in ipairs(enemys) do
    local obj = slk.unit.ogru:new("this_enemys_" .. v.Name)
    obj.Name = "[劲敌]" .. v.Name
    obj.abilList = ""
    obj.file = v.file
    obj.Art = "ReplaceableTextures\\CommandButtons\\BTNShade.blp"
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = 100
    obj.spd = 220
    obj.sight = 500
    obj.nsight = 500
    obj.unitSound = v.unitSound or ""
    obj.weapsOn = 0
    obj.movetp = v.movetp or "foot"--移动类型
    obj.moveHeight = v.moveHeight or 0 --移动高度
    obj.moveFloor = (v.moveHeight or 0) * 0.25 --最低高度
    obj.regenHP = 0
    obj.regenType = ""
    obj.def = 0
    obj.upgrades = ""
    obj.Builds = ""
    obj.fused = 0
    v.TYPE = "normal"
    v.UNIT_ID = obj:get_id()
    ?>
    call SaveStr(hash_myslk, StringHash("thisenemys"), <?=k?>, "<?=string.addslashes(json.stringify(v))?>")
    <?
end
?>
call SaveInteger(hash_myslk, StringHash("thisenemys"), -1, <?=#enemys?>)
<?
