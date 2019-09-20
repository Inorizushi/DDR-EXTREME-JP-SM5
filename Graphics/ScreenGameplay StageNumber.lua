-- Stage Number, used for Nonstop, Oni, and Endless modes
local Player = ...
if not Player then error("ScreenGameplay StageNumber requires a Player") end

return LoadFont("stage")..{
	BeginCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local curStageStats = STATSMAN:GetCurStageStats()
		local pss = curStageStats:GetPlayerStageStats(Player)
		self:settext( string.format( "%2i", pss:GetSongsPlayed()) )
	end;
	ChangeCourseSongInMessageCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};