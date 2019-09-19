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
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")

-- stage display (course)
if ShowStandardDecoration("StageNumber") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local stageNum = LoadActor(THEME:GetPathG(Var "LoadingScreen", "StageNumber"), pn)
		t[#t+1] = StandardDecorationFromTable( "StageNumber" .. ToEnumShortString(pn), stageNum );
	end
end

local ToHide = {"Overhead","Vivid","NoRecover","FailOff"}
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	local usingreverse = GAMESTATE:PlayerIsUsingModifier(pn,'reverse')
    t[#t+1] = Def.Sprite{
        Texture=THEME:GetPathG("StepsDisplayGameplay","frame"),
        InitCommand=function(s)
            s:animate(0):draworder(101):xy(
                pn == PLAYER_1 and SCREEN_LEFT+80 or SCREEN_RIGHT-80,
                usingreverse and SCREEN_TOP+85-44 or SCREEN_BOTTOM-37-30
            )
        end,
        OnCommand=function(s)
            s:addx( pn == PLAYER_1 and -164 or 164 ):linear(0.6):addx( pn == PLAYER_1 and 164 or -164 )
            s:playcommand("Set")
        end,
        SetCommand=function(s)
			if GAMESTATE:GetCurrentSteps(pn) then
				local stt = LoadStepsDisplayGameplayFrame(self,pn)
				s:setstate( usingreverse and stt+2 or stt )
            end
        end
	};
	
	t[#t+1] = Def.BitmapText{
		Font="ScreenGameplay player options",
		OnCommand=function(s) 
			s:xy(
				THEME:GetMetric(Var "LoadingScreen","PlayerOptions".. ToEnumShortString(pn) .."X"),
				THEME:GetMetric(Var "LoadingScreen","PlayerOptions".. ToEnumShortString(pn) .."Y")
			)
			local mods = {}
			local complete = ""
			for i,a in ipairs(GAMESTATE:GetPlayerState(pn):GetPlayerOptionsArray("ModsLevel_Preferred")) do
				local removed = false
				local ToHide = {"Overhead","Vivid","NoRecover","FailOff"}
				for _, v in pairs(ToHide) do
					if a == v then
						lua.ReportScriptError( "removing ".. a )
						removed = true
						break
					end
				end
				if not removed then
					mods[#mods+1] = a
				end
			end

			for i,a in ipairs(mods) do
				complete = complete .. a .. " "
			end

			s:settext( complete )
			s:draworder(99):halign( pn == PLAYER_1 and 0 or 1 )
			:diffuse( pn == PLAYER_1 and color("0.4,0.8,1.0,1") or color("1.0,0.5,0.2,1") )
			:shadowlength(1):addy(usingreverse and -50 or 78):linear(0.6):addy(usingreverse and 50 or -78)
		end;
	}
end

return t
