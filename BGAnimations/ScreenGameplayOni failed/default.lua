local t = Def.ActorFrame{
	LoadActor("../failed")..{
		StartTransitioningCommand=cmd(play);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+25;zoomto,SCREEN_WIDTH,50);
		OnCommand=cmd(croptop,1;linear,0.8;croptop,0);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-39;zoomto,SCREEN_WIDTH,78);
		OnCommand=cmd(cropbottom,1;linear,0.8;cropbottom,0);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+25;zoomto,SCREEN_WIDTH,50);
		OnCommand=cmd(diffusealpha,0;linear,0.8;diffusealpha,1);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-39;zoomto,SCREEN_WIDTH,78);
		OnCommand=cmd(diffusealpha,0;linear,0.8;diffusealpha,1);
	};
	LoadActor("../door1")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-160;CenterY;zoomto,320,480);
		OnCommand=cmd(addx,-320;linear,0.333;addx,320;linear,0.016;addx,-4;linear,0.016;addx,4;linear,0.016;addx,-4;linear,0.016;addx,4;linear,0.016;addx,-4;linear,0.016;addx,4;linear,0.016;addx,-2;linear,0.016;addx,2);
	};
	LoadActor("../door2")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;CenterY;zoomto,320,480);
		OnCommand=cmd(addx,320;linear,0.333;addx,-320;linear,0.016;addx,4;linear,0.016;addx,-4;linear,0.016;addx,4;linear,0.016;addx,-4;linear,0.016;addx,4;linear,0.016;addx,-4;linear,0.016;addx,2;linear,0.016;addx,-2);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,0;sleep,3;linear,0.3;diffusealpha,1);
	};
};

return t