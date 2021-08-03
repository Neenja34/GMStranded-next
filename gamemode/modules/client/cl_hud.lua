function HideHUD(name)
	for k, v in pairs( { "CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", "CHudWeaponSelection", "CHudHistoryResource", "CHudCrosshair" } ) do
		if name == v then return false end
	end
end
hook.Add( "HUDShouldDraw", "HideHUD", HideHUD )

local gap = CreateClientConVar( "sgs_crosshair_gap", "4", true, false, "", 0, 100 )
local length = CreateClientConVar( "sgs_crosshair_length", "10", true, false, "", 0, 100 )
local thickness = CreateClientConVar( "sgs_crosshair_thickness", "2", true, false, "", 0, 100 )
local outline = CreateClientConVar( "sgs_crosshair_outline", "1", true, false, "", 0, 1 )
local outlineThickness = CreateClientConVar( "sgs_crosshair_outline_thickness", "2", true, false, "", 0, 100 )
CreateClientConVar( "sgs_crosshair_color", "255,255,255,255", true, false, "" )
CreateClientConVar( "sgs_crosshair_outline_color", "0,0,0,255", true, false, "" )

local color = {}
local outlinecolor = {}

local white = Color( 255, 255, 255, 255 )
local black = Color( 0, 0, 0, 255 )
local red = Color( 255, 0, 0, 255 )
local yellow = Color( 255, 255, 0, 255 )
local cyan = Color( 0, 255, 255, 255 )

function SGS_DrawCrosshair()

	if !LocalPlayer():Alive() then return end
	if SGS.hudtimer[ "display" ] == true then return end

	if SGS.person == "third" then
		local trace = LocalPlayer():GetEyeTraceNoCursor()
		local hitpos = trace.HitPos
		local pos = hitpos:ToScreen()

		crosshairX = pos.x
		crosshairY = pos.y
	else
		crosshairX = ScrW() / 2
		crosshairY = ScrH() / 2
	end

	if outline:GetBool() then

		outlinecolor = string.Split( GetConVar( "sgs_crosshair_outline_color" ):GetString(), "," )

		surface.SetDrawColor( Color( outlinecolor[ 1 ], outlinecolor[ 2 ], outlinecolor[ 3 ], outlinecolor[ 4 ] ) )

		surface.DrawRect( crosshairX - gap:GetInt() - length:GetInt() - ( outlineThickness:GetInt() / 2 ),
							crosshairY - ( thickness:GetInt() / 2 ) - ( outlineThickness:GetInt() / 2 ),
							length:GetInt() + outlineThickness:GetInt(),
							thickness:GetInt() + outlineThickness:GetInt() ) --Left

		surface.DrawRect( crosshairX - ( thickness:GetInt() / 2 ) - ( outlineThickness:GetInt() / 2 ),
							crosshairY - gap:GetInt() - length:GetInt() - ( outlineThickness:GetInt() / 2 ),
							thickness:GetInt() + outlineThickness:GetInt(),
							length:GetInt() + outlineThickness:GetInt() ) --Up

		surface.DrawRect( crosshairX + gap:GetInt() - ( outlineThickness:GetInt() / 2 ),
							crosshairY - ( thickness:GetInt() / 2 ) - ( outlineThickness:GetInt() / 2 ),
							length:GetInt() + outlineThickness:GetInt(),
							thickness:GetInt() + outlineThickness:GetInt() ) --Right

		surface.DrawRect( crosshairX - ( thickness:GetInt() / 2 ) - ( outlineThickness:GetInt() / 2 ),
							crosshairY + gap:GetInt() - ( outlineThickness:GetInt() / 2 ),
							thickness:GetInt() + outlineThickness:GetInt(),
							length:GetInt() + outlineThickness:GetInt() ) --Down

	end

	color = string.Split( GetConVar( "sgs_crosshair_color" ):GetString(), "," )

	surface.SetDrawColor( Color( color[ 1 ], color[ 2 ], color[ 3 ], color[ 4 ] ) )
	surface.DrawRect( crosshairX - gap:GetInt() - length:GetInt(),
						crosshairY - ( thickness:GetInt() / 2 ),
						length:GetInt(), thickness:GetInt() ) --Left

	surface.DrawRect( crosshairX - ( thickness:GetInt() / 2 ),
						crosshairY - gap:GetInt() - length:GetInt(),
						thickness:GetInt(), length:GetInt() ) --Up

	surface.DrawRect( crosshairX + gap:GetInt(),
						crosshairY - ( thickness:GetInt() / 2 ),
						length:GetInt(), thickness:GetInt() ) --Right

	surface.DrawRect( crosshairX - ( thickness:GetInt() / 2 ),
						crosshairY + gap:GetInt(),
						thickness:GetInt(), length:GetInt() ) --Down

end
hook.Add( "HUDPaint", "SGS_DrawCrosshair", SGS_DrawCrosshair )

/*---------------------------------
----------New Scoreboard-----------
---------------------------------*/
local PANEL = {}
function PANEL:Init()

	self:SetPos((ScrW() / 2) - 400, ScrH() * 0.1)
	self:SetSize(815, ScrH() * 0.8)
	self:SetVisible(false)
	self:DrawFrame()

end

function PANEL:Paint( w, h )

	draw.SimpleTextOutlined( "|G4P| Stranded (Project Gull)", "ScoreboardDefaultTitle", 8, 0, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 2, black)

end

