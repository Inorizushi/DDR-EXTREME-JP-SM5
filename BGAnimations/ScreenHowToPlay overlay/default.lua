-- ScreenHowToPlay Overlay

local t = Def.ActorFrame{
	LoadActor("lifeframe")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+29);
		OnCommand=cmd(draworder,99);
	};
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,90;valign,1;CenterX;y,SCREEN_BOTTOM+10;diffuse,Color("Black"));
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
local travelDist = SCREEN_WIDTH*1.7;

local LeftToRightIn = Def.ActorFrame{
	LoadActor("../LeftToRight_green")..{
		InitCommand=cmd(blend,Blend.Add);
	};
	Def.Quad{
		InitCommand=cmd(addx,64;diffuse,color("#000000FF");halign,0;zoomto,travelDist,32);
	};
};

local RightToLeftIn = Def.ActorFrame{
	LoadActor("../RightToLeft_green")..{
		InitCommand=cmd(blend,Blend.Add);
	};
	Def.Quad{
		InitCommand=cmd(addx,-64;diffuse,color("#000000FF");halign,1;zoomto,travelDist,32);
	};
};

local LeftToRightOut = Def.ActorFrame{
	LoadActor("../LeftToRight_green")..{
		InitCommand=cmd(blend,Blend.Add);
	};
	Def.Quad{
		InitCommand=cmd(addx,64;diffuse,color("#000000FF");halign,0;zoomto,-travelDist,32);
	};
};

local RightToLeftOut = Def.ActorFrame{
	LoadActor("../RightToLeft_green")..{
		InitCommand=cmd(blend,Blend.Add);
	};
	Def.Quad{
		InitCommand=cmd(addx,-64;diffuse,color("#000000FF");halign,1;zoomto,-travelDist,32);
	};
};
--Stars in animation

--Stars in left to right
t[#t+1] = Def.ActorFrame{
	LeftToRightIn..{
		InitCommand=cmd(xy,SCREEN_LEFT-63,48);
		OnCommand=cmd(linear,2;addx,1920);
	};
	LeftToRightIn..{
		InitCommand=cmd(xy,SCREEN_LEFT-63,112);
		OnCommand=cmd(addx,-80;linear,2;addx,1920);
	};
	LeftToRightIn..{
		InitCommand=cmd(xy,SCREEN_LEFT-63,176);
		OnCommand=cmd(addx,-160;linear,2;addx,1920);
	};
	LeftToRightIn..{
		InitCommand=cmd(xy,SCREEN_LEFT-63,240);
		OnCommand=cmd(addx,-240;linear,2;addx,1920);
	};
	LeftToRightIn..{
		InitCommand=cmd(xy,SCREEN_LEFT-63,304);
		OnCommand=cmd(addx,-320;linear,2;addx,1920);
	};
	LeftToRightIn..{
		InitCommand=cmd(xy,SCREEN_LEFT-63,368);
		OnCommand=cmd(addx,-480;linear,2;addx,1920);
	};
};

--Stars in left to right
t[#t+1] = Def.ActorFrame{
	RightToLeftIn..{
		InitCommand=cmd(xy,SCREEN_RIGHT+63,16);
		OnCommand=cmd(addx,560;linear,2;addx,-1920);
	};
	RightToLeftIn..{
		InitCommand=cmd(xy,SCREEN_RIGHT+63,80);
		OnCommand=cmd(addx,480;linear,2;addx,-1920);
	};
	RightToLeftIn..{
		InitCommand=cmd(xy,SCREEN_RIGHT+63,144);
		OnCommand=cmd(addx,400;linear,2;addx,-1920);
	};
	RightToLeftIn..{
		InitCommand=cmd(xy,SCREEN_RIGHT+63,208);
		OnCommand=cmd(addx,320;linear,2;addx,-1920);
	};
	RightToLeftIn..{
		InitCommand=cmd(xy,SCREEN_RIGHT+63,272);
		OnCommand=cmd(addx,240;linear,2;addx,-1920);
	};
	RightToLeftIn..{
		InitCommand=cmd(xy,SCREEN_RIGHT+63,336);
		OnCommand=cmd(addx,160;linear,2;addx,-1920);
	};
	RightToLeftIn..{
		InitCommand=cmd(xy,SCREEN_RIGHT+63,400);
		OnCommand=cmd(addx,80;linear,2;addx,-1920);
	};
	RightToLeftIn..{
		InitCommand=cmd(xy,SCREEN_RIGHT+63,464);
		OnCommand=cmd(addx,0;linear,2;addx,-1920);
	};
};

