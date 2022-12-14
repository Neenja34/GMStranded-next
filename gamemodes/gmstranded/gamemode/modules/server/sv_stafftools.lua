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

    if !tr.Hit then return end

    local ent = ents.Create(args[1])
    local position = tr.HitPos + Vector(0, 0, args[2])
    ent:SetPos(position)
    if #args > 4 then
        ent:SetAngles(Angle(args[3], args[4], args[5]))
    end
    ent:Spawn()
    ent:SetNWString("Owner", "World")

    print(ply:GetName() .. " created " .. args[1] .. " in position: " .. tostring(position))
end
concommand.Add("sgs_spawnentity", SGS_ConSpawnEntity)

local spawnPoints = {}
function SGS_AddMeteorSpawnPoint(ply, com)
    if !ply:IsSuperAdmin() then
        ply:SendMessage("This command is reserved for Developers!", 60, Color(255, 0, 0, 255))
        return
    end

    local trace = {}
    trace.start = ply:EyePos()
    trace.endpos = ply:EyePos() + ply:EyeAngles():Forward() * 10000
    trace.filter = ply
    local tr = util.TraceLine(trace)

    if !tr.Hit then return end

    table.insert(spawnPoints, tr.HitPos)
    PrintTable(spawnPoints)
end
concommand.Add("sgs_addMeteorSpawnPoint", SGS_AddMeteorSpawnPoint)

function SGS_SaveMeteorSpawnPoints(ply, com)
    if !ply:IsSuperAdmin() then
        ply:SendMessage("This command is reserved for Developers!", 60, Color(255, 0, 0, 255))
        return
    end
    file.Write("sgstranded/mapsaves/meteorspawnpoints/" .. game.GetMap() .. ".txt",util.TableToJSON(spawnPoints, true))
end
concommand.Add("sgs_saveMeteorSpawnPoints", SGS_SaveMeteorSpawnPoints)