local t = Def.ActorFrame{}

local DiffToIndex = {
  ["Difficulty_Beginner"] = 0,
  ["Difficulty_Easy"] = 1,
  ["Difficulty_Medium"] = 2,
  ["Difficulty_Hard"] = 3,
  ["Difficulty_Challenge"] = 4,
  ["Difficulty_Edit"] = 5,
}

local xPosPlayerIcon = {
    P1 = SCREEN_CENTER_X-263,
    P2 = SCREEN_CENTER_X-73
}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1] = Def.ActorFrame{
  InitCommand=function(self)
    local short = ToEnumShortString(pn)
    self:x(xPosPlayerIcon[short]):y(SCREEN_CENTER_Y+15)
  end,
  LoadActor("_iconframe "..ToEnumShortString(pn))..{
    OnCommand=cmd(addy,40;cropbottom,1;sleep,0.717;decelerate,0.183;addy,-40;cropbottom,0);
    OffCommand=cmd(sleep,0.2;accelerate,0.183;addy,40;cropbottom,1);
  };
  Def.ActorFrame{
    InitCommand=cmd(x,pn=="PlayerNumber_P2" and 15 or -15);
	OnCommand=function(s)
		s:addy(40):diffusealpha(0):sleep(0.717):decelerate(0.183):addy(-40):diffusealpha(1)
	end,
    OffCommand=cmd(sleep,0.2;accelerate,0.183;addy,40;diffusealpha,0);
    Def.Sprite{
      Texture="_difficulty icons 1x6.png";
	  InitCommand=cmd(pause);
	  BeginCommand=function(s)
		s:diffusealpha(0):cropbottom(1):sleep(0.717):decelerate(0.183):cropbottom(0):diffusealpha(1)
	end,
      SetCommand=function(self)
        local song = GAMESTATE:GetCurrentSong()
        if song then
          local steps = GAMESTATE:GetCurrentSteps(pn)
          if steps then
            self:setstate(DiffToIndex[steps:GetDifficulty()])
            self:visible(true)
          end
        else
          self:visible(false)
        end
      end;
      CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
  		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		  CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
		OffCommand=function(s)
			s:sleep(0.2):accelerate(0.183):cropbottom(1)
		end,
    };
    LoadActor("_autogen")..{
      InitCommand=cmd(visible,false);
  		BeginCommand=cmd(playcommand,"Set");
  		ShowCommand=cmd(visible,true;diffuseshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,1"));
  		HideCommand=cmd(visible,false;stopeffect);
      CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
  		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
  		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
  		SetCommand=function(self)
  			local song = GAMESTATE:GetCurrentSong()
  			if song then
  				local steps = GAMESTATE:GetCurrentSteps(pn)
  				if steps then
  					if steps:IsAutogen() then self:playcommand("Show")
  					else self:playcommand("Hide")
  					end
  				else
  					self:playcommand("Hide")
  				end
  			else
  				self:playcommand("Hide")
  			end
  		end;
    };
  };
};
end;

--Meter Frames
t[#t+1] = Def.ActorFrame{
	LoadActor("_frame p1")..{
		InitCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) ~= true or SCREENMAN:GetTopScreen() == 'ScreenSelectCourse' then
				self:visible(false)
			else
				self:visible(true)
			end
			self:x(SCREEN_CENTER_X-234):y(SCREEN_CENTER_Y+175)
		end,
		OnCommand=cmd(cropbottom,1;sleep,0.533;linear,0.184;cropbottom,0);
		OffCommand=cmd(sleep,0.183;linear,0.2;cropbottom,1);
	};
	LoadActor("_frame p2")..{
		InitCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_2) ~= true or SCREENMAN:GetTopScreen() == 'ScreenSelectCourse' then
				self:visible(false)
			else
				self:visible(true)
			end
			self:x(SCREEN_CENTER_X-102):y(SCREEN_CENTER_Y+175)
		end,
		OnCommand=cmd(cropbottom,1;sleep,0.533;linear,0.184;cropbottom,0);
		OffCommand=cmd(sleep,0.183;linear,0.2;cropbottom,1);
	};
	LoadActor("splitter")..{
		InitCommand=function(self)
			if GAMESTATE:GetNumPlayersEnabled() == 2 then
				self:visible(true)
			else
				self:visible(false)
			end;
			self:x(SCREEN_CENTER_X-170):y(SCREEN_CENTER_Y+180)
		end;
		OnCommand=cmd(cropbottom,1;sleep,0.533;linear,0.184;cropbottom,0);
		OffCommand=cmd(sleep,0.183;linear,0.2;cropbottom,1);
	};
};

-- StepsDisplay
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState(player);
	end

	local name = "StepsDisplaySelMusic";

	local sd = Def.StepsDisplay {
		InitCommand=cmd(Load,name..ToEnumShortString(pn),GAMESTATE:GetPlayerState(pn););
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if not song then
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
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		-- stepsdisplay
		local MetricsName = "StepsDisplay" .. PlayerNumberToString(pn);
		t[#t+1] = StepsDisplay(pn) .. {
			InitCommand=function(self)
				self:player(pn);
				self:name(MetricsName);
				ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
			end;
		};
	end
end

local xPosPlayer = {
  P1 = (SCREEN_CENTER_X-294),
  P2 = (SCREEN_CENTER_X-40)
}

--meter
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1] = Def.ActorFrame{
	LoadFont("DifficultyMeter meter")..{
		InitCommand=function(self)
			local short = ToEnumShortString(pn)
			self:x(xPosPlayer[short]):halign(pn=='PlayerNumber_P2' and 1 or 0)
			:y(_screen.cy+183)
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
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(diffusealpha,0;sleep,0.533;linear,0.184;diffusealpha,1);
		OffCommand=cmd(linear,0.2;zoomy,0);
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
};
end

return t;
