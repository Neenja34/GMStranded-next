local minDist = 360000
local maxDist = 4000000

local red = Color( 255, 0, 0, 255 )
local black = Color( 0, 0, 0, 255 )

function DrawNPCName()

	for k, v in pairs( ents.FindByClass( "npc_*" ) ) do

		if v:GetNWBool( "ispet" ) == true then continue end
		if v:GetClass() == "npc_antlion" and v:GetNWBool( "isburrowed" ) then continue end

		for _, o in pairs( SGS.worldnpcs ) do

			if v:GetClass() != o then continue end

			local me = LocalPlayer():GetPos()
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

		break
		end

	end

end
hook.Add( "HUDPaint", "DrawNPCName", DrawNPCName )

local MAT_SHIELD = Material("models/props_combine/com_shield001a")
hook.Add( "PreDrawTranslucentRenderables", "DrawShields", function()
    for k, v in pairs( ents.FindByClass("npc_*") ) do
        if v:GetNWBool( "shielded" ) == true then
			MAT_SHIELD:SetFloat( "$bluramount", 0 )
			MAT_SHIELD:SetFloat( "$refractamount", 0.01 )
            render.MaterialOverride(MAT_SHIELD)
            v:DrawModel()
            render.MaterialOverride()
        end
    end
    for k, v in pairs( player.GetAll() ) do
        if v:GetNWBool( "shielded" ) == true then
			MAT_SHIELD:SetFloat( "$bluramount", 0 ) 
			MAT_SHIELD:SetFloat( "$refractamount", 0.01 )
            render.MaterialOverride(MAT_SHIELD)
            v:DrawModel()
            render.MaterialOverride()
        end
    end
end )

local Laser = Material( "cable/blue_elec" )
hook.Add( "PreDrawTranslucentRenderables", "DrawHunterBeams", function()
	local boss = nil
	for k, v in pairs( ents.FindByClass("npc_hunter") ) do
		if !v.ispet then
			boss = v
			break
		end
	end
	if !boss then return end
	for k, v in pairs( player.GetAll() ) do
		if v:GetNWBool("levitated", false) then
			render.SetMaterial( Laser )
			render.DrawBeam( v:GetPos() + Vector(0,0,30), boss:GetPos() + Vector(0,0,90), 10, math.random(30,50), math.random(30,50), Color( 255, 255, 255, 255 ) )
		end
	end
end )

hook.Add( "Think", "EnragedHunterFlames", function()
	if CurTime() < ( LocalPlayer().nexthunterparticle or CurTime() ) then return end
	for k, v in pairs( ents.FindByClass("npc_hunter") ) do
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