function PANEL:DrawFrame()

	if SGS.ScoreBoardPanel then
		SGS.ScoreBoardPanel:Remove()
	end

	SGS.ScoreBoardPanel = vgui.Create( "DPanelList", self )
	SGS.ScoreBoardPanel:SetPos( 8, 40 )
	SGS.ScoreBoardPanel:SetSize( 800, ScrH() * 0.7 )
	SGS.ScoreBoardPanel:EnableVerticalScrollbar( true )

	for k, v in pairs( team.GetAllTeams() ) do

		if #team.GetPlayers( k ) <= 0 then continue end
		if k == 1002 then continue end

		local teambanner = vgui.Create( "DPanel" )
		teambanner:SetSize( 782, 25 )
		teambanner.Paint = function()

			surface.SetFont( "ScoreboardDefault" )
			surface.SetTextColor( black )
			surface.SetDrawColor( team.GetColor( k ) )
			surface.DrawRect( 0, 0, teambanner:GetWide(), teambanner:GetTall() )
			surface.SetDrawColor( black )
			surface.DrawOutlinedRect( 0, 0, teambanner:GetWide(), teambanner:GetTall() )
			local tw, th = surface.GetTextSize( team.GetName( k ) )
			surface.SetTextPos( 400 - ( tw / 2), 12 - ( th / 2) )
			surface.DrawText( team.GetName( k ) )

		end
		SGS.ScoreBoardPanel:AddItem( teambanner )

		local titlebarbanner = vgui.Create( "DPanel" )
		titlebarbanner:SetSize( 782, 20 )
		titlebarbanner.Paint = function()

			surface.SetFont( "SGS_RCacheMenuText" )
			surface.SetTextColor( black )
			surface.SetDrawColor( white )
			surface.DrawRect( 0, 0, titlebarbanner:GetWide(), titlebarbanner:GetTall() )
			surface.SetDrawColor( black )
			surface.DrawOutlinedRect( 0, 0, titlebarbanner:GetWide(), titlebarbanner:GetTall() )
			local _, th = surface.GetTextSize( "I" )
			surface.SetTextPos( 5, 10 - ( th / 2 ) )
			surface.DrawText( "Name:" )
			surface.SetTextPos( 400, 10 - ( th / 2 ) )
			surface.DrawText( "Level:" )
			surface.SetTextPos( 510, 10 - ( th / 2 ) )
			surface.DrawText( "Voice Channel:" )
			surface.SetTextPos( 640, 10 - ( th / 2 ) )
			surface.DrawText( "Ping:" )
			surface.SetTextPos( 685, 10 - ( th / 2 ) )
			surface.DrawText( "Mute:" )
			surface.SetTextPos( 720, 10 - ( th / 2 ) )
			surface.DrawText( "Gag:" )
			surface.SetTextPos( 760, 10 - ( th / 2 ) )
			surface.DrawText( "Stats:" )

		end
		SGS.ScoreBoardPanel:AddItem( titlebarbanner )

		for _, ply in pairs( player.GetAll() ) do

			if ply && ply:Team() == k then continue end

			local playerbanner = vgui.Create( "DPanel" )
			playerbanner:SetSize( 782, 20 )

			local pslvl = ply:GetNWString( "survival", "0" )
			if ply:IsUserGroup( "usera" ) then
				pslvl = "1"
			end

			local pvc = ply:GetNWString( "voicechannel", "A" )
			if ply:IsUserGroup( "usera" ) then
				pvc = "A"
			end

			local pping = ply:Ping()
			local pname = ply:Nick()
			playerbanner.Paint = function()

				surface.SetFont( "SGS_RCacheMenuText" )
				surface.SetTextColor( black )
				surface.SetDrawColor( white )
				surface.DrawRect( 0, 0, playerbanner:GetWide(), playerbanner:GetTall() )
				surface.SetDrawColor( black )
				surface.DrawOutlinedRect( 0, 0, playerbanner:GetWide(), playerbanner:GetTall() )

				local tr, th = surface.GetTextSize( pname )
				surface.SetTextPos( 5, 10 - ( th / 2 ) )
				if ply:GetNWBool( "afk", false ) then
					surface.SetTextColor( red )
					surface.DrawText( "*AFK*" )
					surface.SetTextColor( black )
					surface.SetTextPos( 45, 10 - ( th / 2 ) )
					surface.DrawText( pname )
				else
					surface.DrawText( pname )
				end
				surface.SetTextPos( 410, 10 - ( th / 2 ) )
				surface.DrawText( pslvl )
				surface.SetTextPos( 550, 10 - ( th / 2 ) )
				surface.DrawText( pvc )
				surface.SetTextPos( 648, 10 - ( th / 2 ) )
				surface.DrawText( pping )

			end

			gagbutton = vgui.Create( "DImageButton", playerbanner )
			gagbutton:SetSize( 16, 16 )
			gagbutton:SetPos( 725, 2 )
			if ply:IsMuted() then
				gagbutton:SetImage( "icon32/muted.png" )
			else
				gagbutton:SetImage( "icon32/unmuted.png" )
			end

			gagbutton.DoClick = function()
				ply:SetMuted( !ply:IsMuted() )
				self:DrawFrame()
			end

			mutebutton = vgui.Create( "DImageButton", playerbanner )
			mutebutton:SetSize( 16, 16 )
			mutebutton:SetPos( 690, 2 )
			if ply.ismuted then
				mutebutton:SetImage( "icon32/muted.png" )
			else
				mutebutton:SetImage( "icon32/unmuted.png" )
			end

			mutebutton.DoClick = function()
				ply.ismuted = !ply.ismuted
				self:DrawFrame()
			end

			statsbutton = vgui.Create( "DImageButton", playerbanner )
			statsbutton:SetSize( 16, 16 )
			statsbutton:SetPos( 765, 2 )
			statsbutton:SetImage( "icon16/table_edit.png" )
			statsbutton.DoClick = function()
				RunConsoleCommand( "sgs_viewplayerstats", ply:Nick() )
			end

			SGS.ScoreBoardPanel:AddItem( playerbanner )

		end

		local blankbar = vgui.Create( "DPanel" )
		blankbar:SetSize( 782, 12 )
		blankbar.Paint = function()

			surface.SetDrawColor( 255, 255, 255, 0 )
			surface.DrawRect( 0, 0, blankbar:GetWide(), blankbar:GetTall() )

		end
		SGS.ScoreBoardPanel:AddItem( blankbar )

	end

end
vgui.Register( "sgs_newscoreboard", PANEL, "EditablePanel" )

function GM:ScoreboardShow()

	if ( !IsValid( SGS.ScoreBoard ) ) then
		SGS.ScoreBoard = vgui.Create( "sgs_newscoreboard" )
	end

	if ( IsValid( SGS.ScoreBoard ) ) then
		SGS.ScoreBoard:Show()
		SGS.ScoreBoard:DrawFrame()
		SGS.ScoreBoard:MakePopup()
		SGS.ScoreBoard:SetKeyboardInputEnabled( false )
	end

end

function GM:ScoreboardHide()

	if ( IsValid( SGS.ScoreBoard ) ) then
		SGS.ScoreBoard:Hide()
	end

end

/*--------------------------------
---------------TOS----------------
--------------------------------*/
local PANEL = {}

function PANEL:Init()

	self.x = ScrW()
	self.y = ScrH()
	self.sizex = self.x * 0.8
	self.sizey = self.y * 0.8
	self:SetSize( self.sizex, self.sizey )
	self:SetPos( ( ScrW() / 2 ) - ( self.sizex / 2 ), ( ScrH() / 2 ) - ( self.sizey / 2 ) )
	self:SetVisible( false )
	self.time = SGS.tostime
	self.nextthink = CurTime() + 1
	self.bdisabled = true
	self:DrawFrame()

end

