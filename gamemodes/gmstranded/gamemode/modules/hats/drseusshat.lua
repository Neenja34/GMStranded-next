local hatname = "drseusshat"
local hat = {
	model="models/player/items/soldier/dappertopper.mdl", 
	offsets={
["models/player/group01/female_01.mdl"] = { pos=Vector(1.854191,0.775579,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_02.mdl"] = { pos=Vector(1.854191,0.775579,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_03.mdl"] = { pos=Vector(1.854191,0.304197,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_04.mdl"] = { pos=Vector(1.854191,0.775626,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_05.mdl"] = { pos=Vector(1.854191,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_06.mdl"] = { pos=Vector(1.854191,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_01.mdl"] = { pos=Vector(3.226261,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_02.mdl"] = { pos=Vector(2.576414,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_03.mdl"] = { pos=Vector(2.576414,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_04.mdl"] = { pos=Vector(3.011606,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_05.mdl"] = { pos=Vector(3.011606,0.424163,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_06.mdl"] = { pos=Vector(3.889230,0.775626,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_07.mdl"] = { pos=Vector(2.779764,0.058526,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_08.mdl"] = { pos=Vector(2.779764,0.058526,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_09.mdl"] = { pos=Vector(3.223550,0.299264,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_01.mdl"] = { pos=Vector(1.854191,0.775579,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_02.mdl"] = { pos=Vector(1.854191,0.775579,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_03.mdl"] = { pos=Vector(1.854191,0.304197,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_04.mdl"] = { pos=Vector(1.854191,0.775626,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_05.mdl"] = { pos=Vector(1.854191,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_06.mdl"] = { pos=Vector(1.854191,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_01.mdl"] = { pos=Vector(3.226261,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_02.mdl"] = { pos=Vector(2.576414,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_03.mdl"] = { pos=Vector(2.576414,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_04.mdl"] = { pos=Vector(3.011606,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_05.mdl"] = { pos=Vector(3.011606,0.424163,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_06.mdl"] = { pos=Vector(3.889230,0.775626,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_07.mdl"] = { pos=Vector(2.779764,0.058526,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_08.mdl"] = { pos=Vector(2.779764,0.058526,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_09.mdl"] = { pos=Vector(3.223550,0.299264,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_01.mdl"] = { pos=Vector(1.854191,0.775579,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_02.mdl"] = { pos=Vector(1.854191,0.775579,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_03.mdl"] = { pos=Vector(1.854191,0.304197,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_04.mdl"] = { pos=Vector(1.854191,0.775626,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_05.mdl"] = { pos=Vector(1.854191,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_06.mdl"] = { pos=Vector(1.854191,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_01.mdl"] = { pos=Vector(3.226261,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_02.mdl"] = { pos=Vector(2.576414,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_03.mdl"] = { pos=Vector(2.576414,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_04.mdl"] = { pos=Vector(3.011606,0.541317,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_05.mdl"] = { pos=Vector(3.011606,0.424163,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_06.mdl"] = { pos=Vector(3.889230,0.775626,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_07.mdl"] = { pos=Vector(2.779764,0.058526,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_08.mdl"] = { pos=Vector(2.779764,0.058526,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_09.mdl"] = { pos=Vector(3.223550,0.299264,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/hostage/hostage_01.mdl"] = { pos=Vector(2.559190,0.299264,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/hostage/hostage_02.mdl"] = { pos=Vector(3.217614,0.772878,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/hostage/hostage_03.mdl"] = { pos=Vector(2.886747,-0.047362,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/hostage/hostage_04.mdl"] = { pos=Vector(2.114725,0.756109,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/alyx.mdl"] = { pos=Vector(2.550445,-0.336562,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/breen.mdl"] = { pos=Vector(2.093070,0.036085,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/eli.mdl"] = { pos=Vector(2.896932,0.036085,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/gman_high.mdl"] = { pos=Vector(3.593400,0.534732,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/kleiner.mdl"] = { pos=Vector(2.554558,0.033813,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/monk.mdl"] = { pos=Vector(3.240696,0.159800,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/mossman.mdl"] = { pos=Vector(3.240696,0.159800,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/mossman_arctic.mdl"] = { pos=Vector(3.240696,0.159800,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/arctic.mdl"] = { pos=Vector(5.070398,0.159800,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/guerilla.mdl"] = { pos=Vector(4.836142,-0.216726,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/leet.mdl"] = { pos=Vector(6.719028,0.280558,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/phoenix.mdl"] = { pos=Vector(5.149656,0.280558,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/combine_soldier.mdl"] = { pos=Vector(4.053086,-1.838963,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/combine_soldier_prisonguard.mdl"] = { pos=Vector(4.053086,-1.838963,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/combine_super_soldier.mdl"] = { pos=Vector(5.235119,-1.838963,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/police.mdl"] = { pos=Vector(3.364557,0.051943,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/police_fem.mdl"] = { pos=Vector(2.024846,0.415302,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/gasmask.mdl"] = { pos=Vector(6.347943,0.171364,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/riot.mdl"] = { pos=Vector(6.347943,0.171364,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/swat.mdl"] = { pos=Vector(6.347943,0.171364,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/urban.mdl"] = { pos=Vector(6.347943,0.171364,0.000000), ang=Angle(-90.000000,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/crow.mdl"] = { pos=Vector(3.000091,4.496663,-0.224011), ang=Angle(32.464733,0.000000,-90.000000), scale=Vector(0.150000,0.150000,0.150000), bone="Crow.Head" },
	}
}

RegisterHatSetting( hatname, hat )