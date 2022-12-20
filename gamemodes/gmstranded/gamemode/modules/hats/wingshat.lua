local hatname = "wingshat"
local hat = {
	model="models/player/items/heavy/heavy_fairy_wings.mdl", 
	offsets={
		["models/player/group01/female_01.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/female_02.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/female_03.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/female_04.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/female_05.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/female_06.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_01.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_02.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_03.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_04.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_05.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_06.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_07.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_08.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group01/male_09.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/female_01.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/female_02.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/female_03.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/female_04.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/female_05.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/female_06.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_01.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_02.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_03.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_04.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_05.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_06.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_07.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_08.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03/male_09.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/female_01.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/female_02.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/female_03.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/female_04.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/female_05.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/female_06.mdl"] = { pos=Vector(-2.668095,-2.116796,0.000000), ang=Angle(-108.508408,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_01.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_02.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_03.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_04.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_05.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_06.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_07.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_08.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group03m/male_09.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group02/male_02.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group02/male_04.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group02/male_06.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/group02/male_08.mdl"] = { pos=Vector(-1.852786,-2.116796,0.000000), ang=Angle(-112.787262,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/hostage/hostage_01.mdl"] = { pos=Vector(-1.552646,-2.487621,0.000000), ang=Angle(-109.775215,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/hostage/hostage_02.mdl"] = { pos=Vector(-1.552646,-2.487621,0.000000), ang=Angle(-109.775215,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/hostage/hostage_03.mdl"] = { pos=Vector(-1.552646,-2.487621,0.000000), ang=Angle(-109.775215,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/hostage/hostage_04.mdl"] = { pos=Vector(-1.552646,-2.487621,0.000000), ang=Angle(-109.775215,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/alyx.mdl"] = { pos=Vector(-1.552646,-2.487621,0.000000), ang=Angle(-109.775215,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/barney.mdl"] = { pos=Vector(-1.809226,-1.206530,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/breen.mdl"] = { pos=Vector(-1.704759,-2.797380,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/eli.mdl"] = { pos=Vector(-1.681139,-2.269525,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/gman_high.mdl"] = { pos=Vector(-1.681139,-3.155338,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/kleiner.mdl"] = { pos=Vector(-1.681139,-3.155338,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/monk.mdl"] = { pos=Vector(-1.681139,-1.926546,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/mossman.mdl"] = { pos=Vector(-2.131008,-3.193145,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/mossman_arctic.mdl"] = { pos=Vector(-2.131008,-2.323112,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/arctic.mdl"] = { pos=Vector(-2.131008,-2.323112,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/guerilla.mdl"] = { pos=Vector(-1.042398,-1.210613,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/leet.mdl"] = { pos=Vector(-0.350330,-1.965711,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/phoenix.mdl"] = { pos=Vector(-0.153106,-1.607556,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/gasmask.mdl"] = { pos=Vector(-0.153106,-1.607556,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/gasmask.mdl"] = { pos=Vector(-3.656096,-7.189787,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(2.000000,2.000000,2.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/riot.mdl"] = { pos=Vector(-3.656096,-7.189787,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(2.000000,2.000000,2.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/swat.mdl"] = { pos=Vector(-3.656096,-7.189787,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(2.000000,2.000000,2.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/urban.mdl"] = { pos=Vector(-3.656096,-7.189787,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(2.000000,2.000000,2.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/combine_soldier.mdl"] = { pos=Vector(-2.406987,0.031046,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/combine_soldier_prisonguard.mdl"] = { pos=Vector(-2.406987,0.031046,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/combine_super_soldier.mdl"] = { pos=Vector(-0.553509,-0.389310,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/police.mdl"] = { pos=Vector(-1.883056,-1.587739,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/player/police_fem.mdl"] = { pos=Vector(-2.037621,-2.324064,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Spine4" },
		["models/vortigaunt.mdl"] = { pos=Vector(-2.290231,-5.064923,0.000000), ang=Angle(-100.608910,90.000000,90.000000), scale=Vector(2.000000,2.000000,2.000000), bone="ValveBiped.spine4" },
		["models/crow.mdl"] = { pos=Vector(0.000000,-0.043812,0.111114), ang=Angle(0.000000,0.000000,-24.806599), scale=Vector(0.400000,0.400000,0.400000), bone="Crow.Body" },
	}
}

RegisterHatSetting( hatname, hat )