--Stars out animation

--stars out right to left
t[#t+1] = Def.ActorFrame{
	RightToLeftOut..{
		InitCommand=cmd(xy,SCREEN_RIGHT+65,48);
		OnCommand=cmd(addx,0;sleep,22.566;linear,1.368;addx,-1280);
	};
	RightToLeftOut..{
		InitCommand=cmd(xy,SCREEN_RIGHT+65,112);
		OnCommand=cmd(addx,80;sleep,22.566;linear,1.368;addx,-1280);
	};
	RightToLeftOut..{
		InitCommand=cmd(xy,SCREEN_RIGHT+65,176);
		OnCommand=cmd(addx,160;sleep,22.566;linear,1.368;addx,-1280);
	};
	RightToLeftOut..{
		InitCommand=cmd(xy,SCREEN_RIGHT+65,240);
		OnCommand=cmd(addx,240;sleep,22.566;linear,1.368;addx,-1280);
	};
	RightToLeftOut..{
		InitCommand=cmd(xy,SCREEN_RIGHT+65,304);
		OnCommand=cmd(addx,160;sleep,22.566;linear,1.368;addx,-1280);
	};
	RightToLeftOut..{
		InitCommand=cmd(xy,SCREEN_RIGHT+65,368);
		OnCommand=cmd(addx,80;sleep,22.566;linear,1.368;addx,-1280);
	};
	RightToLeftOut..{
		InitCommand=cmd(xy,SCREEN_RIGHT+65,432);
		OnCommand=cmd(addx,0;sleep,22.566;linear,1.368;addx,-1280);
	};
};

--stars out left to right
t[#t+1] = Def.ActorFrame{
	LeftToRightOut..{
		InitCommand=cmd(xy,SCREEN_LEFT-65,16);
		OnCommand=cmd(addx,0;sleep,22.566;linear,1.368;addx,1280);
	};
	LeftToRightOut..{
		InitCommand=cmd(xy,SCREEN_LEFT-65,80);
		OnCommand=cmd(addx,-80;sleep,22.566;linear,1.368;addx,1280);
	};
	LeftToRightOut..{
		InitCommand=cmd(xy,SCREEN_LEFT-65,144);
		OnCommand=cmd(addx,-160;sleep,22.566;linear,1.368;addx,1280);
	};
	LeftToRightOut..{
		InitCommand=cmd(xy,SCREEN_LEFT-65,208);
		OnCommand=cmd(addx,-240;sleep,22.566;linear,1.368;addx,1280);
	};
	LeftToRightOut..{
		InitCommand=cmd(xy,SCREEN_LEFT-65,272);
		OnCommand=cmd(addx,-240;sleep,22.566;linear,1.368;addx,1280);
	};
	LeftToRightOut..{
		InitCommand=cmd(xy,SCREEN_LEFT-65,336);
		OnCommand=cmd(addx,-160;sleep,22.566;linear,1.368;addx,1280);
	};
	LeftToRightOut..{
		InitCommand=cmd(xy,SCREEN_LEFT-65,400);
		OnCommand=cmd(addx,-80;sleep,22.566;linear,1.368;addx,1280);
	};
	LeftToRightOut..{
		InitCommand=cmd(xy,SCREEN_LEFT-65,464);
		OnCommand=cmd(addx,0;sleep,22.566;linear,1.368;addx,1280);
	};
}

return t;
