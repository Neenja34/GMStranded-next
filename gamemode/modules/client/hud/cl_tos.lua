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
	self.time = SGS.tostime
	self.nextthink = CurTime() + 1
	self.bdisabled = true
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
	TOSbutton:SetText( "Wait: " .. self.time )
	TOSbutton:SetDisabled( true )
	TOSbutton.DoClick = function( TOSbutton )
		if TOSbutton:GetDisabled() then return end
		RunConsoleCommand( "sgs_accepttos" )
		self:Remove()
	end

	TOSbutton2 = vgui.Create( "DButton", self )
	TOSbutton2:SetSize( 120, 40 )
	TOSbutton2:SetPos( 140, self.sizey - 52 )
	TOSbutton2:SetText( "I DON'T ACCEPT" )
	TOSbutton2.DoClick = function( TOSbutton2 )
		RunConsoleCommand( "disconnect" )
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
vgui.Register( "sgs_tospanel", PANEL, "EditablePanel" )