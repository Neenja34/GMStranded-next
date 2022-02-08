local black = Color(0, 0, 0, 210)
local white = Color(255, 255, 255, 255)

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

function SGS_RadioMenu(radio)
	if !IsValid(radio) then return end
	SGS.radiomenu = vgui.Create("sgs_radiomenu")
	SGS.radiomenu.radio = radio
	SGS.radiomenu:MakePopup()
	SGS.radiomenu:SetVisible(true)
end

local radioPanel = {
	Init = function(self)
		local width = 274
		local height = 360
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
		draw.SimpleText("Radio", "SGS_RCacheTitles", wide / 2, 14, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
}

function radioPanel:DrawFrame()
	local radiopanel = vgui.Create("DPanel", self)
	radiopanel:Dock(FILL)
	radiopanel:SetPaintBackground(false)

	local radioScroll = vgui.Create("DScrollPanel", radiopanel)
	radioScroll:Dock(FILL)

	scroll = radioScroll:GetVBar()
	function scroll:Paint()
	end
	function scroll.btnUp:Paint()
	end
	function scroll.btnDown:Paint()
	end
	function scroll.btnGrip:Paint()
	end

	radioGrid = vgui.Create("DIconLayout", radioScroll)
	radioGrid:SetSpaceY(4)
	radioGrid:SetSpaceX(4)
	radioGrid:Dock(TOP)
	radioGrid:DockMargin(15, 45, -10, 10)

	for k, v in SortedPairs(SGS.RadioList) do
		for _, id in pairs(SGS.RadioList[k]) do
			local stationButton = vgui.Create("DButton", radioGrid)
			stationButton:SetSize(120, 24)
			stationButton:SetColor(white)
			stationButton:SetText(k)

			stationButton.Paint = function()
				surface.SetDrawColor(black)
				surface.DrawRect(0, 0, stationButton:GetWide(), stationButton:GetTall())
			end

			stationButton.DoClick = function()
				if !IsValid(self.radio) then return end
				net.Start("radio_ctos")
					net.WriteEntity(self.radio)
					net.WriteString(id.stationid)
				net.SendToServer()
			end
			radioGrid:Add(stationButton)
		end
	end

	local stopBtn = vgui.Create("DButton", self)
	stopBtn:SetSize(80, 20)
	stopBtn:SetPos(self:GetWide() / 2 - 40, self:GetTall() - 30)
	stopBtn:SetColor(white)
	stopBtn:SetText("Stop Radio")
	stopBtn.Paint = function()
		surface.SetDrawColor(black)
		surface.DrawRect(0, 0, stopBtn:GetWide(), stopBtn:GetTall())
	end
	stopBtn.DoClick = function(btn)
		if !IsValid(self.radio) then return end
		net.Start("radio_ctos")
			net.WriteEntity(self.radio)
			net.WriteString("0")
		net.SendToServer()
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
		SGS.radiomenu:Remove()
	end
end
vgui.Register("sgs_radiomenu", radioPanel, "Panel")
