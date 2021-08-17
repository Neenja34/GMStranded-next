local minDist = 360000
local maxDist = 4000000

local red = Color( 255, 0, 0, 255 )
local black = Color( 0, 0, 0, 255 )

local npcs = {
	["npc_antlion"] = {},
	["npc_zombie"] = {},
	["npc_antlionguard"] = {},
	["npc_manhack"] = {},
	["npc_hunter"] = {},
}

function GetAllNpcs()
	local all = {}
	for _, v in pairs(npcs) do
		for i, npc in pairs(v) do
			table.insert(all, npc)
		end
	end
	return all
end

function DrawNPCName()
	local me = LocalPlayer():GetPos()
	for class, npcTable in pairs( npcs ) do
		for k, v in pairs(npcTable) do
			if !IsValid(v) then continue end
			if class == "npc_antlion" and v:GetNWBool( "isburrowed" ) then continue end

			local target = v:GetPos()
			local dist = me:DistToSqr( target )
			local pos = ( target + Vector( 0, 0, v:OBBMaxs().z + 15 ) ):ToScreen()

			if dist < minDist then
				local hpbar = math.Clamp( ( v:Health() / v:GetNWInt( "maxhp" ) ) * 80, 0, 80 )
				draw.SimpleTextOutlined( v:GetNWString( "name" ), "SGS_HUD3", pos.x, pos.y - 30, red, 1, 1, 1, black )
				if v:GetNWInt( "level" ) > 0 then
					draw.SimpleTextOutlined( "Level: " .. tostring( v:GetNWInt( "level" ) ), "SGS_HUD3", pos.x, pos.y - 18, red, 1, 1, 1, black )
				else
					draw.SimpleTextOutlined( "Level: ??", "SGS_HUD3", pos.x, pos.y - 18, red, 1, 1, 1, black )
				end
				draw.RoundedBoxEx( 2, pos.x - 42, pos.y - 6, 84, 16, black, true, true, true, true )
				draw.RoundedBoxEx( 2, pos.x - 40, pos.y - 4, hpbar, 12, red, true, true, true, true )
			elseif dist < maxDist then
				draw.RoundedBoxEx( 2, pos.x - 4, pos.y - 4, 8, 8, red, true, true, true, true )
			end
		end
	end
end
hook.Add( "HUDPaint", "DrawNPCName", DrawNPCName )

function GetNpcs()
	-- First we cull invalid npcs from the lists
	local entitiesToRemove = {}
	for _, v in pairs(npcs) do
		for i, npc in pairs(table.Copy(v)) do
			if IsValid(npc) then continue end
			table.remove(v, i)
		end
	end

	-- Then we search new ones
	for k, v in pairs( ents.FindByClass( "npc_*" ) ) do
		local npcTable = npcs[v:GetClass()]
		if npcTable == nil then continue end
		if v:GetNWBool( "ispet" ) then continue end
		table.insert(npcTable, v)
	end
end
hook.Add( "Think", "GetNpcs", GetNpcs )

local MAT_SHIELD = Material("models/props_combine/com_shield001a")
hook.Add( "PreDrawTranslucentRenderables", "DrawShields", function()
	local npcsAndPlayers = GetAllNpcs()
	table.Merge(npcsAndPlayers, player.GetAll())

    for k, v in pairs(npcsAndPlayers) do
		if !IsValid(v) then continue end
        if !v:GetNWBool( "shielded" ) then continue end
		MAT_SHIELD:SetFloat( "$bluramount", 0 )
		MAT_SHIELD:SetFloat( "$refractamount", 0.01 )
		render.MaterialOverride(MAT_SHIELD)
		v:DrawModel()
		render.MaterialOverride()
    end
end)

local Laser = Material( "cable/blue_elec" )
hook.Add( "PreDrawTranslucentRenderables", "DrawHunterBeams", function()
	local boss = nil
	for k, v in pairs( npcs["npc_hunter"] ) do
		if !IsValid(v) then continue end
		if v.ispet then continue end
		boss = v
		break
	end
	if !boss then return end
	for k, v in pairs( player.GetAll() ) do
		if !v:GetNWBool("levitated", false) then continue end
		render.SetMaterial( Laser )
		render.DrawBeam( v:GetPos() + Vector(0,0,30), boss:GetPos() + Vector(0,0,90), 10, math.random(30,50), math.random(30,50), Color( 255, 255, 255, 255 ) )
	end
end )

hook.Add( "Think", "EnragedHunterFlames", function()
	if CurTime() < ( LocalPlayer().nexthunterparticle or CurTime() ) then return end
	for k, v in pairs( npcs["npc_hunter"] ) do
		if !IsValid(v) then continue end
		if !v:GetNWBool("enraged", false) then continue end
		local ED = EffectData()
		ED:SetOrigin( v:GetAttachment(5).Pos )
		ED:SetStart(Vector(255,255,255))
		local effect = util.Effect( 'particle_luafire_torch_v', ED, true, true )
		local ED = EffectData()
		ED:SetOrigin( v:GetAttachment(4).Pos )
		ED:SetStart(Vector(255,255,255))
		local effect = util.Effect( 'particle_luafire_torch_v', ED, true, true )
		local ED = EffectData()
		ED:SetOrigin( v:GetAttachment(11).Pos )
		ED:SetStart(Vector(255,255,255))
		local effect = util.Effect( 'particle_luafire_torch_v', ED, true, true )
		local ED = EffectData()
		ED:SetOrigin( v:GetAttachment(12).Pos )
		ED:SetStart(Vector(255,255,255))
		local effect = util.Effect( 'particle_luafire_torch_v', ED, true, true )
		local ED = EffectData()
		ED:SetOrigin( v:GetAttachment(13).Pos )
		ED:SetStart(Vector(255,255,255))
		local effect = util.Effect( 'particle_luafire_torch_v', ED, true, true )
	end
	LocalPlayer().nexthunterparticle = CurTime() + 0.05
end )