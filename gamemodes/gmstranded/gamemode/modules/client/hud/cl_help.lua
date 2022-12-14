local black = Color( 0, 0, 0, 210 )

local PANEL = {}

function PANEL:Init()

	self.x = ScrW()
	self.y = ScrH()
	self.sizex = self.x * 0.8
	self.sizey = self.y * 0.8
	self:SetSize( self.sizex, self.sizey )
	self:SetPos( ( ScrW() / 2 ) - ( self.sizex / 2 ), ( ScrH() / 2 ) - ( self.sizey / 2 ) )
	self:SetVisible( false )
	self:DrawFrame()

end

function PANEL:Paint( w, h )

	surface.SetDrawColor( black )
	surface.DrawRect( 4, 4,  self:GetWide() - 8, self:GetTall() - 8 )

end

function PANEL:DrawFrame()

	HTMLTest = vgui.Create( "DHTML", self )
	HTMLTest:SetPos( 12, 12 )
	HTMLTest:SetSize( self.sizex - 24, self.sizey - 68 )
	HTMLTest:OpenURL( "http://neenja.nn.pe/guide" )

	TOSbutton = vgui.Create( "DButton", self )
	TOSbutton:SetSize( 120, 40 )
	TOSbutton:SetPos( 12, self.sizey - 52  )
	TOSbutton:SetText( "CLOSE" )
	TOSbutton.DoClick = function( TOSbutton )
		self:Remove()
	end

end
vgui.Register( "sgs_helppanel", PANEL, "Panel" )