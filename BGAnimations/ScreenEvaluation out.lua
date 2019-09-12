return Def.ActorFrame{
	Def.Actor{
		OnCommand=cmd(sleep,1.8);
	};

	LoadActor(THEME:GetPathS("","_moreswoosh"))..{
		StartTransitioningCommand=cmd(play);
	};

	LoadActor(THEME:GetPathB("","_moveon"))..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-10;zoomy,0;diffusealpha,0);
		OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.916;linear,0.233;diffusealpha,1;zoomy,1);
	};
};
