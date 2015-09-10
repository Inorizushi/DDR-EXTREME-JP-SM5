return Def.ActorFrame{
	-- used on exit item
	Def.Quad{
		Name="Fade";
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0"));
		OffCommand=function(self)
			local screen = SCREENMAN:GetTopScreen()
			if screen then
				if screen:AllAreOnLastRow() then
					self:linear(0.3)
					self:diffusealpha(1)
				end
			end
		end;
	};

	-- used on not exit
	Def.Actor{
		Name="Dummy";
		OffCommand=function(self)
			local screen = SCREENMAN:GetTopScreen()
			if screen then
				if not screen:AllAreOnLastRow() then
					self:linear(0.3)
				end
			end
		end;
	};
};