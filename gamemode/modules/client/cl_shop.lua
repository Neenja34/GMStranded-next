local minDist = 360000
local maxDist = 4000000

local black = Color( 0, 0, 0, 255 )
local gray = Color( 100, 200, 200, 255 )

local npctexts = {
	["npc_vortigaunt"] = {
		entity = nil,
		texts = {
			"Vorty",
			"[GToken Vendor]"
		}
	},
	["npc_gman"] = {
		entity = nil,
		texts = {
			"The President",
			"[Quest Rewards]"
		}
	},
	["npc_breen"] = {
		entity = nil,
		texts = {
			"Dr. Breen",
			"[Holiday Vendor]"
		}
	},
	["npc_kleiner"] = {
		entity = nil,
		texts = {
			"Dr. K",
			"[Hat Salesman]"
		}
	},
}

function DrawShopName()
	local mepos = LocalPlayer():GetPos()
	for _, v in pairs( npctexts ) do
		local entity = v.entity
		if entity == nil || !IsValid(entity) then continue end
		local tpos = entity:GetPos()
		local dist = mepos:DistToSqr( tpos )
		local pos = ( tpos + Vector( 0, 0, entity:OBBMaxs().z + 15 ) ):ToScreen()

		if dist < minDist then
			for y, t in pairs( v.texts ) do
				draw.SimpleTextOutlined( t, "SGS_HUD3", pos.x, pos.y - 25 + ((y - 1) * 15), gray, 1, 1, 1, black )
			end
		elseif dist < maxDist then
			draw.RoundedBoxEx( 2, pos.x - 4, pos.y - 4, 8, 8, gray, true, true, true, true )
		end
	end
end
hook.Add( "HUDPaint", "DrawShopName", DrawShopName )

function GetShopEntities()
	for k, v in pairs( ents.GetAll() ) do
		local texts = npctexts[v:GetClass()]
		if texts == nil then continue end
		if texts.entity != nil && IsValid(texts.entity) then continue end
		if v:GetNWBool( "ispet", false ) then continue end
		texts.entity = v
	end
end
hook.Add( "Think", "GetShopNameEntities", GetShopEntities )