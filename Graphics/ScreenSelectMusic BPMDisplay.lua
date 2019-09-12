return Def.ActorFrame{
	Def.BPMDisplay{
		Name="BPMDisplay";
		File=THEME:GetPathF("BPMDisplay", "bpm");
		InitCommand=cmd(halign,1);
		CurrentSongChangedMessageCommand=function(self)
			self:SetFromGameState()
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				(THEME:GetMetric("BPMDisplay","SetExtraCommand"))(self)
			end
		end;
	};

	LoadActor("BPMDisplay label")..{
		Name="Label";
		InitCommand=cmd(halign,0);
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				(THEME:GetMetric("BPMDisplay","SetExtraCommand"))(self)
			else
				local song = GAMESTATE:GetCurrentSong()
				if song then
					-- we have song; check bpm status and color accordingly
					if song:IsDisplayBpmRandom() then
						(THEME:GetMetric("BPMDisplay","SetRandomCommand"))(self)
					else
						local bpms = song:GetDisplayBpms()
						if bpms[1]==bpms[2] then
							(THEME:GetMetric("BPMDisplay","SetNormalCommand"))(self)
						else
							(THEME:GetMetric("BPMDisplay","SetChangeCommand"))(self)
						end
					end
				else
					-- no song
					(THEME:GetMetric("BPMDisplay","SetNoBpmCommand"))(self)
				end
			end
		end;
	};
};
