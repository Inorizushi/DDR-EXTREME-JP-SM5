
local DDR ={}

function DDR.Input(self)
	return function(event)
		if not event.PlayerNumber then return end
		if ToEnumShortString(event.type) == "FirstPress" or ToEnumShortString(event.type) == "Repeat" then
			self:playcommand(event.GameButton)
		end
		if ToEnumShortString(event.type) == "Release" then
			self:playcommand(event.GameButton.."Release")
		end
	end
end

local t = Def.ActorFrame{
	OnCommand=function(s)
		SCREENMAN:GetTopScreen():AddInputCallback(DDR.Input(s))
		for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
			SCREENMAN:set_input_redirected(pn, true)
		end
	end,
}

local editdata = {}
local function LoadEditItems()
	local wheelitem = Def.ActorFrame{
		Def.ActorFrame{
			Def.Sprite{
				Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/backer"),
			},
			Def.BitmapText{
				Font="_2070polyester round",
				Text="OFFICIAL STEP",
				OnCommand=function(s)
					s:diffuse(Color.Blue):strokecolor(Color.Black):xy(-3,-3)
				end,
			},
		}
	}

	local song = GAMESTATE:GetCurrentSong()
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

	for v in ivalues(editdata) do
		wheelitem[#wheelitem+1] = Def.ActorFrame{
			Def.Sprite{
				Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/backer"),
			},
			Def.BitmapText{
				Font="_2070polyester round",
				Text="AC:["..string.format( "% 9s", string.sub(v.author,0,9) ).."]",
				OnCommand=function(s)
					s:diffuse(Color.Green):strokecolor(Color.Black):xy(-3,-3)
				end,
			},
		}
	end

	for i=1,10-#editdata do
		wheelitem[#wheelitem+1] = Def.ActorFrame{
			Def.Sprite{
				Texture=THEME:GetPathG("MusicWheelItem Song","NormalPart/backer"),
			},
			Def.BitmapText{
				Font="_2070polyester round",
				Text="- NO DATA. -",
				OnCommand=function(s)
					s:strokecolor(Color.Black):diffuse(color("#777777")):xy(-3,-3)
				end,
			},
		}
	end

	return {wheelitem,editdata}
end
local cur = 0
local onselector = false

t[#t+1] = Def.Quad{
	OnCommand=function(s)
		s:zoomto(SCREEN_WIDTH,74)
		:xy(SCREEN_CENTER_X,0):vertalign(top):MaskSource()
	end,
};

t[#t+1] = Def.Quad{
	OnCommand=function(s)
		s:zoomto(SCREEN_WIDTH,46)
		:xy(SCREEN_CENTER_X,SCREEN_BOTTOM):vertalign(bottom):MaskSource()
	end,
};

t[#t+1] = Def.ActorScroller{
	NumItemsToDraw=11,
	children=LoadEditItems()[1],
	OnCommand=function(s)
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
		MESSAGEMAN:Broadcast("ReturnedFromScreen")
	end,
	TransformFunction=function(s, offset, itemIndex, numItems)
		s:x( (1-math.cos(offset/math.pi))*84.5 )
		s:y( offset*40 )
	end,
	OffsetCommand=function(s)
		if cur < 0 then cur = 0 end
		if cur > #editdata then cur = #editdata end
		s:SetDestinationItem(cur)
		SOUND:PlayOnce( THEME:GetPathS("MusicWheel","change") )
		GAMESTATE:Env()["SelectedEdit"] = cur > 0
		MESSAGEMAN:Broadcast("EditScrollerChanged")
	end,
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