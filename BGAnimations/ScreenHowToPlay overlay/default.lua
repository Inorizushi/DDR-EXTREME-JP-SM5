-- ScreenHowToPlay Overlay
local t = Def.ActorFrame{
	LoadActor("_howtoplay")..{
		Name="HowToPlayBig";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+15);
		OnCommand=cmd(sleep,1.485;diffusealpha,0);
	};
	LoadActor("lifeframe")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+29);
		OnCommand=cmd(draworder,99);
	};

	-- let the messages begin
	Def.ActorFrame {
	
		LoadActor("steps")..{
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-5);
			ShowCommand=cmd(addy,-62;croptop,1;diffusealpha,1;sleep,1.683;linear,0.198;addy,62;croptop,0;sleep,1.287;linear,0.198;addy,-62;croptop,1);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
		--#1ST STEP#--
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-40;y,SCREEN_CENTER_Y+10);
			ShowCommand=cmd(diffusealpha,0;sleep,3.993;diffusealpha,1;linear,0.264;addx,60;sleep,0.792;diffusealpha,0);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
		LoadActor("taphand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-109;y,SCREEN_CENTER_Y-28);
			ShowCommand=cmd(diffusealpha,0;sleep,5.874;diffusealpha,1;linear,0.066;y,168;sleep,2.12;linear,0.165;y,212;linear,0;diffusealpha,0);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
		LoadActor("tapmessage")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-145;y,SCREEN_CENTER_Y-33);
			ShowCommand=cmd(diffusealpha,0;zoomy,0;sleep,6.237;diffusealpha,1;linear,0.264;zoomy,1;sleep,1.724;diffusealpha,0);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
		--#2nd Step#--
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-94;y,SCREEN_CENTER_Y+52);
			ShowCommand=cmd(diffusealpha,0;sleep,10.535;diffusealpha,1;linear,0.264;addx,152;sleep,0.792;diffusealpha,0);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
		LoadActor("jumphands")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-175;y,SCREEN_CENTER_Y-28);
			ShowCommand=cmd(diffusealpha,0;sleep,12.416;diffusealpha,1;linear,0.066;y,168;sleep,2.12;linear,0.165;y,212;linear,0;diffusealpha,0);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
		LoadActor("jumpmessage")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-145;y,SCREEN_CENTER_Y-33);
			ShowCommand=cmd(diffusealpha,0;zoomy,0;sleep,12.779;diffusealpha,1;linear,0.264;zoomy,1;sleep,1.724;diffusealpha,0);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
		--#Misstep#--
		LoadActor("miss")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-179;y,SCREEN_CENTER_Y-28);
			ShowCommand=cmd(sleep,17.539;diffusealpha,1;linear,0.198;y,120;linear,0;bob;effectperiod,0.5;effectmagnitude,0,15,0);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
		LoadActor("messagemiss")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-145;y,SCREEN_CENTER_Y+32);
			ShowCommand=cmd(diffusealpha,0;zoomy,0;sleep,18.892;diffusealpha,1;linear,0.264;zoomy,1);
			OnCommand=cmd(diffusealpha,0;queuecommand,"Show");
		};
	};
};

return t;