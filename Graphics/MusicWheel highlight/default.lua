local t = Def.ActorFrame{
  LoadActor("hl")..{
    OnCommand=cmd(cropbottom,0.1;diffuseshift;blend,Blend.Add;;effectcolor1,0.2,0.33,0,1;effectcolor2,0.2,0.33,0,0;effectperiod,1.085);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("frame")..{
    InitCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) ~= true or PROFILEMAN:IsPersistentProfile(PLAYER_1) == false then
        self:croptop(0.27)
      end;
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) ~= true or PROFILEMAN:IsPersistentProfile(PLAYER_2) == false then
        self:cropbottom(0.27)
      end;
    end;
  };
};

local yPosPlayer = {
	P1 = -33,
	P2 = 33
};

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1] = Def.BitmapText{
  Font="ScreenSelectMusic score";
  CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
  InitCommand=function(self)
		local short = ToEnumShortString(pn)
		self:x(75):y(yPosPlayer[short])
    self:zoomx(0.8):zoomy(0.75):diffuse(PlayerColor(pn))
  end;
  OnCommand=cmd(queuecommand,"Set");
  SetCommand= function(self)
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

  		if PROFILEMAN:IsPersistentProfile(pn) then
  			--player
  			profile = PROFILEMAN:GetProfile(pn);
  		else
  			-- machine profile
  			profile = PROFILEMAN:GetMachineProfile();
  		end;

  		scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
  		assert(scorelist)
  		local scores = scorelist:GetHighScores();
  		if scores[1] then
  			topscore = scores[1]:GetScore()
  		else
  			topscore = 0;
  		end;
  		assert(topscore)
      if PROFILEMAN:IsPersistentProfile(pn) then
        if topscore ~= 0 then
          self:settext(string.format("%9.0i",tostring(math.floor(topscore))))
        else
          self:settext(string.format("% 9.0i",0))
        end
      else
        self:settext("")
      end;
  	else
      if PROFILEMAN:IsPersistentProfile(pn) then
        self:settext(string.format("% 9.0i",0))
      else
        self:settext("")
      end;
  	end;
  end;
};
end;

return t;
