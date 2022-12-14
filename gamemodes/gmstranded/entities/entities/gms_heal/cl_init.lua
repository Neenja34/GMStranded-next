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

	if self.visible then

		local color = self:GetColor()
		local start = self:GetPos()
		render.SetMaterial(self.Glow)
		for i = 1, 2 do
			render.DrawSprite(
				start,
				self.Sizes[2],self.Sizes[2],
				color
			)
		end

	end

end

--Called when the SENT is spawned
--Return: Nothing
function ENT:Initialize()

	self.Created = CurTime()
	self.Sizes = { 6, 6, 180 } -- X,Y and shaft-leght!
	self.world = GAMEMODE.Worlds:GetWorld( self )

	if self.world == LocalPlayer().world then
		self.visible = true
	else
		self.visible = false
	end

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