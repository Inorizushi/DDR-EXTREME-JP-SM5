return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		StartTransitioningCommand=function(s) s:play() end
	};

	LoadActor("_moveon")..{
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-10)
		end,
		OnCommand=function(s)
			s:diffuse( Color.White ):accelerate(0.166):diffuse( color("0.5,0.5,0.5,1") )
			:zoomy(0.72):sleep(0):diffusealpha(0)
		end
	};
	LoadActor("_2moveon")..{
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-10)
		end,
		OnCommand=function(s)
			s:diffusealpha(0):sleep(0.166)
			:diffusealpha(1):zoomy(0.72):linear(0.133):diffusealpha(0):zoomy(0)
		end
	};
};