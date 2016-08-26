return Def.ActorFrame{
	LoadActor("_picture")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y-14);
		OnCommand=cmd(draworder,20;cropleft,1;sleep,0.264;sleep,0.132;cropleft,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropleft,0.936;linear,0.396;cropleft,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropleft,0.936;sleep,0.016;linear,0.267;cropbottom,1);
	};
};