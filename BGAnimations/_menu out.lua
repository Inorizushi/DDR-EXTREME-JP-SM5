return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		StartTransitioningCommand=cmd(play);
	};

	LoadActor("_moveon")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-10);
		OnCommand=cmd(diffusealpha,0;sleep,0.933;diffuse,color("0.5,0.5,0.5,1");zoomy,0.72;decelerate,0.166;zoomy,1;diffuse,color("1,1,1,1"));
	};
	LoadActor("_2moveon")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-10);
		OnCommand=cmd(diffusealpha,0;sleep,0.8;diffusealpha,0;zoomy,0;linear,0.133;zoomy,0.72;diffusealpha,1;sleep,0;diffusealpha,0);
	};
};