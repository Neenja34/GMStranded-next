--if true then return end

SGS.eggtable = {}

SGS.maxeggs = 35
SGS.eggrespawn = 60
SGS.iseaster = true


concommand.Add( "sgs_createegglist", function( ply )
	if IsValid( ply ) and !ply:IsAdmin() then return end
	SGS.eggtable = {}
	for k, v in pairs( ents.FindByClass("gms_easteregg") ) do
		local entry = {}
		local pos = v:GetPos()
		local ang = v:GetAngles()
		
		entry["pos"] = pos.x.." "..pos.y.." "..pos.z
		entry["ang"] = ang.p.." "..ang.y.." "..ang.r
		
		SGS.eggtable[#SGS.eggtable + 1] = entry
	end
	
	
	file.Write("sgstranded/egglist.txt",util.TableToJSON(SGS.eggtable, true))
end)

function SGS_LoadEggList()

	if !file.Exists("sgstranded/egglist.txt", "DATA") then return end
	ServerLog("Loading Egg List\n")
	SGS.eggtable = util.JSONToTable(file.Read("sgstranded/egglist.txt", �DATA�))

end
timer.Simple( 1, SGS_LoadEggList )

function SGS_SpawnEgg()
	if SGS.iseaster == false then return end
	if #ents.FindByClass("gms_easteregg") >= SGS.maxeggs then
		return
	end
	
	local e = math.random( #SGS.eggtable )
	local pos = string.Explode( " ", SGS.eggtable[e]["pos"] )
	
	pos = Vector(tonumber(pos[1]),tonumber(pos[2]),tonumber(pos[3]))
	
	local ang = string.Explode( " ", SGS.eggtable[e]["ang"] )
	ang = Angle(tonumber(ang[1]),tonumber(ang[2]),tonumber(ang[3]))
	
	for k, v in pairs( ents.FindInSphere( pos, 5 ) ) do
		if v:GetClass() == "gms_easteregg" then
			ServerLog("Can't place egg here: Near another egg\n")
			timer.Simple( 5, SGS_SpawnEgg )
			return
		end
		
		if v:IsPlayer() then
			ServerLog("Can't place egg here: Near Player\n")
			SGS_SpawnEgg()
			return		
		end
	end
	
	local egg = ents.Create( "gms_easteregg" )
	egg:SetPos(pos)
	egg:SetAngles(ang)
	egg:Spawn()
	egg:SetNWString("Owner", "World")
	ServerLog("Placing egg at location: " .. tostring(egg:GetPos()) .. "\n")
	SafeRemoveEntityDelayed( egg, 600 )
end

function SGS_EasterEggSpawning()
	if SGS.iseaster == false then return end
	SGS_SpawnEgg()
end
timer.Create( "SGS_EasterEggSpawning", SGS.eggrespawn, 0, SGS_EasterEggSpawning )

function SGS_OpenEasterEgg( ply )
	if ply:GetResource("Package") <= 0 then return end
	
	local tier = math.random(1,100)
	if tier <= 65 then
		SGS_AwardEasterTier( ply, 0 )
	elseif tier > 65 and tier <= 80 then
		SGS_AwardEasterTier( ply, 1 )
	elseif tier > 80 and tier <= 88 then
		SGS_AwardEasterTier( ply, 2 )
	elseif tier > 88 and tier <= 94 then
		SGS_AwardEasterTier( ply, 3 )
	elseif tier > 94 and tier <= 99 then
		SGS_AwardEasterTier( ply, 4 )
	else
		SGS_AwardEasterTier( ply, 5 )
	end
	ply:SubResource( "Package", 1 )
end

function SGS_AwardEasterTier( ply, tier )

	if tier == 0 then
		local t = { "pypa_seed", "jelly_beans", "red_liquorice", "cotton_candy", "gummy_bears", "marshmallow_peeps" }
		ply:AddResource( t[math.random(#t)], 5 )
	
	elseif tier == 1 then
		local m = math.random(4)
		if m == 1 then
			ply:GiveGTokens(math.random(2, 10))
		elseif m == 2 then
			ply:AddResource( "aid_pack", 2 )
		elseif m == 3 then
			local s = SGS.skills[math.random(#SGS.skills)] .. "_relic_1"
			ply:AddResource( s, 1 )
		elseif m == 4 then
			local t = { "wind", "water", "earth", "fire" }
			local s = t[math.random(#t)] .. "_stone"
			ply:AddResource( s, math.random(5) )
		end
	
	elseif tier == 2 then
		local m = math.random(4)
		if m == 1 then
			ply:GiveGTokens(math.random(10, 15))
		elseif m == 2 then
			local t = { "white", "yellow", "black", "orange", "green", "blue", "brown", "gray" }
			local s = t[math.random(#t)] .. "_pet_egg"
			ply:AddResource( s, 1 )
		elseif m == 3 then
			local s = SGS.skills[math.random(#SGS.skills)] .. "_relic_2"
			ply:AddResource( s, 1 )
		elseif m == 4 then
			local t = { "chaos", "nature", "cosmic" }
			local s = t[math.random(#t)] .. "_stone"
			ply:AddResource( s, math.random(5) )
		end	
	
	elseif tier == 3 then
		local m = math.random(4)
		if m == 1 then
			ply:GiveGTokens(math.random(15, 20))
		elseif m == 2 then
			ply:AddResource( "sapphire", 1 )
		elseif m == 3 then
			ply:AddResource( "emerald", 1 )
		elseif m == 4 then
			local t = { "inert" }
			local s = t[math.random(#t)] .. "_stone"
			ply:AddResource( s, math.random(5, 10) )
		end
	
	elseif tier == 4 then
		local m = math.random(3)
		if m == 1 then
			ply:GiveGTokens(math.random(20, 40))
		elseif m == 2 then
			local t = { "white", "yellow", "black", "orange", "green", "blue", "brown", "gray" }
			local s = t[math.random(#t)] .. "_pet_egg"
			ply:AddResource( s, 1 )
		elseif m == 3 then
			ply:AddResource( "ruby", 1 )
		end
			
	elseif tier == 5 then
		local m = math.random(3)
		if m == 1 then
			ply:GiveGTokens(50)
		elseif m == 2 then
			local t = { "red" }
			local s = t[math.random(#t)] .. "_pet_egg"
			ply:AddResource( s, 1 )
		elseif m == 3 then
			ply:AddResource( "diamond", 1 )
		end	
		
	end
end

concommand.Add( "sgs_starteaster", function( ply )
	if IsValid( ply ) and !ply:IsAdmin() then return end
	SGS.iseaster = true
	for i=1, SGS.maxeggs - #ents.FindByClass("gms_easteregg") do
		SGS_SpawnEgg()
	end
end)

concommand.Add( "sgs_stopeaster", function( ply )
	if IsValid( ply ) and !ply:IsAdmin() then return end
	SGS.iseaster = false
	for k, v in pairs( ents.FindByClass( "gms_easteregg" ) ) do
		v:Remove()
	end
end)

concommand.Add( "spawnegg", function( ply )
	if IsValid( ply ) and !ply:IsAdmin() then return end
	local tr = ply:TraceFromEyes(140)
	
	local egg = ents.Create("gms_easteregg")
	egg:SetPos( tr.HitPos )
	egg:Spawn()
	
end)
