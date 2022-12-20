# GMStranded-next

Here is a series of updates that I've made to the G4P Stranded game mode made by Mr. President. This repo also serves as a guide to get
G4P set up onto a self-hosted dedicated server. Thanks to all the players, Mr. President, Holyshot, Moltenn, Thunderr, Youti, Nerax and our other 
moderators & donators for the support! You can find the original gamemode by Mr. President here - https://github.com/zpetty33/GMStranded.
I've included the website files, and the player data that my server used to use a bonus :)

How to install as single player only:

Step 1: Download the gamemode here https://github.com/zpetty33/GMStranded and then download this repo.

Step 2: Copy the following folders from GMStranded-master (the original gamemode) to steamapps\common\GarrysMod\garrysmod (Overwrite if it asks you to).
		1. gamemodes
		2. maps
		3. particles
		4. data
Step 3: Copy everything from GMStranded-next-main (the Project Gull updates) except the README & Website folder to steamapps\common\GarrysMod\garrysmod (Overwrite if it asks you to).
		
		(It's important that step 2 and 3 are done in order!)
		
Step 4: Subscribe to this workshop collection - https://steamcommunity.com/workshop/filedetails/?id=1690678237

Step 5: Start up the gamemode gmstranded on the maps gms_coastal_island_v2.bsp or gms_g4p_stargate_v11.bsp. Enjoy!

How to host on a dedicated server or purchased host:

<Warning - this guide requires port forwarding if you're self hosting. I recommend Googling your router model and 'how to port forward' if you don't know how as
different router models have different methods to port forward. If you've rented an online host, then port forwarding shouldn't be needed.>

Step 1: Download the gamemode here https://github.com/zpetty33/GMStranded and then download this repo. If you're self hosting on your own computer, download SteamCMD here https://developer.valvesoftware.com/wiki/SteamCMD#Downloading_SteamCMD.

Step 2: If you're self hosting on your own computer, open up and type the following into SteamCMD -

		1. force_install_dir <your server directory here>
		2. login anonymous
		3. app_update 4020
		Once SteamCMD has finished downloading the server, you can close SteamCMD. The base server files should now be in the directory you specified. (Note: Running that set of commands a second time will run a Steam update on the server)
		
Step 3: Navigate to where you downloaded the repos, then drag and drop the following folders from GMStranded-master into the following places, replacing any files if asked to -
		
		1. data, gamemodes, maps, particles --> <your server directory here>\garrysmod
	
		And then from the GMStranded-next-main folder -
		
		2. Everything except the README & Website folder goes into <your server directory here>\garrysmod
		
		It's important that this is done in order. GMStranded-master (the original gamemode) first, then GMStranded-next-main (Project Gull updates).

Step 4: Navigate to <your server directory here>\garrysmod\cfg and open server.cfg - change the following lines -

	  hostname - should be changed to your server name
	  rcon_password - should be changed to an admin password
	  sv_password - should be changed to the server password (if you need to)
	  
	  Additionally, you can add/remove the two // at the start of a line to make it readable by the server (Anything with // at the start will 
	  be skipped). sv_loadingurl is the link to the loading screen if you have one setup. sv_downloadurl is for FastDL if you wanted to 
	  set that one too. Save, exit.
	  
Step 5: Go to https://steamcommunity.com/dev/managegameservers and create a new server with appid 4000 and a memorable memo.

Step 6: If you're self hosting on your own computer, Go back to the root of your server directory. You should see srcds.exe if you've done the steps correctly! Don't open it just yet though.

Step 7: (Only if you're self hosting on your own computer) Create a new file called 'start.bat'. Open it with your favourite text editor and input the following:

		srcds.exe -console -game garrysmod -condebug -nohltv -maxplayers 32 +map gms_g4p_stargate_v11 +gamemode gmstranded +host_workshop_collection 1690678237 +sv_setsteamaccount "<Your token here>"
		
		(If you're on a paid host) Navigate to where you can create custom command lines for starting the server. You'll want to create a command line identical to the one above, however things like max players will be determined by the package you own
		
Step 8: Change sv_setsteamaccount to the token that you generated from Steam Game Server Account Management (the website). Save, exit.

Step 9: If you're self hosting on your own computer, you will now need to port forward the port 27015 on your router (Google your router model and 'how to port forward' if you're not sure how to, each router
		 model is different and unfortunately I can't list every one here)
	   
Step 10: Open start.bat (If you're self hosting on your own computer) or start the server through your web panel (If you're on a paid host) - the source dedicated server console window should open and start downloading the custom content. 
		 Once it's finished, it will boot the server. You'll know once it's finished booting when it says: VAC secure mode is activated.
	   
Step 11: Try joining the server through your Garry's Mod client normally. If the steps were followed correctly and no errors occur, you should have a fully working joinable multiplayer server!

		If you see a 'rainbow glow' effect around anything you look at, you'll have to go into a couple files and comment out a bit of code. The code itself can change or reset after running a steam update on the server,
		so unfortunately I can't provide fixes in this pack & sometimes the line that the code is on changes so I can't provide an exact line number either. I can however, describe how to fix it:
		
		1. Shut down the server, then open up <your server directory here>\garrysmod\lua\includes\modules\halo.lua with a text editor - near the bottom of the code (at the time of writing, it is on line 154), is a line that says 'Render( v )'. Comment that out
		   by putting -- at the start of the line, so it looks like --Render( v )
		   
		2. Save and exit halo.lua, then open up <your server directory here>\garrysmod\lua\includes\modules\properties.lua with a text editor - near the bottom of the code (at the time of writing, it is on line 195) is a line
		   that says halo.Add( t, c, 2, 2, 2, true, false ). Comment that line out by putting -- at the start of it. Save and exit. Start up the server, and you should be good to go if done correctly!
		