return Def.ActorFrame{
	LoadActor("../ready")..{
		Name="Main";
		InitCommand=cmd(CenterX;SCREEN_CENTER_Y-4);
	};
};