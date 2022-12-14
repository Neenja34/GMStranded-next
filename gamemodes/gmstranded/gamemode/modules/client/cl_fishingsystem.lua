function Fishing_MousePress( ply, key )
	if !ply == LocalPlayer() then return end
	if !ply.lastclick then ply.lastclick = CurTime() - 0.2 end
	
	if ply.lastclick + 0.2 > CurTime() then return end
	
	if key == IN_ATTACK then
		ply:PrintMessage( HUD_PRINTTALK, "You pressed the attack button" )
		ply.lastclick = CurTime()
	end
end
--hook.Add( "KeyPress", "Fishing_MousePress", Fishing_MousePress )