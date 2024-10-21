function DDRInput(self)
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

local t = Def.ActorFrame{
	BeginCommand=function(s)
		if GAMESTATE:IsAnyHumanPlayerUsingMemoryCard() then
			if SCREENMAN:GetTopScreen():HaveProfileToSave() then
				local Timer = SCREENMAN:GetTopScreen():GetChild("Timer")
				if Timer then
					Timer:stop()
				end
				SOUND:PlayAnnouncer("ScreenProfileSaveSummary MemorySave")
				s:sleep(0.1):queuecommand("Action"):sleep(2):queuecommand("CardSaved")
        	else
            	s:queuecommand("CardSaved")
			end
		else
			s:queuecommand("ContinueScreen")
		end
    end,
	CardSavedCommand=function(s)
		local Timer = SCREENMAN:GetTopScreen():GetChild("Timer")
		if Timer then
			Timer:SetSeconds(20)
			Timer:start()
		end
		SOUND:PlayAnnouncer("ScreenProfileSaveSummary MemoryCorrect")
		GAMESTATE:SaveProfiles()
		SCREENMAN:GetTopScreen():AddInputCallback(DDRInput(s))
		s:sleep(20):queuecommand("ContinueScreen")
	end,
	ContinueScreenCommand=function()
		SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
		SOUND:StopMusic()
	end;
	StorageDevicesChangedMessageCommand=function(s)
		if MEMCARDMAN:GetCardState(PLAYER_1) == 'MemoryCardState_removed' or MEMCARDMAN:GetCardState(PLAYER_2) == 'MemoryCardState_removed' then
			s:playcommand("ContinueScreen")
		end
	end,
	StartCommand=function(s)
		s:playcommand("ContinueScreen")
	end,
};

t[#t+1] = LoadActor(THEME:GetPathS("","_ScreenProfileSaveSummary music (loop).ogg"))..{
	ActionCommand=function(s)
		s:play()
	end,
}

t[#t+1] = Def.Sprite{
	Texture=lang.."Warning1",
	InitCommand=function(s)
		s:xy( SCREEN_CENTER_X,SCREEN_CENTER_Y-130 ):diffuse(Color.Blue)
		s:visible(false)
	end,
	CardSavedCommand=function(s)
		s:visible(true)
	end,
	OffCommand=function(s)
		s:linear(0.2):addx(SCREEN_WIDTH)
	end,
};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s)
		s:xy( SCREEN_CENTER_X,SCREEN_CENTER_Y-80 ):diffuse( color("1,1,0.5,1") )
		s:addx( -SCREEN_WIDTH ):decelerate(0.3):addx( SCREEN_WIDTH )
	end,
	CardSavedCommand=function(s)
		s:visible(false)
	end,
    Def.Sprite{ Texture=THEME:GetPathB("","ScreenProfileLoad overlay/"..lang.."Warning3"),
        InitCommand=function(s) s:xy( -140,0 ) end
    };
    Def.Sprite{ Texture=THEME:GetPathB("","ScreenProfileLoad overlay/"..lang.."Warning4"),
        InitCommand=function(s) s:xy( 120,0 ) end
    };
}

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s)
		s:xy( SCREEN_CENTER_X,SCREEN_CENTER_Y-60 ):diffuse( color("1,1,0.5,1") )
		s:visible(false)
	end,
	OffCommand=function(s)
		s:linear(0.2):addx(-SCREEN_WIDTH)
	end,
	CardSavedCommand=function(s)
		s:visible(true)
	end,
    Def.Sprite{ Texture=lang.."Warning3",
        InitCommand=function(s) s:xy( -110,0 ) end
    };
    Def.Sprite{ Texture=lang.."Warning5",
        InitCommand=function(s) s:xy( 112,0 ) end
    };
}

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-10) end,
    ActionCommand=function(s) s:decelerate(0.2):y(SCREEN_CENTER_Y+80):queuecommand("Bounce") end,
    OffCommand=function(s) s:finishtweening():decelerate(0.2):y(SCREEN_CENTER_Y-10):sleep(1) end,
	CardSavedCommand=function(s) s:finishtweening():y(SCREEN_CENTER_Y+80) end,
	BounceCommand=function(s)
		s:stoptweening():decelerate(0.3):zoom(0.7)
		:bounceend(0.2):zoom(0.9)
		:decelerate(0.2):zoom(1)
		:bounceend(0.2):zoom(0.9)
		:decelerate(0.2):zoom(1)
		:queuecommand("Bounce")
	end,
	Def.Sprite{
		Texture="../_moveon",
		ActionCommand=function(s) s:sleep(0.2):queuecommand("Bounce") end,
		CardSavedCommand=function(s) s:stoptweening():decelerate(0.1):zoom(1) end,
		BounceCommand=function(s)
			s:stoptweening():bouncebegin(0.3):zoomx(0.9):zoomy(1.1)
			:smooth(0.15):zoom(1)
			:bouncebegin(0.15):zoomx(0.95):zoomy(1.05)
			:smooth(0.15):zoom(1)
			:queuecommand("Bounce")
			-- :decelerate(0.2):zoom(1)
			-- :decelerate(0.4):zoom(1)
			-- :accelerate(0.4):zoomx(1.05):zoomy(0.95)
			-- :decelerate(0.4):zoomx(1):zoomy(1)
		end,
	};
}

t[#t+1] = Def.Quad{
	InitCommand=function(s) s:FullScreen():diffuse(Alpha(Color.Black,0)) 
		if not GAMESTATE:IsAnyHumanPlayerUsingMemoryCard() then
			s:diffusealpha(1)
		end
	end,
};

return t;