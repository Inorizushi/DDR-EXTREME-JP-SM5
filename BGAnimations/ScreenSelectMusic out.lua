return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1")),
		OnCommand=cmd(diffusealpha,0;sleep,1.133;linear,0.3;diffusealpha,1);
	};
};