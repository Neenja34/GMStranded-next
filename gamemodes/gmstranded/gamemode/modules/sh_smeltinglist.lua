SGS.Smelting = {}
function Menu_RegisterSmelting( category, recipe )
	if !SGS.Smelting[category] then SGS.Smelting[category] = {} end
	SGS.Smelting[category][#SGS.Smelting[category] + 1] = recipe
end

//--Iron--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/iron_x1.png"
RECIPE.title = "Iron"
RECIPE.uid = "iron1"
RECIPE.description = "Smelts Iron Ore into something more useful"
RECIPE.cost = { iron_ore = 1}
RECIPE.reqlvl = { smithing = 3}
RECIPE.gives = { iron = 1}
RECIPE.xp = 10
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/iron_x5.png"
RECIPE.title = "Iron x5"
RECIPE.uid = "iron2"
RECIPE.description = "Smelts Iron Ore into something more useful"
RECIPE.cost = { iron_ore = 5}
RECIPE.reqlvl = { smithing = 3}
RECIPE.gives = { iron = 5}
RECIPE.xp = 45
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/iron_x10.png"
RECIPE.title = "Iron x10"
RECIPE.uid = "iron3"
RECIPE.description = "Smelts Iron Ore into something more useful"
RECIPE.cost = { iron_ore = 10}
RECIPE.reqlvl = { smithing = 3}
RECIPE.gives = { iron = 10}
RECIPE.xp = 90
Menu_RegisterSmelting( "ingot", RECIPE )

//--Construction--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/metal_x5.png"
RECIPE.title = "Metal x5"
RECIPE.uid = "construction1"
RECIPE.description = "Converts Iron into a metal usable in constructing props"
RECIPE.cost = { iron = 1}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { metal = 5 }
RECIPE.xp = 10
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/metal_x25.png"
RECIPE.title = "Metal x25"
RECIPE.uid = "construction2"
RECIPE.description = "Converts Iron into a metal usable in constructing props"
RECIPE.cost = { iron = 5}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { metal = 25 }
RECIPE.xp = 45
Menu_RegisterSmelting( "ingot", RECIPE )

//--Steel--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/steel_x1.png"
RECIPE.title = "Steel"
RECIPE.uid = "steel1"
RECIPE.description = "Smelts Iron and Coal into the tougher steel resource"
RECIPE.cost = { iron_ore = 1, coal = 2}
RECIPE.reqlvl = { smithing = 15}
RECIPE.gives = { steel = 1 }
RECIPE.xp = 20
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/steel_x5.png"
RECIPE.title = "Steel x5"
RECIPE.uid = "steel2"
RECIPE.description = "Smelts Iron and Coal into the tougher steel resource"
RECIPE.cost = { iron_ore = 5, coal = 10}
RECIPE.reqlvl = { smithing = 15}
RECIPE.gives = { steel = 5 }
RECIPE.xp = 90
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/steel_x10.png"
RECIPE.title = "Steel x10"
RECIPE.uid = "steel3"
RECIPE.description = "Smelts Iron and Coal into the tougher steel resource"
RECIPE.cost = { iron_ore = 10, coal = 20}
RECIPE.reqlvl = { smithing = 15}
RECIPE.gives = { steel = 10 }
RECIPE.xp = 180
Menu_RegisterSmelting( "ingot", RECIPE )

//--Silver--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/silver_x1.png"
RECIPE.title = "Silver"
RECIPE.uid = "silver1"
RECIPE.description = "Smelts Silver Ore and Coal into Silver"
RECIPE.cost = { silver_ore = 1, coal = 4}
RECIPE.reqlvl = { smithing = 25}
RECIPE.gives = { silver = 1 }
RECIPE.xp = 30
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/silver_x5.png"
RECIPE.title = "Silver x5"
RECIPE.uid = "silver2"
RECIPE.description = "Smelts Silver Ore and Coal into Silver"
RECIPE.cost = { silver_ore = 5, coal = 20}
RECIPE.reqlvl = { smithing = 25}
RECIPE.gives = { silver = 5 }
RECIPE.xp = 140
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/silver_x10.png"
RECIPE.title = "Silver x10"
RECIPE.uid = "silver3"
RECIPE.description = "Smelts Silver Ore and Coal into Silver"
RECIPE.cost = { silver_ore = 10, coal = 40}
RECIPE.reqlvl = { smithing = 25}
RECIPE.gives = { silver = 10 }
RECIPE.xp = 275
Menu_RegisterSmelting( "ingot", RECIPE )

//--Trinium--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/trin_x1.png"
RECIPE.title = "Trinium"
RECIPE.uid = "trinium1"
RECIPE.description = "Smelts Trinium Ore and Coal into Trinium"
RECIPE.cost = { trinium_ore = 1, coal = 6}
RECIPE.reqlvl = { smithing = 40}
RECIPE.gives = { trinium = 1 }
RECIPE.xp = 50
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/trin_x5.png"
RECIPE.title = "Trinium x5"
RECIPE.uid = "trinium2"
RECIPE.description = "Smelts Trinium Ore and Coal into Trinium"
RECIPE.cost = { trinium_ore = 5, coal = 30}
RECIPE.reqlvl = { smithing = 40}
RECIPE.gives = { trinium = 5 }
RECIPE.xp = 230
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/trin_x10.png"
RECIPE.title = "Trinium x10"
RECIPE.uid = "trinium3"
RECIPE.description = "Smelts Trinium Ore and Coal into Trinium"
RECIPE.cost = { trinium_ore = 10, coal = 60}
RECIPE.reqlvl = { smithing = 40}
RECIPE.gives = { trinium = 10 }
RECIPE.xp = 450
Menu_RegisterSmelting( "ingot", RECIPE )


//--Naquadah--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/naq_x1.png"
RECIPE.title = "Naquadah"
RECIPE.uid = "naquadah1"
RECIPE.description = "Smelts Naquadah Ore and Coal into Naquadah"
RECIPE.cost = { naquadah_ore = 1, coal = 8}
RECIPE.reqlvl = { smithing = 53}
RECIPE.gives = { naquadah = 1 }
RECIPE.xp = 110
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/naq_x5.png"
RECIPE.title = "Naquadah x5"
RECIPE.uid = "naquadah2"
RECIPE.description = "Smelts Naquadah Ore and Coal into Naquadah"
RECIPE.cost = { naquadah_ore = 5, coal = 40}
RECIPE.reqlvl = { smithing = 53}
RECIPE.gives = { naquadah = 5 }
RECIPE.xp = 460
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/naq_x10.png"
RECIPE.title = "Naquadah x10"
RECIPE.uid = "naquadah3"
RECIPE.description = "Smelts Naquadah Ore and Coal into Naquadah"
RECIPE.cost = { naquadah_ore = 10, coal = 80}
RECIPE.reqlvl = { smithing = 53}
RECIPE.gives = { naquadah = 10 }
RECIPE.xp = 850
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/reinnaq_x1.png"
RECIPE.title = "Reinforced Naquadah"
RECIPE.uid = "naquadah4"
RECIPE.description = "Combines Naquadah and Trinium to make\nReinforced Naquadah"
RECIPE.cost = { naquadah = 1, trinium = 10}
RECIPE.reqlvl = { smithing = 55}
RECIPE.gives = { reinforced_naquadah = 1 }
RECIPE.xp = 1000
Menu_RegisterSmelting( "ingot", RECIPE )

//--Mithril--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/mith_x1.png"
RECIPE.title = "Mithril"
RECIPE.uid = "mithril1"
RECIPE.description = "Smelts Mithril Ore and Coal into Mithril"
RECIPE.cost = { mithril_ore = 1, coal = 10}
RECIPE.reqlvl = { smithing = 65}
RECIPE.gives = { mithril = 1 }
RECIPE.xp = 160
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/mith_x5.png"
RECIPE.title = "Mithril x5"
RECIPE.uid = "mithril2"
RECIPE.description = "Smelts Mithril Ore and Coal into Mithril"
RECIPE.cost = { mithril_ore = 5, coal = 50}
RECIPE.reqlvl = { smithing = 65}
RECIPE.gives = { mithril = 5 }
RECIPE.xp = 700
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/mith_x10.png"
RECIPE.title = "Mithril x10"
RECIPE.uid = "mithril3"
RECIPE.description = "Smelts Mithril Ore and Coal into Mithril"
RECIPE.cost = { mithril_ore = 10, coal = 100}
RECIPE.reqlvl = { smithing = 65}
RECIPE.gives = { mithril = 10 }
RECIPE.xp = 1300
Menu_RegisterSmelting( "ingot", RECIPE )

//--Gold--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/gold_x1.png"
RECIPE.title = "Gold"
RECIPE.uid = "gold1"
RECIPE.description = "Smelts Gold Ore and Coal into Gold"
RECIPE.cost = { gold_ore = 1, coal = 2}
RECIPE.reqlvl = { smithing = 65}
RECIPE.gives = { gold = 1 }
RECIPE.xp = 160
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/gold_x5.png"
RECIPE.title = "Gold x5"
RECIPE.uid = "gold2"
RECIPE.description = "Smelts Gold Ore and Coal into Gold"
RECIPE.cost = { gold_ore = 5, coal = 10}
RECIPE.reqlvl = { smithing = 65}
RECIPE.gives = { gold = 5 }
RECIPE.xp = 700
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/gold_x10.png"
RECIPE.title = "Gold x10"
RECIPE.uid = "gold3"
RECIPE.description = "Smelts Gold Ore and Coal into Gold"
RECIPE.cost = { gold_ore = 10, coal = 20}
RECIPE.reqlvl = { smithing = 65}
RECIPE.gives = { gold = 10 }
RECIPE.xp = 1300
Menu_RegisterSmelting( "ingot", RECIPE )

//--Platinum--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/silver_x1.png"
RECIPE.title = "Platinum"
RECIPE.uid = "platinum1"
RECIPE.description = "Smelts Platinum Ore and Coal into Platinum"
RECIPE.cost = { platinum_ore = 1, coal = 12}
RECIPE.reqlvl = { smithing = 71}
RECIPE.gives = { platinum = 1 }
RECIPE.xp = 210
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/silver_x5.png"
RECIPE.title = "Platinum x5"
RECIPE.uid = "platinum2"
RECIPE.description = "Smelts Platinum Ore and Coal into Platinum"
RECIPE.cost = { platinum_ore = 5, coal = 60}
RECIPE.reqlvl = { smithing = 71}
RECIPE.gives = { platinum = 5 }
RECIPE.xp = 1000
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/silver_x10.png"
RECIPE.title = "Platinum x10"
RECIPE.uid = "platinum3"
RECIPE.description = "Smelts Platinum Ore and Coal into Platinum"
RECIPE.cost = { platinum_ore = 10, coal = 120}
RECIPE.reqlvl = { smithing = 71}
RECIPE.gives = { platinum = 10 }
RECIPE.xp = 1800
Menu_RegisterSmelting( "ingot", RECIPE )

//--Meteoric--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/meteoriciron.png"
RECIPE.title = "Meteoric Iron"
RECIPE.uid = "meteoriciron1"
RECIPE.description = "Smelts Meteoric Iron Ore and Coal into Meteoric Iron"
RECIPE.cost = { meteoric_iron_ore = 1, coal = 30}
RECIPE.reqlvl = { smithing = 65}
RECIPE.gives = { meteoric_iron = 1 }
RECIPE.xp = 450
Menu_RegisterSmelting( "ingot", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/refinedmeteoriciron.png"
RECIPE.title = "Refined Meteoric Iron"
RECIPE.uid = "meteoriciron2"
RECIPE.description = "Refines Meteoric Iron and Enchanted Metal together."
RECIPE.cost = { meteoric_iron = 4, enchanted_metal = 2}
RECIPE.reqlvl = { smithing = 75}
RECIPE.gives = { refined_meteoric_iron = 1 }
RECIPE.xp = 1200
Menu_RegisterSmelting( "ingot", RECIPE )

//--BToken--//

RECIPE = {}
RECIPE.material = "vgui/gems/emerald_new.png"
RECIPE.title = "Boss PCache"
RECIPE.uid = "boss1"
RECIPE.description = "Creates a Boss permanent cache core"
RECIPE.cost = { btoken = 80}
RECIPE.reqlvl = { smithing = 50}
RECIPE.gives = { boss_pcache_core = 1 }
RECIPE.xp = 160
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/gems/emerald_new.png"
RECIPE.title = "Boss Hatchet Head"
RECIPE.uid = "boss2"
RECIPE.description = "Creates a Boss Hatchet Head"
RECIPE.cost = { btoken = 56}
RECIPE.reqlvl = { smithing = 50}
RECIPE.gives = { boss_hatchet_head = 1 }
RECIPE.xp = 160
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/gems/emerald_new.png"
RECIPE.title = "Boss Pickaxe Head"
RECIPE.uid = "boss3"
RECIPE.description = "Creates a Boss Pickaxe Head"
RECIPE.cost = { btoken = 48}
RECIPE.reqlvl = { smithing = 50}
RECIPE.gives = { boss_pick_head = 1 }
RECIPE.xp = 160
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/gems/emerald_new.png"
RECIPE.title = "Boss Rod Core"
RECIPE.uid = "boss4"
RECIPE.description = "Creates a Boss Rod Core"
RECIPE.cost = { btoken = 48}
RECIPE.reqlvl = { smithing = 50}
RECIPE.gives = { boss_rod_core = 1 }
RECIPE.xp = 160
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/gems/emerald_new.png"
RECIPE.title = "Combat Artifact"
RECIPE.uid = "boss5"
RECIPE.description = "Creates a level 1 combat Artifact"
RECIPE.cost = { btoken = 1}
RECIPE.reqlvl = { combat = 50}
RECIPE.gives = { combat_artifact_1 = 1 }
RECIPE.xp = 160
Menu_RegisterSmelting( "misc", RECIPE )

//--Glass--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/glass_x1.png"
RECIPE.title = "Glass"
RECIPE.uid = "construction3"
RECIPE.description = "Melt sand into glass for use in construction"
RECIPE.cost = { sand = 2}
RECIPE.reqlvl = { smithing = 10}
RECIPE.gives = { glass = 1 }
RECIPE.xp = 20
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/glass_x5.png"
RECIPE.title = "Glass x5"
RECIPE.uid = "construction4"
RECIPE.description = "Melt sand into glass for use in construction"
RECIPE.cost = { sand = 10}
RECIPE.reqlvl = { smithing = 10}
RECIPE.gives = { glass = 5 }
RECIPE.xp = 50
Menu_RegisterSmelting( "misc", RECIPE )

//--Alchemy--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/vial.png"
RECIPE.title = "Glass Vial"
RECIPE.uid = "alchemy1"
RECIPE.description = "Creates a glass vial used in potion brewing"
RECIPE.cost = { glass = 2}
RECIPE.reqlvl = { smithing = 1}
RECIPE.gives = { vial = 1 }
RECIPE.xp = 10
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/potions/new/thecure.png"
RECIPE.title = "Melon Aids Cure"
RECIPE.uid = "alchemy2"
RECIPE.description = "Creates a Melon Aids Cure"
RECIPE.cost = { liferoot = 3, pypa_seed = 5, bottled_water = 5}
RECIPE.reqlvl = { smithing = 1}
RECIPE.gives = { the_cure = 1 }
RECIPE.xp = 10
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/flask.png"
RECIPE.title = "Glass Flask"
RECIPE.uid = "alchemy3"
RECIPE.description = "Creates a glass flask used in potion brewing"
RECIPE.cost = { glass = 5, stone = 2}
RECIPE.reqlvl = { smithing = 12}
RECIPE.gives = { flask = 1 }
RECIPE.xp = 60
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/heavy_flask.png"
RECIPE.title = "Heavy Glass Flask"
RECIPE.uid = "alchemy4"
RECIPE.description = "Creates a heavy glass flask used in potion brewing"
RECIPE.cost = { glass = 5, iron_ore = 2}
RECIPE.reqlvl = { smithing = 25}
RECIPE.gives = { heavy_flask = 1 }
RECIPE.xp = 120
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/imbued_flask.png"
RECIPE.title = "Imbued Glass Flask"
RECIPE.uid = "alchemy5"
RECIPE.description = "Creates an imbued glass flask used in potion brewing"
RECIPE.cost = { glass = 5, silver_ore = 2}
RECIPE.reqlvl = { smithing = 36}
RECIPE.gives = { imbued_flask = 1 }
RECIPE.xp = 160
Menu_RegisterSmelting( "misc", RECIPE )

//--Woodworks--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x1.png"
RECIPE.title = "Oak Wood to Normal Wood"
RECIPE.uid = "woodworks1"
RECIPE.description = "Turns Oak wood into Normal wood, for coal production"
RECIPE.cost = { oak_wood = 1}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 1}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x5.png"
RECIPE.title = "Oak Wood to Normal Wood x5"
RECIPE.uid = "woodworks2"
RECIPE.description = "Turns Oak wood into Normal wood, for coal production"
RECIPE.cost = { oak_wood = 5}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 5}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x1.png"
RECIPE.title = "Maple Wood to Normal Wood"
RECIPE.uid = "woodworks3"
RECIPE.description = "Turns Maple wood into Normal wood, for coal production"
RECIPE.cost = { maple_wood = 1}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 1}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x5.png"
RECIPE.title = "Maple Wood to Normal Wood x5"
RECIPE.uid = "woodworks4"
RECIPE.description = "Turns Maple wood into Normal wood, for coal production"
RECIPE.cost = { maple_wood = 5}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 5}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x1.png"
RECIPE.title = "Pine Wood to Normal Wood"
RECIPE.uid = "woodworks5"
RECIPE.description = "Turns Pine wood into Normal wood, for coal production"
RECIPE.cost = { pine_wood = 1}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 1}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x5.png"
RECIPE.title = "Pine Wood to Normal Wood x5"
RECIPE.uid = "woodworks6"
RECIPE.description = "Turns Pine wood into Normal wood, for coal production"
RECIPE.cost = { pine_wood = 5}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 5}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x1.png"
RECIPE.title = "Yew Wood to Normal Wood"
RECIPE.uid = "woodworks7"
RECIPE.description = "Turns Yew wood into Normal wood, for coal production"
RECIPE.cost = { yew_wood = 1}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 1}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x5.png"
RECIPE.title = "Yew Wood to Normal Wood x5"
RECIPE.uid = "woodworks8"
RECIPE.description = "Turns Yew wood into Normal wood, for coal production"
RECIPE.cost = { yew_wood = 5}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 5}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x1.png"
RECIPE.title = "Buckeye Wood to Normal Wood"
RECIPE.uid = "woodworks9"
RECIPE.description = "Turns Buckeye wood into Normal wood, for coal production"
RECIPE.cost = { buckeye_wood = 1}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 1}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x5.png"
RECIPE.title = "Buckeye Wood to Normal Wood x5"
RECIPE.uid = "woodworks10"
RECIPE.description = "Turns Buckeye wood into Normal wood, for coal production"
RECIPE.cost = { buckeye_wood = 5}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 5}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x1.png"
RECIPE.title = "Palm Wood to Normal Wood"
RECIPE.uid = "woodworks11"
RECIPE.description = "Turns Palm wood into Normal wood, for coal production"
RECIPE.cost = { palm_wood = 1}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 1}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x5.png"
RECIPE.title = "Palm Wood to Normal Wood x5"
RECIPE.uid = "woodworks12"
RECIPE.description = "Turns Palm wood into Normal wood, for coal production"
RECIPE.cost = { palm_wood = 5}
RECIPE.reqlvl = { smithing = 5}
RECIPE.gives = { wood = 5}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

//--Misc--//

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x1.png"
RECIPE.title = "Wood to Coal"
RECIPE.uid = "misc11"
RECIPE.description = "Turns wood into coal"
RECIPE.cost = { wood = 5}
RECIPE.reqlvl = { smithing = 25}
RECIPE.gives = { coal = 1}
RECIPE.xp = 30
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x5.png"
RECIPE.title = "Wood to Coal (x5)"
RECIPE.uid = "misc12"
RECIPE.description = "Turns wood into coal"
RECIPE.cost = { wood = 25}
RECIPE.reqlvl = { smithing = 25}
RECIPE.gives = { coal = 5}
RECIPE.xp = 130
Menu_RegisterSmelting( "misc", RECIPE )

RECIPE = {}
RECIPE.material = "vgui/furnace/new/wood2coal_x10.png"
RECIPE.title = "Wood to Coal (x10)"
RECIPE.uid = "misc13"
RECIPE.description = "Turns wood into coal"
RECIPE.cost = { wood = 50}
RECIPE.reqlvl = { smithing = 25}
RECIPE.gives = { coal = 10}
RECIPE.xp = 250
Menu_RegisterSmelting( "misc", RECIPE )