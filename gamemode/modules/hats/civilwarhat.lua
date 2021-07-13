local hatname = "civilwarhat"
local hat = {
	model="models/workshop/player/items/soldier/jul13_ol_jack/jul13_ol_jack.mdl", 
	offsets={
["models/player/group01/female_01.mdl"] = { pos=Vector(-0.143001,-0.208210,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_02.mdl"] = { pos=Vector(-0.274292,0.199040,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_03.mdl"] = { pos=Vector(-0.004470,-0.419571,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_04.mdl"] = { pos=Vector(-0.003653,-0.209964,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_05.mdl"] = { pos=Vector(-0.003653,-0.209964,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/female_06.mdl"] = { pos=Vector(-0.279198,-0.101983,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_01.mdl"] = { pos=Vector(0.954300,-0.422718,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_02.mdl"] = { pos=Vector(0.252797,-0.422718,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_03.mdl"] = { pos=Vector(0.523300,-0.103896,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_04.mdl"] = { pos=Vector(0.662745,-0.321768,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_05.mdl"] = { pos=Vector(0.378722,-0.649010,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_06.mdl"] = { pos=Vector(1.375392,-0.002872,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_07.mdl"] = { pos=Vector(0.633051,-0.776899,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_08.mdl"] = { pos=Vector(0.633051,-0.886900,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group01/male_09.mdl"] = { pos=Vector(0.780274,-0.556892,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_01.mdl"] = { pos=Vector(-0.143001,-0.208210,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_02.mdl"] = { pos=Vector(-0.274292,0.199040,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_03.mdl"] = { pos=Vector(-0.004470,-0.419571,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_04.mdl"] = { pos=Vector(-0.003653,-0.209964,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_05.mdl"] = { pos=Vector(-0.003653,-0.209964,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/female_06.mdl"] = { pos=Vector(-0.279198,-0.101983,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_01.mdl"] = { pos=Vector(0.954300,-0.422718,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_02.mdl"] = { pos=Vector(0.252797,-0.422718,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_03.mdl"] = { pos=Vector(0.523300,-0.103896,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_04.mdl"] = { pos=Vector(0.662745,-0.321768,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_05.mdl"] = { pos=Vector(0.378722,-0.649010,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_06.mdl"] = { pos=Vector(1.375392,-0.002872,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_07.mdl"] = { pos=Vector(0.633051,-0.776899,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_08.mdl"] = { pos=Vector(0.633051,-0.886900,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03/male_09.mdl"] = { pos=Vector(0.780274,-0.556892,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_01.mdl"] = { pos=Vector(-0.143001,-0.208210,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_02.mdl"] = { pos=Vector(-0.274292,0.199040,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_03.mdl"] = { pos=Vector(-0.004470,-0.419571,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_04.mdl"] = { pos=Vector(-0.003653,-0.209964,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_05.mdl"] = { pos=Vector(-0.003653,-0.209964,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/female_06.mdl"] = { pos=Vector(-0.279198,-0.101983,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_01.mdl"] = { pos=Vector(0.954300,-0.422718,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_02.mdl"] = { pos=Vector(0.252797,-0.422718,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_03.mdl"] = { pos=Vector(0.523300,-0.103896,0.000000), ang=Angle(-86.197746,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_04.mdl"] = { pos=Vector(0.662745,-0.321768,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_05.mdl"] = { pos=Vector(0.378722,-0.649010,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_06.mdl"] = { pos=Vector(1.375392,-0.002872,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_07.mdl"] = { pos=Vector(0.633051,-0.776899,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_08.mdl"] = { pos=Vector(0.633051,-0.886900,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/group03m/male_09.mdl"] = { pos=Vector(0.780274,-0.556892,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/hostage/hostage_01.mdl"] = { pos=Vector(0.327818,-0.446219,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/hostage/hostage_02.mdl"] = { pos=Vector(1.348912,-0.000859,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/hostage/hostage_03.mdl"] = { pos=Vector(0.599150,-0.885190,0.000000), ang=Angle(-83.607162,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/hostage/hostage_04.mdl"] = { pos=Vector(-0.294348,0.621084,0.000000), ang=Angle(-72.004990,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/alyx.mdl"] = { pos=Vector(-0.294348,-1.862759,0.000000), ang=Angle(-85.050354,0.000000,-90.000000), scale=Vector(1.100000,1.100000,1.100000), bone="ValveBiped.Bip01_Head1" },
["models/player/barney.mdl"] = { pos=Vector(0.010964,-0.758998,0.000000), ang=Angle(-85.050354,0.000000,-90.000000), scale=Vector(1.100000,1.100000,1.100000), bone="ValveBiped.Bip01_Head1" },
["models/player/breen.mdl"] = { pos=Vector(0.010964,-0.639910,0.000000), ang=Angle(-85.050354,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/eli.mdl"] = { pos=Vector(0.161844,-0.639910,0.000000), ang=Angle(-85.050354,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/gman_high.mdl"] = { pos=Vector(1.219973,-0.046542,0.000000), ang=Angle(-76.958786,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/kleiner.mdl"] = { pos=Vector(-0.882092,-0.190659,0.000000), ang=Angle(-73.593987,0.000000,-90.000000), scale=Vector(1.100000,1.100000,1.100000), bone="ValveBiped.Bip01_Head1" },
["models/player/monk.mdl"] = { pos=Vector(0.444974,-0.196936,0.000000), ang=Angle(-77.110138,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/mossman.mdl"] = { pos=Vector(0.444974,-0.196936,0.000000), ang=Angle(-77.110138,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/mossman_arctic.mdl"] = { pos=Vector(0.444974,-0.196936,0.000000), ang=Angle(-77.110138,0.000000,-90.000000), scale=Vector(1.000000,1.000000,1.000000), bone="ValveBiped.Bip01_Head1" },
["models/player/arctic.mdl"] = { pos=Vector(1.618618,-0.429578,0.000000), ang=Angle(-81.730530,0.000000,-90.000000), scale=Vector(1.050000,1.050000,1.050000), bone="ValveBiped.Bip01_Head1" },
["models/player/guerilla.mdl"] = { pos=Vector(2.141599,-0.789156,0.000000), ang=Angle(-81.730530,0.000000,-90.000000), scale=Vector(1.050000,1.050000,1.050000), bone="ValveBiped.Bip01_Head1" },
["models/player/leet.mdl"] = { pos=Vector(3.003928,-0.316732,0.000000), ang=Angle(-81.730530,0.000000,-90.000000), scale=Vector(1.050000,1.050000,1.050000), bone="ValveBiped.Bip01_Head1" },
["models/player/phoenix.mdl"] = { pos=Vector(2.137440,-0.435906,0.000000), ang=Angle(-81.730530,0.000000,-90.000000), scale=Vector(1.050000,1.050000,1.050000), bone="ValveBiped.Bip01_Head1" },
["models/player/gasmask.mdl"] = { pos=Vector(-0.019459,-0.435906,0.000000), ang=Angle(-81.730530,0.000000,-90.000000), scale=Vector(1.400000,1.400000,1.400000), bone="ValveBiped.Bip01_Head1" },
["models/player/riot.mdl"] = { pos=Vector(-0.019459,-0.435906,0.000000), ang=Angle(-81.730530,0.000000,-90.000000), scale=Vector(1.400000,1.400000,1.400000), bone="ValveBiped.Bip01_Head1" },
["models/player/swat.mdl"] = { pos=Vector(-0.019459,-0.076225,0.000000), ang=Angle(-81.730530,0.000000,-90.000000), scale=Vector(1.400000,1.400000,1.400000), bone="ValveBiped.Bip01_Head1" },
["models/player/urban.mdl"] = { pos=Vector(0.340989,2.399069,0.000000), ang=Angle(-45.930115,0.000000,-90.000000), scale=Vector(1.400000,1.400000,1.400000), bone="ValveBiped.Bip01_Head1" },
["models/player/combine_soldier.mdl"] = { pos=Vector(0.340989,-1.126138,0.000000), ang=Angle(-79.216568,0.000000,-90.000000), scale=Vector(1.200000,1.200000,1.200000), bone="ValveBiped.Bip01_Head1" },
["models/player/combine_soldier_prisonguard.mdl"] = { pos=Vector(0.340989,-1.126138,0.000000), ang=Angle(-79.216568,0.000000,-90.000000), scale=Vector(1.200000,1.200000,1.200000), bone="ValveBiped.Bip01_Head1" },
["models/player/combine_super_soldier.mdl"] = { pos=Vector(0.340989,-1.986714,0.000000), ang=Angle(-79.216568,0.000000,-90.000000), scale=Vector(1.200000,1.200000,1.200000), bone="ValveBiped.Bip01_Head1" },
["models/player/police.mdl"] = { pos=Vector(-0.193580,0.360049,0.000000), ang=Angle(-79.216568,0.000000,-90.000000), scale=Vector(1.200000,1.200000,1.200000), bone="ValveBiped.Bip01_Head1" },
["models/player/police_fem.mdl"] = { pos=Vector(-2.631236,0.493987,0.000000), ang=Angle(-79.216568,0.000000,-90.000000), scale=Vector(1.200000,1.200000,1.200000), bone="ValveBiped.Bip01_Head1" },
["models/crow.mdl"] = { pos=Vector(0.592298,0.282410,0.000000), ang=Angle(42.941841,0.000000,-90.000000), scale=Vector(0.250000,0.250000,0.250000), bone="Crow.Head" },
	}
}

RegisterHatSetting( hatname, hat )