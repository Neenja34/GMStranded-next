local white = Color( 255, 255, 255, 255 )
local gray = Color( 80, 80, 80, 150 )
local darkgray = Color( 50, 50, 50, 150 )

surface.CreateFont( "UnlockFont1",
{
	font		= "tahoma",
	size		= 28,
	weight		= 800,
	shadow		= false
})

surface.CreateFont( "UnlockFont2",
{
	font		= "tahoma",
	size		= 18,
	weight		= 800,
	shadow		= false
})

--UnlockHUD
local unlock_window_w = 350
local unlock_window_h = 100
local unlock_window_top = 75
function SGS_UnlockHUD()

	if !LocalPlayer().skillunlocktbl then return end
	if CurTime() > ( LocalPlayer().achievementstart or 0 ) + 8 then return end
	draw.RoundedBoxEx( 4, ScrW() / 2 - unlock_window_w / 2, unlock_window_top, unlock_window_w, unlock_window_h, gray, true, true, true, true )
	draw.RoundedBoxEx( 4, ScrW() / 2 - ( unlock_window_w / 2 - 4 ), unlock_window_top + 4, unlock_window_w - 8, unlock_window_h - 8, darkgray, true, true, true, true )

	draw.DrawText( "Congratulations!", "UnlockFont1", ScrW() / 2 - 2, unlock_window_top + 10, white, TEXT_ALIGN_CENTER )
	draw.DrawText( "You have reached " .. LocalPlayer().skillunlocktbl[ 1 ] .. " level: " .. LocalPlayer().skillunlocktbl[ 2 ], "UnlockFont2", ScrW() / 2 - 2, unlock_window_top + 35, white, TEXT_ALIGN_CENTER )
	draw.DrawText( LocalPlayer().skillunlocktbl[ 3 ], "UnlockFont2", ScrW() / 2 - 2, unlock_window_top + 60, white, TEXT_ALIGN_CENTER )
	draw.DrawText( LocalPlayer().skillunlocktbl[ 4 ], "UnlockFont2", ScrW() / 2 - 2, unlock_window_top + 75, white, TEXT_ALIGN_CENTER )

end
hook.Add( "HUDPaint", "SGS_UnlockHUD", SGS_UnlockHUD )