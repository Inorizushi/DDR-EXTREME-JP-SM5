return Def.ActorFrame{
		LoadActor("_picture")..{
		InitCommand=cmd(x,-384;y,-170);
		OnCommand=cmd(cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		OffCommand=cmd(linear,0.396;cropright,0.936;linear,0.264;cropbottom,1);
	};
	LoadActor("bar")..{
		InitCommand=cmd(x,-226);
		OnCommand=cmd(draworder,50;cropright,1;sleep,0.264;sleep,0.66;linear,0.363;cropright,0);
		OffCommand=cmd(cropright,0;sleep,0.726;linear,0.363;cropright,1);
	};
	
};