local white = Color( 255, 255, 255, 255 )
local black = Color ( 0, 0, 0, 210 )
local yellow = Color( 255, 255, 0, 255 )

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
	self:SetVisible( false )
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
	surface.SetDrawColor( black )
	surface.DrawRect( 4, 4, 524, 56 ) --Icon Outter

end

function PANEL:DrawOthers()

	if IsValid( SGS.HotBarContainer ) then
		SGS.HotBarContainer:Remove()
	end

	SGS.HotBarContainer = vgui.Create( "DIconLayout", self )
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
			if tbl[ 1 ].dropType == "tool" then
				SGS_AssignHotBar( pnl.slotID, tbl[ 1 ].tool, true )
			elseif tbl[ 1 ].dropType == "spell" then
				SGS_AssignHotBarSpell( pnl.slotID, tbl[ 1 ].spell, true )
			end

		end )

		HotBarSlot:Receiver( "resourceDrop", function( pnl, tbl, dropped, menu, x, y )

			if !dropped then return end
			surface.PlaySound( "ui/buttonclickrelease.wav" )
			if tbl[ 1 ].dropType == "consumable" then
				SGS_AssignHotBarConsumable( pnl.slotID, tbl[ 1 ].res, true )
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
					LocalPlayer():SetPData( "sgs13HotBar_slot" .. tostring( i ), "NONE" )
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

	surface.SetDrawColor( black )
	surface.DrawRect( 0, 0, 48, 48 ) --Icon Outter

	local bnumber = tostring( self.index )
	if bnumber == "10" then bnumber = "0" end

	draw.SimpleText( bnumber, "HotBarnumbers", 3, 1, white, 0, 0 )

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
	self:SetTooltip( SGS_ToolTipShort( item ) )

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
		draw.SimpleText( tostring( count ), "HotBarnumbers", 38 - ( ( len * 7 ) - 7 ), 34, yellow, 0, 0 )
	end

end
vgui.Register( "sgs_HotBarbutton", PANEL, "DImageButton" )