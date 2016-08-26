-- ScreenHowToPlay Overlay

local t = Def.ActorFrame{
	LoadActor("lifeframe")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+29);
		OnCommand=cmd(draworder,99);
	};
	LoadActor("scoreframe")..{
	InitCommand=cmd(draworder,80;CenterX;y,SCREEN_BOTTOM-33);
	};
	LoadActor("howtoplay")..{
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
			InitCommand=cmd(x,SCREEN_CENTER_X+174;y,SCREEN_CENTER_Y-34);
			ShowCommand=cmd(diffusealpha,0;sleep,17.366;diffusealpha,1;linear,0.2;addy,-92;addy,-16;effectperiod,0.133);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("text_gameover")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+146;y,SCREEN_CENTER_Y+47);
			ShowCommand=cmd(zoomy,0;sleep,18.666;decelerate,0.3;zoomy,1);
			OnCommand=cmd(queuecommand,"Show");
		};

	};
};

return t;