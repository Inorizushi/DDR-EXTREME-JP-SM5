return Def.ActorFrame{
	Def.Sprite{
		Texture="ready",
		Name="Main";
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-12)
		end,
		OnCommand=function(s)
			s:diffusealpha(1):sleep(1.8):diffusealpha(0)
		end
	};
};