return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		StartTransitioningCommand=cmd(play);
	};

	LoadActor("_moveon")..{
		InitCommand=cmd(Center;zoomy,0;diffuse,color("0,0,0,0"));
		OnCommand=cmd(linear,0.5;diffuse,color("1,1,1,1");zoomy,1);
	};
};