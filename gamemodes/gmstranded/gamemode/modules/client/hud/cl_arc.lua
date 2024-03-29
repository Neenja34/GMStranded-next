local white = Color( 255, 255, 255, 255 )
local black = Color( 0, 0, 0, 255 )
local black2 = Color( 0, 0, 0, 180 )
local innerColor = Color( 20, 200, 200, 220 )

function surface.PrecacheArc( cx, cy, radius, thickness, startang, endang, roughness, bClockwise )

	local triarc = {}
	local deg2rad = math.pi / 180

	-- Correct start/end ang
	local startang, endang = startang or 0, endang or 0
	if bClockwise && startang < endang then
		local temp = startang
		startang = endang
		endang = temp
		temp = nil
	elseif startang > endang then
		local temp = startang
		startang = endang
		endang = temp
		temp = nil
	end

	-- Define step
	local roughness = math.max( roughness or 1, 1 )
	local step = roughness
	if bClockwise then
		step = math.abs( roughness ) * -1
	end

	-- Create the inner circle's points.
	local inner = {}
	local r = radius - thickness
	for deg = startang, endang, step do
		local rad = deg2rad * deg
		table.insert( inner, {
			x = cx + ( math.cos( rad ) * r ),
			y = cy + ( math.sin( rad ) * r )
		} )
	end

	-- Create the outer circle's points.
	local outer = {}
	for deg = startang, endang, step do
		local rad = deg2rad * deg
		table.insert( outer, {
			x = cx + ( math.cos( rad ) * radius ),
			y = cy + ( math.sin( rad ) * radius )
		} )
	end

	-- Triangulate the points.
	for tri = 1, #inner * 2 do -- twice as many triangles as there are degrees.
		local p1,p2,p3
		p1 = outer[ math.floor( tri / 2 ) + 1 ]
		p3 = inner[ math.floor( ( tri + 1 ) / 2 ) + 1 ]
		if tri % 2 == 0 then --if the number is even use outer.
			p2 = outer[ math.floor( ( tri + 1 ) / 2 ) ]
		else
			p2 = inner[ math.floor( ( tri + 1 ) / 2 ) ]
		end
		table.insert( triarc, { p1, p2, p3 } )
	end
	-- Return a table of triangles to draw.
	return triarc

end

function surface.DrawArc( arc )
	for k,v in ipairs( arc ) do
		surface.DrawPoly( v )
	end
end

function draw.Arc( cx, cy, radius, thickness, startang, endang, roughness, color, bClockwise )
	surface.SetDrawColor( color )
	surface.DrawArc( surface.PrecacheArc( cx, cy, radius, thickness, startang, endang, roughness, bClockwise ) )
end

hook.Add( "PostRenderVGUI", "Circles", function()

	if ( SGS.hudtimer[ "display" ] or false ) == false then return end
	local angSeg = 205
	local angOffset = 270
	local size = 64

	if SGS.colors[ SGS.hudtimer[ "skill" ] ] then
		innerColor = SGS.colors[ SGS.hudtimer[ "skill" ] ]
	end

	local barlen = ( SGS.hudtimer[ "etime" ] - CurTime() ) / SGS.hudtimer[ "len" ]
	barlen = -barlen + 1
	local w = barlen * 360
	if barlen == 0 then w = 0 end

	angSeg = math.Clamp( w, 0, 360 )

	surface.SetTexture( 0 )
	draw.Arc(
		ScrW() / 2, --pos x
		ScrH() / 2, --pos y
		size / 2, --circle radius
		9, --border thickness
		angOffset, --start angle
		angOffset + 360, --end angle
		4, --steps (smaller=more steps)
		black2,
		false
	)
	draw.Arc(
		ScrW() / 2, --pos x
		ScrH() / 2, --pos y
		( size - 3 ) / 2, --circle radius
		6, --border thickness
		angOffset, --start angle
		angOffset + angSeg, --end angle
		4, --steps (smaller=more steps)
		innerColor,
		false
	)

	draw.SimpleTextOutlined( SGS.hudtimer[ "text" ], "SGS_HUD3", ScrW() / 2  , ( ScrH() / 2 ) -50, white, 1, 1, 1, black )

	if CurTime() >= SGS.hudtimer[ "etime" ] then
		SGS.hudtimer[ "display" ] = false
	end

end )