local white = Color( 255, 255, 255, 255 )
local black = Color( 0, 0, 0, 255 )
local red = Color( 255, 20, 20, 255 )

surface.CreateFont( "DeathNotice1",
{
	font		= "tahoma",
	size		= 36,
	weight		= 800,
	shadow		= true
})

surface.CreateFont( "DeathNotice2",
{
	font		= "tahoma",
	size		= 24,
	weight		= 800,
	shadow		= true
})

surface.CreateFont( "DeathNotice3",
{
	font		= "tahoma",
	size		= 14,
	weight		= 800,
	shadow		= true
})

surface.CreateFont( "DeathNotice4",
{
	font		= "tahoma",
	size		= 18,
	weight		= 800,
	shadow		= true
})

surface.CreateFont( "DeathNotice5",
{
	font		= "tahoma",
	size		= 64,
	weight		= 800,
	shadow		= false
})

surface.CreateFont( "DeathNotice6",
{
	font		= "tahoma",
	size		= 124,
	weight		= 800,
	shadow		= false
})

--DEATH HUD
function SGS_DeathHUD()
	if !LocalPlayer():GetNWBool( "displaydeathnotice", false ) then return end
	draw.RoundedBoxEx( 4, ScrW() / 2 - 300, ScrH() / 2 - 225, 600, 450, Color( 80, 80, 80, 200 ), true, true, true, true )
	draw.RoundedBoxEx( 4, ScrW() / 2 - 296, ScrH() / 2 - 221, 592, 442, Color( 50, 50, 50, 200 ), true, true, true, true )
	local keyword = "respawn"
	if LocalPlayer():Alive() then keyword = "close" end
	draw.DrawText( "Press Jump (Defult: Space) to " .. keyword .. "!", "DeathNotice4", ScrW() / 2, ScrH() / 2 - 210, white, TEXT_ALIGN_CENTER )
	draw.DrawText( "You Have Died!", "DeathNotice1", ScrW() / 2, ScrH() / 2 - 190, red, TEXT_ALIGN_CENTER )
	draw.DrawText( "You Were Killed By: ", "DeathNotice2", ScrW() / 2 - 280, ScrH() / 2 - 130, red, TEXT_ALIGN_LEFT )
	draw.DrawText( SGS.killerstring, "DeathNotice2", ScrW() / 2 - 80, ScrH() / 2 - 130, white, TEXT_ALIGN_LEFT )
	draw.DrawText( "Items Dropped: ", "DeathNotice2", ScrW() / 2 - 280, ScrH() / 2 - 80, red, TEXT_ALIGN_LEFT )
	draw.DrawText( "Items Destroyed: ", "DeathNotice2", ScrW() / 2 - 80, ScrH() / 2 - 80, red, TEXT_ALIGN_LEFT )
	draw.DrawText( "Tools Dropped: ", "DeathNotice2", ScrW() / 2 + 140, ScrH() / 2 - 80, red, TEXT_ALIGN_LEFT )

	draw.DrawText( SGS.itemsdropped, "DeathNotice3", ScrW() / 2 - 280, ScrH() / 2 - 50, white, TEXT_ALIGN_LEFT )
	draw.DrawText( SGS.itemsdestroyed, "DeathNotice3", ScrW() / 2 - 80, ScrH() / 2 - 50, white, TEXT_ALIGN_LEFT )
	draw.DrawText( SGS.toolsdropped, "DeathNotice3", ScrW() / 2 + 140, ScrH() / 2 - 50, white, TEXT_ALIGN_LEFT )
end
hook.Add( "HUDPaint", "SGS_DeathHUD", SGS_DeathHUD )

--DEATH HUD
function SGS_DeathHUD2()

	if LocalPlayer():Alive() then return end
	if LocalPlayer():GetNWBool( "displaydeathnotice", false ) then return end
	draw.DrawText( "You Are Near Death!", "DeathNotice5", ScrW() / 2 - 2, 148, black, TEXT_ALIGN_CENTER )
	draw.DrawText( "You Are Near Death!", "DeathNotice5", ScrW() / 2, 150, red, TEXT_ALIGN_CENTER )
	draw.DrawText( "Unless Resurrected You Will Die In:", "DeathNotice1", ScrW() / 2 - 2, 208, black, TEXT_ALIGN_CENTER )
	draw.DrawText( "Unless Resurrected You Will Die In:", "DeathNotice1", ScrW() / 2, 210, red, TEXT_ALIGN_CENTER )
	local timeleft = math.Clamp( LocalPlayer():GetNWInt( "deathtotaltime", 60 ) - ( math.floor( CurTime() ) - LocalPlayer():GetNWInt( "lastdeathtime" ) ), 0, LocalPlayer():GetNWInt( "deathtotaltime", 60 ) )
	draw.DrawText( timeleft, "DeathNotice6", ScrW() / 2 -2, 298, black, TEXT_ALIGN_CENTER )
	draw.DrawText( timeleft, "DeathNotice6", ScrW() / 2, 300, red, TEXT_ALIGN_CENTER )

	draw.DrawText( "Press Reload (Default: R) To Skip Timer", "DeathNotice2", ScrW() / 2 -2, 430, black, TEXT_ALIGN_CENTER )
	draw.DrawText( "Press Reload (Default: R) To Skip Timer", "DeathNotice2", ScrW() / 2, 432, red, TEXT_ALIGN_CENTER )
	draw.DrawText( "Some items may be lost.", "DeathNotice2", ScrW() / 2 -2, 600, black, TEXT_ALIGN_CENTER )
	draw.DrawText( "Some items may be lost.", "DeathNotice2", ScrW() / 2, 600, red, TEXT_ALIGN_CENTER )

end
hook.Add( "HUDPaint", "SGS_DeathHUD2", SGS_DeathHUD2 )