return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background"));
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0.5"));
	};
};