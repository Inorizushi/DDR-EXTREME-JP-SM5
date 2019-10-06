
local DDR={announcer=""}

function DDR.Input(self)
	return function(event)
		if not event.PlayerNumber then return end
		local soundbuttons = {"MenuLeft","MenuRight"}
		if ToEnumShortString(event.type) == "FirstPress" or ToEnumShortString(event.type) == "Repeat" then
			self:playcommand(event.button):playcommand("Offset")
			for v in ivalues(soundbuttons) do
				if event.button == v then
					SOUND:PlayOnce( THEME:GetPathS("MusicWheel","change") )
				end
			end
			GAMESTATE:Env()["ToOptions"] = event.DeviceInput.ago > 0.003
		end
		if ToEnumShortString(event.type) == "Release" then
			self:playcommand(event.GameButton.."Release")
		end
	end
end
-- Mute the announcer. But store it's name, we'll need it later.
DDR.announcer = ANNOUNCER:GetCurrentAnnouncer()
ANNOUNCER:SetCurrentAnnouncer("")

local t = Def.ActorFrame{
	OnCommand=function(s)
		SCREENMAN:GetTopScreen():AddInputCallback(DDR.Input(s))
		for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
			SCREENMAN:set_input_redirected(pn, true)
		end
	end,
}

local editdata = {}
-- Time for construction
local function LoadEditItems()
	-- Default. Acts as original gateway.
	local wheelitem = Def.ActorFrame{
		Def.ActorFrame{
			Def.Sprite{ Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/backer") },
			Def.BitmapText{ Font="_2070polyester round", Text="OFFICIAL STEP",
				OnCommand=function(s) s:diffuse(Color.Blue):strokecolor(Color.Black):xy(-3,-3) end
			},
		}
	}

	local song = GAMESTATE:GetCurrentSong()
	-- Verify we have a valid difficulty, and verify that is compatible with our current type.
	-- Otherwise, we might have problems when using SetCurrentSteps.
	if song and song:HasEdits( GAMESTATE:GetCurrentStyle():GetStepsType() ) then
		for v in ivalues(song:GetAllSteps()) do
			if v:GetDifficulty() == "Difficulty_Edit" then
				editdata[#editdata+1] = {
					Steps=v,
					author=(v:GetAuthorCredit() and v:GetAuthorCredit() or v:GetDescription())
				}
			end
		end
	end

	local function DetectEditSource(author)
		local string = ""
		local pcolor

		for pn in ivalues(PlayerNumber) do
			if GAMESTATE:GetCurrentSong():GetGroupName() == PROFILEMAN:GetProfile(pn):GetDisplayName() then
				string = ToEnumShortString(pn)..":["..string.format( "% 9s", string.sub(author,0,9) ).."]"
				pcolor = PlayerColor(pn)
			else
				string = "AC:["..string.format( "% 9s", string.sub(author,0,9) ).."]"
				pcolor = Color.Green
			end
		end

		return {string,pcolor}
	end

	for v in ivalues(editdata) do
		wheelitem[#wheelitem+1] = Def.ActorFrame{
			Def.Sprite{ Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/backer") },
			Def.BitmapText{
				Font="_2070polyester round",
				-- Limit edit text to AC's 9 character format.
				Text=DetectEditSource(v.author)[1],
				OnCommand=function(s) s:diffuse( DetectEditSource(v.author)[2] ):strokecolor(Color.Black):xy(-3,-3) end
			},
		}
	end

	-- Filler items, these cover the surroundings.
	for i=1,10-#editdata do
		wheelitem[#wheelitem+1] = Def.ActorFrame{
			Def.Sprite{ Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/backer") },
			Def.BitmapText{ Font="_2070polyester round", Text="- NO DATA. -",
				OnCommand=function(s) s:strokecolor(Color.Black):diffuse(color("#777777")):xy(-3,-3) end
			},
		}
	end

	return {wheelitem,editdata}
end
local cur = 0
local onselector = false

t[#t+1] = Def.Quad{
	OnCommand=function(s)
		s:zoomto(SCREEN_WIDTH,74):xy(SCREEN_CENTER_X,0):vertalign(top):MaskSource()
	end
};
t[#t+1] = Def.Quad{
	OnCommand=function(s)
		s:zoomto(SCREEN_WIDTH,46):xy(SCREEN_CENTER_X,SCREEN_BOTTOM):vertalign(bottom):MaskSource()
	end
};

local leftsum = 0
t[#t+1] = Def.ActorScroller{
	NumItemsToDraw=11,
	children=LoadEditItems()[1],
	OnCommand=function(s)
		-- Now that the announcer was muted from the screen, restore it.
		if DDR.announcer ~= "" then ANNOUNCER:SetCurrentAnnouncer(DDR.announcer) end
		SOUND:PlayOnce( THEME:GetPathS("ScreenSelectMusic difficulty","easier") )
		s:SetFastCatchup(true):MaskDest()
		:SetSecondsPerItem(0.1)
		:SetWrap(true)
		:xy( SCREEN_RIGHT-173, SCREEN_CENTER_Y+14 )
	end,
	StartCommand=function(s)
		if SCREENMAN:GetTopScreen() then
			s:queuecommand("Cancel")
			SCREENMAN:PlayStartSound()
			GAMESTATE:Env()["UsingEditSelector"] = false
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToPrevScreen")
		end
	end,
	CancelCommand=function()
		for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
			if cur > 0 then
				GAMESTATE:Env()["SelectedEdit"] = true
				GAMESTATE:SetCurrentSteps( pn , editdata[cur].Steps )
			end
		end
		MESSAGEMAN:Broadcast("ReturnedFromScreen",{LockInput=true})
	end,
	TransformFunction=function(s, offset, itemIndex, numItems)
		s:x( (1-math.cos(offset/math.pi))*84.5 )
		s:y( offset*40 )
	end,
	OffsetCommand=function(s)
		if cur < 0 then cur = 0 end
		if cur > #editdata then cur = #editdata end
		s:SetDestinationItem(cur)
		GAMESTATE:Env()["SelectedEdit"] = (cur > 0 and leftsum < 1) 
		MESSAGEMAN:Broadcast("EditScrollerChanged")
	end,
	LeftCommand=function(s)
		leftsum = leftsum + 1
		if leftsum == 2 then
			SOUND:PlayOnce( THEME:GetPathS("ScreenSelectMusic difficulty","easier") )
			s:sleep(0):playcommand("retreat")
		end
	end,
	retreatCommand=function()
		GAMESTATE:Env()["UsingEditSelector"] = false
		SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToPrevScreen")
		MESSAGEMAN:Broadcast("ReturnedFromScreen",{LockInput=true})
	end,
	RightCommand=function() leftsum = 0 end,
	UpCommand=function() leftsum = 0 end,
	DownCommand=function() leftsum = 0 end,
	MenuLeftCommand=function(s) cur = cur - 1 s:playcommand("Offset") end,
	MenuRightCommand=function(s) cur = cur + 1 s:playcommand("Offset") end,
}

t[#t+1] = loadfile(THEME:GetPathG("MusicWheel","highlight"))()..{
	OnCommand=function(s)
		s:xy( SCREEN_RIGHT-173, SCREEN_CENTER_Y+14 )
	end,
}

t[#t+1] = Def.Sprite{
	Texture=THEME:GetPathG("EditSel","Exit"),
	OnCommand=function(s)
		s:bob():effectmagnitude(0,6,0):xy(SCREEN_RIGHT-120,SCREEN_CENTER_Y-60)
		:zoomy(0):linear(0.2):zoomy(1)
	end;
}

-- Yep, I had to remake the ScrollerBar too.
local height = 175
t[#t+1] = Def.ActorFrame{
	OnCommand=function(s) s:xy(SCREEN_RIGHT-12,SCREEN_CENTER_Y+15) end,
	Def.Sprite{ Texture=THEME:GetPathG("ScrollBar","middle"), OnCommand=function(s) s:zoomtoheight(height*2) end },
	Def.Sprite{ Texture=THEME:GetPathG("ScrollBar","TickThumb"),
		OnCommand=function(s) s:zoomtoheight( height/#editdata ):y(-height/1.4):MaskDest() end,
		EditScrollerChangedMessageCommand=function(s)
			s:stoptweening():decelerate(0.2):y( scale( cur, 0, #editdata, -height/1.4, height/1.4 ) )
		end,
	},
	Def.Sprite{ Texture=THEME:GetPathG("ScrollBar","top"), OnCommand=function(s) s:y(-height) end },
	Def.Sprite{ Texture=THEME:GetPathG("ScrollBar","bottom"), OnCommand=function(s) s:y(height) end },
}

return t;