function PANEL:Paint( w, h )
	surface.SetDrawColor( 0, 0, 0, 210 )
	surface.DrawRect( 4, 4,  self:GetWide() - 8, self:GetTall() - 8 )
end

function PANEL:DrawFrame()

	HTMLTest = vgui.Create("DHTML", self)
	HTMLTest:SetPos(12,12)
	HTMLTest:SetSize( self.sizex - 24, self.sizey - 68 )
	HTMLTest:OpenURL("http://neenja.nn.pe/guide")

	TOSbutton = vgui.Create( "DButton", self )
	TOSbutton:SetSize( 120, 40 )
	TOSbutton:SetPos( 12, self.sizey - 52  )
	TOSbutton:SetText( "Wait: " .. self.time )
	TOSbutton:SetDisabled( true )
	TOSbutton.DoClick = function( TOSbutton )
		if TOSbutton:GetDisabled() then return end
		RunConsoleCommand("sgs_accepttos")
		self:Remove()
	end

	TOSbutton2 = vgui.Create( "DButton", self )
	TOSbutton2:SetSize( 120, 40 )
	TOSbutton2:SetPos( 140, self.sizey - 52 )
	TOSbutton2:SetText( "I DON'T ACCEPT" )
	TOSbutton2.DoClick = function( TOSbutton2 )
		RunConsoleCommand("disconnect")
	end

end


function PANEL:Think()
	if CurTime() < self.nextthink then return end
	if self.bdisabled then
		if self.time > 0 then
			self.time = self.time - 1
			TOSbutton:SetText( "Wait: " .. self.time )
			TOSbutton:SetDisabled( true )
		else
			TOSbutton:SetText( "I ACCEPT" )
			TOSbutton:SetDisabled( false )
			self.bdisabled = false
		end
	end
	self.nextthink = CurTime() + 1
end
vgui.Register("sgs_tospanel", PANEL, "EditablePanel")

/*--------------------------------
--------------Help----------------
--------------------------------*/
local PANEL = {}

function PANEL:Init()

	self.x = ScrW()
	self.y = ScrH()
	self.sizex = self.x * 0.8
	self.sizey = self.y * 0.8
	self:SetSize( self.sizex, self.sizey )
	self:SetPos((ScrW() / 2) - (self.sizex / 2), (ScrH() / 2) - (self.sizey / 2))
	self:SetVisible(false)
	self:DrawFrame()

end

function PANEL:Paint( w, h )
	surface.SetDrawColor( 0, 0, 0, 210 )
	surface.DrawRect( 4, 4,  self:GetWide() - 8, self:GetTall() - 8 )
end

function PANEL:DrawFrame()	
	
	HTMLTest = vgui.Create("DHTML", self)
	HTMLTest:SetPos(12,12)
	HTMLTest:SetSize( self.sizex - 24, self.sizey - 68 )
	HTMLTest:OpenURL("http://neenja.nn.pe/guide")

	TOSbutton = vgui.Create( "DButton", self )
	TOSbutton:SetSize( 120, 40 )
	TOSbutton:SetPos( 12, self.sizey - 52  )
	TOSbutton:SetText( "CLOSE" )
	TOSbutton.DoClick = function( TOSbutton )
		self:Remove()
	end

end

vgui.Register("sgs_helppanel", PANEL, "Panel")

/*--------------------------------
--------------Wiki----------------
--------------------------------*/
local PANEL = {}

function PANEL:Init()

	self:SetPos((ScrW() / 2) - 400, 30)
	self:SetSize(800, 650)
	self:SetVisible(false)
	self:DrawFrame()

end

function PANEL:Paint( w, h )

	draw.RoundedBoxEx( 16, 0, 0, self:GetWide(), self:GetTall(), Color(80, 80, 80, 150), true, true, true, true )

end

function PANEL:DrawFrame()

	HTMLPanel = vgui.Create("DPanel", self)
	HTMLPanel:SetPos(8,64)
	HTMLPanel:SetSize(782, 500)

	HTMLTest = vgui.Create("DHTML", HTMLPanel)
	HTMLTest:SetPos(0,0)
	HTMLTest:Dock( FILL )
	HTMLTest:OpenURL("http://neenja.nn.pe/")

	HelpButton = vgui.Create( "DButton", self )
	HelpButton:SetSize( 120, 40 )
	HelpButton:SetPos( 8, 572 )
	HelpButton:SetText( "OK" )
	HelpButton.DoClick = function( HelpButton )
		self:Remove()
	end

end
vgui.Register("sgs_wikipanel", PANEL, "EditablePanel")

/*--------------------------------
---------HotBar Panels------------
--------------------------------*/

function SGS_OpenHotBar()

	if SGS.HotBar then
		SGS.HotBar:Remove()
		SGS.HotBar = nil
		SGS.hotbarinit = false
	else
		SGS.HotBar = vgui.Create( "sgs_HotBar" )
		SGS.HotBar:SetVisible( true )
		SGS.HotBar:SetZPos( 1100 )
	end

end

local PANEL = {}

function PANEL:Init()

	self:SetPos( ( ScrW() / 2 ) - ( 525 / 2 ), ScrH() - 68 )
	self:SetSize( 534, 64 )
	self:SetVisible(false)
	self:SetZPos( -99 )

	SGS.hotbarinit = true
	function ReloadHotBar()

		if IsValid( self ) then
			self:DrawOthers()
		end

	end
	concommand.Add( "sgs_refreshhotbar", ReloadHotBar )

	self:DrawOthers()

end

function PANEL:Paint()

	--Main Window--	
	surface.SetDrawColor( 0, 0, 0, 210 )
	surface.DrawRect( 4, 4, 524, 56 ) --Icon Outter

end

