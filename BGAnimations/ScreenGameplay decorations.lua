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
	t[#t+1] = LoadActor( THEME:GetPathG("ScreenGameplay","StageNumber"), pn )
end

t[#t+1] = StandardDecorationFromFile("LifeFrame","LifeFrame")
t[#t+1] = StandardDecorationFromFile("ScoreFrame","ScoreFrame")

-- stage display (normal)
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")


local ToHide = {"Overhead"}

for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.BitmapText{
		Font="ScreenGameplay player options",
		OnCommand=function(s)
			s:xy(
				THEME:GetMetric(Var "LoadingScreen","PlayerOptions".. ToEnumShortString(pn) .."X"),
				THEME:GetMetric(Var "LoadingScreen","PlayerOptions".. ToEnumShortString(pn) .."Y")
			)
			local mods = GAMESTATE:GetPlayerState(pn):GetPlayerOptionsArray("ModsLevel_Preferred")
			local complete = ""
			for i,a in ipairs(mods) do
				for v in ivalues(ToHide) do
					if not (a == v) then
						complete = complete .. a .. " "
					end
				end
			end

			s:settext( complete )
			s:draworder(99):halign( pn == PLAYER_1 and 0 or 1 )
			:diffuse( pn == PLAYER_1 and color("0.4,0.8,1.0,1") or color("1.0,0.5,0.2,1") )
			:shadowlength(1):addy(78):linear(0.6):addy(-78)
		end;
	}
end

return t
