function SGS_ConSpawnEntity(ply, com, args)
    if !ply:IsSuperAdmin() or !ply:IsUserGroup("developer") then
		ply:SendMessage("This command is reserved for Developers!", 60, Color(255, 0, 0, 255))
		return
	end

    local trace = {}
	trace.start = ply:EyePos()
	trace.endpos = ply:EyePos() + ply:EyeAngles():Forward() * 10000
    trace.filter = ply
    local tr = util.TraceLine(trace)

    if tr.Hit then
        local ent = ents.Create(args[1])
        local position = tr.HitPos + Vector(0, 0, args[2])
        ent:SetPos(position)
        ent:Spawn()
        ent:SetNWString("Owner", "World")

        print(ply:GetName() .. " created " .. args[1] .. " in position: " .. tostring(position))
    end
end
concommand.Add("sgs_spawnentity", SGS_ConSpawnEntity)