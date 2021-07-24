include("shared.lua")
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
	self:SetLOD( -1 )

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

	self:RenderDistanceCheck( LocalPlayer(), true )
	self:SetNextClientThink( CurTime() + 1 )
	return true

end