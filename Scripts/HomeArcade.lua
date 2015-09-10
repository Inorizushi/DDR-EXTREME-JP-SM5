-- things that have to do with home vs. arcade mode

--[[ ScreenSelectStyle ]]
function StyleChoices()
	local choices = "1,2,3"
	local coinMode = GAMESTATE:GetCoinMode()
	if coinMode == 'CoinMode_Home' then choices = choices .. "" end
	return choices
end

--[[ ScreenSelectDifficulty ]]
function DifficultyChoices()
	local choices = "1,2,3,4"
	local coinMode = GAMESTATE:GetCoinMode()
	if coinMode == 'CoinMode_Home' then choices = choices .. "" end
	return choices
end