net.Receive("client_opentotemmenu", function(length )
	SGS.totemtype = net.ReadString()
	SGS.totempower = net.ReadInt( 32 )
	SGS.totemenabled = net.ReadBit()
	SGS.totem = net.ReadEntity()
	SGS_TotemMenu()
end)

local black = Color(0, 0, 0, 210)
local white = Color(255, 255, 255, 255)
local red = Color(255, 0, 0, 255)
local green = Color(0, 255, 0, 255)

local blur = Material("pp/blurscreen")
local function DrawBlur(panel, amount)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(white)
	surface.SetMaterial(blur)

	for i = 1, 5 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
end

function SGS_TotemMenu()
	SGS.totemmenu = vgui.Create("sgs_totemmenu")
	SGS.totemmenu:MakePopup()
	SGS.totemmenu:SetVisible(true)
end

local totemPanel = {
	Init = function(self)
		local width = 320
		local height = 125
		self:SetSize(width, height)
		self:Center()
		self:SetVisible(false)
		self:DrawFrame()
	end,

	Paint = function(self, w, h)
		local wide = self:GetWide()
		local tall = self:GetTall()
		local x = 0
		local y = 0

		DrawBlur(self, 2)

		surface.SetDrawColor(black)
		surface.DrawRect(x, y, wide, tall)
		surface.DrawRect(x, y, wide, 30)
		surface.DrawOutlinedRect(x, y, wide, tall, 2)
		draw.SimpleText(SGS.totemtype:gsub("^%l", string.upper) .. " Totem", "SGS_RCacheTitles", wide / 2, 14, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		draw.SimpleText("Current Totem Power: " .. SGS.totempower, "SGS_HUD2", 10, 35, white)
		draw.SimpleText("Current Totem Status: ", "SGS_HUD2", 10, 50, white)
		draw.SimpleText(SGS.totemenabled == 1 and "ONLINE" or "OFFLINE", "SGS_HUD2", 135, 50, SGS.totemenabled == 1 and green or red)
	end
}

function totemPanel:DrawFrame()
	local totem = vgui.Create("DPanel", self)
	totem:Dock(FILL)
	totem:SetPaintBackground(false)

	local IconList = vgui.Create("DIconLayout", totem)
	IconList:Dock(FILL)
	IconList:SetSpaceX(4)
	IconList:SetSpaceY(4)

	AddBTN1 = vgui.Create("DButton", totem)
	AddBTN1:SetSize(70, 20)
	AddBTN1:SetPos(10, 70)
	AddBTN1:SetColor(white)
	AddBTN1:SetText("Add Sapphire")
	AddBTN1.Paint = function()
		surface.SetDrawColor(black)
		surface.DrawRect(0, 0, AddBTN1:GetWide(), AddBTN1:GetTall())
	end
	AddBTN1.DoClick = function()
		RunConsoleCommand("sgs_fueltotem", "sapphire", SGS.totem:EntIndex())
		self:Remove()
		SGS.totemmenu:Remove()
	end

	AddBTN2 = vgui.Create("DButton", totem)
	AddBTN2:SetSize(70, 20)
	AddBTN2:SetPos(90, 70)
	AddBTN2:SetColor(white)
	AddBTN2:SetText("Add Emerald")
	AddBTN2.Paint = function()
		surface.SetDrawColor(black)
		surface.DrawRect(0, 0, AddBTN2:GetWide(), AddBTN2:GetTall())
	end
	AddBTN2.DoClick = function()
		RunConsoleCommand("sgs_fueltotem", "emerald", SGS.totem:EntIndex())
		self:Remove()
		SGS.totemmenu:Remove()
	end

	AddBTN3 = vgui.Create("DButton", totem)
	AddBTN3:SetSize(70, 20)
	AddBTN3:SetPos(165, 70)
	AddBTN3:SetColor(white)
	AddBTN3:SetText("Add Ruby")
	AddBTN3.Paint = function()
		surface.SetDrawColor(black)
		surface.DrawRect(0, 0, AddBTN3:GetWide(), AddBTN3:GetTall())
	end
	AddBTN3.DoClick = function()
		RunConsoleCommand("sgs_fueltotem", "ruby", SGS.totem:EntIndex())
		self:Remove()
		SGS.totemmenu:Remove()
	end

	AddBTN4 = vgui.Create("DButton", totem)
	AddBTN4:SetSize(70, 20)
	AddBTN4:SetPos(240, 70)
	AddBTN4:SetColor(white)
	AddBTN4:SetText("Add Diamond")
	AddBTN4.Paint = function()
		surface.SetDrawColor(black)
		surface.DrawRect(0, 0, AddBTN4:GetWide(), AddBTN4:GetTall())
	end
	AddBTN4.DoClick = function()
		RunConsoleCommand("sgs_fueltotem", "diamond", SGS.totem:EntIndex())
		self:Remove()
		SGS.totemmenu:Remove()
	end

	EnableBTN = vgui.Create("DButton", totem)
	EnableBTN:SetSize(70, 20)
	EnableBTN:SetPos(90, 95)
	EnableBTN:SetColor(white)
	EnableBTN:SetText("ENABLE")
	EnableBTN.Paint = function()
		surface.SetDrawColor(black)
		surface.DrawRect(0, 0, EnableBTN:GetWide(), EnableBTN:GetTall())
	end
	EnableBTN.DoClick = function()
		RunConsoleCommand("sgs_enabletotem", SGS.totem:EntIndex())
		self:Remove()
		SGS.totemmenu:Remove()
	end

	DisableBTN = vgui.Create("DButton", totem)
	DisableBTN:SetSize(70, 20)
	DisableBTN:SetPos(165, 95)
	DisableBTN:SetColor(white)
	DisableBTN:SetText("DISABLE")
	DisableBTN.Paint = function()
		surface.SetDrawColor(black)
		surface.DrawRect(0, 0, DisableBTN:GetWide(), DisableBTN:GetTall())
	end
	DisableBTN.DoClick = function()
		RunConsoleCommand("sgs_disabletotem", SGS.totem:EntIndex())
		self:Remove()
		SGS.totemmenu:Remove()
	end

	local closeButton = vgui.Create("DButton", self)
	closeButton:SetText("x")
	closeButton:SetFont("SGS_RCacheTitles")
	closeButton:SetColor(white)
	closeButton:SetSize(16, 16)
	closeButton:SetPos(self:GetWide() - 23, 5)
	closeButton.Paint = function()
	end
	closeButton.DoClick = function()
		self:Remove()
		SGS.totemmenu:Remove()
	end
end
vgui.Register("sgs_totemmenu", totemPanel, "Panel")
