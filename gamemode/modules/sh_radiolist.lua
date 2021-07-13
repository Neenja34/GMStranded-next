SGS.RadioList = {}
function Menu_RegisterRadio( category, station )
	if !SGS.RadioList[category] then SGS.RadioList[category] = {} end
	
	SGS.RadioList[category][#SGS.RadioList[category] + 1] = station
end

Menu_RegisterRadio( "Pop",
{    
    stationid = "46.252.154.133:8080",
}
)
Menu_RegisterRadio( "Radio New Wave", 
{
	stationid = "62.210.10.4:8928",
}
)
Menu_RegisterRadio( "Hip Hop & RnB",
{
    stationid = "149.56.175.167:5461",
}
)
Menu_RegisterRadio( "Rap",
{
    stationid = "158.69.4.114:8150",
}
)
Menu_RegisterRadio( "Drum&Bass",
{    
    stationid = "46.105.124.104:8000",
}
)
Menu_RegisterRadio( "Deep House Radio",
{    
    stationid = "37.187.93.104:8589",
}
)
Menu_RegisterRadio( "Jazz",
{
    stationid = "144.217.158.59:5406",
}
)
Menu_RegisterRadio( "J-idols Project Radio Japanese",
{
    stationid = "184.75.223.178:8011",
}
)
Menu_RegisterRadio( "90s Hits",
{
    stationid = "213.32.121.35:8050",
}
)
Menu_RegisterRadio( "Sensimedia Bass Radio",
{
    stationid = "144.217.203.184:8229",
}
)
Menu_RegisterRadio( "Reggae",
{
    stationid = "67.212.238.178:7099",
}
)
Menu_RegisterRadio( "90s Hits 2",
{
    stationid = "185.33.21.111:80/partyzone90s_128",
}
)