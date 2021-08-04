local color = Color( 80, 80, 80, 150 )

local PANEL = {}

function PANEL:Init()

	self:SetPos( ( ScrW() / 2 ) - 400, 30 )
	self:SetSize( 800, 650 )
	self:SetVisible( false )
	self:DrawFrame()

end

function PANEL:Paint( w, h )

	draw.RoundedBoxEx( 16, 0, 0, self:GetWide(), self:GetTall(), color, true, true, true, true )

end

function PANEL:DrawFrame()

	HTMLPanel = vgui.Create( "DPanel", self )
	HTMLPanel:SetPos( 8, 64 )
	HTMLPanel:SetSize( 782, 500 )

	HTMLTest = vgui.Create( "DHTML", HTMLPanel )
	HTMLTest:SetPos( 0, 0 )
	HTMLTest:Dock( FILL )
	HTMLTest:OpenURL( "http://neenja.nn.pe/" )

	HelpButton = vgui.Create( "DButton", self )
	HelpButton:SetSize( 120, 40 )
	HelpButton:SetPos( 8, 572 )
	HelpButton:SetText( "OK" )
	HelpButton.DoClick = function( HelpButton )
		self:Remove()
	end

end
vgui.Register( "sgs_wikipanel", PANEL, "EditablePanel" )