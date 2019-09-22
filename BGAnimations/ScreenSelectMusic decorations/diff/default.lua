local t = Def.ActorFrame{}
local pn = ...

local xPosPlayerIcon = { [PLAYER_1] = SCREEN_CENTER_X-263,[PLAYER_2] = SCREEN_CENTER_X-73 }
t[#t+1] = Def.ActorFrame{
  InitCommand=function(self)
    self:x(xPosPlayerIcon[pn]):y(SCREEN_CENTER_Y+15)
  end,
  LoadActor("_iconframe "..ToEnumShortString(pn))..{
    OnCommand=function(s) s:addy(40):cropbottom(1):sleep(0.717):decelerate(0.183):addy(-40):cropbottom(0) end,
    OffCommand=function(s) s:sleep(0.2):accelerate(0.183):addy(40):cropbottom(1) end,
  };
  Def.ActorFrame{
    InitCommand=function(s) s:x( pn == "PlayerNumber_P2" and 15 or -15) end,
	OnCommand=function(s) s:addy(40):diffusealpha(0):sleep(0.717):decelerate(0.183):addy(-40):diffusealpha(1) end,
	OffCommand=function(s) s:sleep(0.2):accelerate(0.183):addy(40):diffusealpha(0) end,
    Def.Sprite{
      Texture="_difficulty icons 1x6.png";
	  InitCommand=function(s) s:pause() end,
	  BeginCommand=function(s)
		s:diffusealpha(0):cropbottom(1):sleep(0.717):decelerate(0.183):cropbottom(0):diffusealpha(1)
	end,
    SetCommand=function(self)
	self:visible(false)
		if GAMESTATE:GetCurrentSong() then
			local steps = GAMESTATE:GetCurrentSteps(pn)
			if steps then
				self:setstate( GetDifficultyIconFrame(steps:GetDifficulty()) ):visible(true)
			end
		end
    end;
    CurrentSongChangedMessageCommand=function(s) s:playcommand("Set") end,
  	CurrentStepsP1ChangedMessageCommand=function(s) s:playcommand("Set") end,
	CurrentStepsP2ChangedMessageCommand=function(s) s:playcommand("Set") end,
	OffCommand=function(s) s:sleep(0.2):accelerate(0.183):cropbottom(1) end,
    };
    LoadActor("_autogen")..{
		InitCommand=function(s) s:visible(false) end,
		BeginCommand=function(s) s:playcommand("Set") end,
		ShowCommand=function(s) s:visible(true):diffuseshift():effectcolor1( color("1,1,1,0") ):effectcolor2( Color.White ) end,
		HideCommand=function(s) s:visible(false):stopeffect() end,
		CurrentSongChangedMessageCommand=function(s) s:playcommand("Set") end,
		CurrentStepsP1ChangedMessageCommand=function(s) s:playcommand("Set") end,
		CurrentStepsP2ChangedMessageCommand=function(s) s:playcommand("Set") end,
  		SetCommand=function(self)
			self:playcommand("Hide")
  			if GAMESTATE:GetCurrentSong() then
  				local steps = GAMESTATE:GetCurrentSteps(pn)
				if steps and steps:IsAutogen() then
					self:playcommand("Show")
  				end
  			end
  		end;
    };
  };
};

--Meter Frames
local framepos = { [PLAYER_1] = SCREEN_CENTER_X-234, [PLAYER_2] = SCREEN_CENTER_X-102 }
t[#t+1] = Def.ActorFrame{
	LoadActor("_frame ".. ToEnumShortString(pn))..{
		InitCommand=function(self)
			self:visible( (GAMESTATE:IsPlayerEnabled(pn) or SCREENMAN:GetTopScreen() ~= 'ScreenSelectCourse') and true or false )
			:xy( framepos[pn], SCREEN_CENTER_Y+175 )
		end,
		OnCommand=function(s) s:cropbottom(1):sleep(0.533):linear(0.184):cropbottom(0) end,
		OffCommand=function(s) s:sleep(0.183):linear(0.2):cropbottom(1) end,
	};
	LoadActor("splitter")..{
		InitCommand=function(self)
			self:visible( GAMESTATE:GetNumPlayersEnabled() == 2 )
			self:x(SCREEN_CENTER_X-170):y(SCREEN_CENTER_Y+180)
		end;
		OnCommand=function(s) s:cropbottom(1):sleep(0.633):linear(0.184):cropbottom(0) end,
		OffCommand=function(s) s:sleep(0.083):linear(0.2):cropbottom(1) end,
	};
};

-- StepsDisplay
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState(player);
	end

	local sd = Def.StepsDisplay {
		InitCommand=function(s)
			s:Load( "StepsDisplaySelMusic"..ToEnumShortString(pn),GAMESTATE:GetPlayerState(pn) )
		end,
		CurrentSongChangedMessageCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then
				-- hacky hack 1: set all feet to nothing!
				self:GetChild("Ticks"):settext("0000000000");
				-- hacky hack 2: diffuse to beginner
				self:GetChild("Ticks"):diffuse(CustomDifficultyToColor("Beginner"))
			end
		end;
	};

	if pn == PLAYER_1 then
		sd.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
		sd.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	else
		sd.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
		sd.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	end

	return sd;
end

if ShowStandardDecoration("StepsDisplay") then
	local MetricsName = "StepsDisplay" .. PlayerNumberToString(pn);
	t[#t+1] = StepsDisplay(pn) .. {
		InitCommand=function(self)
			self:player(pn);
			self:name(MetricsName);
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
		end;
	};
end

--meter
local xPosPlayer = { [PLAYER_1] = (SCREEN_CENTER_X-292),[PLAYER_2] = (SCREEN_CENTER_X-44) }
t[#t+1] = Def.ActorFrame{
	LoadFont("DifficultyMeter meter")..{
	InitCommand=function(self)
		self:xy(xPosPlayer[pn], _screen.cy+182):halign(pn=='PlayerNumber_P2' and 1 or 0)
	end;
	SetCommand=function(self)
	local SongOrCourse, StepsOrTrail;
		if GAMESTATE:IsCourseMode() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
			StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
		else
			SongOrCourse = GAMESTATE:GetCurrentSong();
			StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
		end;

	self:visible(false)
		if SongOrCourse and StepsOrTrail then
			local st = StepsOrTrail:GetStepsType();
			local diff = StepsOrTrail:GetDifficulty();
			local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
			if SongOrCourse:HasStepsTypeAndDifficulty(st,diff) then
			local steps = SongOrCourse:GetOneSteps( st, diff );
				self:settext(steps:GetMeter());
				self:diffuse(CustomDifficultyToColor(ToEnumShortString(diff)));
			else
				self:settext("");
			end;
			self:visible(true)
		end;
	end;
	OnCommand=function(s) s:diffusealpha(0):sleep(0.533):linear(0.184):diffusealpha(1) end,
	OffCommand=function(s) s:linear(0.2):zoomy(0) end,
	CurrentSongChangedMessageCommand=function(s) s:playcommand("Set") end,
	CurrentStepsP1ChangedMessageCommand=function(s) s:playcommand("Set") end,
	CurrentStepsP2ChangedMessageCommand=function(s) s:playcommand("Set") end,
	CurrentTrailP1ChangedMessageCommand=function(s) s:playcommand("Set") end,
	CurrentTrailP2ChangedMessageCommand=function(s) s:playcommand("Set") end,
	CurrentCourseChangedMessageCommand=function(s) s:playcommand("Set") end
	};
};

return t;
