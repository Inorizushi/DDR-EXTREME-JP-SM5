return Def.ActorFrame{
	LoadActor("_picture")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		OnCommand=cmd(draworder,20;cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.268;cropbottom,1);
	};
};
