function HideHUD(name)
	for k, v in pairs( { "CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", "CHudWeaponSelection", "CHudHistoryResource", "CHudCrosshair" } ) do
		if name == v then return false end
	end
end
hook.Add( "HUDShouldDraw", "HideHUD", HideHUD )

local white = Color( 255, 255, 255, 255 )
local black = Color( 0, 0, 0, 210 )
local gray = Color( 120, 120, 120, 255 )
local red = Color( 255, 0, 0, 255 )
local cyan = Color( 0, 255, 255, 255 )

surface.CreateFont( "SGS_NEWHUD1", {
	font	=	"tahoma",
	size	=	12
	}
)

surface.CreateFont( "SGS_NEWHUD5", {
	font	=	"tahoma",
	size	=	12,
	weight	=	800
	}
)

surface.CreateFont( "SGS_NEWHUD2", {
	font	=	"tahoma",
	size	=	14,
	weight	=	800
	}
)

surface.CreateFont( "SGS_NEWHUD3", {
	font	=	"tahoma",
	size	=	17,
	weight	=	800
	}
)

surface.CreateFont( "SGS_NEWHUD4", {
	font	=	"tahoma",
	size	=	17,
	weight	=	200
	}
)

function SGS_GetTotalSurvivalLevels()

	local total = SGS.levels[ "woodcutting" ] +
	SGS.levels[ "mining" ] +
	SGS.levels[ "construction" ] +
	SGS.levels[ "smithing" ] +
	SGS.levels[ "farming" ] +
	SGS.levels[ "fishing" ] +
	SGS.levels[ "cooking" ] +
	SGS.levels[ "combat" ] +
	SGS.levels[ "alchemy" ] +
	SGS.levels[ "arcane" ] - 10
	return total

end

CreateClientConVar( "sgs_enablehudnumbers", "0", true, false )
hungerIcon = Material( "vgui/hud/hunger.png", "noclamp smooth" )
thirstIcon = Material( "vgui/hud/thirst.png", "noclamp smooth" )
energyIcon = Material( "vgui/hud/energy.png" )
healthIcon = Material( "vgui/hud/health.png" )
playerIcon = Material( "vgui/hud/player.png" )
tribeIcon = Material( "vgui/hud/tribe.png" )
coinsIcon = Material( "vgui/hud/coins.png" )
oxygenIcon = Material( "vgui/hud/oxygen.png" )
potionIcon = Material( "vgui/hud/potion.png" )
houseIcon = Material( "vgui/hud/house.png" )
bleedIcon = Material( "vgui/hud/blood.png" )
brokenIcon = Material( "vgui/hud/brokenbone.png" )
melonaidsIcon = Material( "vgui/hud/melonaids.png" )

