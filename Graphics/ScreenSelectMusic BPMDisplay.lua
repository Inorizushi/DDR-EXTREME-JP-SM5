local t = Def.ActorFrame{}
local item = Def.ActorFrame{
	Def.BPMDisplay{
		Name="BPMDisplay";
		File=THEME:GetPathF("BPMDisplay", "bpm");
		InitCommand=cmd(halign,1;MaskDest);
		CurrentSongChangedMessageCommand=function(self)
			self:SetFromGameState()
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				(THEME:GetMetric("BPMDisplay","SetExtraCommand"))(self)
			end
		end;
	};

	LoadActor("BPMDisplay label")..{
		Name="Label";
		InitCommand=cmd(halign,0;MaskDest);
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

t[#t+1] = Def.Quad{ OnCommand=function(s) s:zoomto(140,26):y(22):MaskSource() end; }
t[#t+1] = Def.Quad{ OnCommand=function(s) s:zoomto(140,26):y(-24):MaskSource() end; }

local somf = Def.ActorFrame{
	CodeMessageCommand=function(s,param)
		if param.Name == "SongLeft" or param.Name == "SongMenuLeft" then
			s:finishtweening():y(-22)
			:decelerate(0.24):y(0)
		elseif param.Name == "SongRight" or param.Name == "SongMenuRight" then
			s:finishtweening():y(0)
			:decelerate(0.24):y(-22)
		end
	end;
	item,
	item..{
		OnCommand=function(s)
			s:y(22)
		end;
	}
}

t[#t+1] = somf

return t;
