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

function SGS_WorkbenchMenu()
	SGS.workbenchmenu = vgui.Create("sgs_workbenchmenu")
	SGS.workbenchmenu:MakePopup()
	SGS.workbenchmenu:SetVisible(true)
end

local workbenchPanel = {
	Init = function(self)
		local width = 425
		local height = 600
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
		draw.SimpleText("Workbench", "SGS_RCacheTitles", wide / 2, 14, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
}

function workbenchPanel:DrawFrame()
	local workbench = vgui.Create("DPanel", self)
	workbench:Dock(FILL)
	workbench:SetPaintBackground(false)

	local CatList = vgui.Create("DPanelList", workbench)
	CatList:EnableVerticalScrollbar(false)
	CatList:EnableHorizontal(false)
	CatList:SetSize(self:GetWide() + 5, self:GetTall() - 58)
	CatList:SetPos(10, 44)
	CatList:SetSpacing(4)

	for k, v in pairs(SGS.Tools) do
		if k == "main" then continue end
		if k == "construction" then continue end
		if k == "enchanted" then continue end
		if k == "woodcutting-sapphire" then continue end
		if k == "woodcutting-emerald" then continue end
		if k == "woodcutting-ruby" then continue end
		if k == "woodcutting-diamond" then continue end
		if k == "mining-sapphire" then continue end
		if k == "mining-emerald" then continue end
		if k == "mining-ruby" then continue end
		if k == "mining-diamond" then continue end

		local IconList = vgui.Create("DIconLayout")
		local CollapseCat = vgui.Create("DCollapsibleCategory")
		CatList:AddItem(CollapseCat)

		CollapseCat:SetSize(335, 50)
		CollapseCat:SetExpanded(1)
		CollapseCat:SetLabel("  " .. Cap(k) .. " Tools")
		CollapseCat:SetContents(IconList)
		CollapseCat.Paint = function()
			surface.SetDrawColor(black)
			surface.DrawRect(CollapseCat:GetPos() + 4, CollapseCat:GetPos(), self:GetWide() - 30, 20)
		end

		IconList:SetSpaceX(4)
		IconList:SetSpaceY(4)

		for k2, v2 in pairs(SGS.Tools[k]) do
			local icon = vgui.Create("DImageButton", IconList)
			icon:SetMaterial(v2.icon)
			icon:SetTooltip(SGS_ToolTip(v2))
			icon:SetSize(64, 64)
			IconList:Add(icon)
			icon.PaintOver = function()
				for k3, v3 in pairs(v2.reqlvl) do
					local plvl = SGS.levels[k3] or 0
					if plvl < v3 then
						draw.RoundedBoxEx(2, 5, 5, 54, 20, Color(255, 80, 80, 150), false, false, false, false)
						draw.SimpleText("INSUFFICIENT", "proplisticons", 7, 7, Color(0, 0, 0, 255), 0, 0)
						draw.SimpleText("SKILL", "proplisticons", 25, 15, Color(0, 0, 0, 255), 0, 0)
						icon.OnCursorEntered = function()
							return true
						end
						break
					end
				end
				for k3, v3 in pairs(v2.cost) do
					local pamt = SGS.resources[k3] or 0
					if pamt < v3 then
						draw.RoundedBoxEx(2, 5, 39, 54, 20, Color(255, 255, 50, 150), false, false, false, false)
						draw.SimpleText("INSUFFICIENT", "proplisticons", 7, 41, Color(0, 0, 0, 255), 0, 0)
						draw.SimpleText("RESOURCES", "proplisticons", 8, 49, Color(0, 0, 0, 255), 0, 0)
						icon.OnCursorEntered = function()
							return true
						end
						break
					end
				end
			end
			icon.DoClick = function()
				surface.PlaySound("ui/buttonclickrelease.wav")
				RunConsoleCommand("sgs_smith", v2.entity)
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
		SGS.workbenchmenu:Remove()
	end
end
vgui.Register("sgs_workbenchmenu", workbenchPanel, "Panel")
