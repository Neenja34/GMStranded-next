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

	self:DrawOnRenderDistance()

end


function ENT:DrawTranslucent()
	if(!self.StartPos) then self.StartPos = self:GetPos() end; -- Needed for several workarounds
	local color = self:GetColor()
	local start = self:GetPos();

	render.SetMaterial(self.Glow);
	for i =1,2 do
		render.DrawSprite(
			start,
			100,100,
			color
		)
	end
	self:DrawModel()
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

	self:RenderDistanceCheck( LocalPlayer(), true )
	self:NextThink( CurTime() + 1 )

end