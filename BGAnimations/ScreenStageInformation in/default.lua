local stageToGraphic = {
	Stage_1st		= "1",
	Stage_2nd		= "2",
	Stage_3rd		= "3",
	Stage_4th		= "4",
	Stage_5th		= "5",
	Stage_6th		= "6",
	Stage_Next		= "event",
	Stage_Final		= "final",
	Stage_Extra1	= "extra1",
	Stage_Extra2	= "extra2",
	Stage_Nonstop	= "nonstop",
	Stage_Oni		= "oni",
	Stage_Endless	= "endless",
	Stage_Event		= "event"
}

return Def.ActorFrame{
	Def.Actor{ OnCommand=cmd(sleep,0); };

	Def.Sprite{
		InitCommand=cmd(CenterX;CenterY);
		BeginCommand=function(self)
			local curStage = GAMESTATE:GetCurrentStage()

			if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then curStage = 'Stage_Nonstop'
			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then curStage = 'Stage_Oni'
			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then curStage = 'Stage_Endless'
			else
				if GAMESTATE:IsEventMode() then curStage = 'Stage_Event'
				else
					local curStageNum = GAMESTATE:GetCurrentStageIndex() -- 0-based
					local maxStages = PREFSMAN:GetPreference("SongsPerPlay")

					local song = GAMESTATE:GetCurrentSong()
					if song then
						-- handle final stage
						local songStages = 1;
						if song:IsLong() then songStages = 2
						elseif song:IsMarathon() then songStages = 3
						end

						local totalStages = curStageNum+songStages
						if totalStages == maxStages then curStage = 'Stage_Final' end
					end
				end
			end

			self:Load(THEME:GetPathB("ScreenStageInformation","in/"..string.format("_stage %s",stageToGraphic[curStage])))
		end;
		OnCommand=cmd(diffusealpha,0;addy,90;sleep,0.1;diffusealpha,1;decelerate,0.184;addy,-90);
	};
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+130;zoomto,640,128;diffuse,color("0,0,0,1"));
	};
	LoadActor(THEME:GetPathB("","_underline"))..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(zoomx,0;linear,0.083;zoomx,1;sleep,0.15;linear,0.083;zoomx,0);
	};
	LoadActor("SoundStage");
};