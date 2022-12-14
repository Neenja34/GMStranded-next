include("shared.lua")
--Called when it's time to draw the entity.
--Return: Nothing

ENT.Glow = SGS.MaterialFromVMT(
	"StaffGlow",
	[["UnLitGeneric"
	{
		"$basetexture"		"sprites/light_glow01"
		"$nocull" 1
		"$additive" 1
		"$vertexalpha" 1
		"$vertexcolor" 1
	}]]
);
ENT.Shaft = Material("effects/ar2ground2")
ENT.LightSettings = "cl_staff_dynlights_flight"

function ENT:Draw()

	if !self.visible then return end

	if (!self.StartPos) then self.StartPos = self:GetPos() end -- Needed for several workarounds
	local color = self:GetColor()
	local start = self:GetPos()

	render.SetMaterial( self.Glow )
	for i = 1, 2 do
		render.DrawSprite(
			start,
			self.Sizes[2],self.Sizes[2],
			color
		);
	end

end

--Called when the SENT is spawned
--Return: Nothing
function ENT:Initialize()
	self.Created = CurTime()
	self.Sizes = { 48, 48, 16 } -- X,Y and shaft-leght!
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
		dlight.Pos = self:GetPos() + Vector(0,0,0)
		dlight.r = 255
		dlight.g = 0
		dlight.b = 0
		dlight.Brightness = 1
		dlight.MinLight = 0.5
		dlight.Size = 48
		dlight.Decay = 1
		dlight.DieTime = CurTime() + 1
		dlight.Style = 4
	end

end