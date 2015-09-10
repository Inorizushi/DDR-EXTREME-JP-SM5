return Def.ActorFrame{
	Def.Actor{ OnCommand=cmd(sleep,1.3); };
	LoadActor(THEME:GetPathS("","_moreswoosh"))..{ StartTransitioningCommand=cmd(play); };

	LoadActor("_moveon")..{
		InitCommand=cmd(Center;zoomy,1;diffusealpha,1);
		OnCommand=cmd(linear,0.5;diffusealpha,0;zoomy,0);
	};
}