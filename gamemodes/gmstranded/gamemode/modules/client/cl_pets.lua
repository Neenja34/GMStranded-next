function SGS_PetNameMenu()

	PetNameMenu = vgui.Create( "DFrame" )
	PetNameMenu:ShowCloseButton(false)
	PetNameMenu:SetDraggable(false)
	PetNameMenu:SetSize( 200, 110 )
	PetNameMenu:SetTitle("")
	PetNameMenu:SetPos( ScrW() / 2 - 75, ScrH() / 2 - 75 )
	PetNameMenu:MakePopup()

	local label = vgui.Create("DLabel", PetNameMenu)
	label:SetPos( 10, 25 )
	label:SetText("Your egg has hatched!")
	label:SizeToContents()

	local label2 = vgui.Create("DLabel", PetNameMenu)
	label2:SetPos( 10, 40 )
	label2:SetText("Please name your new pet.")
	label2:SizeToContents()

	local line1 = vgui.Create("DTextEntry", PetNameMenu)
	line1:SetSize( 180, 20 )
	line1:SetPos( 10, 60 )

	local button = vgui.Create( "DButton", PetNameMenu )
	button:SetSize( 50, 15 )
	button:SetPos( 10, 90 )
	button:SetText( "Submit" )
	button.DoClick = function( button )
		if line1:GetValue() == "" then return end
		RunConsoleCommand("sgs_namepet", line1:GetValue())
		PetNameMenu:SetVisible(false)
	end

	PetNameMenu:SetVisible(true)

end

local black = Color( 0, 0, 0, 255 )
local blue = Color( 80, 80, 190, 255 )
local orange = Color( 255, 80, 50, 255 )
local green = Color( 60, 220, 60, 255 )

local minDist = 360000
local maxDist = 4000000

function DrawPetTitle()

	for k, v in pairs( ents.FindInSphere( LocalPlayer():GetPos(), 2000 ) ) do

		if v:GetNWBool("ispet") == false then continue end

		local mepos = LocalPlayer():GetPos()
		local tpos = v:GetPos()
		local dist = mepos:DistToSqr( tpos )
		local pos = ( v:GetPos() + Vector( 0, 0, v:OBBMaxs().z + 15 ) ):ToScreen()

		if dist < minDist then

			draw.SimpleTextOutlined( v:GetNWString("petname"), "SGS_HUD3", pos.x, pos.y - 35, blue, 1, 1, 1, black )
			draw.SimpleTextOutlined("<" .. v:GetNWString("ownername") .. "'s Pet" .. ">", "SGS_HUD3", pos.x, pos.y - 20, blue, 1, 1, 1, black )
			draw.SimpleTextOutlined("<Age: " .. v:GetNWInt("age", 1) .. ">", "SGS_HUD3", pos.x, pos.y - 5, green, 1, 1, 1, black )
			if v:GetNWBool("famished", false) then
				draw.SimpleTextOutlined("**FAMISHED**", "SGS_HUD3", pos.x, pos.y + 10, orange, 1, 1, 1, black )
			end

		elseif dist < maxDist then

			draw.RoundedBoxEx( 2, pos.x - 4, pos.y - 4, 8, 8, blue, true, true, true, true )

		end

	end

end
hook.Add("HUDPaint", "DrawPetTitle", DrawPetTitle)

function SGS_PetsDieKeepSize( npc, ragdoll )

	if npc:GetNWBool("ispet") then
		ragdoll:SetModelScale( npc:GetNWFloat("size", 1.0), 0 )
	end

end
hook.Add("CreateClientsideRagdoll", "SGS_PetsDieKeepSize", SGS_PetsDieKeepSize)