include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH
--Called when it's time to draw the entity.
--Return: Nothing


function ENT:Draw()

	self:DrawOnRenderDistance()

end

--Called when the SENT is spawned
--Return: Nothing
function ENT:Initialize()

	self:DrawShadow( false )
	self.shadowcreated = false
	self.world = GAMEMODE.Worlds:GetWorld( self )
	self.visible = true

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

	local pl = LocalPlayer()

	if self.world == pl.world then
		local dis = pl:GetPos():DistToSqr( self:GetPos() )
		self.visible = dis < SGS.drawdistance
	else
		self.visible = false
		return
	end

	local dlight = DynamicLight( self:EntIndex() )
	if ( dlight ) then
		dlight.Pos = self:LocalToWorld( Vector( 0, -35, 0) )
		dlight.r = 222
		dlight.g = 50
		dlight.b = 0
		dlight.Brightness = 1.2
		dlight.MinLight = 0.3
		dlight.Size = 30
		dlight.Decay = 10
		dlight.DieTime = CurTime() + 0.5
		dlight.Style = 6
	end

	local dlight2 = DynamicLight( self:EntIndex() + 1 )
	if ( dlight2 ) then
		dlight2.Pos = self:LocalToWorld( Vector( 0, 0, 20 ) )
		dlight2.r = 222
		dlight2.g = 50
		dlight2.b = 0
		dlight2.Brightness = 1.2
		dlight2.MinLight = 0.3
		dlight2.Size = 30
		dlight2.Decay = 10
		dlight2.DieTime = CurTime() + 0.5
		dlight2.Style = 5
	end

end