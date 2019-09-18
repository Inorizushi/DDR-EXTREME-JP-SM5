return Def.ActorFrame{
	Def.Sprite{
		Texture="go",
		Name="Main";
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-12)
		end,
		OnCommand=function(s)
			s:diffusealpha(1):sleep(1.2):diffusealpha(0)
		end
	};
};