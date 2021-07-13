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
	self:SetModel("models/props_c17/metalpot002a.mdl")
 	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self:SetUseType(3)
	
	self.ready = false
	self.burned = false
	
	self.cooktime = math.random(7,14)
	
	self.created = CurTime()
	
	self:SetColor(Color(255,150,150,255))
	
	self.sound = CreateSound(self, "ambient/fire/fire_small_loop1.wav")
	self.sound:PlayEx(1, math.random(70,150))

	local ed = EffectData()
	ed:SetEntity( self )
	util.Effect( 'particle_stoveflame2', ed )
end

function ENT:Use( ply )

	if self.ready then
		self.sound:Stop()
		if IsValid(self.parentent) then
			self.parentent.pArray[self.slot] = false
			self.parentent.pans = self.parentent.pans - 1
		end
		local food = self.food
		
		if !self.burned then
			if self.owner == ply then
				ply:AddExp( "cooking", food.xp )
			end
			ply:AddResource( food.name, 1 )
			ply:RandomFindChance()
			
			if food.sname == "fish" then 
			ply:AddStat( "cooking1", 1 )
			if ply:GetNWBool("hasquest") == true and ply:GetNWString("Quest") == "Cook meals." then
				ply:SetNWInt("amounttodo", ply:GetNWInt("amounttodo") - 1 )
				if ply:GetNWInt("amounttodo") == 0 then
					ply:RemoveQuest()
					ply:AddResource("quest_token", 1)
					if ply:GetNWBool("haswquest") == true and ply:GetNWString("Weekly") == "Complete Dailies." then
							ply:SetNWInt("wamounttodo", ply:GetNWInt("wamounttodo") - 1 )
							if ply:GetNWInt("wamounttodo") == 0 then
								ply:RemoveWeeklyQuest()
								ply:AddResource("quest_token", 1)
							end
						end
				end
			end
			end
			if food.sname == "pie" then
			ply:AddStat( "cooking2", 1 )
			if ply:GetNWBool("hasquest") == true and ply:GetNWString("Quest") == "Cook meals." then
				ply:SetNWInt("amounttodo", ply:GetNWInt("amounttodo") - 1 )
				if ply:GetNWInt("amounttodo") == 0 then
					ply:RemoveQuest()
					ply:AddResource("quest_token", 1)
					if ply:GetNWBool("haswquest") == true and ply:GetNWString("Weekly") == "Complete Dailies." then
							ply:SetNWInt("wamounttodo", ply:GetNWInt("wamounttodo") - 1 )
							if ply:GetNWInt("wamounttodo") == 0 then
								ply:RemoveWeeklyQuest()
								ply:AddResource("quest_token", 1)
							end
						end
				end
			end
			end
			if food.sname == "pizza" then
			ply:AddStat( "cooking3", 1 ) 
			if ply:GetNWBool("hasquest") == true and ply:GetNWString("Quest") == "Cook meals." then
				ply:SetNWInt("amounttodo", ply:GetNWInt("amounttodo") - 1 )
				if ply:GetNWInt("amounttodo") == 0 then
					ply:RemoveQuest()
					ply:AddResource("quest_token", 1)
					if ply:GetNWBool("haswquest") == true and ply:GetNWString("Weekly") == "Complete Dailies." then
							ply:SetNWInt("wamounttodo", ply:GetNWInt("wamounttodo") - 1 )
							if ply:GetNWInt("wamounttodo") == 0 then
								ply:RemoveWeeklyQuest()
								ply:AddResource("quest_token", 1)
							end
						end
				end
			end
			end
			if food.sname == "meat" then
			ply:AddStat( "cooking4", 1 ) 
			if ply:GetNWBool("hasquest") == true and ply:GetNWString("Quest") == "Cook meals." then
				ply:SetNWInt("amounttodo", ply:GetNWInt("amounttodo") - 1 )
				if ply:GetNWInt("amounttodo") == 0 then
					ply:RemoveQuest()
					ply:AddResource("quest_token", 1)
					if ply:GetNWBool("haswquest") == true and ply:GetNWString("Weekly") == "Complete Dailies." then
							ply:SetNWInt("wamounttodo", ply:GetNWInt("wamounttodo") - 1 )
							if ply:GetNWInt("wamounttodo") == 0 then
								ply:RemoveWeeklyQuest()
								ply:AddResource("quest_token", 1)
							end
						end
				end
			end
			end
			
			ply:SetStat( "cooking9", ply:GetStat("cooking1") + ply:GetStat("cooking2") + ply:GetStat("cooking3") + ply:GetStat("cooking4") )
			ply:CheckForAchievements( "chefhat" )
			ply:CheckForAchievements( "cookingmaster" )
		else
			ply:AddResource( "burned_" ..food.sname, 1 )
		
			if food.sname == "fish" then ply:AddStat( "cooking5", 1 ) end
			if food.sname == "pie" then ply:AddStat( "cooking6", 1 ) end
			if food.sname == "pizza" then ply:AddStat( "cooking7", 1 ) end
			if food.sname == "meat" then ply:AddStat( "cooking8", 1 ) end
		end
		
		self:Remove()
	else
		if IsValid(self.parentent) then
			self.parentent.pArray[self.slot] = false
			self.parentent.pans = self.parentent.pans - 1
		end
		
		local food = self.food
		for k, v in pairs( food.cost ) do
			ply:AddResource( k, v )
		end
		self.sound:Stop()
		self:Remove()
		
	end
	
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
	if !self.food then return end

	if !self.ready then
		if CurTime() >= self.created + self.endtime then
			self.ready = true
			self:SetColor(Color(255,255,255,255))
		end
	end
	
	if self.ready and !self.burned then
		if CurTime() >= self.created + self.endtime + self.burntime then
			self.burned = true
			self:SetColor( Color(40,40,40,255) )
			self.sound:Stop()
		end
	end
	
	self:NextThink(CurTime() + 0.2)
	return true
end

--Called when an entity touches this SENT.
--Return: Nothing
function ENT:Touch(entEntity)
end

--Called when: ?
--Return: TRANSMIT_ALWAYS, TRANSMIT_NEVER or TRANSMIT_PVS
function ENT:UpdateTransmitState(entEntity)
end