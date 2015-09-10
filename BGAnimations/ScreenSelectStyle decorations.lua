local t = LoadFallbackB()

-- Explanation
--t[#t+1] = StandardDecorationFromFile("Explanation","Explanation")

-- Warning
t[#t+1] = StandardDecorationFromFile("Warning","Warning")
t[#t+1] = StandardDecorationFromFile("Explanation","Explanation")

t[#t+1] = LoadActor("help")..{ 
	InitCommand=cmd(x,SCREEN_CENTER_X-165;y,SCREEN_BOTTOM-33.5;);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(sleep,1.22);
	
	LoadActor("_yellow")..{
		OnCommand=cmd(zoomx,2;x,SCREEN_CENTER_X+269;y,SCREEN_CENTER_Y-219;sleep,0.33;diffusealpha,0);
	};
	
	LoadActor("slash")..{
		OnCommand=cmd(draworder,99;x,SCREEN_RIGHT-103;y,SCREEN_CENTER_Y-220;addx,-640;sleep,0.264;linear,0.33;addx,640;linear,0;diffusealpha,1);
	};
	LoadActor("sexpbg")..{
		OnCommand=cmd(x,SCREEN_RIGHT-150;y,SCREEN_TOP+57;addx,-256;sleep,0.264;sleep,0.198;linear,0.198;addx,256);
		OffCommand=cmd(sleep,0.396;linear,0.198;addx,-256);
	};
	LoadActor("arrowsexp")..{
		OnCommand=cmd(x,SCREEN_LEFT+292;y,SCREEN_TOP+57;addx,-256;diffusealpha,0;sleep,0.264;diffusealpha,1;sleep,0.198;linear,0.198;addx,256);
		OffCommand=cmd(sleep,0.396;linear,0.198;addx,-256;sleep,0.198;diffusealpha,0);
	};
}

return t