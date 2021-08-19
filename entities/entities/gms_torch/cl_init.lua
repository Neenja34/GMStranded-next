include("shared.lua")

--Called when it's time to draw the entity.
--Return: Nothing
function ENT:Draw()

	if !self.visible then
		self:DestroyShadow()
		return
	end

	self:CreateShadow()
	self:DrawModel()

	if !self.lastparticle then self.lastparticle = 0 end
	if CurTime() > self.lastparticle + 0.05 then
		local ED = EffectData()
		ED:SetOrigin( self:LocalToWorld(Vector(0,0,13) ) )
		ED:SetStart(Vector(255,255,255))
		local effect = util.Effect( 'particle_luafire_torch_v', ED, true, true )
		self.lastparticle = CurTime()
	end

end

--Called when the SENT is spawned
--Return: Nothing
function ENT:Initialize()
	self.res = "ERROR"
	self.amt = 0
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

	if lightdistance == nil then return end

	local pl = LocalPlayer()
	local dis = pl:GetPos():DistToSqr(self:GetPos())
	if dis > lightdistance:GetInt() then
		self.visible = false
		return
	else
		self.visible = true
	end

	if SGS.showlights == false then return end

	local dlight = DynamicLight( self:EntIndex() )
	if ( dlight ) then
		dlight.Pos = self:LocalToWorld(Vector(0,0,13) )
		dlight.r = 255
		dlight.g = 100
		dlight.b = 50
		dlight.Brightness = 0.5
		dlight.MinLight = 0.01
		dlight.Size = 200
		dlight.Decay = 210 * 2
		dlight.DieTime = CurTime() + 1
		dlight.Style = 6
	end

end