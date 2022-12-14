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

	if SGS.showlights == false then return end

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
		dlight.Pos = self:LocalToWorld(Vector(15,-40, 10) )
		dlight.r = 255
		dlight.g = 255
		dlight.b = 255
		dlight.Brightness = 0.9
		dlight.MinLight = 0.1
		dlight.Size = 80
		dlight.Decay = 10
		dlight.DieTime = CurTime() + 0.5
		dlight.Style = 6
	end

end