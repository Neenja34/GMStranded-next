SGS.Ach = {}
function Achievement_RegisterAchievement( ach )
	SGS.Ach[#SGS.Ach + 1] = ach
end

--local ACH = {}
--ACH.short = "santahat"
--ACH.long = "Naughty or Nice?"
--ACH.cc = "sgs_equiphat santahat"
--ACH.at = "Access Q > Options menu to equip your new hat."
--ACH.show = true
--ACH.displaytext = "Obtained during the Christmas Event"
--ACH.reward = "Santa Hat"
--Achievement_RegisterAchievement( ACH )

--local ACH = {}
--ACH.short = "3yearhat"
--ACH.long = "G4P Stranded 3 Year Anniversary"
--ACH.cc = "sgs_equiphat 3yearhat"
--ACH.at = "Access Q > Options menu to equip your new hat."
--ACH.show = true
--ACH.displaytext = "Play during the 3 year anniversary event"
--ACH.reward = "3 Year Anniversary Hat"
--Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "inventory1"
ACH.long = "Inventory Cap Increase - Level 1"
ACH.cc = "sgs_recalculatemaxinv"
ACH.show = true
ACH.displaytext = "Purchased from Vorty"
ACH.reward = "Increases max inventory by 50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "inventory2"
ACH.long = "Inventory Cap Increase - Level 2"
ACH.cc = "sgs_recalculatemaxinv"
ACH.show = true
ACH.displaytext = "Purchased from Vorty"
ACH.reward = "Increases max inventory by 100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "maxpets1"
ACH.long = "Pet House Upgrade - Level 1"
ACH.cc = "sgs_recalculatemaxpets"
ACH.show = true
ACH.displaytext = "Purchased from Vorty"
ACH.reward = "Increases pet house capacity by 5"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "maxpets2"
ACH.long = "Pet House Upgrade - Level 2"
ACH.cc = "sgs_recalculatemaxpets"
ACH.show = true
ACH.displaytext = "Purchased from Vorty"
ACH.reward = "Increases pet house capacity by 5"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "planting1"
ACH.long = "Max Plant Increase - Level 1"
ACH.cc = "sgs_recalculatemaxplants"
ACH.show = true
ACH.displaytext = "Purchased from Vorty"
ACH.reward = "Raises max plant cap by 3"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "planting2"
ACH.long = "Max Plant Increase - Level 2"
ACH.cc = "sgs_recalculatemaxplants"
ACH.show = true
ACH.displaytext = "Purchased from Vorty"
ACH.reward = "Raises max plant cap by 6"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "bunnyears"
ACH.long = "The Ears Are The Best Part"
ACH.cc = "sgs_equiphat bunnyears"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.show = true
ACH.displaytext = "Obtained from the Easter Event."
ACH.reward = "Bunny Ears Hat"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "headcrabhat"
ACH.long = "They Grow Up So Fast"
ACH.cc = "sgs_equiphat headcrabhat"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.show = true
ACH.displaytext = "Hatch one of each color egg."
ACH.reward = "Headcrab Hat"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "chefhat"
ACH.long = "Cooking for Two ... Thousand"
ACH.cc = "sgs_equiphat chefhat"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.show = true
ACH.displaytext = "Cook 2000 items on the stove."
ACH.reward = "Chef Hat"
ACH.associatedstat = "cooking9"
ACH.statneeded = "2000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "farminghat"
ACH.long = "Farming Hat"
ACH.cc = "sgs_equiphat farminghat"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.show = true
ACH.displaytext = "Eat 25 Golden Melons."
ACH.reward = "Farming Hat"
ACH.associatedstat = "farming3"
ACH.statneeded = "25"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "goggleshat"
ACH.long = "Assassinate the President"
ACH.cc = "sgs_equiphat goggleshat"
ACH.show = true
ACH.displaytext = "Kill the President in PvP."
ACH.reward = "Special Hat"
ACH.associatedstat = "combat7"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "squirrelhat"
ACH.long = "Caretaker"
ACH.cc = "sgs_equiphat squirrelhat"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.show = true
ACH.displaytext = "Raise 30 pets to fully grown."
ACH.reward = "Squirrel Buddy"
ACH.associatedstat = "pets11"
ACH.statneeded = "30"
Achievement_RegisterAchievement( ACH )


local ACH = {}
ACH.short = "robotbuddy"
ACH.long = "Robot Buddy"
ACH.cc = "sgs_equiphat robotbuddy"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "crownhat"
ACH.long = "It's Good To Be King!"
ACH.cc = "sgs_equiphat crownhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "billycockhat"
ACH.long = "Billycock Hat"
ACH.cc = "sgs_equiphat billycockhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "treasurehat"
ACH.long = "Treasure Hat"
ACH.cc = "sgs_equiphat treasurehat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "mininghat"
ACH.long = "Oooo... Shiny!"
ACH.cc = "sgs_equiphat mininghat"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.show = true
ACH.displaytext = "Mine 500+ Gems."
ACH.reward = "Mining Helmet"
ACH.associatedstat = "mining8"
ACH.statneeded = "500"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "flathat"
ACH.long = "Flat Hat"
ACH.cc = "sgs_equiphat flathat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "presshat"
ACH.long = "Stop The Presses!"
ACH.cc = "sgs_equiphat presshat"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.show = true
ACH.displaytext = "Find 10000 GTokens."
ACH.reward = "Press Hat"
ACH.associatedstat = "general13"
ACH.statneeded = "10000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "treasurehat2"
ACH.long = "Treasure Hat 2"
ACH.cc = "sgs_equiphat treasurehat2"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "wizardhat"
ACH.long = "I Put On My Robe And Wizard Hat"
ACH.cc = "sgs_equiphat wizardhat"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.show = true
ACH.displaytext = "Use 2500 Arcane Stones casting spells."
ACH.reward = "Wizard Hat"
ACH.associatedstat = "arcane3"
ACH.statneeded = "2500"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "killaboss"
ACH.long = "Boss Slayer"
ACH.show = true
ACH.displaytext = "Kill a boss."
ACH.associatedstat = "combat3"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "killaboss2"
ACH.long = "Kill 10 bosses."
ACH.show = true
ACH.displaytext = "Kill 10 bosses."
ACH.associatedstat = "combat3"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "killaboss3"
ACH.long = "Kill 50 bosses."
ACH.show = true
ACH.displaytext = "Kill 50 bosses."
ACH.associatedstat = "combat3"
ACH.statneeded = "50"
ACH.reward = "25 Btokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "soldierhat"
ACH.long = "Soldier Hat"
ACH.cc = "sgs_equiphat soldierhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "pilothelmethat"
ACH.long = "Pilot Helmet Hat"
ACH.cc = "sgs_equiphat pilothelmethat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "civilwarhat"
ACH.long = "Civil War Hat"
ACH.cc = "sgs_equiphat civilwarhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "dragonbornhat"
ACH.long = "Dragonborn Hat"
ACH.cc = "sgs_equiphat dragonbornhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "drseusshat"
ACH.long = "Dr. Seuss Hat"
ACH.cc = "sgs_equiphat drseusshat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "notchhat"
ACH.long = "Notch Head Hat"
ACH.cc = "sgs_equiphat notchhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "captainshat"
ACH.long = "Captain's Hat"
ACH.cc = "sgs_equiphat captainshat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "oldarmyhat"
ACH.long = "Old Army Hat"
ACH.cc = "sgs_equiphat oldarmyhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "russianhat"
ACH.long = "Russian Hat"
ACH.cc = "sgs_equiphat russianhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cowboyhat"
ACH.long = "Cowboy Hat"
ACH.cc = "sgs_equiphat cowboyhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "chiefhat"
ACH.long = "Cowboy Hat"
ACH.cc = "sgs_equiphat chiefhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "flamincohat"
ACH.long = "Flaminco Hat"
ACH.cc = "sgs_equiphat flamincohat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "hoodedmaskhat"
ACH.long = "Hooded Mask Hat"
ACH.cc = "sgs_equiphat hoodedmaskhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "robinhoodhat"
ACH.long = "Robin Hood Hat"
ACH.cc = "sgs_equiphat robinhoodhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "generalhat"
ACH.long = "General's Hat"
ACH.cc = "sgs_equiphat generalhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "berethat"
ACH.long = "Beret hat"
ACH.cc = "sgs_equiphat berethat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "featherhat"
ACH.long = "Feathered Hat"
ACH.cc = "sgs_equiphat featherhat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "detectivehat"
ACH.long = "Detective Hat"
ACH.cc = "sgs_equiphat detectivehat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "drillsergeanthat"
ACH.long = "Drill Sergeant Hat"
ACH.cc = "sgs_equiphat drillsergeanthat"
ACH.at = "Access Q > Options menu to equip your new hat."
Achievement_RegisterAchievement( ACH )

--local ACH = {}
--ACH.short = "betaprogram"
--ACH.long = "Beta Program Participant"
--ACH.at = "You can now perform actions reserved for beta program participants."
--Achievement_RegisterAchievement( ACH )


--[[
TIME ACHIEVEMENTS
]]

local ACH = {}
ACH.short = "time1"
ACH.long = "How did I get here?"
ACH.show = true
ACH.displaytext = "Play on the server for 1 hour."
ACH.associatedstat = "time1"
ACH.statneeded = "60"
ACH.stat_divisor = 60
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "time2"
ACH.long = "I guess it's not so bad."
ACH.show = true
ACH.displaytext = "Play on the server for 10 hours."
ACH.associatedstat = "time1"
ACH.statneeded = "600"
ACH.stat_divisor = 60
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "time3"
ACH.long = "Maybe I was never really stranded..."
ACH.show = true
ACH.displaytext = "Play on the server for 50 hours."
ACH.associatedstat = "time1"
ACH.statneeded = "3000"
ACH.stat_divisor = 60
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "time4"
ACH.long = "What am I doing with my life?"
ACH.show = true
ACH.displaytext = "Play on the server for 100 hours."
ACH.associatedstat = "time1"
ACH.statneeded = "6000"
ACH.stat_divisor = 60
ACH.reward = "250 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "time5"
ACH.long = "King of the Island!"
ACH.show = true
ACH.displaytext = "Play on the server for 150 hours."
ACH.associatedstat = "time1"
ACH.statneeded = "9000"
ACH.stat_divisor = 60
ACH.reward = "Veteran Rank"
Achievement_RegisterAchievement( ACH )

--[[
	MISC ACHIEVEMENTS
]]

local ACH = {}
ACH.short = "steamgroup"
ACH.long = "Community Member"
ACH.show = false
ACH.displaytext = "Join the G4P(PG) Group on Discord (Requires Survival Level 5+)"
ACH.cc = "sgs_equiphat steamgroup"
ACH.at = "Access Q > Options menu to equip your new hat."
ACH.reward = "Community Hat / 2500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "secretworld"
ACH.long = "Been there, Done that!"
ACH.show = true
ACH.displaytext = "Visit the secret world to unlock this achievement"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "voidcache1"
ACH.long = "Keeper of the Void"
ACH.show = true
ACH.displaytext = "Find 100 Void Caches"
ACH.associatedstat = "general17"
ACH.statneeded = "100"
ACH.reward = "Void Cache x 5"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "voidcache10"
ACH.long = "Find 10 Void Caches."
ACH.show = true
ACH.displaytext = "Find 10 Void Caches."
ACH.associatedstat = "general17"
ACH.statneeded = "10"
ACH.reward = "Void Cache"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "voidcache2"
ACH.long = "Void Gambler"
ACH.show = true
ACH.displaytext = "Open 50 Void Caches"
ACH.associatedstat = "general18"
ACH.statneeded = "50"
ACH.reward = "Void Crystal x 3"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "voidcacheo10"
ACH.long = "Open 10 Void Caches"
ACH.show = true
ACH.displaytext = "Open 10 Void Caches"
ACH.associatedstat = "general18"
ACH.statneeded = "10"
ACH.reward = "Void Crystal"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "zombieslayer"
ACH.long = "Zombie Slayer!"
ACH.show = true
ACH.displaytext = "Kill 1000 Zombies"
ACH.associatedstat = "combat8"
ACH.statneeded = "1000"
ACH.reward = "750 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "zombieslayer2"
ACH.long = "Rotten meat"
ACH.show = true
ACH.displaytext = "Kill 10 Zombies"
ACH.associatedstat = "combat8"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "zombieslayer3"
ACH.long = "Zombie Dominator"
ACH.show = true
ACH.displaytext = "Kill 100 Zombies"
ACH.associatedstat = "combat8"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "bloodchampion"
ACH.long = "Blood Champion!"
ACH.show = true
ACH.displaytext = "Survive 100 Blood Moons"
ACH.associatedstat = "bloodmoon1"
ACH.statneeded = "100"
ACH.reward = "500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "bloodchampion1"
ACH.long = "Peace at last"
ACH.show = true
ACH.displaytext = "Survive 1 Blood Moon"
ACH.associatedstat = "bloodmoon1"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "bloodchampion2"
ACH.long = "Hell Walker"
ACH.show = true
ACH.displaytext = "Survive 50 Blood Moons"
ACH.associatedstat = "bloodmoon1"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "fishmaster"
ACH.long = "Master Fisherman"
ACH.show = true
ACH.displaytext = "Catch 10000 Fish"
ACH.associatedstat = "fishing1"
ACH.statneeded = "10000"
ACH.reward = "1000 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodcuttingmaster"
ACH.long = "Master Lumberjack"
ACH.show = true
ACH.displaytext = "Fell 10000 Trees"
ACH.associatedstat = "woodcutting2"
ACH.statneeded = "10000"
ACH.reward = "1000 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "miningmaster"
ACH.long = "Master Miner"
ACH.show = true
ACH.displaytext = "Deplete 10000 Ore Rocks"
ACH.associatedstat = "mining7"
ACH.statneeded = "10000"
ACH.reward = "750 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "constructionmaster"
ACH.long = "Master Craftsman"
ACH.show = true
ACH.displaytext = "Construct 10000 Props"
ACH.associatedstat = "construction1"
ACH.statneeded = "10000"
ACH.reward = "750 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "farmingmaster"
ACH.long = "Master Farmer"
ACH.show = true
ACH.displaytext = "Plant 10000 Seeds"
ACH.associatedstat = "farming1"
ACH.statneeded = "10000"
ACH.reward = "1000 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "smithingmaster"
ACH.long = "Master Blacksmith"
ACH.show = true
ACH.displaytext = "Smelt 10000 Ore"
ACH.associatedstat = "smithing2"
ACH.reward = "1000 GTokens"
ACH.statneeded = "10000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "arcanemaster"
ACH.long = "Master Arcanist"
ACH.show = true
ACH.displaytext = "Cast 10000 Bolt Spells"
ACH.associatedstat = "arcane1"
ACH.reward = "750 GTokens"
ACH.statneeded = "10000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "alchemymaster"
ACH.long = "Master Alchemist"
ACH.show = true
ACH.displaytext = "Perform 10000 Transmutations"
ACH.associatedstat = "alchemy4"
ACH.reward = "1000 GTokens"
ACH.statneeded = "10000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cookingmaster"
ACH.long = "Master Chef"
ACH.show = true
ACH.displaytext = "Cook 10000 Food Items"
ACH.associatedstat = "cooking9"
ACH.statneeded = "10000"
ACH.reward = "1000 GTokens"
Achievement_RegisterAchievement( ACH )

--Custom begins here

local ACH = {}
ACH.short = "welcome" 
ACH.long = "Welcome!"
ACH.show = true
ACH.displaytext = "!Help to get started!."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woahthisaintsobad" 
ACH.long = "Woah, this aint so bad"
ACH.show = true
ACH.displaytext = "Get survival level 10."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cantstopyou" 
ACH.long = "Nothing can stop you now!"
ACH.show = true
ACH.displaytext = "Get survival level 20."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "almost" 
ACH.long = "Almost there!"
ACH.show = true
ACH.displaytext = "Get survival level 30."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "didit" 
ACH.long = "You did it!"
ACH.show = true
ACH.displaytext = "Get survival level 40."
ACH.reward = "1000 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "melon"
ACH.long = "MelonAids?"
ACH.show = true
ACH.associatedstat = "general4"
ACH.statneeded = "1"
ACH.displaytext = "Careful you don't get infected!"
ACH.reward = "A Cure"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "melon10"
ACH.long = "Cheap Hooker"
ACH.show = true
ACH.associatedstat = "general4"
ACH.statneeded = "10"
ACH.displaytext = "Catch MelonAids 10 times."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "nomelon"
ACH.long = "Delicious fish."
ACH.show = true
ACH.associatedstat = "fishing1"
ACH.statneeded = "1"
ACH.displaytext = "Catch a fish"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "nomelon100"
ACH.long = "Fisherman"
ACH.show = true
ACH.associatedstat = "fishing1"
ACH.statneeded = "100"
ACH.displaytext = "Catch 100 fish"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "nomelon1000"
ACH.long = "Stellar fisherman"
ACH.show = true
ACH.associatedstat = "fishing1"
ACH.statneeded = "1000"
ACH.displaytext = "Catch 1000 fish"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "nomelon500"
ACH.long = "Adept Fisherman"
ACH.show = true
ACH.associatedstat = "fishing1"
ACH.statneeded = "500"
ACH.displaytext = "Catch a fish"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cute"
ACH.long = "Not what i imagined."
ACH.show = true
ACH.associatedstat = "general16"
ACH.statneeded = "1"
ACH.displaytext = "Hatch a pet egg."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cute10"
ACH.long = "Local pet shop"
ACH.associatedstat = "general16"
ACH.statneeded = "10"
ACH.show = true
ACH.displaytext = "Hatch 10 pet eggs."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cute100"
ACH.long = "Veterinarian"
ACH.associatedstat = "general16"
ACH.statneeded = "100"
ACH.show = true
ACH.displaytext = "Hatch 100 pet eggs."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cute500"
ACH.long = "Gotta catch 'em all"
ACH.associatedstat = "general16"
ACH.statneeded = "500"
ACH.reward = "10000 GTokens"
ACH.show = true
ACH.displaytext = "Hatch 500 pet eggs."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "deadofage"
ACH.long = "Noo, not so soon!"
ACH.show = true
ACH.displaytext = "First pet to die of age."
ACH.associatedstat = "pets11"
ACH.statneeded = "1"
ACH.reward = "50 Gtokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "wizzy"
ACH.long = "What was that!?"
ACH.associatedstat = "arcane1"
ACH.statneeded = "1"
ACH.show = true
ACH.displaytext = "Arcane Virginity"
ACH.reward = "20 WindStones"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "wizzy100"
ACH.long = "You're a wizard, Harry."
ACH.associatedstat = "arcane1"
ACH.statneeded = "100"
ACH.show = true
ACH.displaytext = "Cast 100 Bolts."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "wizzy500"
ACH.long = "Did you put your name in the goblet of fire?"
ACH.associatedstat = "arcane1"
ACH.statneeded = "500"
ACH.show = true
ACH.displaytext = "Cast 500 Bolts."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "wizzy1000"
ACH.long = "I'm not a wizard Hagrid!"
ACH.associatedstat = "arcane1"
ACH.statneeded = "1000"
ACH.show = true
ACH.displaytext = "Cast 1000 Bolts."
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "holdup"
ACH.long = "Stop crashing the server!"
ACH.show = true
ACH.displaytext = "Remover Tool 101"
ACH.associatedstat = "construction1"
ACH.statneeded = "1000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "holdup2"
ACH.long = "Constructor."
ACH.show = true
ACH.displaytext = "Construct 5000 props."
ACH.associatedstat = "construction1"
ACH.statneeded = "5000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "noholdup"
ACH.long = "Demolisher"
ACH.show = true
ACH.displaytext = "Deconstruct 1000 props"
ACH.associatedstat = "construction2"
ACH.statneeded = "1000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "noholdup2"
ACH.long = "Demolitionist"
ACH.show = true
ACH.displaytext = "Deconstruct 5000 props"
ACH.associatedstat = "construction2"
ACH.statneeded = "5000"
ACH.reward = "500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "missclick"
ACH.long = "OOF, Missclick!"
ACH.show = true
ACH.displaytext = "Kill a person"
ACH.associatedstat = "combat5"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "missclick5"
ACH.long = "Slayer"
ACH.show = true
ACH.displaytext = "Kill 5 people"
ACH.associatedstat = "combat5"
ACH.statneeded = "5"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "missclick50"
ACH.long = "Angry"
ACH.show = true
ACH.displaytext = "Kill 50 people"
ACH.associatedstat = "combat5"
ACH.statneeded = "50"
ACH.reward = "250 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "dieinpvp1"
ACH.long = "There was an attempt."
ACH.show = true
ACH.displaytext = "Die in PvP."
ACH.associatedstat = "combat6"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "dieinpvp5"
ACH.long = "I tried."
ACH.show = true
ACH.displaytext = "Die in PvP 5 times."
ACH.associatedstat = "combat6"
ACH.statneeded = "5"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "dieinpvp25"
ACH.long = "Died like a soldier, where he stood with honor."
ACH.show = true
ACH.displaytext = "Die in PvP 25 times."
ACH.associatedstat = "combat6"
ACH.statneeded = "25"
ACH.reward = "250 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "thirsty10"
ACH.long = "Thirsty"
ACH.show = true
ACH.displaytext = "Drink 10 water bottles."
ACH.associatedstat = "general1"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "berries10"
ACH.long = "Tastes like chicken.. wait what?"
ACH.show = true
ACH.displaytext = "Eat 10 berries."
ACH.associatedstat = "general2"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "berries100"
ACH.long = "Stranded."
ACH.show = true
ACH.displaytext = "Eat 100 berries."
ACH.associatedstat = "general2"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "berries1000"
ACH.long = "Stomach-ache."
ACH.show = true
ACH.displaytext = "Eat 1000 berries."
ACH.associatedstat = "general2"
ACH.statneeded = "1000"
ACH.reward = "250 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "sleepy10"
ACH.long = "Sleepy."
ACH.show = true
ACH.displaytext = "Sleep 10 times."
ACH.associatedstat = "general3"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "sleepy100"
ACH.long = "Shadow realm visitor."
ACH.show = true
ACH.displaytext = "Sleep 100 times."
ACH.associatedstat = "general3"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "sleepy1000"
ACH.long = "Coma."
ACH.show = true
ACH.displaytext = "Sleep 1000 times."
ACH.associatedstat = "general3"
ACH.statneeded = "1000"
ACH.reward = "500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "die1"
ACH.long = "Ouch"
ACH.show = true
ACH.displaytext = "Die Once."
ACH.associatedstat = "general5"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "die10"
ACH.long = "That hurt."
ACH.show = true
ACH.displaytext = "Die ten times."
ACH.associatedstat = "general5"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "die100"
ACH.long = "God dammit."
ACH.show = true
ACH.displaytext = "Die 100 times."
ACH.associatedstat = "general5"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "die500"
ACH.long = "FFS."
ACH.show = true
ACH.displaytext = "Die 500 times."
ACH.associatedstat = "general5"
ACH.statneeded = "500"
ACH.reward = "500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "relic1"
ACH.long = "Relic buster."
ACH.show = true
ACH.displaytext = "Open a relic."
ACH.associatedstat = "general11"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "relic10"
ACH.long = "Knowledge!"
ACH.show = true
ACH.displaytext = "Open 10 relics."
ACH.associatedstat = "general11"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "relic50"
ACH.long = "200IQ."
ACH.show = true
ACH.displaytext = "Open 50 relics."
ACH.associatedstat = "general11"
ACH.statneeded = "50"
ACH.reward = "500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "artifact1"
ACH.long = "What's this?"
ACH.show = true
ACH.displaytext = "Eat 1 artifact."
ACH.associatedstat = "general12"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "artifact5"
ACH.long = "I speak the moon runes."
ACH.show = true
ACH.displaytext = "Eat 5 artifacts."
ACH.associatedstat = "general12"
ACH.statneeded = "5"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "artifact50"
ACH.long = "Prospector."
ACH.show = true
ACH.displaytext = "Eat 50 artifacts."
ACH.associatedstat = "general12"
ACH.statneeded = "50"
ACH.reward = "250 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "gtoken1"
ACH.long = "Find a gtoken."
ACH.show = true
ACH.displaytext = "Find a gtoken."
ACH.associatedstat = "general13"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "gtoken750"
ACH.long = "Enough for a cache."
ACH.show = true
ACH.displaytext = "Find 750 gtokens."
ACH.associatedstat = "general13"
ACH.statneeded = "750"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "sgtoken50000"
ACH.long = "Gold Rush."
ACH.show = true
ACH.displaytext = "Spend 50000 gtokens."
ACH.associatedstat = "general14"
ACH.statneeded = "50000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodc100"
ACH.long = "Woody."
ACH.show = true
ACH.displaytext = "Collect 100 wood."
ACH.associatedstat = "woodcutting1"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodc500"
ACH.long = "Got Wood?"
ACH.show = true
ACH.displaytext = "Collect 500 wood."
ACH.associatedstat = "woodcutting1"
ACH.statneeded = "500"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodc1000"
ACH.long = "Chipper."
ACH.show = true
ACH.displaytext = "Collect 1000 wood."
ACH.associatedstat = "woodcutting1"
ACH.statneeded = "1000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodc5000"
ACH.long = "Lumberer."
ACH.show = true
ACH.displaytext = "Collect 5000 wood."
ACH.associatedstat = "woodcutting1"
ACH.statneeded = "5000"
ACH.reward = "750 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodf10"
ACH.long = "Timber!"
ACH.show = true
ACH.displaytext = "Fell 10 Trees."
ACH.associatedstat = "woodcutting2"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodf100"
ACH.long = "FU mother nature!"
ACH.show = true
ACH.displaytext = "Fell 100 Trees."
ACH.associatedstat = "woodcutting2"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodf5000"
ACH.long = "Canadian"
ACH.show = true
ACH.displaytext = "Fell 5000 Trees."
ACH.associatedstat = "woodcutting2"
ACH.statneeded = "5000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woodf1000"
ACH.long = "Amazon rainforest stands no chance."
ACH.show = true
ACH.displaytext = "Fell 1000 Trees."
ACH.associatedstat = "woodcutting2"
ACH.statneeded = "1000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woode1"
ACH.long = "OOoo."
ACH.show = true
ACH.displaytext = "Find enchanted wood."
ACH.associatedstat = "woodcutting3"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woode5"
ACH.long = "Shiny wood."
ACH.show = true
ACH.displaytext = "Find 5 enchanted wood."
ACH.associatedstat = "woodcutting3"
ACH.statneeded = "5"
ACH.reward = "1 Enchanted Wood"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woode50"
ACH.long = "My wood glows."
ACH.show = true
ACH.displaytext = "Find 50 enchanted wood."
ACH.associatedstat = "woodcutting3"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "woode100"
ACH.long = "Rainbow wood."
ACH.show = true
ACH.displaytext = "Find 100 enchanted wood."
ACH.associatedstat = "woodcutting3"
ACH.statneeded = "100"
ACH.reward = "5 Enchanted Wood"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "ored10"
ACH.long = "Depleter."
ACH.show = true
ACH.displaytext = "Deplete 10 ore deposits."
ACH.associatedstat = "mining7"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "ored100"
ACH.long = "Miner."
ACH.show = true
ACH.displaytext = "Deplete 100 ore deposits."
ACH.associatedstat = "mining7"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "ored1000"
ACH.long = "Arms are stronk."
ACH.show = true
ACH.displaytext = "Deplete 1000 ore deposits."
ACH.associatedstat = "mining7"
ACH.statneeded = "1000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "ored5000"
ACH.long = "I haven't seen daylight in years.."
ACH.show = true
ACH.displaytext = "Deplete 5000 ore deposits."
ACH.associatedstat = "mining7"
ACH.statneeded = "5000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "gems1"
ACH.long = "Oh, they come in different colours?"
ACH.show = true
ACH.displaytext = "Find a gem."
ACH.associatedstat = "mining8"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "gems10"
ACH.long = "Wedding ring."
ACH.show = true
ACH.displaytext = "Find 10 gems."
ACH.associatedstat = "mining8"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "gems50"
ACH.long = "Find me a priest!"
ACH.show = true
ACH.displaytext = "Find 50 gems."
ACH.associatedstat = "mining8"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "gems100"
ACH.long = "Gem Baron."
ACH.show = true
ACH.displaytext = "Find 100 gems."
ACH.associatedstat = "mining8"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "meteorc1"
ACH.long = "Dragon stones from heaven."
ACH.show = true
ACH.displaytext = "Collect a meteoric ore."
ACH.associatedstat = "mining13"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "meteorc10"
ACH.long = "The eye of the dragon"
ACH.show = true
ACH.displaytext = "Collect 10 meteoric ore."
ACH.associatedstat = "mining13"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "meteorc50"
ACH.long = "Draconic Forgery"
ACH.show = true
ACH.displaytext = "Collect 50 meteoric ore."
ACH.associatedstat = "mining13"
ACH.statneeded = "50"
ACH.reward = "3 Meteoric Ore"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "plants50"
ACH.long = "John Doe"
ACH.show = true
ACH.displaytext = "Plant 50 seeds."
ACH.associatedstat = "farming1"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "plants500"
ACH.long = "Welcome to the pypa fields"
ACH.show = true
ACH.displaytext = "Plant 500 seeds."
ACH.associatedstat = "farming1"
ACH.statneeded = "500"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "plants5000"
ACH.long = "Vietnam"
ACH.show = true
ACH.displaytext = "Plant 5000 seeds."
ACH.associatedstat = "farming1"
ACH.statneeded = "5000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "forage50"
ACH.long = "Can I smoke it?"
ACH.show = true
ACH.displaytext = "Forage 50 seeds."
ACH.associatedstat = "farming2"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "forage500"
ACH.long = "Seed master"
ACH.show = true
ACH.displaytext = "Forage 500 seeds."
ACH.associatedstat = "farming2"
ACH.statneeded = "500"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "forage5000"
ACH.long = "Seed baron"
ACH.show = true
ACH.displaytext = "Forage 5000 seeds."
ACH.associatedstat = "farming2"
ACH.statneeded = "5000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "forage10000"
ACH.long = "Foraging King"
ACH.show = true
ACH.displaytext = "Forage 10000 seeds."
ACH.associatedstat = "farming2"
ACH.statneeded = "10000"
ACH.reward = "750 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "goldm1"
ACH.long = "Golden"
ACH.show = true
ACH.displaytext = "Eat a gold melon."
ACH.associatedstat = "farming3"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "goldm10"
ACH.long = "Better than chicken."
ACH.show = true
ACH.displaytext = "Eat 10 gold melons."
ACH.associatedstat = "farming3"
ACH.statneeded = "10"
ACH.reward = "250 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "losefish10"
ACH.long = "Slippery bastard"
ACH.show = true
ACH.displaytext = "Lose 10 fish."
ACH.associatedstat = "fishing2"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "losefish100"
ACH.long = "Slipped out of my grasp.."
ACH.show = true
ACH.displaytext = "Lose 100 fish."
ACH.associatedstat = "fishing2"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "losefish1000"
ACH.long = "Fish repellent"
ACH.show = true
ACH.displaytext = "Lose 1000 fish."
ACH.associatedstat = "fishing2"
ACH.statneeded = "1000"
ACH.reward = "250 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "craft1"
ACH.long = "First tool!"
ACH.show = true
ACH.displaytext = "Craft a tool."
ACH.associatedstat = "smithing1"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "craft10"
ACH.long = "Smith the Smither"
ACH.show = true
ACH.displaytext = "Craft 10 tools."
ACH.associatedstat = "smithing1"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "craft100"
ACH.long = "Molten iron"
ACH.show = true
ACH.displaytext = "Craft 100 tools."
ACH.associatedstat = "smithing1"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "craft1000"
ACH.long = "Lungs made of asbestos"
ACH.show = true
ACH.displaytext = "Craft 1000 tools."
ACH.associatedstat = "smithing1"
ACH.statneeded = "1000"
ACH.reward = "1000 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cookery10"
ACH.long = "Beginner chef"
ACH.show = true
ACH.displaytext = "Cook 10 total food items."
ACH.associatedstat = "cooking9"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cookery100"
ACH.long = "Cookery Professional"
ACH.show = true
ACH.displaytext = "Cook 100 total food items."
ACH.associatedstat = "cooking9"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "cookery1000"
ACH.long = "Specialist Chef"
ACH.show = true
ACH.displaytext = "Cook 1000 total food items."
ACH.associatedstat = "cooking9"
ACH.statneeded = "1000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "structurem5"
ACH.long = "Builder"
ACH.show = true
ACH.displaytext = "Make 5 structures."
ACH.associatedstat = "construction3"
ACH.statneeded = "5"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "structurem50"
ACH.long = "Decorator"
ACH.show = true
ACH.displaytext = "Make 50 structures."
ACH.associatedstat = "construction3"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "structurem500"
ACH.long = "Structural designer"
ACH.show = true
ACH.displaytext = "Make 500 structures."
ACH.associatedstat = "construction3"
ACH.statneeded = "500"
ACH.reward = "500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "antlion10"
ACH.long = "Bring me its head!"
ACH.show = true
ACH.displaytext = "Kill 10 antlions."
ACH.associatedstat = "combat1"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "antlion100"
ACH.long = "I fear no ant, no lion."
ACH.show = true
ACH.displaytext = "Kill 100 antlions."
ACH.associatedstat = "combat1"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "antlion1000"
ACH.long = "Ground Thumper"
ACH.show = true
ACH.displaytext = "Kill 1000 antlions."
ACH.associatedstat = "combat1"
ACH.statneeded = "1000"
ACH.reward = "500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "pbrew1"
ACH.long = "Brewing 101"
ACH.show = true
ACH.displaytext = "Brew a potion."
ACH.associatedstat = "alchemy1"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "pbrew50"
ACH.long = "Witch"
ACH.show = true
ACH.displaytext = "Brew 50 potions."
ACH.associatedstat = "alchemy1"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "pbrew500"
ACH.long = "Alchemical breakthrough"
ACH.show = true
ACH.displaytext = "Brew 500 potions."
ACH.associatedstat = "alchemy1"
ACH.statneeded = "500"
ACH.reward = "250 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "pdrink5"
ACH.long = "I feel funny.."
ACH.show = true
ACH.displaytext = "Drink 5 potions."
ACH.associatedstat = "alchemy2"
ACH.statneeded = "5"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "pdrink50"
ACH.long = "*Gulp*"
ACH.show = true
ACH.displaytext = "Drink 50 potions."
ACH.associatedstat = "alchemy2"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "pdrink500"
ACH.long = "Druggie"
ACH.show = true
ACH.displaytext = "Drink 500 potions."
ACH.associatedstat = "alchemy2"
ACH.reward = "250 GTokens"
ACH.statneeded = "500"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "transmute100"
ACH.long = "Using earths energy"
ACH.show = true
ACH.displaytext = "Transmute 100 items."
ACH.associatedstat = "alchemy4"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "transmute5000"
ACH.long = "Magician"
ACH.show = true
ACH.displaytext = "Transmute 5000 items."
ACH.associatedstat = "alchemy4"
ACH.statneeded = "5000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "tp1"
ACH.long = "Nothing personal, kid"
ACH.show = true
ACH.displaytext = "Use a teleport spell."
ACH.associatedstat = "arcane2"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "tp50"
ACH.long = "Omae wa, moe shinderu."
ACH.show = true
ACH.displaytext = "Use a teleport spell 50 times."
ACH.associatedstat = "arcane2"
ACH.statneeded = "50"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "tp500"
ACH.long = "NANI?"
ACH.show = true
ACH.displaytext = "Use a teleport spell 500 times."
ACH.associatedstat = "arcane2"
ACH.statneeded = "500"
ACH.reward = "500 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "bloodzombie10"
ACH.long = "Bloody zombies"
ACH.show = true
ACH.displaytext = "Kill 10 blood zombies"
ACH.associatedstat = "bloodmoon2"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "bloodzombie100"
ACH.long = "Bloodier zombies"
ACH.show = true
ACH.displaytext = "Kill 100 blood zombies"
ACH.associatedstat = "bloodmoon2"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "bloodzombie1000"
ACH.long = "Bloodiest zombies"
ACH.show = true
ACH.displaytext = "Kill 1000 blood zombies"
ACH.associatedstat = "bloodmoon2"
ACH.statneeded = "1000"
ACH.reward = "1000 GTokens"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "afk10"
ACH.long = "ResidentSleeper"
ACH.show = true
ACH.displaytext = "Spend 10 minutes total AFK."
ACH.associatedstat = "time2"
ACH.statneeded = "10"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "afk60"
ACH.long = "Idle 'R' Us"
ACH.show = true
ACH.displaytext = "Be AFK for 60 minutes"
ACH.associatedstat = "time2"
ACH.statneeded = "60"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "afk1440"
ACH.long = "I'll be back..."
ACH.show = true
ACH.displaytext = "Be AFK for a day"
ACH.associatedstat = "time2"
ACH.statneeded = "1440"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "burn1"
ACH.long = "Little less time on the stove, next!"
ACH.show = true
ACH.displaytext = "Burn a fish"
ACH.associatedstat = "cooking5"
ACH.statneeded = "1"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "burn100"
ACH.long = "Burn, baby burn"
ACH.show = true
ACH.displaytext = "Burn 100 fish"
ACH.associatedstat = "cooking5"
ACH.statneeded = "100"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "burn1000"
ACH.long = "Burn, baby burn"
ACH.show = true
ACH.displaytext = "Burn 1000 fish"
ACH.associatedstat = "cooking5"
ACH.statneeded = "1000"
Achievement_RegisterAchievement( ACH )

local ACH = {}
ACH.short = "burn5000"
ACH.long = "Not so fresh anymore"
ACH.show = true
ACH.displaytext = "Burn 5000 fish"
ACH.associatedstat = "cooking5"
ACH.statneeded = "5000"
ACH.reward = "1000 GTokens"
Achievement_RegisterAchievement( ACH )