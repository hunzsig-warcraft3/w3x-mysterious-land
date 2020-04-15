SHOPS = {}
SHOPS_CONF = {
    {
        Name = "巫毒商店",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\orc\\VoodooLounge\\VoodooLounge",
        modelScale = 0.70,
        scale = 3.60
    },
    {
        Name = "冷兵器磨坊",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\orc\\WarMill\\WarMill",
        modelScale = 0.70,
        scale = 3.60
    },
    {
        Name = "火器铁铺",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\human\\Blacksmith\\Blacksmith",
        modelScale = 0.70,
        scale = 3.60
    },
    {
        Name = "科技车间",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\human\\Workshop\\Workshop",
        modelScale = 0.70,
        scale = 3.60
    },
    {
        Name = "营地",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\orc\\OrcBarracks\\OrcBarracks",
        modelScale = 0.70,
        scale = 3.60
    },
    {
        Name = "铁箱子",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\human\\HumanBarracks\\HumanBarracks",
        modelScale = 0.70,
        scale = 3.60
    },
    {
        Name = "奇异屋",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\nightelf\\HuntersHall\\HuntersHall.mdl",
        modelScale = 0.70,
        scale = 3.60
    },
    {
        Name = "稀奇古怪黑科技",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\human\\ArcaneSanctum\\ArcaneSanctum",
        modelScale = 0.80,
        scale = 2.70
    },
    {
        Name = "神秘之地",
        pathTex = "PathTextures\\8x8SimpleSolid.tga",
        file = "buildings\\human\\ArcaneVault\\ArcaneVault",
        modelScale = 0.80,
        scale = 2.70
    }
}

-- shops
for _, v in ipairs(SHOPS_CONF) do
    local obj = slk.unit.ngme:new("shops_" .. v.Name)
    obj.Name = v.Name
    obj.pathTex = v.pathTex
    obj.abilList = "Avul,Apit,Aall"
    obj.file = v.file
    obj.modelScale = v.modelScale or 1.00
    obj.scale = v.scale or 1.00
    obj.HP = 99999
    obj.sight = 1000
    obj.nsight = 1000
    obj.unitSound = v.unitSound or ""
    obj.Makeitems = ""
    obj.Sellitems = ""
    obj.UberSplat = ""
    table.insert(SHOPS, { UNIT_ID = obj:get_id(), Name = v.Name })
end