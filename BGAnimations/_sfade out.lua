return Def.ActorFrame{
	Def.Sound{
		File=THEME:GetPathS("","_swoosh"),
		StartTransitioningCommand=function(s) s:play() end
	};

	Def.Quad{
		InitCommand=function(s)
			s:stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT):diffuse( color("0,0,0,0") )
		end,
		OnCommand=function(s)
			s:diffusealpha(0):linear(0.3):diffusealpha(1)
		end
	};
};