function PANEL:DrawOthers()

	if IsValid( SGS.HotBarContainer ) then
		SGS.HotBarContainer:Remove()
	end

	SGS.HotBarContainer = vgui.Create( "DIconLayout", self)
	SGS.HotBarContainer:SetSize( 688, 48 )
	SGS.HotBarContainer:SetPos( 8, 8 )
	SGS.HotBarContainer:SetSpaceY( 0 )
	SGS.HotBarContainer:SetSpaceX( 4 )

	local ugroup = "guest"

	if LocalPlayer():IsMember() then
		ugroup = "member"
	end

	if LocalPlayer():IsDonator() then
		ugroup = "donator"
	end

	for i = 1, 10 do

		local HotBarSlot = vgui.Create( "sgs_HotBarslot" )
		HotBarSlot:SetSize( 48, 48 )
		HotBarSlot.slotID = i
		SGS.HotBarContainer:Add( HotBarSlot )

		HotBarSlot:Receiver( "HotbarDrop", function( pnl, tbl, dropped, menu, x, y )

			if !dropped then return end
			surface.PlaySound( "ui/buttonclickrelease.wav" )
			if tbl[1].dropType == "tool" then
				SGS_AssignHotBar( pnl.slotID, tbl[1].tool, true )
			elseif tbl[1].dropType == "spell" then
				SGS_AssignHotBarSpell( pnl.slotID, tbl[1].spell, true )
			end

		end )

		HotBarSlot:Receiver( "resourceDrop", function( pnl, tbl, dropped, menu, x, y )

			if !dropped then return end
			surface.PlaySound( "ui/buttonclickrelease.wav" )
			if tbl[1].dropType == "consumable" then
				SGS_AssignHotBarConsumable( pnl.slotID, tbl[1].res, true )
			end

		end )

		if SGS.HotBarcontents[ i ] then
			if SGS_HotBarReturnType( SGS.HotBarcontents[ i ] ) == "tool" then
				HotBarSlot:SetUpSlot( i, ugroup, "tool" )
				if SGS_CheckOwnership( SGS.HotBarcontents[ i ] ) then
					local item = SGS_ReverseToolLookup( SGS.HotBarcontents[ i ] )
					local HotBarButton = vgui.Create( "sgs_HotBarbutton", HotBarSlot )
					HotBarButton:SetupButton( 0, 0, 48, 48, item, i, "tool" )
				else
					SGS.HotBarcontents[ i ] = nil
					LocalPlayer():SetPData( "sgs13HotBar_slot" .. tostring( i ), "NONE" )
				end
			elseif SGS_HotBarReturnType( SGS.HotBarcontents[ i ] ) == "edible" then
				HotBarSlot:SetUpSlot( i, ugroup, "edible" )
				if SGS_CheckInventory( SGS.HotBarcontents[ i ] ) then
					local item = SGS_ReverseFoodLookup( SGS.HotBarcontents[ i ] )
					local HotBarButton = vgui.Create( "sgs_HotBarbutton", HotBarSlot )
					HotBarButton:SetupButton( 0, 0, 48, 48, item, i, "edible" )
				else
					SGS.HotBarcontents[ i ] = nil
					LocalPlayer():SetPData("sgs13HotBar_slot" .. tostring( i ), "NONE")
				end
			elseif SGS_HotBarReturnType( SGS.HotBarcontents[ i ] ) == "potion" then
				HotBarSlot:SetUpSlot( i, ugroup, "potion" )
				if SGS_CheckInventory( SGS.HotBarcontents[ i ] ) then
					local item = SGS_ReversePotionLookup( SGS.HotBarcontents[ i ] )
					local HotBarButton = vgui.Create( "sgs_HotBarbutton", HotBarSlot )
					HotBarButton:SetupButton( 0, 0, 48, 48, item, i, "potion" )
				else
					SGS.HotBarcontents[ i ] = nil
					LocalPlayer():SetPData( "sgs13HotBar_slot" .. tostring( i ), "NONE" )
				end
			elseif SGS_HotBarReturnType( SGS.HotBarcontents[ i ] ) == "spell" then
				HotBarSlot:SetUpSlot( i, ugroup, "spell" )
				local item = SGS_ReverseSpellLookup( SGS.HotBarcontents[ i ] )
				local HotBarButton = vgui.Create( "sgs_HotBarbutton", HotBarSlot )
				HotBarButton:SetupButton( 0, 0, 48, 48, item, i, "spell" )
			end
		end
		HotBarSlot:SetUpSlot( i, ugroup, "none" )
	end

end
vgui.Register( "sgs_HotBar", PANEL, "EditablePanel" )


/*--------------------------------
----------HotBar Slots------------
--------------------------------*/

local PANEL = {}

function PANEL:Init()

	self.ready = false

end

function PANEL:Paint()

	if self.ready == false then return end

	surface.SetDrawColor( 0, 0, 0, 210 )
	surface.DrawRect( 0, 0, 48, 48 ) --Icon Outter

	local bnumber = tostring( self.index )
	if bnumber == "10" then bnumber = "0" end

	draw.SimpleText(bnumber, "HotBarnumbers", 3, 1, white, 0, 0)

end

function PANEL:SetUpSlot( index, ugroup, stype )

	self.index = index
	self.ugroup = ugroup
	self.stype = stype

	self.ready = true

end
vgui.Register( "sgs_HotBarslot", PANEL, "EditablePanel" )


/*--------------------------------
---------HotBar Buttons-----------
--------------------------------*/

local PANEL = {}

function PANEL:Init()

	self.ready = false

end

function PANEL:SetupButton( x, y, x2, y2, item, index, btype )

	self:SetPos( x, y )
	if btype == "tool" then
		self:SetMaterial( item.icon )
	elseif btype == "edible" then
		self:SetMaterial( item.material )
	elseif btype == "potion" then
		self:SetMaterial( item.material )
	elseif btype == "spell" then
		self:SetMaterial( item.material )
	end
	self:SetSize( x2, y2 )
	self:SetTooltip( SGS_ToolTipShort(item) )

	self.item = item
	self.index = index
	self.btype = btype

	self.ready = true

end


function PANEL:DoClick()

	surface.PlaySound( "ui/buttonclickrelease.wav" )
	if self.btype == "tool" then
		RunConsoleCommand( "SGS_EquipTools", self.item.entity )
	elseif self.btype == "edible" then
		RunConsoleCommand( "sgs_eat", self.item.name )
	elseif self.btype == "potion" then
		RunConsoleCommand( "sgs_pdrink", self.item.mname )
	elseif self.btype == "spell" then
		RunConsoleCommand( "sgs_cast", self.item.spell )
	end

end

function PANEL:DoRightClick()

	local DropDown = DermaMenu()
	DropDown:AddOption( "Remove from HotBar", function() SGS_RemoveFromHotBar( self.index ) end )
	DropDown:Open()

end

function PANEL:PaintOver()

	if self.ready == false then return end

	local bnumber = tostring( self.index )
	if bnumber == "10" then bnumber = "0" end
	draw.SimpleText( bnumber, "HotBarnumbers", 3, 1, white, 0, 0 )

	if self.btype == "edible" or self.btype == "potion" then
		local count = SGS.resources[ SGS.HotBarcontents[ self.index ] ] or 0
		local len = string.len( tostring( count ) )
		draw.SimpleText( tostring( count ), "HotBarnumbers", 38 - ( (len * 7) - 7 ), 34, yellow, 0, 0 )
	end

end
vgui.Register( "sgs_HotBarbutton", PANEL, "DImageButton" )

surface.CreateFont( "DeathNotice1",
{
	font		= "Helvetica",
	size		= 36,
	weight		= 800,
	shadow		= true
})

