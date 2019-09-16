return Def.ActorFrame{
	Def.Sound{
		File=THEME:GetPathS("","_swoosh"),
		StartTransitioningCommand=function(s) s:play() end
	};

	Def.Sprite{
		Texture="_moveon",
		InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-10) end,
		OnCommand=function(s)
			s:diffusealpha(0):sleep(0.933):diffuse( color("0.5,0.5,0.5,1") ):zoomy(0.72):decelerate(0.166)
			:zoomy(1):diffuse( Color.White )
		end
	};
	Def.Sprite{
		Texture="_2moveon",
		InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-10) end,
		OnCommand=function(s)
			s:diffusealpha(0):sleep(0.8):diffusealpha(0):zoomy(0):linear(0.133):zoomy(0.72)
			:diffusealpha(1):sleep(0):diffusealpha(0)
		end
	};
};