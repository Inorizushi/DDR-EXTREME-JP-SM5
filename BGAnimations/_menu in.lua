return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		StartTransitioningCommand=cmd(play);
	};

	LoadActor("_moveon")..{
		InitCommand=cmd(Center;zoomy,1;diffusealpha,1);
		OnCommand=cmd(linear,0.5;diffuse,color("0,0,0,0");zoomy,0);
	};
};