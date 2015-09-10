return Def.ActorFrame{
		LoadActor("_picture")..{
		InitCommand=cmd(x,72;y,-170);
		OnCommand=cmd(draworder,20;cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		OffCommand=cmd(sleep,0.924;linear,0.396;cropright,0.936;linear,0.264;cropbottom,1);
	};
	
};