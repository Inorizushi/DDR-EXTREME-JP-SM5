return Def.ActorFrame{
	Def.Actor{
		OnCommand=cmd(sleep,1.8);
	};

	LoadActor(THEME:GetPathS("","_moreswoosh"))..{
		StartTransitioningCommand=cmd(play);
	};

	LoadActor(THEME:GetPathB("","_moveon"))..{
		InitCommand=cmd(Center;zoomy,0;diffusealpha,0);
		OnCommand=cmd(sleep,0.8;linear,0.5;diffusealpha,1;zoomy,1);
	};
};