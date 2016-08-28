local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay");

t[#t+1] = Def.ActorFrame{
  Def.RollingNumbers{
    Font="ScreenEvaluation Combo",
    InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-249;y,SCREEN_CENTER_Y+104;diffuse,color("#FFFF00");playcommand,"Set";);
    OnCommand=cmd(draworder,90;zoom,1.3;horizalign,left;diffusealpha,0;sleep,0.266;linear,0.416;diffusealpha,1);
    OffCommand=cmd(sleep,0.066;sleep,0.333;linear,0.416;diffusealpha,0);
    SetCommand=function(self)
      self:Load("RollingNumbersMaxCombo")
      if GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer() >= 1 then
        self:targetnumber(STATSMAN:GetFinalEvalStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo());
      else
        self:targetnumber(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo());
      end;
    end;
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("","ScreenEvaluation ComboLabel"))..{
    InitCommamd=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1));
    OnCommand=cmd(x,SCREEN_CENTER_X-276;y,SCREEN_CENTER_Y+104;draworder,90;diffusealpha,0;sleep,0.266;linear,0.416;diffusealpha,1);
    OffCommand=cmd(sleep,0.066;sleep,0.333;linear,0.416;diffusealpha,0);
  };
};

-- difficulty display
if ShowStandardDecoration("DifficultyIcon") then
	if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
		-- in rave mode, we always have two players.
	else
		-- otherwise, we only want the human players
		for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
			local diffIcon = LoadActor(THEME:GetPathG(Var "LoadingScreen", "DifficultyIcon"), pn)
			t[#t+1] = StandardDecorationFromTable("DifficultyIcon" .. ToEnumShortString(pn), diffIcon);
		end
	end
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "MachineRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "MachineRecord"), pn ) .. {
		InitCommand=function(self)
			self:player(pn);
			self:name(MetricsName);
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PersonalRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PersonalRecord"), pn ) .. {
		InitCommand=function(self)
			self:player(pn);
			self:name(MetricsName);
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
		end;
	};
end

t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra1" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
};


return t;
