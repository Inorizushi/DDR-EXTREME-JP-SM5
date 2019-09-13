local Player = ...
assert(Player,"ScreenEvaluation DifficultyIcon requires a Player")

return LoadActor(THEME:GetPathG("ScreenEvaluation","difficulty icons"))..{
	InitCommand=function(s) s:pause() end,
	BeginCommand=function(s) s:playcommand("Set") end,
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			-- change icon index based on difficulty
			local steps = GAMESTATE:GetCurrentSteps(Player)
			if steps then
				self:setstate(GetDifficultyIconFrame(steps:GetDifficulty()))
				self:visible(true)
			end
		else
			self:visible(false)
		end
	end
};