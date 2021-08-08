AddCSLuaFile()
SWEP.Base = "custom_base"
SWEP.HoldType = "melee"
SWEP.ViewModelFOV = 60.100502512563
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/c_crowbar.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-3.646, -3.089, -2.162), angle = Angle(0.13, 0, 0) }
}

SWEP.VElements = {
	["rod"] = { type = "Model", model = "models/devonjones/stranded/ironrod.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.244, 1.444, -6.403), angle = Angle(-180, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["rod"] = { type = "Model", model = "models/devonjones/stranded/ironrod.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.79, 2.217, -7.209), angle = Angle(-169.691, -77.732, -20.851), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


local SwingSound = Sound( "weapons/slam/throw.wav" )
local Mins, Maxs = Vector(-12, -12, -12), Vector(12, 12, 12)
function SWEP:PrimaryAttack( right )

	local ply = self:GetOwner()
	ply:SetAnimation( PLAYER_ATTACK1 )
	self:SendWeaponAnim( ACT_VM_MISSCENTER )
	if IsFirstTimePredicted() then
		ply:SetAnimation( PLAYER_ATTACK1 )
	end

	force = ply:EyeAngles():Forward()
	local td = {}

	self:SetNextPrimaryFire(CurTime() + 0.8)

	if CLIENT then return end

	ply:EmitSound( SwingSound )

	if ply:GetLevel("combat") >= 10 then
		td.start = ply:GetShootPos()
		td.endpos = td.start + force * 100
		td.filter = ply
		td.mins = Mins
		td.maxs = Maxs

		if ( ply:IsPlayer() ) then
			ply:LagCompensation( true )
		end

		tr = util.TraceHull(td)

		if ( ply:IsPlayer() ) then
			ply:LagCompensation( false )
		end

		if tr.Hit then
			ent = tr.Entity
			if IsValid(ent) then
				if SERVER then
					dmg = DamageInfo()
					dmg:SetDamageType( DMG_GENERIC )
					dmg:SetDamage( math.random(12,23) )

					dmg:SetAttacker(ply)
					dmg:SetInflictor(ply)
					dmg:SetDamageForce(force * 20000)
					ent:TakeDamageInfo(dmg)
				end
			end
			SGS_EmitHitSound( tr.MatType, tr.HitPos )
		end

		if ply:GetInfo( "sgs_viewpunch_enable" ) == "1" then
			ply:ViewPunch( Angle( math.Rand( -2, 0 ), 5, math.Rand( -2, 2 ) ) )
		end

	else
		ply:SendMessage("This weapon requires a level 10 or higher in combat.", 60, Color(255, 125, 0, 255))
	end

end


function SWEP:SecondaryAttack()
end


function SWEP:Deploy()

	self:GetOwner():GetViewModel():SetPlaybackRate(1.3)
	self:SetNextPrimaryFire(CurTime() + 0.8)
	self:SendWeaponAnim(ACT_VM_DRAW)
	return true

end

