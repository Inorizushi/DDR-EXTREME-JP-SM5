local travelDist = SCREEN_WIDTH*1.7;

local LeftToRight = Def.ActorFrame{
	LoadActor("../LeftToRight_green");
	Def.Quad{
		InitCommand=cmd(addx,64;diffuse,color("#000000FF");halign,0;zoomto,travelDist,32);
	};
};

local RightToLeft = Def.ActorFrame{
	LoadActor("../RightToLeft_green");
	Def.Quad{
		InitCommand=cmd(addx,-64;diffuse,color("#000000FF");halign,1;zoomto,travelDist,32);
	};
};

return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(linear,0.4;diffusealpha,0);
	};

	-- 6 left -> right
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y-176);
		OnCommand=cmd(linear,0.4;addx,SCREEN_WIDTH*1.7);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y-112);
		OnCommand=cmd(linear,0.4;addx,SCREEN_WIDTH*1.7);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y-48);
		OnCommand=cmd(linear,0.4;addx,SCREEN_WIDTH*1.7);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_CENTER_Y+16);
		OnCommand=cmd(linear,0.4;addx,SCREEN_WIDTH*1.7);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_CENTER_Y+80);
		OnCommand=cmd(linear,0.4;addx,SCREEN_WIDTH*1.7);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-384;y,SCREEN_CENTER_Y+144);
		OnCommand=cmd(linear,0.4;addx,SCREEN_WIDTH*1.7);
	};

	-- 6 right -> left
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+64;y,SCREEN_CENTER_Y-144);
		OnCommand=cmd(linear,0.4;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+128;y,SCREEN_CENTER_Y-80);
		OnCommand=cmd(linear,0.4;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+192;y,SCREEN_CENTER_Y-16);
		OnCommand=cmd(linear,0.4;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+256;y,SCREEN_CENTER_Y+48);
		OnCommand=cmd(linear,0.4;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+320;y,SCREEN_CENTER_Y+112);
		OnCommand=cmd(linear,0.4;addx,-SCREEN_WIDTH*1.7);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+384;y,SCREEN_CENTER_Y+176);
		OnCommand=cmd(linear,0.4;addx,-SCREEN_WIDTH*1.7);
	};
};
