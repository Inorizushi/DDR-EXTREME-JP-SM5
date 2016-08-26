return Def.ActorFrame{
	LoadActor("../go")..{
		Name="Main";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-12);
		OnCommand=cmd(diffusealpha,1;sleep,1.2;diffusealpha,0);
	};
};