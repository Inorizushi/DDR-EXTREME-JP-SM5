return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,1;linear,0.3;diffusealpha,1);
		-- currently sm-ssc v2.0.0, but not a critical feature.
		SkippedMessageCommand=cmd(linear,0.3;diffusealpha,1);
	};
};