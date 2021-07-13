include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH

--Called when it's time to draw the entity.
--Return: Nothing
function ENT:Draw()
	if self:GetNWBool("draw", true) then
		self.Entity:DrawModel()
	end
end

--Called when the SENT is spawned
--Return: Nothing
function ENT:Initialize()
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
end

