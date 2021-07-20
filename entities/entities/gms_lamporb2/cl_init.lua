include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH
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
ENT.Shaft = Material("effects/ar2ground2");
ENT.LightSettings = "cl_staff_dynlights_flight";

function ENT:Draw()

	if self.visible then

		local color = self:GetColor()
		local start = self:GetPos();

		render.SetMaterial( self.Glow )
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

	self.Sizes = { 64, 64, 180 } -- X,Y and shaft-leght!
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
		if dis < lightdistance:GetInt() then
			self.visible = true
		else
			self.visible = false
			return
		end

		local dlight = DynamicLight( self:EntIndex() )
		if ( dlight ) then
			dlight.Pos = self:GetPos() + Vector( 0, 0, 30 )
			dlight.r = 50
			dlight.g = 255
			dlight.b = 50
			dlight.Brightness = 0.5
			dlight.MinLight = 0.05
			dlight.Size = 512
			dlight.Decay = 210 * 2
			dlight.DieTime = CurTime() + 1
			dlight.Style = 5
		end

	end

end