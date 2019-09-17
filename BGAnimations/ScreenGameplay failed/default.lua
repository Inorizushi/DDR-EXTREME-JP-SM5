local travelDist = SCREEN_WIDTH*1.5;

local LeftToRight = Def.ActorFrame{
	LoadActor("../LeftToRight_purple");
	Def.Quad{
		InitCommand=cmd(halign,1;zoomto,1088,32;diffuse,color("0,0,0,1");addx,-64);
	};
};

local RightToLeft = Def.ActorFrame{
	LoadActor("../RightToLeft_purple");
	Def.Quad{
		InitCommand=cmd(halign,0;zoomto,SCREEN_WIDTH*1.9,32;diffuse,color("0,0,0,1");addx,64);
	};
};

local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,1;linear,0.3;diffusealpha,1);
	};
	
	-- 7 left -> right
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y-192);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y-128);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y-64);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y+64);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y+128);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y+192);
		OnCommand=cmd(linear,1.3;addx,travelDist);
	};

	-- 8 right -> left
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+64;y,SCREEN_CENTER_Y-224);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+128;y,SCREEN_CENTER_Y-160);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+192;y,SCREEN_CENTER_Y-96);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+256;y,SCREEN_CENTER_Y-32);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+256;y,SCREEN_CENTER_Y+32);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+192;y,SCREEN_CENTER_Y+96);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+128;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+64;y,SCREEN_CENTER_Y+224);
		OnCommand=cmd(linear,1.3;addx,-SCREEN_WIDTH*1.7);
	};
	LoadActor("failed.png")..{
		InitCommand=cmd(Center;blend,Blend.Add);
		OnCommand=cmd(zoom,3.2;diffusealpha,0;sleep,0.726;diffusealpha,0.4;sleep,0.198;linear,0.132;zoom,0.6;linear,0.033;zoom,1;sleep,0.033;diffusealpha,0);
	};
	LoadActor("failed.png")..{
		InitCommand=cmd(Center;blend,Blend.Add);
		OnCommand=cmd(zoom,3.3;diffusealpha,0;sleep,0.759;diffusealpha,0.2;sleep,0.198;linear,0.132;zoom,0.6;linear,0.033;zoom,1;sleep,0;diffusealpha,1;sleep,1.829;linear,0.333;diffusealpha,0);
	};
	LoadActor("failed.png")..{
		InitCommand=cmd(Center;blend,Blend.Add);
		OnCommand=cmd(zoom,3.1;diffusealpha,0;sleep,0.693;diffusealpha,0.6;sleep,0.198;linear,0.132;zoom,0.6;linear,0.033;zoom,1;sleep,0.066;diffusealpha,0);
	};
	LoadActor("failed.ogg")..{
		StartTransitioningCommand=cmd(play);
	};
};

return t