function SGS_ConSpawnEntity(ply, com, args)
    if !ply:IsSuperAdmin() or !ply:IsUserGroup("developer") then
		ply:SendMessage("This command is reserved for Developers!", 60, Color(255, 0, 0, 255))
		return
	end

    local tr = util.TraceLine( {
	start = ply:EyePos(),
	endpos = ply:EyePos() + ply:EyeAngles():Forward() * 10000,
	filter = function()
        if tr.HitWorld then
            return true
        end
    end
    } )
    print(ply:GetName() .. " created " .. args[1] .. " in position: " .. tostring(tr.HitPos))

    local ent = ents.Create(args[1])
	ent:SetPos(tr.HitPos)
	ent:Spawn()
	ent:SetNWString("Owner", "World")

end
concommand.Add( "sgs_spawnentity", SGS_ConSpawnEntity )