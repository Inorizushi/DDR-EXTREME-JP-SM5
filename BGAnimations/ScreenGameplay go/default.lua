return Def.ActorFrame{
	LoadActor("../go")..{
		Name="Main";
		InitCommand=cmd(CenterX;SCREEN_CENTER_Y-4);
	};
};