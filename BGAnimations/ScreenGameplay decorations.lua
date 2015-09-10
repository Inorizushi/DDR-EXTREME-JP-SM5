local t = Def.ActorFrame{};

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
	local ScoreMode = 'DDR SuperNOVA 2';
	
	t[#t+1] = Def.Actor {
		Condition = not GAMESTATE:IsDemonstration();
		JudgmentMessageCommand=function(self, params)
			if params.Player == pn then	
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_Invalid' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then	
					if pss:GetFailed() ~= true then
						pss:SetScore(Scoring[ScoreMode](params,pss));
					end
				end
			end
		end;
	};
end

t[#t+1] = StandardDecorationFromFile("LifeFrame","LifeFrame")
t[#t+1] = StandardDecorationFromFile("ScoreFrame","ScoreFrame")

-- stage display (normal)
t[#t+1] = StandardDecorationFromFile("SDisplay","SDisplay")

-- stage display (course)
if ShowStandardDecoration("StageNumber") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local stageNum = LoadActor(THEME:GetPathG(Var "LoadingScreen", "StageNumber"), pn)
		t[#t+1] = StandardDecorationFromTable( "StageNumber" .. ToEnumShortString(pn), stageNum );
	end
end

t[#t+1] = LoadActor("under")..{ 
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+20);
	OnCommand=cmd(draworder,0);
}

return t