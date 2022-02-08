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

function SGS_ShopMenu()
	SGS.shopmenu = vgui.Create("sgs_shopmenu")
	SGS.shopmenu:MakePopup()
	SGS.shopmenu:SetVisible(true)
end

local shopPanel = {
	Init = function(self)
		local width = 425 --320 
		local height = 600 --370
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
		draw.SimpleText("GToken Shop", "SGS_RCacheTitles", wide / 2, 14, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
}

function shopPanel:DrawFrame()
	local shop = vgui.Create("DPanel", self)
	shop:Dock(FILL)
	shop:SetPaintBackground(false)

	local CatList = vgui.Create("DPanelList", shop)
	CatList:EnableVerticalScrollbar(false)
	CatList:EnableHorizontal(false)
	CatList:SetSize(self:GetWide() + 5, self:GetTall() - 58)
	CatList:SetPos(10, 44)
	CatList:SetSpacing(4)

	for k, v in pairs(SGS.Shop) do
		local IconList = vgui.Create("DIconLayout")
		local CollapseCat = vgui.Create("DCollapsibleCategory")
		CatList:AddItem(CollapseCat)

		CollapseCat:SetSize(335, 50)
		CollapseCat:SetExpanded(1)
		CollapseCat:SetLabel("  " .. Cap(k))
		CollapseCat:SetContents(IconList)
		CollapseCat.Paint = function()
			surface.SetDrawColor(black)
			surface.DrawRect(CollapseCat:GetPos() + 4, CollapseCat:GetPos(), self:GetWide() - 30, 20)
		end

		IconList:SetSpaceX(4)
		IconList:SetSpaceY(4)

		for k2, v2 in pairs(SGS.Shop[k]) do
			local cost = v2.cost
			if GAMEMODE.Tribes:GetTribeLevel(LocalPlayer()) >= 10 then
				cost = math.ceil(cost * 0.9)
			end
			local icon = vgui.Create("DImageButton", IconList)
			icon:SetImage(v2.material)
			icon:SetTooltip(SGS_ToolTipShop(v2))
			icon:SetSize(64, 64)
			IconList:Add(icon)
			icon.PaintOver = function()
				if SGS.gtokens < cost then
					draw.RoundedBoxEx( 2, 5, 39, 54, 20, Color(255, 255, 50, 150), false, false, false, false )
					draw.SimpleText("INSUFFICIENT", "proplisticons", 7, 41, Color(0, 0, 0, 255), 0, 0)
					draw.SimpleText("GTOKENS", "proplisticons", 8, 49, Color(0, 0, 0, 255), 0, 0)
					icon.OnCursorEntered = function()
						return true
					end
				end
			end
			icon.DoClick = function()
				surface.PlaySound("ui/buttonclickrelease.wav")
				RunConsoleCommand("sgs_buy", v2.uid)
			end
		end
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
	end
end
vgui.Register("sgs_shopmenu", shopPanel, "Panel")

function SGS_ShopMenu2()
	SGS.shopmenu2 = vgui.Create("sgs_shop2menu")
	SGS.shopmenu2:MakePopup()
	SGS.shopmenu2:SetVisible(true)
end

local shop2Panel = {
	Init = function(self)
		local width = 425 --320 
		local height = 500 --370
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
		draw.SimpleText("Quest Shop", "SGS_RCacheTitles", wide / 2, 14, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
}

function shop2Panel:DrawFrame()
	local shop2 = vgui.Create("DPanel", self)
	shop2:Dock(FILL)
	shop2:SetPaintBackground(false)

	local CatList = vgui.Create("DPanelList", shop2)
	CatList:EnableVerticalScrollbar(false)
	CatList:EnableHorizontal(false)
	CatList:SetSize(self:GetWide() + 5, self:GetTall() - 58)
	CatList:SetPos(10, 44)
	CatList:SetSpacing(4)

	for k, v in pairs(SGS.SpecialShop) do

		local IconList = vgui.Create("DIconLayout")
		local CollapseCat = vgui.Create("DCollapsibleCategory")
		CatList:AddItem(CollapseCat)

		CollapseCat:SetSize(335, 50)
		CollapseCat:SetExpanded(1)
		CollapseCat:SetLabel("  " .. Cap(k))
		CollapseCat:SetContents(IconList)
		CollapseCat.Paint = function()
			surface.SetDrawColor(black)
			surface.DrawRect(CollapseCat:GetPos() + 4, CollapseCat:GetPos(), self:GetWide() - 30, 20)
		end

		IconList:SetSpaceX(4)
		IconList:SetSpaceY(4)

		for k2, v2 in pairs(SGS.SpecialShop[k]) do
			local icon = vgui.Create("DImageButton", IconList)
			icon:SetImage(v2.material)
			icon:SetTooltip(SGS_ToolTipShop2(v2))
			icon:SetSize(64, 64)
			IconList:Add(icon)
			icon.PaintOver = function()
				if (SGS.resources["quest_token"] or 0) < v2.cost then
					draw.RoundedBoxEx(2, 5, 39, 54, 20, Color(255, 255, 50, 150), false, false, false, false)
					draw.SimpleText("INSUFFICIENT", "proplisticons", 7, 41, Color(0, 0, 0, 255), 0, 0)
					draw.SimpleText("TOKENS", "proplisticons", 8, 49, Color(0, 0, 0, 255), 0, 0)
					icon.OnCursorEntered = function()
						return true
					end
				end
			end
			icon.DoClick = function()
				surface.PlaySound( "ui/buttonclickrelease.wav" )
				RunConsoleCommand("sgs_buy2", v2.uid)
			end
		end
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
	end
end
vgui.Register("sgs_shop2menu", shop2Panel, "Panel")
