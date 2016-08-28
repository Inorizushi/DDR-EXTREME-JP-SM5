local t = LoadFallbackB()

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_TOP+58;draworder,100);
	LoadActor("explanation")..{
		InitCommand=cmd(x,SCREEN_LEFT+164);
		OnCommand=cmd(draworder,99;diffusealpha,0;sleep,0.264;diffusealpha,1);
	};
	Def.Quad{
		InitCommand=cmd(x,SCREEN_LEFT+420;setsize,288,24;diffuse,color("#8cbd00"));
		OnCommand=cmd(addx,-256;sleep,0.264;sleep,0.198;linear,0.198;addx,256);
		OffCommand=cmd(sleep,0.396;linear,0.198;addx,-256);
	};
	LoadActor("arrow")..{
		InitCommand=cmd(x,SCREEN_LEFT+292);
		OnCommand=cmd(addx,-256;diffusealpha,0;sleep,0.264;diffusealpha,1;sleep,0.198;linear,0.198;addx,256);
		OffCommand=cmd(sleep,0.396;linear,0.198;addx,-256;sleep,0.198;diffusealpha,0);
	};
};

t[#t+1] = LoadActor(THEME:GetPathG("","ScreenSelectStyle Warning.png"))..{
	InitCommand=cmd(x,SCREEN_CENTER_X+154;y,SCREEN_CENTER_Y+94;valign,0);
	OnCommand=cmd(croptop,1;sleep,0.264;addy,-90;sleep,0.183;croptop,0;decelerate,0.166;addy,90;linear,0.033;zoomy,0.953;addy,-1;sleep,0.016;linear,0.066;zoomy,1.031;addy,2;sleep,0.016;linear,0.033;zoomy,1;addy,-1;queuecommand,"Flash");
	FlashCommand=cmd(sleep,0.279;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.4,0.4,0.4,1;effectperiod,0.25);
	OffCommand=cmd(stopeffect;sleep,0;accelerate,0.2;addy,-80;linear,0;diffusealpha,0);
};


t[#t+1] = LoadActor("../help")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-165;y,SCREEN_BOTTOM-33.5;);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}

return t
