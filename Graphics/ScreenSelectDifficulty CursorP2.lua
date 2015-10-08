return Def.ActorFrame{
		LoadActor(THEME:GetPathG("_difficulty","cursor/_cursor P2"))..{
		InitCommand=cmd(diffusealpha,1;);
		OnCommand=cmd(draworder,3;cropleft,1;sleep,0.264;sleep,0.66;linear,0.363;cropleft,0);
		OffCommand=cmd(sleep,0.726;linear,0.363;cropright,1;cropleft,1);
	};
};