surface.CreateFont( "DeathNotice2",
{
	font		= "Helvetica",
	size		= 24,
	weight		= 800,
	shadow		= true
})

surface.CreateFont( "DeathNotice3",
{
	font		= "Helvetica",
	size		= 14,
	weight		= 800,
	shadow		= true
})

surface.CreateFont( "DeathNotice4",
{
	font		= "Helvetica",
	size		= 18,
	weight		= 800,
	shadow		= true
})

surface.CreateFont( "DeathNotice5",
{
	font		= "Helvetica",
	size		= 64,
	weight		= 800,
	shadow		= false
})

surface.CreateFont( "DeathNotice6",
{
	font		= "Tahoma",
	size		= 124,
	weight		= 800,
	shadow		= false
})

--DEATH HUD
function SGS_DeathHUD()
	if !LocalPlayer():GetNWBool( "displaydeathnotice", false ) then return end
	draw.RoundedBoxEx( 4, ScrW() / 2 - 300, ScrH() / 2 - 225, 600, 450, Color( 80, 80, 80, 200 ), true, true, true, true )
	draw.RoundedBoxEx( 4, ScrW() / 2 - 296, ScrH() / 2 - 221, 592, 442, Color( 50, 50, 50, 200 ), true, true, true, true )
	local keyword = "respawn"
	if LocalPlayer():Alive() then keyword = "close" end
	draw.DrawText( "Press Jump (Defult: Space) to " .. keyword .. "!", "DeathNotice4", ScrW() / 2, ScrH() / 2 - 210, white, TEXT_ALIGN_CENTER )
	draw.DrawText( "You Have Died!", "DeathNotice1", ScrW() / 2, ScrH() / 2 - 190, Color( 255, 20, 20, 255 ), TEXT_ALIGN_CENTER )
	draw.DrawText( "You Were Killed By: ", "DeathNotice2", ScrW() / 2 - 280, ScrH() / 2 - 130 , Color( 255, 20, 20, 255 ), TEXT_ALIGN_LEFT )
	draw.DrawText( SGS.killerstring, "DeathNotice2", ScrW() / 2 - 80, ScrH() / 2 - 130 , Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
	draw.DrawText( "Items Dropped: ", "DeathNotice2", ScrW() / 2 - 280, ScrH() / 2 - 80 , Color( 255, 20, 20, 255 ), TEXT_ALIGN_LEFT )
	draw.DrawText( "Items Destroyed: ", "DeathNotice2", ScrW() / 2 - 80, ScrH() / 2 - 80 , Color( 255, 20, 20, 255 ), TEXT_ALIGN_LEFT )
	draw.DrawText( "Tools Dropped: ", "DeathNotice2", ScrW() / 2 + 140, ScrH() / 2 - 80 , Color( 255, 20, 20, 255 ), TEXT_ALIGN_LEFT )

	draw.DrawText( SGS.itemsdropped, "DeathNotice3", ScrW() / 2 - 280, ScrH() / 2 - 50 , white, TEXT_ALIGN_LEFT )
	draw.DrawText( SGS.itemsdestroyed, "DeathNotice3", ScrW() / 2 - 80, ScrH() / 2 - 50 , white, TEXT_ALIGN_LEFT )
	draw.DrawText( SGS.toolsdropped, "DeathNotice3", ScrW() / 2 + 140, ScrH() / 2 - 50 , white, TEXT_ALIGN_LEFT )
end
hook.Add( "HUDPaint", "SGS_DeathHUD", SGS_DeathHUD )

--DEATH HUD
function SGS_DeathHUD2()

	if LocalPlayer():Alive() then return end
	if LocalPlayer():GetNWBool( "displaydeathnotice", false ) then return end
	draw.DrawText( "You Are Near Death!", "DeathNotice5", ScrW() / 2 - 2, 148, black, TEXT_ALIGN_CENTER )
	draw.DrawText( "You Are Near Death!", "DeathNotice5", ScrW() / 2, 150, Color( 255, 20, 20, 255 ), TEXT_ALIGN_CENTER )
	draw.DrawText( "Unless Resurrected You Will Die In:", "DeathNotice1", ScrW() / 2 - 2, 208, black, TEXT_ALIGN_CENTER )
	draw.DrawText( "Unless Resurrected You Will Die In:", "DeathNotice1", ScrW() / 2, 210, Color( 255, 20, 20, 255 ), TEXT_ALIGN_CENTER )
	local timeleft = math.Clamp( LocalPlayer():GetNWInt("deathtotaltime", 60) - ( math.floor( CurTime() ) - LocalPlayer():GetNWInt("lastdeathtime") ), 0, LocalPlayer():GetNWInt("deathtotaltime", 60) )
	draw.DrawText( timeleft, "DeathNotice6", ScrW() / 2 -2, 298, black, TEXT_ALIGN_CENTER )
	draw.DrawText( timeleft, "DeathNotice6", ScrW() / 2, 300, Color( 255, 20, 20, 255 ), TEXT_ALIGN_CENTER )

	draw.DrawText( "Press Reload (Default: R) To Skip Timer", "DeathNotice2", ScrW() / 2 -2, 430, black, TEXT_ALIGN_CENTER )
	draw.DrawText( "Press Reload (Default: R) To Skip Timer", "DeathNotice2", ScrW() / 2, 432, Color( 255, 20, 20, 255 ), TEXT_ALIGN_CENTER )
	draw.DrawText( "Some items may be lost.", "DeathNotice2", ScrW() / 2 -2, 600, black, TEXT_ALIGN_CENTER )
	draw.DrawText( "Some items may be lost.", "DeathNotice2", ScrW() / 2, 600, Color( 255, 20, 20, 255 ), TEXT_ALIGN_CENTER )

end
hook.Add( "HUDPaint", "SGS_DeathHUD2", SGS_DeathHUD2 )

surface.CreateFont( "UnlockFont1",
{
	font		= "Tahoma",
	size		= 28,
	weight		= 800,
	shadow		= false
})

surface.CreateFont( "UnlockFont2",
{
	font		= "Tahoma",
	size		= 18,
	weight		= 800,
	shadow		= false
})

--UnlockHUD
local unlock_window_w = 350
local unlock_window_h = 100
local unlock_window_top = 75
function SGS_UnlockHUD()
	if !LocalPlayer().skillunlocktbl then return end
	if CurTime() > ( LocalPlayer().achievementstart or 0 ) + 8 then return end
	draw.RoundedBoxEx( 4, ScrW() / 2 - unlock_window_w / 2, unlock_window_top, unlock_window_w, unlock_window_h, Color( 80, 80, 80, 150 ), true, true, true, true )
	draw.RoundedBoxEx( 4, ScrW() / 2 - ( unlock_window_w / 2 - 4 ), unlock_window_top + 4, unlock_window_w - 8, unlock_window_h - 8, Color( 50, 50, 50, 150 ), true, true, true, true )

	draw.DrawText( "Congratulations!", "UnlockFont1", ScrW() / 2 - 2, unlock_window_top + 10, white, TEXT_ALIGN_CENTER )
	draw.DrawText( "You have reached " .. LocalPlayer().skillunlocktbl[ 1 ] .. " level: " .. LocalPlayer().skillunlocktbl[ 2 ], "UnlockFont2", ScrW() / 2 - 2, unlock_window_top + 35, white, TEXT_ALIGN_CENTER )
	draw.DrawText( LocalPlayer().skillunlocktbl[ 3 ], "UnlockFont2", ScrW() / 2 - 2, unlock_window_top + 60, white, TEXT_ALIGN_CENTER )
	draw.DrawText( LocalPlayer().skillunlocktbl[ 4 ], "UnlockFont2", ScrW() / 2 - 2, unlock_window_top + 75, white, TEXT_ALIGN_CENTER )
end
hook.Add( "HUDPaint", "SGS_UnlockHUD", SGS_UnlockHUD )

function surface.PrecacheArc( cx, cy, radius, thickness, startang, endang, roughness, bClockwise )

	local triarc = {}
	local deg2rad = math.pi / 180

	-- Correct start/end ang
	local startang, endang = startang or 0, endang or 0
	if bClockwise && startang < endang then
		local temp = startang
		startang = endang
		endang = temp
		temp = nil
	elseif startang > endang then
		local temp = startang
		startang = endang
		endang = temp
		temp = nil
	end

	-- Define step
	local roughness = math.max( roughness or 1, 1 )
	local step = roughness
	if bClockwise then
		step = math.abs( roughness ) * -1
	end

	-- Create the inner circle's points.
	local inner = {}
	local r = radius - thickness
	for deg = startang, endang, step do
		local rad = deg2rad * deg
		table.insert( inner, {
			x = cx + (math.cos(rad) * r),
			y = cy + (math.sin(rad) * r)
		} )
	end

	-- Create the outer circle's points.
	local outer = {}
	for deg = startang, endang, step do
		local rad = deg2rad * deg
		table.insert( outer, {
			x = cx + (math.cos(rad) * radius),
			y = cy + (math.sin(rad) * radius)
		} )
	end

	-- Triangulate the points.
	for tri = 1, #inner * 2 do -- twice as many triangles as there are degrees.
		local p1,p2,p3
		p1 = outer[ math.floor( tri / 2 ) + 1 ]
		p3 = inner[ math.floor( ( tri + 1 ) / 2 ) + 1 ]
		if tri % 2 == 0 then --if the number is even use outer.
			p2 = outer[ math.floor( ( tri + 1 ) / 2 ) ]
		else
			p2 = inner[ math.floor( ( tri + 1 ) / 2 ) ]
		end
		table.insert( triarc, {p1, p2, p3} )
	end
	-- Return a table of triangles to draw.
	return triarc

end

function surface.DrawArc( arc )
	for k,v in ipairs( arc ) do
		surface.DrawPoly( v )
	end
end

function draw.Arc( cx, cy, radius, thickness, startang, endang, roughness, color, bClockwise )
	surface.SetDrawColor( color )
	surface.DrawArc( surface.PrecacheArc( cx,cy,radius,thickness,startang,endang,roughness,bClockwise ) )
end

hook.Add( "PostRenderVGUI", "Circles", function()
	if ( SGS.hudtimer[ "display" ] or false ) == false then return end
	local angSeg = 205
	local angOffset = 270
	local size = 64
	local innerColor = Color(20, 200, 200, 220)

	if SGS.colors[ SGS.hudtimer[ "skill" ] ] then
		innerColor = SGS.colors[ SGS.hudtimer[ "skill" ] ]
	end

	local barlen = ( SGS.hudtimer[ "etime" ] - CurTime() ) / SGS.hudtimer[ "len" ]
	barlen = -barlen + 1
	local w = barlen * 360
	if barlen == 0 then w = 0 end

	angSeg = math.Clamp( w, 0, 360 )

	surface.SetTexture( 0 )
	draw.Arc(
		ScrW() / 2, --pos x
		ScrH() / 2, --pos y
		size / 2, --circle radius
		9, --border thickness
		angOffset, --start angle
		angOffset + 360, --end angle
		4, --steps (smaller=more steps)
		Color( 0, 0, 0, 180 ),
		false
	)
	draw.Arc(
		ScrW() / 2, --pos x
		ScrH() / 2, --pos y
		( size - 3 ) / 2, --circle radius
		6, --border thickness
		angOffset, --start angle
		angOffset + angSeg, --end angle
		4, --steps (smaller=more steps)
		innerColor,
		false
	)

	draw.SimpleTextOutlined( SGS.hudtimer[ "text" ], "SGS_HUD3", ScrW() / 2  , ( ScrH() / 2 ) -50, white, 1, 1, 1, black )

	if CurTime() >= SGS.hudtimer[ "etime" ] then
		SGS.hudtimer[ "display" ] = false
	end

end )

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

function SGS_AllThingsHUD()

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
	surface.SetDrawColor( 0, 0, 0, 210 )
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

	surface.SetDrawColor( 0, 0, 0, 210 )
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
	surface.SetMaterial( tribeIcon	)
	surface.DrawTexturedRect( x + 5, y - 119, 16, 16 )
	surface.SetMaterial( coinsIcon	)
	surface.DrawTexturedRect( ScrW() - 90 , 74, 16, 16 )

	if LocalPlayer():Sheltered() then
		surface.SetDrawColor( 255, 255, 255, 180 )
		surface.SetMaterial( houseIcon	)
		surface.DrawTexturedRect( 5 , y - 180, 32, 32 )
	end

	if LocalPlayer().bleeding then
		surface.SetDrawColor( 250, 180, 180, 180 )
		surface.SetMaterial( bleedIcon	)
		surface.DrawTexturedRect( 38 , y - 180, 32, 32 )
	end

	if LocalPlayer().brokenleg then
		surface.SetDrawColor( 255, 255, 255, 180 )
		surface.SetMaterial( brokenIcon	)
		surface.DrawTexturedRect( 70 , y - 175, 24, 24 )
	end

	if LocalPlayer().melonaids then
		surface.SetDrawColor( 255, 255, 255, 200 )
		surface.SetMaterial( melonaidsIcon	)
		surface.DrawTexturedRect( 100 , y - 175, 24, 24 )
	end

	if ( SGS.o2show or false ) == true then
		-- Oxygen Meter
		surface.SetDrawColor( 0, 0, 0, 210 )
		surface.DrawRect( x + 235, y - 20, 160, 20 ) --Oxygen Outter
		surface.DrawRect( x + 265, y - 17, 127, 14 ) --Oxygen Inner
		surface.SetDrawColor( white )
		surface.SetMaterial( oxygenIcon	)
		surface.DrawTexturedRect( x + 242, y - 18, 16, 16 )
		surface.SetDrawColor( 0, 255, 255, 210 )
		local barlen = (SGS.o2 / SGS.maxneeds) * 127
		surface.DrawRect( x + 265, y - 17, barlen, 14 ) --Oxygen Meter
	end

	if ( LocalPlayer():GetNWBool( "potionshow", false ) or false ) == true then
		-- Potion Meter
		surface.SetDrawColor( 0, 0, 0, 210 )
		surface.DrawRect( x + 235, y - 44, 160, 20 ) --Potion Outter
		surface.DrawRect( x + 265, y - 41, 127, 14 ) --Potion Inner
		surface.SetDrawColor( white )
		surface.SetMaterial( potionIcon	)
		surface.DrawTexturedRect( x + 242, y - 42, 16, 16 )
		surface.SetDrawColor( 255, 80, 255, 210 )
		local barlen = (LocalPlayer():GetNWInt("potionendtime", CurTime()) - CurTime()) / LocalPlayer():GetNWInt("potiontime", CurTime()) * 127
		surface.DrawRect( x + 265, y - 41, barlen, 14 )
	end

	--Health Bar
	surface.SetDrawColor( 255, 50, 50, 255 )
	local w = ( LocalPlayer():Health() / LocalPlayer():GetMaxHealth() ) * 202
	surface.DrawRect( x + 26, y - 94, w, 18 ) --Health Inner

	--Hunger Bar
	surface.SetDrawColor( 45, 190, 45, 255 )
	local w = ( SGS.needs["hunger"] / SGS.maxneeds ) * 127
	surface.DrawRect( x + 102, y - 65, w, 14 )

	--Thirst Bar
	surface.SetDrawColor( 120, 220, 255, 255 )
	local w = ( SGS.needs["thirst"] / SGS.maxneeds ) * 127
	surface.DrawRect( x + 102, y - 41, w, 14 )

	--Energy Bar
	surface.SetDrawColor( 220, 220, 0, 255 )
	local w = ( SGS.needs["fatigue"] / SGS.maxneeds ) * 127
	surface.DrawRect( x + 102, y - 17, w, 14 )

	if GetConVar("sgs_enablehudnumbers"):GetBool() then

		surface.SetFont( "SGS_NEWHUD2" )
		local message = math.Clamp( math.ceil(( LocalPlayer():Health() / LocalPlayer():GetMaxHealth() ) * 100), 0, 100 ) .. "%"
		local w, _ = surface.GetTextSize( message )
		surface.SetTextColor( 120, 120, 120, 255 )
		surface.SetTextPos( x + 134 - (w / 2), y - 93 )
		surface.DrawText( message )

		surface.SetFont( "SGS_NEWHUD2" )
		local message = math.ceil(( SGS.needs["hunger"] / SGS.maxneeds ) * 100) .. "%"
		local w, _ = surface.GetTextSize( message )
		surface.SetTextColor( 120, 120, 120, 255 )
		surface.SetTextPos( x + 170 - (w / 2), y - 65 )
		surface.DrawText( message )

		surface.SetFont( "SGS_NEWHUD2" )
		local message = math.ceil(( SGS.needs["thirst"] / SGS.maxneeds ) * 100) .. "%"
		local w, _ = surface.GetTextSize( message )
		surface.SetTextColor( 120, 120, 120, 255 )
		surface.SetTextPos( x + 170 - (w / 2), y - 41 )
		surface.DrawText( message )

		surface.SetFont( "SGS_NEWHUD2" )
		local message = math.ceil(( SGS.needs["fatigue"] / SGS.maxneeds ) * 100) .. "%"
		local w, _ = surface.GetTextSize( message )
		surface.SetTextColor( 120, 120, 120, 255 )
		surface.SetTextPos( x + 170 - (w / 2), y - 17 )
		surface.DrawText( message )

	end


	--Survival Exp Bar
	local curLvl = SGS_GetTotalSurvivalLevels()
	surface.SetDrawColor( 150, 200, 0, 255 )
	local clvlexp = ( SGS.levels["survival"] - 1 ) * 20
	local nextexp = SGS.levels["survival"] * 20
	local w = ((SGS_GetTotalSurvivalLevels() - clvlexp) / (nextexp - clvlexp)) * 394
	surface.DrawRect( ScrW() - 403, y - 125, w, 12 )

	--Skill Exp Bar
	surface.SetDrawColor( SGS.colors[ lastExp ].r, SGS.colors[ lastExp ].g, SGS.colors[ lastExp ].b, 100 * skillFade )
	local w = ((SGS.exp[lastExp] - SGS.explist[SGS.levels[lastExp]]) / (SGS.explist[SGS.levels[lastExp] + 1] - SGS.explist[SGS.levels[lastExp]])) * 394
	surface.DrawRect( ScrW() - 403, y - 159, w, 12 )
	local w2 = ( ( SGS.last_skill_amt or 0 ) / (SGS.explist[SGS.levels[lastExp] + 1] - SGS.explist[SGS.levels[lastExp]])) * 394
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
	surface.DrawText( "Survival lvl: " .. SGS.levels["survival"])
	local message = curLvl .. " / " .. SGS.levels["survival"] * 20
	local w, _ = surface.GetTextSize( message )
	surface.SetTextPos( ScrW() - 406 + 200 - ( w / 2 ), y - 138 )
	surface.DrawText(message)

	--Skill Level Text
	surface.SetFont( "SGS_NEWHUD5" )
	surface.SetTextColor( Color(255,255,255,255 * skillFade) )
	surface.SetTextPos( ScrW() - 399, y - 175 )
	surface.DrawText( "lvl: " .. SGS.levels[lastExp])
	local message = SGS.exp[lastExp] .. " / " .. SGS.explist[SGS.levels[lastExp] + 1]
	local w, _ = surface.GetTextSize( message )
	surface.SetTextPos( ScrW() - 406 + 200 - ( w / 2 ), y - 172 )
	surface.DrawText( message )
	surface.SetFont( "SGS_NEWHUD2" )
	local message = Cap(lastExp)
	local w, _ = surface.GetTextSize( message )
	surface.SetTextColor( Color(255,255,255,255 * skillFade) )
	surface.SetTextPos( ScrW() - 406 + 200 - ( w / 2 ), y - 186 )
	surface.DrawText( message )

	surface.SetFont( "SGS_NEWHUD5" )
	local message = SGS.last_skill_message or ""
	local w, _ = surface.GetTextSize( message )
	surface.SetTextColor( Color(255,255,255,255 * skillFade) )
	surface.SetTextPos( ScrW() - 10 - w, y - 175 )
	surface.DrawText( message )

	--Time Text
	surface.SetFont( "SGS_NEWHUD3" )
	local day = SGS_CheckTimeForDay( SGS.day )
	local time = tostring(SGS_CheckTimeForHour( SGS.time )) .. ":" .. tostring(SGS_CheckTimeForMinute( SGS.time ))
	w2, h2 = surface.GetTextSize(time)
	surface.SetTextPos( ScrW() - 52 - (w2 / 2), 10 )
	surface.SetTextColor( white )
	surface.DrawText( time )
	surface.SetFont( "SGS_NEWHUD4" )
	w, h = surface.GetTextSize(day)
	surface.SetTextPos( ScrW() - 52 - (w / 2), 30 )
	surface.SetTextColor( white )
	surface.DrawText( day )

	surface.SetFont( "SGS_NEWHUD3" )
	surface.SetTextColor( red )
	surface.SetTextPos( ScrW() - 86 , 50 )
	surface.DrawText( "PVP:"  )
	surface.SetTextColor( white)
	surface.SetTextPos( ScrW() - 50 , 50 )
	if LocalPlayer():GetNWBool("inpvp", false) == true then
		surface.DrawText( "ON"  )
	else
		surface.DrawText( "OFF"  )
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

		if LocalPlayer():GetNWString("Quest") == nil then
			quest = "None at the moment"
		else
			quest = LocalPlayer():GetNWString("Quest")
		end

		if LocalPlayer():GetNWInt("amounttodo") == nil then
			amounttodo = "Wait for refresh."
		else
			amounttodo = LocalPlayer():GetNWInt("amounttodo")
		end

		surface.SetDrawColor( 0, 0, 0, 210 )
		surface.DrawRect( x , y , 240, 160 ) --Icon Outter
		surface.DrawRect( x + 3 , y + 3 , 240 - 6, 20 ) --Icon Inner
		surface.SetTextColor( red )
		surface.SetFont( "SGS_NEWHUD3" )
		surface.SetTextPos( x + 50 , y + 3  )
		surface.DrawText( "Quests" )

		surface.SetFont( "SGS_NEWHUD5" )
		surface.SetTextColor( white )

		local offset = 15
		local percent = 100 - ((LocalPlayer():GetNWInt("daytimer") / 1440) * 100)

		surface.SetTextPos( x + 6 , y + 30 + offset * 0 )
		surface.DrawText( "Time left:" )
		surface.SetDrawColor( 200, 200, 0, 210 )
		surface.DrawRect( x + 6 , y + 45 , 200 * (percent / 100), 15 )
		surface.SetTextPos( x + ((200 * (percent / 100)) / 2), y + 30 + offset * 1 )
		surface.DrawText( math.Round(percent) .. "%" )

		if LocalPlayer():GetNWBool("hasquest") == true then
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
		if LocalPlayer():GetNWBool("haswquest") == true then
			surface.SetTextPos( x + 6 , y + 30 + offset * 5 )
			surface.SetDrawColor( 200, 200, 30, 210 )
			surface.DrawText( "Weekly: " .. LocalPlayer():GetNWString("Weekly") )
			surface.SetDrawColor( 200, 200, 0, 210 )
			surface.DrawRect( x + 6 , y + 120 , LocalPlayer():GetNWInt("wamounttodo") * 7, 15 )
			surface.SetTextPos( x + LocalPlayer():GetNWInt("wamounttodo") * 3, y + 30 + offset * 6 )
			surface.DrawText( LocalPlayer():GetNWInt("wamounttodo") )
		else
			surface.SetTextPos( x + 6 , y + 30 + offset * 5 )
			surface.DrawText( "Weekly: Waiting for refresh." )
		end

		surface.SetTextPos( x + 6 , y + 30 + offset * 7 )
		if LocalPlayer():GetNWInt("whenisweekly") == 7 then
			whenisweekly = 0
		else
			whenisweekly = LocalPlayer():GetNWInt("whenisweekly")
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
		local line = (ScrH() - 120) + (msg.drawline * 15)
		local tab = ScrW() - 396
		local col = msg.Col
		draw.SimpleText(txt,"SGS_HUD2",tab,line,col,0,0)
		GAMEMODE.CheckTotalMessages()
	end

	if SGS.skillmenuopen == true then

		local x = ( ScrW() - 260 )
		local y = ScrH() - 548
		local multi = 35
		surface.SetDrawColor( 0, 0, 0, 210 )
		surface.DrawRect( x, y ,  254, 351 )

		for i = 1, 10 do
			local y = ScrH() - 548 + multi * (i-1)
			surface.SetDrawColor( 0, 0, 0, 210 )
			surface.DrawRect( x + 3, y + 3 , 248, 30 )
			surface.DrawRect( x + 6, y + 18 , 242, 12 )
			local skill = SGS.skills[i]
			local nextexp = SGS.explist[SGS.levels[skill] + 1]
			local clvlexp = SGS.explist[SGS.levels[skill]]
			local curexp =  SGS.exp[skill]
			local curlevel = SGS.levels[skill]
			local barlen = ((curexp - clvlexp) / (nextexp - clvlexp)) * 242
			surface.SetDrawColor( SGS.colors[ skill ].r, SGS.colors[ skill ].g, SGS.colors[ skill ].b, 210 )
			surface.DrawRect( x + 6, y + 18 , barlen, 12 )
			surface.SetDrawColor( 0, 0, 0, 210 )
			surface.SetFont( "SGS_NEWHUD5" )
			surface.SetTextPos( x + 10, y + 4 )
			surface.SetTextColor( white )
			surface.DrawText( Cap(skill) .. ": " .. curlevel )
			surface.SetTextColor( white )
			local message = curexp .. " / " .. nextexp
			local w, _ = surface.GetTextSize( message )
			surface.SetTextPos( x + 248 - w , y + 4 )
			surface.DrawText(message)
		end
	end

	if SGS.showafk then
		local x = ScrW() / 2
		local y = 200
		surface.SetDrawColor( 0, 0, 0, 210 )
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

		surface.SetDrawColor( 0, 0, 0, 210 )
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
hook.Add( "HUDPaint", "SGS_AllThingsHUD", SGS_AllThingsHUD )

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