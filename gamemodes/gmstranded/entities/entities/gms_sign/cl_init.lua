include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH
--Called when it's time to draw the entity.
--Return: Nothing
function ENT:Draw()

	self:DrawOnRenderDistance()

	if self.visible then

		local FixAngles = self:GetAngles()
		local FixRotation = Vector( 90, 180, 180)
		FixAngles:RotateAroundAxis( FixAngles:Right(), FixRotation.x )
		FixAngles:RotateAroundAxis( FixAngles:Up(), FixRotation.y )
		FixAngles:RotateAroundAxis( FixAngles:Forward(), FixRotation.z )
		local TargetPos = self:GetPos() + ( self:GetUp() * 12 ) + ( self:GetForward() * 0.2 )
		cam.Start3D2D( TargetPos, FixAngles, 0.125 )
			local x = -10
			local y = -74
			draw.RoundedBox( 2, x, y, 220, 145, Color( 0, 0, 0, 255 ) )
			draw.SimpleText( self:GetNWString( "line1" ), "sign", x + 105, y + 10, self.color, 1, 1 )
			draw.SimpleText( self:GetNWString( "line2" ), "sign", x + 105, y + 35, self.color, 1, 1 )
			draw.SimpleText( self:GetNWString( "line3" ), "sign", x + 105, y + 60, self.color, 1, 1 )
			draw.SimpleText( self:GetNWString( "line4" ), "sign", x + 105, y + 85, self.color, 1, 1 )
			draw.SimpleText( self:GetNWString( "line5" ), "sign", x + 105, y + 110, self.color, 1, 1 )
		cam.End3D2D()

	end

end

--Called when the SENT is spawned
--Return: Nothing
function ENT:Initialize()

	self.color = Color( 255, 255, 255, 255 )

	self.line1 = "ABCDEFGHIJKLMNOP"
	self.line2 = "This is rediculo"
	self.line3 = "TEST LINE 3"
	self.line4 = "TEST LINE 4"
	self.line5 = "TEST LINE 5"

	self.visible = true
	self:DrawShadow( false )
	self.shadowcreated = false
	self.world = GAMEMODE.Worlds:GetWorld( self )

end

--Return true if this entity is translucent.
--Return: Boolean
function ENT:IsTranslucent()
end

--Called when a save-game is loaded.
--Return: Nothing
function ENT:OnRestore()
end

--Called when the SENT thinks.
--Return: Nothing
function ENT:Think()

	if SGS.drawdistance == nil then return end

	local world = self.world
	local pl = LocalPlayer()

	if world == pl.world then
		local dis = pl:GetPos():DistToSqr( self:GetPos() )
		self.visible = dis < SGS.drawdistance / 32
	else
		world = GAMEMODE.Worlds:GetWorld( self )
		self.visible = false
		return
	end

	self:SetNextClientThink( CurTime() + 1)
	return true

end