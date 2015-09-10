local r = {};
local ZeroIfNotFound = { __index = function() return 0 end; };

function GetTotalItems(radars)
	local total = radars:GetValue('RadarCategory_TapsAndHolds')
	total = total + radars:GetValue('RadarCategory_Holds') 
	total = total + radars:GetValue('RadarCategory_Rolls')
	return math.max(1,total);
end

function GetDirectRadar(player)
	if GAMESTATE:IsCourseMode() then
		return GAMESTATE:GetCurrentTrail(player):GetRadarValues(player);
	else
		return GAMESTATE:GetCurrentSteps(player):GetRadarValues(player);
	end
end

local score = {0,0};
local tmp_Score = {0,0};

r['DDR SuperNOVA 2'] = function(params, pss)
	local radarValues = GetDirectRadar(params.Player);
	local totalItems = GetTotalItems(radarValues);	
	local p = (params.Player == 'PlayerNumber_P1') and 1 or 2;
	local stepScore = string.format("%1.3f",(1000000/totalItems));
	
	if pss:GetScore() == 0 then
		tmp_Score[p] = 0;
		score[p] = 0;
	end;
	
	local oneStepScore =
	{
		['TapNoteScore_W1'] = stepScore,
		['TapNoteScore_W2'] = stepScore-10,
		['TapNoteScore_W3'] = (stepScore/2)-10,
		['TapNoteScore_W4'] = 0,
		['TapNoteScore_W5'] = 0,
		['TapNoteScore_Miss'] = 0,
		['TapNoteScore_HitMine'] = 0,
		['TapNoteScore_AvoidMine'] = 0,
		['TapNoteScore_CheckpointMiss'] = 0,
		['TapNoteScore_CheckpointHit'] = 0
	};
	setmetatable(oneStepScore, ZeroIfNotFound);
	local add = 0;
	
	if params.HoldNoteScore == 'HoldNoteScore_Held' then
		add = stepScore;
	elseif (params.HoldNoteScore == 'HoldNoteScore_LetGo') then
		add = 0;
	else
		add = oneStepScore[params.TapNoteScore];
	end
	
	tmp_Score[p] = tmp_Score[p] + add;
	score[p] = round(tmp_Score[p],-1);
	return score[p]
end

Scoring = r;