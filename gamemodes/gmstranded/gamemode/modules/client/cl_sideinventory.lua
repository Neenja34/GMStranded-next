local hashAllowedPackages = {}
for i, v in pairs( SGS.AllowedPackage ) do
    hashAllowedPackages[ v ] = true
end

local hashmenuedibles = {}
for i, v in pairs( SGS.menuedible ) do
    hashmenuedibles[ v ] = true
end

local hashmenupotions = {}
for i, v in pairs( SGS.menupotions ) do
    hashmenupotions[ v ] = true
end

function SGS_OpenSideInventory()

    if SGS.sideinventory then
        SGS.sideinventoryposx, SGS.sideinventoryposy = SGS.sideinventory:GetPos()
        SGS.sideinventory:Remove()
        SGS.sideinventory = nil
    else
        SGS.sideinventory = vgui.Create( "sgs_sideinventory" )
        SGS.sideinventory:SetVisible( true )
    end

end

local PANEL = {}
function PANEL:Init()

    self:DrawFrame()
    self:SetPos( SGS.sideinventoryposx, SGS.sideinventoryposy )
    self:SetSize( 280, 600 )
    self:SetVisible( false )
    self:SetZPos( -99 )

end

function PANEL:DrawFrame()

    inv = vgui.Create( "DPanel", self )
    inv:Dock( FILL )
    inv:SetPaintBackground( false )

    scroll = vgui.Create( "DScrollPanel", inv )
    scroll:Dock( FILL )

    grid = vgui.Create( "DIconLayout", scroll )
    grid:SetSpaceY( 4 )
    grid:SetSpaceX( 4 )
    grid:Dock( TOP )
    grid:DockMargin( 8, 28, 8, 8 )

    function DrawSideInventory()

        local curinv = 0
        for k, v in pairs( SGS.resources ) do
        	curinv = curinv + tonumber( v )
        end
        SGS.curinv = curinv

        local children = grid:GetChildren()

        for k, v in SortedPairs( SGS.resources ) do
        	if children[ k ] then continue end
        	if v == 0 then continue end

        	local ResourceButton = vgui.Create( "menu_qResourceButton", grid )
        	ResourceButton:SetSize( 120, 24 )
        	ResourceButton:SetButtonText( CapAll( string.gsub( k, "_", " " ) ) )
            ResourceButton.res = k
        	ResourceButton.PaintOver = function()
        		surface.SetFont( "qMenuFont1" )
        		count =  SGS.resources[ k ]
        		local x = surface.GetTextSize( count )
        		draw.SimpleText( count, "qMenuFont1", 60 - x / 2, 11, Color( 255, 255, 255, 255 ), 0, 0 )
        	end
        	ResourceButton:SetMouseInputEnabled( true )

        	if hashmenuedibles[ k ] or hashmenupotions[ k ] then
        		grid:Add( ResourceButton )
        		ResourceButton.dropType = "consumable"
        		ResourceButton.consumeEnable = true
        	elseif hashAllowedPackages[ k ] then
        		grid:Add( ResourceButton )
        		ResourceButton.unpackEnable = true
        	else
        		grid:Add( ResourceButton )
        	end

        	function ResourceButton:DoClick()
        		surface.PlaySound( "ui/buttonclickrelease.wav" )
        		if inv.ResourceDialogue then
        			inv.ResourceDialogue:Remove()
        		end

        		inv.ResourceDialogue = vgui.Create( "resource_dialogue" )
        		inv.ResourceDialogue.res = k
        		inv.ResourceDialogue.amt = v

        		if ResourceButton.consumeEnable then
        			inv.ResourceDialogue.consumeEnable = true
        		end

        		if ResourceButton.unpackEnable then
        			inv.ResourceDialogue.unpackEnable = true
        		end

        		inv.ResourceDialogue:MakePopup()
        	end
        end

        for k, v in SortedPairs( children ) do
        	if SGS.resources[ k ] && SGS.resources[ k ] > 0 then continue end

        	children[ k ]:Remove()
        end
    end
    DrawSideInventory()
    concommand.Add( "sgs_refreshsideinventory", DrawSideInventory )
end

function PANEL:Paint()

    local wide = self:GetWide()
    local tall = self:GetTall()
    local x = 0
    local y = 0

    surface.SetDrawColor( 0, 0, 0, 210 )

    surface.DrawRect( x, y, wide, tall ) --Outer
    surface.DrawRect( x + 4, y + 4, wide - 14, tall - 8 ) --Inner

    surface.SetDrawColor( 100, 100, 100, 255 )
    surface.DrawRect( x + 8, y + 8, wide - 36, tall - 584 )

    draw.SimpleText( "Inventory: " .. SGS.curinv .. " / " .. SGS.maxinv, "SGS_HUD2", wide / 2, 9, Color( 255, 255, 255, 255 ), 1, 0 )

end
vgui.Register( "sgs_sideinventory", PANEL, "Panel" )