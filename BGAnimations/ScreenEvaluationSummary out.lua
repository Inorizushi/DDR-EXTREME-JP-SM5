return Def.ActorFrame{
	Def.Actor{
		OnCommand=cmd(sleep,0.5);
	};

	LoadActor(THEME:GetPathS("","_moreswoosh"))..{
		StartTransitioningCommand=cmd(play);
	};
};