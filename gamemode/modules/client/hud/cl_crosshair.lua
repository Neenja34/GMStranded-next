local gap = CreateClientConVar( "sgs_crosshair_gap", "4", true, false, "", 0, 100 )
local length = CreateClientConVar( "sgs_crosshair_length", "10", true, false, "", 0, 100 )
local thickness = CreateClientConVar( "sgs_crosshair_thickness", "2", true, false, "", 0, 100 )
local outline = CreateClientConVar( "sgs_crosshair_outline", "1", true, false, "", 0, 1 )
local outlineThickness = CreateClientConVar( "sgs_crosshair_outline_thickness", "2", true, false, "", 0, 100 )
CreateClientConVar( "sgs_crosshair_color", "255,255,255,255", true, false, "" )
CreateClientConVar( "sgs_crosshair_outline_color", "0,0,0,255", true, false, "" )

local color = {}
local outlinecolor = {}

function SGS_DrawCrosshair()

	if !LocalPlayer():Alive() then return end
	if SGS.hudtimer[ "display" ] == true then return end

	if SGS.person == "third" then
		local trace = LocalPlayer():GetEyeTraceNoCursor()
		local hitpos = trace.HitPos
		local pos = hitpos:ToScreen()

		crosshairX = pos.x
		crosshairY = pos.y
	else
		crosshairX = ScrW() / 2
		crosshairY = ScrH() / 2
	end

	if outline:GetBool() then

		outlinecolor = string.Split( GetConVar( "sgs_crosshair_outline_color" ):GetString(), "," )

		surface.SetDrawColor( Color( outlinecolor[ 1 ], outlinecolor[ 2 ], outlinecolor[ 3 ], outlinecolor[ 4 ] ) )

		surface.DrawRect( crosshairX - gap:GetInt() - length:GetInt() - ( outlineThickness:GetInt() / 2 ),
							crosshairY - ( thickness:GetInt() / 2 ) - ( outlineThickness:GetInt() / 2 ),
							length:GetInt() + outlineThickness:GetInt(),
							thickness:GetInt() + outlineThickness:GetInt() ) --Left

		surface.DrawRect( crosshairX - ( thickness:GetInt() / 2 ) - ( outlineThickness:GetInt() / 2 ),
							crosshairY - gap:GetInt() - length:GetInt() - ( outlineThickness:GetInt() / 2 ),
							thickness:GetInt() + outlineThickness:GetInt(),
							length:GetInt() + outlineThickness:GetInt() ) --Up

		surface.DrawRect( crosshairX + gap:GetInt() - ( outlineThickness:GetInt() / 2 ),
							crosshairY - ( thickness:GetInt() / 2 ) - ( outlineThickness:GetInt() / 2 ),
							length:GetInt() + outlineThickness:GetInt(),
							thickness:GetInt() + outlineThickness:GetInt() ) --Right

		surface.DrawRect( crosshairX - ( thickness:GetInt() / 2 ) - ( outlineThickness:GetInt() / 2 ),
							crosshairY + gap:GetInt() - ( outlineThickness:GetInt() / 2 ),
							thickness:GetInt() + outlineThickness:GetInt(),
							length:GetInt() + outlineThickness:GetInt() ) --Down

	end

	color = string.Split( GetConVar( "sgs_crosshair_color" ):GetString(), "," )

	surface.SetDrawColor( Color( color[ 1 ], color[ 2 ], color[ 3 ], color[ 4 ] ) )
	surface.DrawRect( crosshairX - gap:GetInt() - length:GetInt(),
						crosshairY - ( thickness:GetInt() / 2 ),
						length:GetInt(), thickness:GetInt() ) --Left

	surface.DrawRect( crosshairX - ( thickness:GetInt() / 2 ),
						crosshairY - gap:GetInt() - length:GetInt(),
						thickness:GetInt(), length:GetInt() ) --Up

	surface.DrawRect( crosshairX + gap:GetInt(),
						crosshairY - ( thickness:GetInt() / 2 ),
						length:GetInt(), thickness:GetInt() ) --Right

	surface.DrawRect( crosshairX - ( thickness:GetInt() / 2 ),
						crosshairY + gap:GetInt(),
						thickness:GetInt(), length:GetInt() ) --Down

end
hook.Add( "HUDPaint", "SGS_DrawCrosshair", SGS_DrawCrosshair )