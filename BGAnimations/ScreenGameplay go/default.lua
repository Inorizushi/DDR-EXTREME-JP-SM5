return Def.ActorFrame{
	LoadActor("../go")..{
		Name="Main";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-4);
		OnCommand=cmd(diffusealpha,1;sleep,1.188;diffusealpha,0)
	};
};