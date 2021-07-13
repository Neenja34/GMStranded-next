local PlayerMeta = FindMetaTable("Player")

function PlayerMeta:CheckLastDaily()
	local lastdaily = self:GetSetting( "last_daily" )
	if !lastdaily then lastdaily = 0 end
	local onedayingame = 1440
	if lastdaily < onedayingame then
		-- print(lastdaily)
		self:SetLastDaily(lastdaily)
		return true
	else
		self:GiveThatManAQuest()
		local lastdaily = 0
		if whenisweekly == nil then whenisweekly = 0 end
		whenisweekly = whenisweekly + 1
		self:SetNWInt("whenisweekly", whenisweekly)
		self:SetLastDaily(lastdaily)
		if whenisweekly == 7 then
			self:GiveThatManAWeeklyQuest()
			whenisweekly = 0
		end
		return false
	end
end

function PlayerMeta:SetLastDaily( lastdaily )
	self:SetSetting( "last_daily", math.floor( 1 + lastdaily ) )
	self:SetNWInt("daytimer", lastdaily)
end

function PlayerMeta:GiveThatManAQuest()
	if self:GetNWBool("hasquest") == nil then
		self:SetNWBool("hasquest", false)
	end
	if self:GetNWBool("hasquest") == true then
		self:RemoveQuest()
	end
local randomskill = math.random(1,10)
	if randomskill == 1 then
		local amounttodo = math.random(20,30)
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Cut Wood." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 2 then
		local amounttodo = math.random(5,10)
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Kill Creatures." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 3 then
		local amounttodo = math.random(15,30)
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Forage seeds." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 4 then
		local amounttodo = math.random(20,30)
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Mine mineral." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 5 then
		local amounttodo = math.random(15,20)
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Fish up fish." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 6 then
		local amounttodo = math.random(3,5)
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Smith items." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 7 then
		local amounttodo = math.random(10,20) 
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Cook meals." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 8 then
		local amounttodo = math.random(10,20) 
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Build props." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 9 then
		local amounttodo = math.random(10,20)
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Cast spells." )
		self:SetNWBool("hasquest", true)
	end
	if randomskill == 10 then
		local amounttodo = math.random(5,10)
		self:SetNWInt("amounttodo", amounttodo )
		self:SetNWString( "Quest", "Brew potions." )
		self:SetNWBool("hasquest", true)
	end
end

function PlayerMeta:RemoveQuest()
	self:SetNWBool("hasquest", false)
	self:SetNWString( "Quest", "None at the moment" )
end

function PlayerMeta:GiveThatManAWeeklyQuest()
	if self:GetNWBool("haswquest") == nil then
		self:SetNWBool("haswquest", false)
	end
	if self:GetNWBool("haswquest") == true then
		self:RemoveWeeklyQuest()
	end
	
local randomweekly = math.random(1,2)

	if randomweekly == 1 then
		local wamounttodo = math.random(3,5)
		self:SetNWInt("wamounttodo", wamounttodo )
		self:SetNWString( "Weekly", "Complete Dailies." )
		self:SetNWBool("haswquest", true)
	end
	if randomweekly == 2 then
		local wamounttodo = math.random(1,1)
		self:SetNWInt("wamounttodo", wamounttodo )
		self:SetNWString( "Weekly", "Eat Golden Melons." )
		self:SetNWBool("haswquest", true)
	end
	if randomweekly == 3 then
		local wamounttodo = math.random(20,30)
		self:SetNWInt("wamounttodo", wamounttodo )
		self:SetNWString( "Weekly", "Quest 3." )
		self:SetNWBool("haswquest", true)
	end
	if randomweekly == 4 then
		local wamounttodo = math.random(20,30)
		self:SetNWInt("wamounttodo", wamounttodo )
		self:SetNWString( "Weekly", "Quest 4." )
		self:SetNWBool("haswquest", true)
	end
end

function PlayerMeta:RemoveWeeklyQuest()
	self:SetNWBool("haswquest", false)
	self:SetNWString( "Weekly", "None at the moment" )
end
