return Def.ActorFrame{
	LoadActor("../ready")..{
		Name="Main";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-4);
		OnCommand=cmd(diffusealpha,1;sleep,1.551;diffusealpha,0);
	};
};