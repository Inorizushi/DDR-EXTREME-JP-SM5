return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=function(self)
			if getenv("OptionsFromTitleMenu") then
				self:diffusealpha(1)
				self:linear(0.3)
				self:diffusealpha(0)
				setenv("OptionsFromTitleMenu",false)
			end
		end;
	};
};