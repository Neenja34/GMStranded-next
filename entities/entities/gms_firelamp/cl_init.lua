include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH

--Called when it's time to draw the entity.
--Return: Nothing
ENT.rotate = 0
function ENT:Draw()

	if !self.visible then
		self:DestroyShadow()
		return
	end

	self:CreateShadow()
	self:DrawModel()

end

--Called when the SENT is spawned
--Return: Nothing
function ENT:Initialize()
	local ed = EffectData()
	ed:SetEntity( self )
	util.Effect( 'particle_luafire5', ed, true, true )
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
	if lightdistance == nil then return end

	local pl = LocalPlayer()
	local dis = pl:GetPos():DistToSqr(self:GetPos())
	if dis > lightdistance:GetInt() then
		self.visible = false
		return
	else
		self.visible = true
	end

	local dlight = DynamicLight( self:EntIndex() )
	if ( dlight ) then
		dlight.Pos = self:LocalToWorld(Vector( 0, 0, -15 ))
		dlight.r = 255
		dlight.g = 100
		dlight.b = 50
		dlight.Brightness = 1.5
		dlight.MinLight = 0.04
		dlight.Size = 300
		dlight.Decay = 210 * 2
		dlight.DieTime = CurTime() + 1
		dlight.Style = 6
	end

end

