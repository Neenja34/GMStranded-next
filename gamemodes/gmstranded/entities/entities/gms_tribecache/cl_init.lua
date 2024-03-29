include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH
--Called when it's time to draw the entity.
--Return: Nothing


--Models/effects/comball_tape
--Models/effects/comball_sphere
--Models/effects/vol_light001
--models/alyx/emptool_glow
--models/props_combine/stasisfield_beam


local MAT_SHIELD = Material("Models/effects/comball_tape")

function ENT:Draw()

	self:DrawOnRenderDistance()

end

local MAT_SHIELD = Material("models/alyx/emptool_glow")
function ENT:DrawTranslucent()

	if self.visible then

		MAT_SHIELD:SetFloat( "$bluramount", 1 )
		MAT_SHIELD:SetFloat( "$refractamount", 10 )
		render.MaterialOverride(MAT_SHIELD)
		self:SetModelScale( math.abs( math.sin( CurTime() * 2 ) / 7.5 ) + 1.05 , 0)
		self:DrawModel()
		render.MaterialOverride()
		self:SetModelScale(1,0)

	end

end


--Called when the SENT is spawned
--Return: Nothing
function ENT:Initialize()

	self:DrawShadow( false )
	self.shadowcreated = false
	self.world = GAMEMODE.Worlds:GetWorld( self )
	self.visible = true
	self.s = 40

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

	self:RenderDistanceCheck( LocalPlayer(), false )
	self:SetNextClientThink( CurTime() + 1 )
	return true

end