AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

--Called when an entity is no longer touching this SENT.
--Return: Nothing
function ENT:EndTouch(entEntity)
end

--Called when the SENT is spawned
--Return: Nothing

function ENT:Initialize()
	self:SetModel("models/Gibs/HGIBS.mdl")
	self:SetModelScale( self:GetModelScale() * 2.25, 1 )
 	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	
	self:SetColor( Color( math.random( 100,255), math.random( 100,255), math.random( 100,255), 255 ) )
	
	self:SetUseType(3)
end

function ENT:Use( ply )
	ply:SendMessage("You picked up a package of stuff!",3,Color(255,50,50,255))
	local tier = math.random(1,100)
	if tier <= 65 then
		SGS_AwardEasterTier( ply, 0 )
	elseif tier > 65 and tier <= 80 then
		SGS_AwardEasterTier( ply, 1 )
	elseif tier > 80 and tier <= 88 then
		SGS_AwardEasterTier( ply, 2 )
	elseif tier > 88 and tier <= 94 then
		SGS_AwardEasterTier( ply, 3 )
	elseif tier > 94 and tier <= 99 then
		SGS_AwardEasterTier( ply, 4 )
	else
		SGS_AwardEasterTier( ply, 5 )
	end
	self:Remove()
end

function ENT:OnRemove()
	timer.Simple( SGS.eggrespawn, SGS_SpawnEgg )
end

function ENT:AcceptInput(input, ply)
end

--Called when the entity key values are setup (either through calls to ent:SetKeyValue, or when the map is loaded).
--Return: Nothing
function ENT:KeyValue(k,v)
end

--Called when a save-game is loaded.
--Return: Nothing
function ENT:OnRestore()
end

--Called when something hurts the entity.
--Return: Nothing
function ENT:OnTakeDamage(dmiDamage)
end

--Controls/simulates the physics on the entity.
--Return: (SimulateConst) sim, (Vector) linear_force and (Vector) angular_force
function ENT:PhysicsSimulate(pobPhysics,numDeltaTime)
end

--Called when an entity starts touching this SENT.
--Return: Nothing
function ENT:StartTouch(entEntity)
end

--Called when the SENT thinks.
--Return: Nothing
function ENT:Think()

end

--Called when an entity touches this SENT.
--Return: Nothing
function ENT:Touch(entEntity)
end

--Called when: ?
--Return: TRANSMIT_ALWAYS, TRANSMIT_NEVER or TRANSMIT_PVS
function ENT:UpdateTransmitState(entEntity)
end