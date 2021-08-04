local white = Color( 255, 255, 255, 255 )
local transparent = Color( 255, 255, 255, 0 )
local black = Color( 0, 0, 0, 255 )
local red = Color( 255, 0, 0, 255 )

local PANEL = {}
function PANEL:Init()

	self:SetPos( ( ScrW() / 2 ) - 400, ScrH() * 0.1 )
	self:SetSize( 815, ScrH() * 0.8 )
	self:SetVisible( false )
	self:DrawFrame()

end

function PANEL:Paint( w, h )

	draw.SimpleTextOutlined( "|G4P| Stranded (Project Gull)", "ScoreboardDefaultTitle", 8, 0, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 2, black )

end

function PANEL:DrawFrame()

	if SGS.ScoreBoardPanel then
		SGS.ScoreBoardPanel:Remove()
	end

	SGS.ScoreBoardPanel = vgui.Create( "DPanelList", self )
	SGS.ScoreBoardPanel:SetPos( 8, 40 )
	SGS.ScoreBoardPanel:SetSize( 800, ScrH() * 0.7 )
	SGS.ScoreBoardPanel:EnableVerticalScrollbar( true )

	for k, v in pairs( team.GetAllTeams() ) do

		if #team.GetPlayers( k ) <= 0 then continue end
		if k == 1002 then continue end

		local teambanner = vgui.Create( "DPanel" )
		teambanner:SetSize( 782, 25 )
		teambanner.Paint = function()

			surface.SetFont( "ScoreboardDefault" )
			surface.SetTextColor( black )
			surface.SetDrawColor( team.GetColor( k ) )
			surface.DrawRect( 0, 0, teambanner:GetWide(), teambanner:GetTall() )
			surface.SetDrawColor( black )
			surface.DrawOutlinedRect( 0, 0, teambanner:GetWide(), teambanner:GetTall() )
			local tw, th = surface.GetTextSize( team.GetName( k ) )
			surface.SetTextPos( 400 - ( tw / 2 ), 12 - ( th / 2 ) )
			surface.DrawText( team.GetName( k ) )

		end
		SGS.ScoreBoardPanel:AddItem( teambanner )

		local titlebarbanner = vgui.Create( "DPanel" )
		titlebarbanner:SetSize( 782, 20 )
		titlebarbanner.Paint = function()

			surface.SetFont( "SGS_RCacheMenuText" )
			surface.SetTextColor( black )
			surface.SetDrawColor( white )
			surface.DrawRect( 0, 0, titlebarbanner:GetWide(), titlebarbanner:GetTall() )
			surface.SetDrawColor( black )
			surface.DrawOutlinedRect( 0, 0, titlebarbanner:GetWide(), titlebarbanner:GetTall() )
			local _, th = surface.GetTextSize( "I" )
			surface.SetTextPos( 5, 10 - ( th / 2 ) )
			surface.DrawText( "Name:" )
			surface.SetTextPos( 400, 10 - ( th / 2 ) )
			surface.DrawText( "Level:" )
			surface.SetTextPos( 510, 10 - ( th / 2 ) )
			surface.DrawText( "Voice Channel:" )
			surface.SetTextPos( 640, 10 - ( th / 2 ) )
			surface.DrawText( "Ping:" )
			surface.SetTextPos( 685, 10 - ( th / 2 ) )
			surface.DrawText( "Mute:" )
			surface.SetTextPos( 720, 10 - ( th / 2 ) )
			surface.DrawText( "Gag:" )
			surface.SetTextPos( 760, 10 - ( th / 2 ) )
			surface.DrawText( "Stats:" )

		end
		SGS.ScoreBoardPanel:AddItem( titlebarbanner )

		for _, ply in pairs( player.GetAll() ) do

			if ply && ply:Team() == k then continue end

			local playerbanner = vgui.Create( "DPanel" )
			playerbanner:SetSize( 782, 20 )

			local pslvl = ply:GetNWString( "survival", "0" )
			if ply:IsUserGroup( "usera" ) then
				pslvl = "1"
			end

			local pvc = ply:GetNWString( "voicechannel", "A" )
			if ply:IsUserGroup( "usera" ) then
				pvc = "A"
			end

			local pping = ply:Ping()
			local pname = ply:Nick()
			playerbanner.Paint = function()

				surface.SetFont( "SGS_RCacheMenuText" )
				surface.SetTextColor( black )
				surface.SetDrawColor( white )
				surface.DrawRect( 0, 0, playerbanner:GetWide(), playerbanner:GetTall() )
				surface.SetDrawColor( black )
				surface.DrawOutlinedRect( 0, 0, playerbanner:GetWide(), playerbanner:GetTall() )

				local tr, th = surface.GetTextSize( pname )
				surface.SetTextPos( 5, 10 - ( th / 2 ) )
				if ply:GetNWBool( "afk", false ) then
					surface.SetTextColor( red )
					surface.DrawText( "*AFK*" )
					surface.SetTextColor( black )
					surface.SetTextPos( 45, 10 - ( th / 2 ) )
					surface.DrawText( pname )
				else
					surface.DrawText( pname )
				end
				surface.SetTextPos( 410, 10 - ( th / 2 ) )
				surface.DrawText( pslvl )
				surface.SetTextPos( 550, 10 - ( th / 2 ) )
				surface.DrawText( pvc )
				surface.SetTextPos( 648, 10 - ( th / 2 ) )
				surface.DrawText( pping )

			end

			gagbutton = vgui.Create( "DImageButton", playerbanner )
			gagbutton:SetSize( 16, 16 )
			gagbutton:SetPos( 725, 2 )
			if ply:IsMuted() then
				gagbutton:SetImage( "icon32/muted.png" )
			else
				gagbutton:SetImage( "icon32/unmuted.png" )
			end

			gagbutton.DoClick = function()
				ply:SetMuted( !ply:IsMuted() )
				self:DrawFrame()
			end

			mutebutton = vgui.Create( "DImageButton", playerbanner )
			mutebutton:SetSize( 16, 16 )
			mutebutton:SetPos( 690, 2 )
			if ply.ismuted then
				mutebutton:SetImage( "icon32/muted.png" )
			else
				mutebutton:SetImage( "icon32/unmuted.png" )
			end

			mutebutton.DoClick = function()
				ply.ismuted = !ply.ismuted
				self:DrawFrame()
			end

			statsbutton = vgui.Create( "DImageButton", playerbanner )
			statsbutton:SetSize( 16, 16 )
			statsbutton:SetPos( 765, 2 )
			statsbutton:SetImage( "icon16/table_edit.png" )
			statsbutton.DoClick = function()
				RunConsoleCommand( "sgs_viewplayerstats", ply:Nick() )
			end

			SGS.ScoreBoardPanel:AddItem( playerbanner )

		end

		local blankbar = vgui.Create( "DPanel" )
		blankbar:SetSize( 782, 12 )
		blankbar.Paint = function()

			surface.SetDrawColor( transparent )
			surface.DrawRect( 0, 0, blankbar:GetWide(), blankbar:GetTall() )

		end
		SGS.ScoreBoardPanel:AddItem( blankbar )

	end

end
vgui.Register( "sgs_newscoreboard", PANEL, "EditablePanel" )

function GM:ScoreboardShow()

	if ( !IsValid( SGS.ScoreBoard ) ) then
		SGS.ScoreBoard = vgui.Create( "sgs_newscoreboard" )
	end

	if ( IsValid( SGS.ScoreBoard ) ) then
		SGS.ScoreBoard:Show()
		SGS.ScoreBoard:DrawFrame()
		SGS.ScoreBoard:MakePopup()
		SGS.ScoreBoard:SetKeyboardInputEnabled( false )
	end

end

function GM:ScoreboardHide()

	if ( IsValid( SGS.ScoreBoard ) ) then
		SGS.ScoreBoard:Hide()
	end

end