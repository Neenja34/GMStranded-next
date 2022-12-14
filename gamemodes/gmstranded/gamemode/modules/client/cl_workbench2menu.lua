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

function SGS_Workbench2Menu()
	SGS.workbench2menu = vgui.Create("sgs_workbench2menu")
	SGS.workbench2menu:MakePopup()
	SGS.workbench2menu:SetVisible(true)
end

local workbench2Panel = {
	Init = function(self)
		local width = 288
		local height = 108
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
		surface.DrawRect(x, y, wide, tall) --Left
		surface.DrawRect(x, y, wide, 30)
		surface.DrawOutlinedRect(x, y, wide, tall, 2)
		draw.SimpleText("Enchanted Workbench", "SGS_RCacheTitles", wide / 2, 14, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
}

function workbench2Panel:DrawFrame()
	local workbench2 = vgui.Create("DPanel", self)
	workbench2:Dock(FILL)
	workbench2:DockMargin(10, 35, -10, 10)
	workbench2:SetPaintBackground(false)

	local IconList = vgui.Create("DIconLayout", workbench2)
	IconList:Dock(FILL)
	IconList:SetSpaceX(4)
	IconList:SetSpaceY(4)

	for k, v in pairs(SGS.Tools) do
		if k ~= "enchanted" then continue end
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
		SGS.workbench2menu:Remove()
	end
end
vgui.Register("sgs_workbench2menu", workbench2Panel, "Panel")
