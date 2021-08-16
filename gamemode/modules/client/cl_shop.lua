local minDist = 360000
local maxDist = 4000000

local black = Color( 0, 0, 0, 255 )
local gray = Color( 100, 200, 200, 255 )

function DrawShopName()

	local mepos = LocalPlayer():GetPos()

	for k, v in pairs( ents.FindByClass( "npc_vortigaunt" ) ) do

		if v:GetNWBool( "ispet" ) == true then continue end

		local tpos = v:GetPos()
		local dist = mepos:DistToSqr( tpos )
		local pos = ( v:GetPos() + Vector( 0, 0, v:OBBMaxs().z + 15 ) ):ToScreen()

		if dist < minDist then

			draw.SimpleTextOutlined( "Vorty", "SGS_HUD3", pos.x, pos.y - 25, gray, 1, 1, 1, black )
			draw.SimpleTextOutlined( "[GToken Vendor]", "SGS_HUD3", pos.x, pos.y - 10, gray, 1, 1, 1, black )

		elseif dist < maxDist then

			draw.RoundedBoxEx( 2, pos.x - 4, pos.y - 4, 8, 8, gray, true, true, true, true )

		end

	end

	for k, v in pairs( ents.FindByClass( "npc_gman" ) ) do

		if v:GetNWBool( "ispet" ) == true then continue end

		local tpos = v:GetPos()
		local dist = mepos:DistToSqr( tpos )
		local pos = ( v:GetPos() + Vector( 0, 0, v:OBBMaxs().z + 15 ) ):ToScreen()

		if dist < minDist then

			draw.SimpleTextOutlined( "The President", "SGS_HUD3", pos.x, pos.y - 25, gray, 1, 1, 1, black )
			draw.SimpleTextOutlined( "[Quest Rewards]", "SGS_HUD3", pos.x, pos.y - 10, gray, 1, 1, 1, black )

		elseif dist < maxDist then

			draw.RoundedBoxEx( 2, pos.x - 4, pos.y - 4, 8, 8, gray, true, true, true, true )

		end

	end

	for k, v in pairs( ents.FindByClass( "npc_breen" ) ) do

		if v:GetNWBool( "ispet" ) == true then continue end

		local tpos = v:GetPos()
		local dist = mepos:DistToSqr( tpos )
		local pos = ( v:GetPos() + Vector( 0, 0, v:OBBMaxs().z + 15 ) ):ToScreen()

		if dist < minDist then

			draw.SimpleTextOutlined( "Dr. Breen", "SGS_HUD3", pos.x, pos.y - 25, gray, 1, 1, 1, black )
			draw.SimpleTextOutlined( "[Holiday Vendor]", "SGS_HUD3", pos.x, pos.y - 10, gray, 1, 1, 1, black )

		elseif dist < maxDist then

			draw.RoundedBoxEx( 2, pos.x - 4, pos.y - 4, 8, 8, gray, true, true, true, true )

		end

	end

	for k, v in pairs( ents.FindByClass( "npc_kleiner" ) ) do

		if v:GetNWBool( "ispet" ) == true then continue end

		local tpos = v:GetPos()
		local dist = mepos:DistToSqr( tpos )
		local pos = ( v:GetPos() + Vector( 0, 0, v:OBBMaxs().z + 15 ) ):ToScreen()

		if dist < minDist then

			draw.SimpleTextOutlined( "Dr. K", "SGS_HUD3", pos.x, pos.y - 25, gray, 1, 1, 1, black )
			draw.SimpleTextOutlined( "[Hat Salesman]", "SGS_HUD3", pos.x, pos.y - 10, gray, 1, 1, 1, black )

		elseif dist < maxDist then

			draw.RoundedBoxEx( 2, pos.x - 4, pos.y - 4, 8, 8, gray, true, true, true, true )

		end

	end

end
hook.Add( "HUDPaint", "DrawShopName", DrawShopName )