local t = Def.ActorFrame{
	Def.Sprite {
	Texture="help 1x3.png",
		InitCommand=function(self)
			self:draworder(100):CenterX():y(SCREEN_BOTTOM-35)
			self:SetAllStateDelays(4.224)
		end,
		OnCommand=function(self)
			self:shadowlength(0):addy(999):sleep(0.6):addy(-999):diffuseblink():effectperiod(1.056)
		end,
		OffCommand=function(self)
			self:addy(999)
		end
	};
};

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

local yPosPlayer = {
    P1 = (SCREEN_TOP+52),
    P2 = (SCREEN_TOP+64)
}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("mod bar")..{
		Name = pn,
		InitCommand=function(self)
			local short = ToEnumShortString(pn)
			self:y(yPosPlayer[short])
			:CenterX()
		end;
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
		OffCommand=cmd(accelerate,0.783;addx,-640);
	};
end

t[#t+1] = LoadActor("p1badge")..{
	InitCommand=function(self)
		self:x(SCREEN_LEFT):y(SCREEN_TOP+52):halign(0);
	end;
	BeginCommand=function(self,param)
		if GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then
			self:visible(true);
		else
			self:visible(false);
		end;
	end;
	OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
	OffCommand=cmd(accelerate,0.783;addx,-640);
};

t[#t+1] = LoadActor("p2badge")..{
	InitCommand=function(self)
		self:x(SCREEN_LEFT):y(SCREEN_TOP+64):halign(0);
	end;
	BeginCommand=function(self,param)
		if GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') then
			self:visible(true);
		else
			self:visible(false);
		end;
	end;
	OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
	OffCommand=cmd(accelerate,0.783;addx,-640);
};

t[#t+1] = Def.ActorFrame{
	LoadActor( THEME:GetPathB("","_selModIcons") ) .. {
		InitCommand=cmd(player,PLAYER_1;CenterX;y,SCREEN_TOP+52.1;draworder,1);
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
		OffCommand=cmd(accelerate,0.783;addx,-640);
	};
};

local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState( player );
	end

	local t = Def.StepsDisplay {
		InitCommand=cmd(Load,"StepsDisplay",GAMESTATE:GetPlayerState(pn););
	};

	if pn == PLAYER_1 then
		t.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
		t.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	else
		t.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
		t.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	end

	return t;
end

local xPosPlayer = {
  P1 = (SCREEN_LEFT+26),
  P2 = (SCREEN_LEFT+280)
}

local hAlignPlayer = {
	P1 = (0),
	P2 = (1)
}

--meter
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1] = Def.ActorFrame{
	LoadFont("_shared5")..{
		InitCommand=function(self)
			local short = ToEnumShortString(pn)
			self:x(xPosPlayer[short]):halign(hAlignPlayer[short])
			:y(SCREEN_BOTTOM-58)
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
				else
					self:settext("");
				end;
			self:visible(true)
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(diffusealpha,0;sleep,0.533;linear,0.184;diffusealpha,1);
		OffCommand=cmd(sleep,0.183;linear,0.2;diffusealpha,0);
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