function SGS_DrawHUD()

	if SGS.accepttos == false then return end
	if LocalPlayer().showKeybinds == nil then
		LocalPlayer().showKeybinds = true
	end

	local lastExp = SGS.last_skill_exp or "mining"
	local skillFade = SGS.skillFade or 1
	--Drawing the Needs Bars
	local x = 6
	local y = ScrH() - 6

	--Drawing all of the outter boxes
	surface.SetDrawColor( black )
	surface.DrawRect( x, y - 68, 68, 68 ) --Icon Outter

	surface.DrawRect( x + 72, y - 68, 160, 20 ) --Hunger Outter
	surface.DrawRect( x + 102, y - 65, 127, 14 ) --Hunger Inner

	surface.DrawRect( x + 72, y - 44, 160, 20 ) --Thirst Outter
	surface.DrawRect( x + 102, y - 41, 127, 14 ) --Thirst Inner

	surface.DrawRect( x + 72, y - 20, 160, 20 ) --Energy Outter
	surface.DrawRect( x + 102, y - 17, 127, 14 ) --Energy Inner

	surface.DrawRect( x, y - 98, 232, 26 ) 		--Health Outter
	surface.DrawRect( x + 26, y - 94, 202, 18 ) --Health Inner

	surface.DrawRect( x, y - 122, 160, 20 ) 	--Tribe Outter
	surface.DrawRect( x + 26, y - 119, 131, 14 ) --Tribe Inner

	surface.DrawRect( x, y - 146, 160, 20 )		--Name Outter
	surface.DrawRect( x + 26, y - 143, 131, 14 ) --Name Inner

	surface.DrawRect( ScrW() - 406, y - 106, 400, 106 ) --Minconsole Outter
	surface.DrawRect( ScrW() - 403, y - 103, 394, 100 ) --Minconsole Inner

	surface.DrawRect( ScrW() - 406, y - 140, 400, 30 ) --Survival Level Outt1er
	surface.DrawRect( ScrW() - 403, y - 125, 394, 12 ) --Survival Level Bar Inner

	surface.SetDrawColor( 0, 0, 0, 210 * skillFade )
	surface.DrawRect( ScrW() - 406, y - 187, 400, 43 ) --Skill Level Outter
	surface.DrawRect( ScrW() - 403, y - 159, 394, 12 ) --Skill Level Bar Inner

	surface.SetDrawColor( black )
	surface.DrawRect( ScrW() - 102, 6, 96, 115 ) --Clock Outter
	surface.DrawRect( ScrW() - 99, 9, 90, 20 ) --Clock Inner 1
	surface.DrawRect( ScrW() - 99, 49, 90, 20 ) --Clock Inner 2
	surface.DrawRect( ScrW() - 99, 98, 90, 20 ) --Clock Inner 3

	if LocalPlayer().showKeybinds then
		surface.DrawRect( x, 6, 126, 126 ) --Keybinds Outter
		surface.DrawRect( x + 3, 9, 120, 20 ) --Keybinds Inner
	end

	--Icons
	surface.SetDrawColor( white )
	surface.SetMaterial( hungerIcon	)
	surface.DrawTexturedRect( x + 80, y - 65, 14, 14 )
	surface.SetMaterial( thirstIcon	)
	surface.DrawTexturedRect( x + 80, y - 41, 14, 14 )
	surface.SetMaterial( energyIcon	)
	surface.DrawTexturedRect( x + 82, y - 17, 10, 14 )
	surface.SetMaterial( healthIcon	)
	surface.DrawTexturedRect( x + 5, y - 93, 16, 16 )
	surface.SetMaterial( playerIcon	)
	surface.DrawTexturedRect( x + 5, y - 143, 16, 16 )
	surface.SetMaterial( tribeIcon )
	surface.DrawTexturedRect( x + 5, y - 119, 16, 16 )
	surface.SetMaterial( coinsIcon )
	surface.DrawTexturedRect( ScrW() - 90 , 74, 16, 16 )

	if LocalPlayer():Sheltered() then
		surface.SetDrawColor( 255, 255, 255, 180 )
		surface.SetMaterial( houseIcon )
		surface.DrawTexturedRect( 5 , y - 180, 32, 32 )
	end

	if LocalPlayer().bleeding then
		surface.SetDrawColor( 250, 180, 180, 180 )
		surface.SetMaterial( bleedIcon )
		surface.DrawTexturedRect( 38 , y - 180, 32, 32 )
	end

	if LocalPlayer().brokenleg then
		surface.SetDrawColor( 255, 255, 255, 180 )
		surface.SetMaterial( brokenIcon	)
		surface.DrawTexturedRect( 70 , y - 175, 24, 24 )
	end

	if LocalPlayer().melonaids then
		surface.SetDrawColor( 255, 255, 255, 200 )
		surface.SetMaterial( melonaidsIcon )
		surface.DrawTexturedRect( 100 , y - 175, 24, 24 )
	end

	if ( SGS.o2show or false ) == true then
		-- Oxygen Meter
		surface.SetDrawColor( black )
		surface.DrawRect( x + 235, y - 20, 160, 20 ) --Oxygen Outter
		surface.DrawRect( x + 265, y - 17, 127, 14 ) --Oxygen Inner
		surface.SetDrawColor( white )
		surface.SetMaterial( oxygenIcon	)
		surface.DrawTexturedRect( x + 242, y - 18, 16, 16 )
		surface.SetDrawColor( 0, 255, 255, 210 )
		local barlen = ( SGS.o2 / SGS.maxneeds ) * 127
		surface.DrawRect( x + 265, y - 17, barlen, 14 ) --Oxygen Meter
	end

	if ( LocalPlayer():GetNWBool( "potionshow", false ) or false ) == true then
		-- Potion Meter
		surface.SetDrawColor( black )
		surface.DrawRect( x + 235, y - 44, 160, 20 ) --Potion Outter
		surface.DrawRect( x + 265, y - 41, 127, 14 ) --Potion Inner
		surface.SetDrawColor( white )
		surface.SetMaterial( potionIcon	)
		surface.DrawTexturedRect( x + 242, y - 42, 16, 16 )
		surface.SetDrawColor( 255, 80, 255, 210 )
		local barlen = ( LocalPlayer():GetNWInt( "potionendtime", CurTime() ) - CurTime() ) / LocalPlayer():GetNWInt( "potiontime", CurTime() ) * 127
		surface.DrawRect( x + 265, y - 41, barlen, 14 )
	end

	--Health Bar
	surface.SetDrawColor( 255, 50, 50, 255 )
	local w = ( LocalPlayer():Health() / LocalPlayer():GetMaxHealth() ) * 202
	surface.DrawRect( x + 26, y - 94, w, 18 ) --Health Inner

	--Hunger Bar
	surface.SetDrawColor( 45, 190, 45, 255 )
	local w = ( SGS.needs[ "hunger" ] / SGS.maxneeds ) * 127
	surface.DrawRect( x + 102, y - 65, w, 14 )

	--Thirst Bar
	surface.SetDrawColor( 120, 220, 255, 255 )
	local w = ( SGS.needs[ "thirst" ] / SGS.maxneeds ) * 127
	surface.DrawRect( x + 102, y - 41, w, 14 )

	--Energy Bar
	surface.SetDrawColor( 220, 220, 0, 255 )
	local w = ( SGS.needs[ "fatigue" ] / SGS.maxneeds ) * 127
	surface.DrawRect( x + 102, y - 17, w, 14 )

	if GetConVar( "sgs_enablehudnumbers" ):GetBool() then

		surface.SetFont( "SGS_NEWHUD2" )
		local message = math.Clamp( math.ceil( ( LocalPlayer():Health() / LocalPlayer():GetMaxHealth() ) * 100 ), 0, 100 ) .. "%"
		local w, _ = surface.GetTextSize( message )
		surface.SetTextColor( gray )
		surface.SetTextPos( x + 134 - ( w / 2 ), y - 93 )
		surface.DrawText( message )

		surface.SetFont( "SGS_NEWHUD2" )
		local message = math.ceil( ( SGS.needs[ "hunger" ] / SGS.maxneeds ) * 100 ) .. "%"
		local w, _ = surface.GetTextSize( message )
		surface.SetTextColor( gray )
		surface.SetTextPos( x + 170 - ( w / 2 ), y - 65 )
		surface.DrawText( message )

		surface.SetFont( "SGS_NEWHUD2" )
		local message = math.ceil( ( SGS.needs[ "thirst" ] / SGS.maxneeds ) * 100 ) .. "%"
		local w, _ = surface.GetTextSize( message )
		surface.SetTextColor( gray )
		surface.SetTextPos( x + 170 - ( w / 2 ), y - 41 )
		surface.DrawText( message )

		surface.SetFont( "SGS_NEWHUD2" )
		local message = math.ceil( ( SGS.needs[ "fatigue" ] / SGS.maxneeds ) * 100 ) .. "%"
		local w, _ = surface.GetTextSize( message )
		surface.SetTextColor( gray )
		surface.SetTextPos( x + 170 - ( w / 2 ), y - 17 )
		surface.DrawText( message )

	end

	--Survival Exp Bar
	local curLvl = SGS_GetTotalSurvivalLevels()
	surface.SetDrawColor( 150, 200, 0, 255 )
	local clvlexp = ( SGS.levels[ "survival" ] - 1 ) * 20
	local nextexp = SGS.levels[ "survival" ] * 20
	local w = ( ( SGS_GetTotalSurvivalLevels() - clvlexp ) / ( nextexp - clvlexp ) ) * 394
	surface.DrawRect( ScrW() - 403, y - 125, w, 12 )

	--Skill Exp Bar
	surface.SetDrawColor( SGS.colors[ lastExp ].r, SGS.colors[ lastExp ].g, SGS.colors[ lastExp ].b, 100 * skillFade )
	local w = ( ( SGS.exp[ lastExp ] - SGS.explist[ SGS.levels[ lastExp ] ] ) / ( SGS.explist[ SGS.levels[ lastExp ] + 1 ] - SGS.explist[ SGS.levels[ lastExp ] ] ) ) * 394
	surface.DrawRect( ScrW() - 403, y - 159, w, 12 )
	local w2 = ( ( SGS.last_skill_amt or 0 ) / ( SGS.explist[ SGS.levels[ lastExp ] + 1 ] - SGS.explist[ SGS.levels[ lastExp ] ] ) ) * 394
	if w2 > w then w2 = w end
	surface.SetDrawColor( SGS.colors[ lastExp ].r, SGS.colors[ lastExp ].g, SGS.colors[ lastExp ].b, 255 * skillFade )
	surface.DrawRect( ScrW() - 403 + w - w2, y - 159, w2, 12 )

	--Player Name
	surface.SetFont( "SGS_NEWHUD1" )
	surface.SetTextColor( white )
	surface.SetTextPos( x + 28, y - 142 )
	surface.DrawText( LocalPlayer():GetName() )

	--Tribe Name
	surface.SetFont( "SGS_NEWHUD1" )
	surface.SetTextColor( team.GetColor( LocalPlayer():Team() ) )
	surface.SetTextPos( x + 28, y - 118 )
	surface.DrawText( team.GetName( LocalPlayer():Team() ) )

	--Survival Level Text
	surface.SetFont( "SGS_NEWHUD5" )
	surface.SetTextColor( white )
	surface.SetTextPos( ScrW() - 399, y - 138 )
	surface.DrawText( "Survival lvl: " .. SGS.levels[ "survival" ] )
	local message = curLvl .. " / " .. SGS.levels[ "survival" ] * 20
	local w, _ = surface.GetTextSize( message )
	surface.SetTextPos( ScrW() - 406 + 200 - ( w / 2 ), y - 138 )
	surface.DrawText( message )

	--Skill Level Text
	surface.SetFont( "SGS_NEWHUD5" )
	surface.SetTextColor( Color( 255, 255, 255, 255 * skillFade ) )
	surface.SetTextPos( ScrW() - 399, y - 175 )
	surface.DrawText( "lvl: " .. SGS.levels[ lastExp ] )
	local message = SGS.exp[ lastExp ] .. " / " .. SGS.explist[ SGS.levels[ lastExp ] + 1 ]
	local w, _ = surface.GetTextSize( message )
	surface.SetTextPos( ScrW() - 406 + 200 - ( w / 2 ), y - 172 )
	surface.DrawText( message )
	surface.SetFont( "SGS_NEWHUD2" )
	local message = Cap( lastExp )
	local w, _ = surface.GetTextSize( message )
	surface.SetTextColor( Color( 255, 255, 255, 255 * skillFade ) )
	surface.SetTextPos( ScrW() - 406 + 200 - ( w / 2 ), y - 186 )
	surface.DrawText( message )

	surface.SetFont( "SGS_NEWHUD5" )
	local message = SGS.last_skill_message or ""
	local w, _ = surface.GetTextSize( message )
	surface.SetTextColor( Color( 255, 255, 255, 255 * skillFade ) )
	surface.SetTextPos( ScrW() - 10 - w, y - 175 )
	surface.DrawText( message )

	--Time Text
	surface.SetFont( "SGS_NEWHUD3" )
	local day = SGS_CheckTimeForDay( SGS.day )
	local time = tostring( SGS_CheckTimeForHour( SGS.time ) ) .. ":" .. tostring( SGS_CheckTimeForMinute( SGS.time ) )
	w2, h2 = surface.GetTextSize( time )
	surface.SetTextPos( ScrW() - 52 - ( w2 / 2 ), 10 )
	surface.SetTextColor( white )
	surface.DrawText( time )
	surface.SetFont( "SGS_NEWHUD4" )
	w, h = surface.GetTextSize( day )
	surface.SetTextPos( ScrW() - 52 - ( w / 2 ), 30 )
	surface.SetTextColor( white )
	surface.DrawText( day )

	surface.SetFont( "SGS_NEWHUD3" )
	surface.SetTextColor( red )
	surface.SetTextPos( ScrW() - 86 , 50 )
	surface.DrawText( "PVP:" )
	surface.SetTextColor( white )
	surface.SetTextPos( ScrW() - 50 , 50 )

	if LocalPlayer():GetNWBool( "inpvp", false ) == true then
		surface.DrawText( "ON" )
	else
		surface.DrawText( "OFF" )
	end

	surface.SetFont( "SGS_NEWHUD3" )
	surface.SetTextPos( ScrW() - 70 , 74 )
	surface.SetTextColor( white )
	surface.DrawText( SGS.gtokens )

	surface.SetFont( "SGS_NEWHUD2" )
	surface.SetTextColor( white )
	surface.SetTextPos( ScrW() - 90 , 100 )
	surface.DrawText( "V: " .. GAMEMODE.Version )

	if SGS.questmenuopen == true then

		local x = ( ScrW() - 500 )
		local y = 5

		if LocalPlayer():GetNWString( "Quest" ) == nil then
			quest = "None at the moment"
		else
			quest = LocalPlayer():GetNWString( "Quest" )
		end

		if LocalPlayer():GetNWInt( "amounttodo" ) == nil then
			amounttodo = "Wait for refresh."
		else
			amounttodo = LocalPlayer():GetNWInt( "amounttodo" )
		end

		surface.SetDrawColor( black )
		surface.DrawRect( x , y , 240, 160 ) --Icon Outter
		surface.DrawRect( x + 3 , y + 3 , 240 - 6, 20 ) --Icon Inner
		surface.SetTextColor( red )
		surface.SetFont( "SGS_NEWHUD3" )
		surface.SetTextPos( x + 50 , y + 3  )
		surface.DrawText( "Quests" )

		surface.SetFont( "SGS_NEWHUD5" )
		surface.SetTextColor( white )

		local offset = 15
		local percent = 100 - ( ( LocalPlayer():GetNWInt( "daytimer" ) / 1440 ) * 100 )

		surface.SetTextPos( x + 6 , y + 30 + offset * 0 )
		surface.DrawText( "Time left:" )
		surface.SetDrawColor( 200, 200, 0, 210 )
		surface.DrawRect( x + 6 , y + 45 , 200 * ( percent / 100 ), 15 )
		surface.SetTextPos( x + ( ( 200 * ( percent / 100 ) ) / 2 ), y + 30 + offset * 1 )
		surface.DrawText( math.Round( percent ) .. "%" )

		if LocalPlayer():GetNWBool( "hasquest" ) == true then
			surface.SetTextPos( x + 6 , y + 30 + offset * 2 )
			surface.SetDrawColor( 200, 200, 30, 210 )
			surface.DrawText( "Daily: " .. quest )
			surface.SetDrawColor( 200, 200, 0, 210 )
			surface.DrawRect( x + 6 , y + 75 , amounttodo * 7, 15 )
			surface.SetTextPos( x + amounttodo * 3, y + 30 + offset * 3 )
			surface.DrawText( amounttodo )
		else
			surface.SetTextPos( x + 6 , y + 30 + offset * 2 )
			surface.DrawText( "Daily: Waiting for refresh." )
		end

		if LocalPlayer():GetNWBool( "haswquest" ) == true then
			surface.SetTextPos( x + 6 , y + 30 + offset * 5 )
			surface.SetDrawColor( 200, 200, 30, 210 )
			surface.DrawText( "Weekly: " .. LocalPlayer():GetNWString( "Weekly" ) )
			surface.SetDrawColor( 200, 200, 0, 210 )
			surface.DrawRect( x + 6 , y + 120 , LocalPlayer():GetNWInt( "wamounttodo" ) * 7, 15 )
			surface.SetTextPos( x + LocalPlayer():GetNWInt( "wamounttodo" ) * 3, y + 30 + offset * 6 )
			surface.DrawText( LocalPlayer():GetNWInt( "wamounttodo" ) )
		else
			surface.SetTextPos( x + 6 , y + 30 + offset * 5 )
			surface.DrawText( "Weekly: Waiting for refresh." )
		end

		surface.SetTextPos( x + 6 , y + 30 + offset * 7 )
		if LocalPlayer():GetNWInt( "whenisweekly" ) == 7 then
			whenisweekly = 0
		else
			whenisweekly = LocalPlayer():GetNWInt( "whenisweekly" )
		end
		surface.DrawText( "Weekly refreshes every 7 dailies! " .. whenisweekly .. "/7" )

	end

	if LocalPlayer().showKeybinds then

		--Keybinds
		local modi = 12
		surface.SetFont( "SGS_HUD2" )
		surface.SetTextPos( x + 15 , 11 )
		surface.SetTextColor( cyan )
		surface.DrawText( "Game Keybinds" )
		surface.SetTextColor( white )
		surface.SetTextPos( x + 10 , 32 + modi * 0 )
		surface.DrawText( "F1: Skills Menu" )
		surface.SetTextPos( x + 10 , 32 + modi * 1 )
		surface.DrawText( "F2: Toggle Hotbar" )
		surface.SetTextPos( x + 10 , 32 + modi * 2 )
		surface.DrawText( "F3: Tribe Menu" )
		surface.SetTextPos( x + 10 , 32 + modi * 3 )
		surface.DrawText( "F4: Inventory List" )
		surface.SetTextPos( x + 10 , 32 + modi * 4 )
		surface.DrawText( "F6: Rules / Help" )
		surface.SetTextPos( x + 10 , 32 + modi * 5 )
		surface.DrawText( "F7: Commands List" )
		surface.SetTextPos( x + 10 , 32 + modi * 6 )
		surface.DrawText( "F8: Stats Menu" )
		surface.SetTextPos( x + 10 , 32 + modi * 7 )
		surface.DrawText( "F9: Quests Menu" )

	end

	--Mini Console Text
	for k,msg in pairs(GAMEMODE.InfoMessages) do

		local txt = msg.Text
		local line = ( ScrH() - 120 ) + ( msg.drawline * 15 )
		local tab = ScrW() - 396
		local col = msg.Col
		draw.SimpleText( txt, "SGS_HUD2", tab, line, col, 0, 0 )
		GAMEMODE.CheckTotalMessages()

	end

	if SGS.skillmenuopen == true then

		local x = ( ScrW() - 260 )
		local y = ScrH() - 548
		local multi = 35
		surface.SetDrawColor( black )
		surface.DrawRect( x, y ,  254, 351 )

		for i = 1, 10 do

			local y = ScrH() - 548 + multi * ( i - 1 )
			surface.SetDrawColor( black )
			surface.DrawRect( x + 3, y + 3 , 248, 30 )
			surface.DrawRect( x + 6, y + 18 , 242, 12 )
			local skill = SGS.skills[ i ]
			local nextexp = SGS.explist[ SGS.levels[ skill ] + 1 ]
			local clvlexp = SGS.explist[ SGS.levels[ skill ] ]
			local curexp =  SGS.exp[ skill ]
			local curlevel = SGS.levels[ skill ]
			local barlen = ( ( curexp - clvlexp ) / ( nextexp - clvlexp ) ) * 242
			surface.SetDrawColor( SGS.colors[ skill ].r, SGS.colors[ skill ].g, SGS.colors[ skill ].b, 210 )
			surface.DrawRect( x + 6, y + 18 , barlen, 12 )
			surface.SetDrawColor( black )
			surface.SetFont( "SGS_NEWHUD5" )
			surface.SetTextPos( x + 10, y + 4 )
			surface.SetTextColor( white )
			surface.DrawText( Cap( skill ) .. ": " .. curlevel )
			surface.SetTextColor( white )
			local message = curexp .. " / " .. nextexp
			local w, _ = surface.GetTextSize( message )
			surface.SetTextPos( x + 248 - w , y + 4 )
			surface.DrawText( message )

		end

	end

	if SGS.showafk then

		local x = ScrW() / 2
		local y = 200
		surface.SetDrawColor( black )
		surface.DrawRect( x - 75, y - 68, 150, 55 ) --Icon Outter
		surface.DrawRect( x - 72, y - 65, 144, 20 ) --Icon Inner
		surface.SetFont( "SGS_NEWHUD3" )
		surface.SetTextPos( x - 48 , y - 65 )
		surface.SetTextColor( red )
		surface.DrawText( "YOU ARE AFK" )
		surface.SetFont( "SGS_NEWHUD2" )
		surface.SetTextPos( x - 48 , y - 42 )
		surface.SetTextColor( white )
		surface.DrawText( "Time AFK: " .. SGS.afktime .. "m" )
		surface.SetFont( "SGS_NEWHUD1" )
		surface.SetTextPos( x - 65 , y - 30 )
		surface.DrawText( "Type !afk to exit AFK mode." )

	end

	if SGS.commandsmenuopen == true then

		local x = ( ScrW() - 246 )
		local y = 100

		surface.SetDrawColor( black )
		surface.DrawRect( x , y , 240, 160 ) --Icon Outter
		surface.DrawRect( x + 3 , y + 3 , 240 - 6, 20 ) --Icon Inner
		surface.SetTextColor( red )
		surface.SetFont( "SGS_NEWHUD3" )
		surface.SetTextPos( x + 50 , y + 3  )
		surface.DrawText( "F7 - Commands List" )

		surface.SetFont( "SGS_NEWHUD5" )
		surface.SetTextColor( white )
		local offset = 15
		surface.SetTextPos( x + 6 , y + 30 + offset * 0 )
		surface.DrawText( "!sleep - Sleeps for 10 seconds." )
		surface.SetTextPos( x + 6 , y + 30 + offset * 1 )
		surface.DrawText( "!save - Saves your character." )
		surface.SetTextPos( x + 6 , y + 30 + offset * 2 )
		surface.DrawText( "!motd - Open MOTD menu (helpful)" )
		surface.SetTextPos( x + 6 , y + 30 + offset * 3 )
		surface.DrawText( "!thirdperson - Toggles first/third person" )
		surface.SetTextPos( x + 6 , y + 30 + offset * 4 )
		surface.DrawText( "!unstuck - Teleport to spawn" )
		surface.SetTextPos( x + 6 , y + 30 + offset * 5 )
		surface.DrawText( "!cancel - Cancels a process" )
		surface.SetTextPos( x + 6 , y + 30 + offset * 6 )
		surface.DrawText( "!foragetoggle - Toggles foraging on UseKey" )
		surface.SetTextPos( x + 6 , y + 30 + offset * 7 )
		surface.DrawText( "!givetoken - Gives GTokens to other players." )

	end

end
hook.Add( "HUDPaint", "SGS_DrawHUD", SGS_DrawHUD )

function SGS_OpenSkillMenu()

	if SGS == nil then return end
	if SGS.sideinventory then return end

	if input.IsKeyDown(98) then
		SGS.commandsmenuopen = true
		SGS.skillmenuopen = false
	else
		SGS.commandsmenuopen = false
	end

end
hook.Add( "HUDPaint", "SGS_OpenSkillMenu", SGS_OpenSkillMenu )

function SGS_OpenQuestMenu()

	if SGS == nil then return end

	if SGS.questmenuopen == nil then
		SGS.questmenuopen = false
	end

	if questsopencooldown == true then return end

	if input.IsKeyDown(100) then
		if SGS.questmenuopen == true then
			SGS.questmenuopen = false
			questsopencooldown = true
			timer.Simple( 1, function() questsopencooldown = false end )
		return end
		if SGS.questmenuopen == false then
			SGS.questmenuopen = true
			questsopencooldown = true
			timer.Simple( 1, function() questsopencooldown = false end )
		end
	end

end
hook.Add( "HUDPaint", "SGS_OpenQuestMenu", SGS_OpenQuestMenu )