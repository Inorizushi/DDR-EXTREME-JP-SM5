return Def.ActorFrame{
  LoadActor(THEME:GetPathS("","_moreswoosh"))..{
		StartTransitioningCommand=cmd(play);
	};
  Def.Quad{
    InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1"));
    OnCommand=cmd(diffusealpha,1;linear,0.266;diffusealpha,0);
  };
};
