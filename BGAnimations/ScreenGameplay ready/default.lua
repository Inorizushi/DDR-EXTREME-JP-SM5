return Def.ActorFrame{
	LoadActor("../ready")..{
		Name="Main";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-12);
		OnCommand=cmd(diffusealpha,1;sleep,1.8;diffusealpha,0);
	};
};