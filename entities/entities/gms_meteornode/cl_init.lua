include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH
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
	self:CreateVortex()

end

function ENT:CreateVortex()
	self.vortex = ents.CreateClientProp()
	self.vortex:SetPos( self:GetPos() )
	self.vortex:SetModel( "models/effects/portalfunnel.mdl" )
	self.vortex:SetParent( self )
	self.vortex:Spawn()
	self.vortex:SetModelScale( 0.8, 0 )
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

	local pl = LocalPlayer()

	if self.world == pl.world then
		self.visible = true
	else
		self.visible = false
	end

	self:SetNextClientThink( CurTime() + 1 )
	return true

end

function ENT:OnRemove()
	if IsValid( self.vortex ) then
		self.vortex:Remove()
	end
end