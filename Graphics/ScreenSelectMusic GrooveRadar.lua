local function radarSet(self,player)
	local selection = nil;
	if GAMESTATE:IsCourseMode() then
		if GAMESTATE:GetCurrentCourse() then
			selection = GAMESTATE:GetCurrentTrail(player);
		end;
	else
		if GAMESTATE:GetCurrentSong() then
			selection = GAMESTATE:GetCurrentSteps(player);
		end;
	end;
	if selection then
		self:SetFromRadarValues(player, selection:GetRadarValues(player));
	else
		self:SetEmpty(player);
	end;
	self:finishtweening():decelerate(0.3):zoom( (GAMESTATE:Env()["UsingEditSelector"] or GAMESTATE:Env()["SelectedEdit"]) and 0 or 1 )
end

local firstRun=true

local t = Def.ActorFrame {
	Name="Radar";
	Def.GrooveRadar{
		OnCommand=function(self) firstRun = false end;
		CurrentSongChangedMessageCommand=function(self)
			for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
				radarSet(self, pn);
			end;
		end;
		CurrentStepsP1ChangedMessageCommand=function(self) radarSet(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) radarSet(self, PLAYER_2); end;
		CurrentTrailP1ChangedMessageCommand=function(self) radarSet(self, PLAYER_1); end;
		CurrentTrailP2ChangedMessageCommand=function(self) radarSet(self, PLAYER_2); end;
		SortOrderChangedMessageCommand=function(self)
			if not firstRun then
				local curSort = GAMESTATE:GetSortOrder()
				if curSort then
					if curSort == 'SortOrder_ModeMenu' then self:playcommand("Off")
					else self:playcommand("On")
					end
				end
			end
		end;
		ReturnedFromScreenMessageCommand=function(self)
			for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
				radarSet(self, pn);
			end;
		end;
		RandomizeDataMessageCommand=function(s) s:queuecommand("RandomLoop") end,
		StopDataMessageCommand=function(s) s:finishtweening() end,
		RandomLoopCommand=function(s)
			local randnum = GAMESTATE:Env()["randnum"]
			for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
				if randnum:HasStepsTypeAndDifficulty( GAMESTATE:GetCurrentSteps(pn):GetStepsType(), GAMESTATE:Env()["curdir"][pn]  ) then
					local steps = randnum:GetAllSteps()
					for v in ivalues(steps) do
						if v:GetDifficulty() == GAMESTATE:Env()["curdir"][pn] then
							s:SetFromRadarValues( pn, v:GetRadarValues(pn) )
						end
					end
				end
			end
			s:sleep(1/8):queuecommand("RandomLoop")
		end,
	};
};

return t;