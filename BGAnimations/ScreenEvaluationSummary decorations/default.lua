local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");

t[#t+1] = LoadActor("../_shared header")..{ 
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=cmd(draworder,0);
}
t[#t+1] =  Def.ActorFrame {
	InitCommand=cmd(sleep,1.18);

	LoadActor( "h0" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-215);
	};

	LoadActor( "h1" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+104;y,SCREEN_CENTER_Y-215;horizalign,left;sleep,0.264;accelerate,0.2;x,SCREEN_CENTER_X-310;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
		OffCommand=cmd(x,SCREEN_CENTER_X-310;y,SCREEN_CENTER_Y-215;horizalign,left;sleep,0.396;sleep,0.02;accelerate,0.2;x,SCREEN_CENTER_X+104;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
	};

	LoadActor( "h1" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+128;y,SCREEN_CENTER_Y-215;horizalign,left;sleep,0.264;sleep,0.02;accelerate,0.2;x,SCREEN_CENTER_X-286;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
		OffCommand=cmd(x,SCREEN_CENTER_X-286;y,SCREEN_CENTER_Y-215;horizalign,left;sleep,0.396;sleep,0.01;accelerate,0.2;x,SCREEN_CENTER_X+128;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
	};

	LoadActor( "h1" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+152;y,SCREEN_CENTER_Y-215;horizalign,left);
		OffCommand=cmd(x,SCREEN_CENTER_X+152;y,SCREEN_CENTER_Y-215;horizalign,left;sleep,0.396;sleep,0.2;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
	};

	LoadActor( "h2" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-215;horizalign,left;cropright,1;sleep,0.264;sleep,0.04;accelerate,0.2;x,SCREEN_CENTER_X-262;cropright,0);
		OffCommand=cmd(x,SCREEN_CENTER_X-262;y,SCREEN_CENTER_Y-215;horizalign,left;cropright,0;sleep,0.396;accelerate,0.2;x,SCREEN_CENTER_X+160;cropright,1);
	};

	LoadActor( "h1" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+176;y,SCREEN_CENTER_Y-215;horizalign,left);
		OffCommand=cmd(x,SCREEN_CENTER_X+176;y,SCREEN_CENTER_Y-215;horizalign,left);
	};

	LoadActor( "hs" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-215;horizalign,left;cropright,1;sleep,0.264;sleep,0.04;accelerate,0.2;x,SCREEN_CENTER_X-262;cropright,0;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5);
		OffCommand=cmd(x,SCREEN_CENTER_X-262;y,SCREEN_CENTER_Y-215;horizalign,left;cropright,0;sleep,0.396;accelerate,0.2;x,SCREEN_CENTER_X+160;cropright,1);
	};
}
t[#t+1] = LoadActor("help")..{ 
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-33.5;);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}
return t