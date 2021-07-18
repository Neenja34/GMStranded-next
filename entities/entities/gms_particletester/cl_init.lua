include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH

--Called when it's time to draw the entity.
--Return: Nothing
ENT.rotate = 0
function ENT:Draw()

	local pl = LocalPlayer()

	if self.world == GAMEMODE.Worlds:GetWorld( pl ) then
		local dis = pl:GetPos():DistToSqr(self:GetPos())
		if SGS.drawdistance == nil then return end

		if dis < SGS.drawdistance / 4 then
			self:DrawModel()
			if !self.shadowcreated then
				self:DrawShadow( true )
				self.shadowcreated = true
			end
		elseif self.shadowcreated then
			self:DestroyShadow()
			self:DrawShadow( false )
			self.shadowcreated = false
		end
	else
		self:DestroyShadow()
		self:DrawShadow( false )
		self.shadowcreated = false
	end

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

	self:RenderDistanceCheck( LocalPlayer(), true )
	self:SetNextClientThink( CurTime() + 1 )
	return true

end

