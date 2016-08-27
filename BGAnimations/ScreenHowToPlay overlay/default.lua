-- ScreenHowToPlay Overlay

local t = Def.ActorFrame{
	LoadActor("lifeframe")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+29);
		OnCommand=cmd(draworder,99);
	};
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,70;valign,1;CenterX;y,SCREEN_BOTTOM+10;diffuse,Color("Black"));
	};
	LoadActor("scoreframe")..{
		InitCommand=cmd(halign,1;x,SCREEN_RIGHT;valign,1;y,SCREEN_BOTTOM+10);
	};
	LoadActor("howtoplay.png")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(cropbottom,0;sleep,1.533;linear,0.233;addy,64;cropbottom,1);
	};
	LoadActor("howtoplay_jp")..{
		Name="HowToPlayBig";
		InitCommand=cmd(Center);
		OnCommand=cmd(addy,-64;croptop,1;sleep,1.7;linear,0.233;addy,64;croptop,0;sleep,1.267;linear,0.233;addy,-64;croptop,1);
	};

	-- let the messages begin
	Def.ActorFrame {
		LoadActor("text_up")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+146;y,SCREEN_CENTER_Y+47);
			ShowCommand=cmd(zoomy,0;sleep,5.8;decelerate,0.3;zoomy,1;sleep,2;zoomy,0);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("text_jump")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+146;y,SCREEN_CENTER_Y+47);
			ShowCommand=cmd(zoomy,0;sleep,12.166;decelerate,0.3;zoomy,1;sleep,2;zoomy,0);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y+2);
			ShowCommand=cmd(rotationz,-90;addy,999;sleep,4;addy,-999;accelerate,0.266;addx,-80;sleep,0.8;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+122;y,SCREEN_CENTER_Y+84);
			ShowCommand=cmd(rotationz,-90;addy,999;sleep,10.433;addy,-999;accelerate,0.266;addx,-80;sleep,0.8;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("pinkhand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+240;y,SCREEN_CENTER_Y-34);
			ShowCommand=cmd(addy,999;sleep,5.5;addy,-999;linear,0.067;addy,-36;sleep,2.366;linear,0.167;addy,44;sleep,0;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+246;y,SCREEN_CENTER_Y-34);
			ShowCommand=cmd(addy,999;sleep,11.933;addy,-999;linear,0.067;addy,-36;sleep,2.366;linear,0.167;addy,44;sleep,0;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+108;y,SCREEN_CENTER_Y-34);
			ShowCommand=cmd(zoomx,-1;addy,999;sleep,11.933;addy,-999;linear,0.067;addy,-36;sleep,2.366;linear,0.167;addy,44;sleep,0;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("greenhand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+174;y,SCREEN_CENTER_Y-28);
			ShowCommand=cmd(diffusealpha,0;sleep,17.366;diffusealpha,1;linear,0.198;y,SCREEN_CENTER_Y-120;bob;effectperiod,0.5;effectmagnitude,0,15,0);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("text_gameover")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+146;y,SCREEN_CENTER_Y+47);
			ShowCommand=cmd(zoomy,0;sleep,18.666;decelerate,0.3;zoomy,1);
			OnCommand=cmd(queuecommand,"Show");
		};

	};
};
--6 Right to Left Stars
t[#t+1] = Def.ActorFrame{
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_TOP+48;);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_TOP+112;);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_TOP+176;);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_TOP+240;);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_TOP+304;);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-384;y,SCREEN_TOP+368;);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-448;y,SCREEN_TOP+432;);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
};

--6 RightToLeft leading bars
t[#t+1] = Def.ActorFrame{
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-64;y,SCREEN_TOP+48;addx,64;halign,0;zoomtowidth,1216);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-128;y,SCREEN_TOP+112;addx,64;halign,0;zoomtowidth,1216);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-192;y,SCREEN_TOP+176;addx,64;halign,0;zoomtowidth,1216);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-256;y,SCREEN_TOP+240;addx,64;halign,0;zoomtowidth,1216);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-320;y,SCREEN_TOP+304;addx,64;halign,0;zoomtowidth,1216);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-384;y,SCREEN_TOP+368;addx,64;halign,0;zoomtowidth,1216);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-448;y,SCREEN_TOP+432;addx,64;halign,0;zoomtowidth,1216);
		OnCommand=cmd(linear,1.254;addx,1216);
	};
};

