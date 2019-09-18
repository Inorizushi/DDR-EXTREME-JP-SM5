-- Stage Number, used for Nonstop, Oni, and Endless modes
local Player = ...
if not Player then error("ScreenGameplay StageNumber requires a Player") end

return LoadFont("stage")..{
	Condition=GAMESTATE:GetPlayMode() == 'PlayMode_Oni',
	InitCommand=function(s)
		s:xy(
			THEME:GetMetric(Var "LoadingScreen","StageNumber"..ToEnumShortString(Player).."X"),
			THEME:GetMetric(Var "LoadingScreen","StageNumber"..ToEnumShortString(Player).."Y")
		):draworder(101):addy(-50):linear(0.6):addy(50)
	end;
	BeginCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local curStageStats = STATSMAN:GetCurStageStats()
		local pss = curStageStats:GetPlayerStageStats(Player)
		self:settext(pss:GetSongsPlayed())
	end;
	ChangeCourseSongInMessageCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};