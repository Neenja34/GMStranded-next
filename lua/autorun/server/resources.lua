/*
Models
*/
resource.AddFile("models/props_foliage/mall_tree_medium01.mdl")
resource.AddFile("materials/models/props_foliage/mall_trees_barks01.vtf")
resource.AddFile("materials/models/props_foliage/mall_trees_barks01.vmf")
resource.AddFile("materials/models/props_foliage/mall_trees_branches02.vtf")
resource.AddFile("materials/models/props_foliage/mall_trees_branches02.vmf")
resource.AddFile("sound/sounds/levelup.mp3")

/*
Sounds
*/
local files, dirs = file.Find("sound/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("sound/" .. v)
end

/*
Fireworks Shit
*/
local files, dirs = file.Find("materials/vgui/fireworks/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/fireworks/" .. v)
end

/*
Sprites
*/
local files, dirs = file.Find("materials/sprites/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/sprites/" .. v)
end

/*
Hud Idons
*/
local files, dirs = file.Find("materials/vgui/hud/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/hud/" .. v)
end

/*
Cooking Icons
*/
local files, dirs = file.Find("materials/vgui/cooking/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/cooking/" .. v)
end
local files, dirs = file.Find("materials/vgui/pie/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/pie/" .. v)
end
local files, dirs = file.Find("materials/vgui/fish/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/fish/" .. v)
end

/*
Grinding Powder Icons
*/
local files, dirs = file.Find("materials/vgui/powder/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/powder/" .. v)
end

/*
Spell Icons
*/
local files, dirs = file.Find("materials/vgui/spells/new/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/spells/new/" .. v)
end

/*
Stone Icons
*/
local files, dirs = file.Find("materials/vgui/stones/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/stones/" .. v)
end

/*
Shop Icons
*/
resource.AddFile("materials/vgui/relic_png.png")
resource.AddFile("materials/vgui/seed.png")
resource.AddFile("materials/vgui/gems/diamond_new.png")
resource.AddFile("materials/vgui/gems/sapphire_new.png")
resource.AddFile("materials/vgui/gems/ruby_new.png")
resource.AddFile("materials/vgui/gems/emerald_new.png")
resource.AddFile("materials/vgui/gems/void_new.png")
resource.AddFile("materials/vgui/gems/prismatic_new.png")

/*
Alchemy Icons
*/
local files, dirs = file.Find("materials/vgui/potions/new/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/potions/new/" .. v)
end
local files, dirs = file.Find("materials/vgui/transmute/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/transmute/" .. v)
end

/*
First Aid Icons
*/
local files, dirs = file.Find("materials/vgui/firstaid/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/firstaid/" .. v)
end

/*
Furnace Icons
*/
local files, dirs = file.Find("materials/vgui/furnace/new/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/furnace/new/" .. v)
end

/*
Tool Materials
*/
resource.AddFile("materials/models/hatchet/hatchet.vtf")
resource.AddFile("materials/models/hatchet/hatchet.vmt")
resource.AddFile("materials/models/hatchet/hatchet_bmp.vtf")

/*
Egg Icons
*/
local files, dirs = file.Find("materials/vgui/eggs/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/eggs/" .. v)
end


/*
Farming Seed Icons
*/
local files, dirs = file.Find("materials/vgui/farming/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/farming/" .. v)
end


/*
Tool Icons
*/
local files, dirs = file.Find("materials/vgui/tools/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/tools/" .. v)
end

resource.AddFile("materials/vgui/banner.png")
resource.AddFile("materials/vgui/slotdonator_s.png")
resource.AddFile("materials/vgui/slotmember_s.png")

/*
Fonts
*/
local files, dirs = file.Find("resource/fonts/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("resource/fonts/" .. v)
end

/*
texturefix
*/
local files, dirs = file.Find("materials/vgui/fixes/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/vgui/fixes/" .. v)
end

/*
texturefix2
*/
local files, dirs = file.Find("models/props/cs_militia/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("models/props/cs_militia/" .. v)
end

/*
texturefix3
*/
local files, dirs = file.Find("models/props/cs_office/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("models/props/cs_office/" .. v)
end

/*
texturefix4
*/
local files, dirs = file.Find("materials/models/props/cs_militia/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/models/props/cs_militia/" .. v)
end

/*
texturefix5
*/
local files, dirs = file.Find("materials/models/props/cs_office/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/models/props/cs_office/" .. v)
end


/*
texturefix6
*/
local files, dirs = file.Find("materials/models/props_lab/*", "GAME")
for k, v in pairs( files ) do
	resource.AddFile("materials/models/props_lab/" .. v)
end