--6 LeftToRight wiping stars
t[#t+1] = Def.ActorFrame{
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_TOP+16;);
		OnCommand=cmd(addx,1216;linear,1.256;addx,-1216);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_TOP+80;);
		OnCommand=cmd(addx,1216;linear,1.256;addx,-1216);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_TOP+144;);
		OnCommand=cmd(addx,1216;linear,1.256;addx,-1216);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_TOP+208;);
		OnCommand=cmd(addx,1216;linear,1.256;addx,-1216);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_TOP+272;);
		OnCommand=cmd(addx,1216;linear,1.256;addx,-1216);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-384;y,SCREEN_TOP+336;);
		OnCommand=cmd(addx,1216;linear,1.256;addx,-1216);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-448;y,SCREEN_TOP+400;);
		OnCommand=cmd(addx,1216;linear,1.256;addx,-1216);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-512;y,SCREEN_TOP+464;);
		OnCommand=cmd(addx,1216;linear,1.256;addx,-1216);
	};
};

--6 LeftToRight leading bars (I hate this.)
t[#t+1] = Def.ActorFrame{
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-64;y,SCREEN_TOP+16;addx,1216;halign,1;addx,-64;zoomtowidth,1216;);
		OnCommand=cmd(linear,1.256;addx,-1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-128;y,SCREEN_TOP+80;addx,1216;halign,1;addx,-64;zoomtowidth,1216;);
		OnCommand=cmd(linear,1.256;addx,-1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-192;y,SCREEN_TOP+144;addx,1216;halign,1;addx,-64;zoomtowidth,1216;);
		OnCommand=cmd(linear,1.256;addx,-1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-256;y,SCREEN_TOP+208;addx,1216;halign,1;addx,-64;zoomtowidth,1216;);
		OnCommand=cmd(linear,1.256;addx,-1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-320;y,SCREEN_TOP+272;addx,1216;halign,1;addx,-64;zoomtowidth,1216;);
		OnCommand=cmd(linear,1.256;addx,-1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-384;y,SCREEN_TOP+336;addx,1216;halign,1;addx,-64;zoomtowidth,1216;);
		OnCommand=cmd(linear,1.256;addx,-1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-448;y,SCREEN_TOP+400;addx,1216;halign,1;addx,-64;zoomtowidth,1216;);
		OnCommand=cmd(linear,1.256;addx,-1216);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-512;y,SCREEN_TOP+464;addx,1216;halign,1;addx,-64;zoomtowidth,1216;);
		OnCommand=cmd(linear,1.256;addx,-1216);
	};
};


--Out Stars (KLJHASWJKHASDGF)
--7 LeftToRight wiping stars
t[#t+1] = Def.ActorFrame{
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_TOP+16);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_TOP+80);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_TOP+144);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_TOP+208);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_TOP+272);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_TOP+336);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_TOP+400);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../LeftToRight.png")..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_TOP+464);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
};

--7 LeftToRight trailing bars
t[#t+1] = Def.ActorFrame{
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-64;y,SCREEN_TOP+16;halign,1;addx,-64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-128;y,SCREEN_TOP+80;halign,1;addx,-64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-192;y,SCREEN_TOP+144;halign,1;addx,-64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-256;y,SCREEN_TOP+208;halign,1;addx,-64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-256;y,SCREEN_TOP+272;halign,1;addx,-64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-192;y,SCREEN_TOP+336;halign,1;addx,-64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-128;y,SCREEN_TOP+400;halign,1;addx,-64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT-64;y,SCREEN_TOP+464;halign,1;addx,-64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,960);
	};
};

-- 8 RIGHTTOLEFT WIPING MOTHERFUCKING STARS WHY ARE THERE 8 THIS TIME WHAT THE FUCK.
t[#t+1] = Def.ActorFrame{
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT+64;y,SCREEN_TOP+48;addx,640);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT+128;y,SCREEN_TOP+112;addx,640);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT+192;y,SCREEN_TOP+176;addx,640);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT+256;y,SCREEN_TOP+240;addx,640);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT+192;y,SCREEN_TOP+304;addx,640);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT+128;y,SCREEN_TOP+368;addx,640);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../RightToLeft.png")..{
		InitCommand=cmd(x,SCREEN_LEFT+64;y,SCREEN_TOP+640;addx,640);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
};

-- 8 RightToLeft leading bars
t[#t+1] = Def.ActorFrame{
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT+64;y,SCREEN_TOP+48;addx,640;halign,0;addx,64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT+128;y,SCREEN_TOP+112;addx,640;halign,0;addx,64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT+192;y,SCREEN_TOP+176;addx,640;halign,0;addx,64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT+256;y,SCREEN_TOP+240;addx,640;halign,0;addx,64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT+192;y,SCREEN_TOP+304;addx,640;halign,0;addx,64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT+128;y,SCREEN_TOP+368;addx,640;halign,0;addx,64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
	LoadActor("../_black")..{
		InitCommand=cmd(texturewrapping,1;x,SCREEN_LEFT+64;y,SCREEN_TOP+432;addx,640;halign,0;addx,64;zoomtowidth,960);
		OnCommand=cmd(sleep,22.72;linear,0.99;addx,-960);
	};
};

return t;
