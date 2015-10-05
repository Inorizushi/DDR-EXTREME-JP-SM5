return Def.ActorFrame {
	LoadActor("_picture")..{
		InitCommand=cmd(x,-80;y,-170);
		OnCommand=cmd(draworder,20;cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.268;cropbottom,1);
	};
	LoadActor("choices")..{
		InitCommand=cmd(draworder,99;x,76);
		OnCommand=cmd(draworder,60;cropbottom,1;sleep,0.264;sleep,0.033;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,0;linear,0.726;cropleft,0;cropright,0);
		OffCommand=cmd(cropbottom,0;cropleft,0;cropright,0;sleep,0.726;linear,0.726;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,1);
	};
	LoadActor(THEME:GetPathG("_difficulty","cursor/_OK P1"))..{
		InitCommand=cmd(draworder,99;y,-84;diffusealpha,0);
		OnCommand=cmd();
		OffCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
	};
};
