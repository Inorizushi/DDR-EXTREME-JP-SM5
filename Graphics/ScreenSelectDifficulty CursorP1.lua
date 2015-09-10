return Def.ActorFrame{
		LoadActor(THEME:GetPathG("_difficulty","cursor/_cursor P1"))..{
		InitCommand=cmd(diffusealpha,0;);
		OnCommand=cmd(draworder,3;draworder,3;diffusealpha,0;sleep,0.55;diffusealpha,1);
		OffCommand=cmd(sleep,0.716;cropbottom,1);
	};

};