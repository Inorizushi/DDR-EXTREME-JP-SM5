local outColor = color("#000000")

return Def.ActorFrame{
	LoadActor("ScreenUnlock","background")..{ 
		InitCommand=cmd(Center;);
	};
	LoadActor("1")..{ 
		InitCommand=cmd(x,SCREEN_CENTER_X-114;y,SCREEN_CENTER_Y+517);
		OnCommand=cmd(sleep,0;linear,7.567;addy,-1359;linear,4.526;addy,-240);
	};
	LoadActor("2")..{ 
		InitCommand=cmd(x,SCREEN_CENTER_X-114;y,SCREEN_CENTER_Y+1021);
		OnCommand=cmd(sleep,0;linear,7.567;addy,-1359;linear,4.526;addy,-240);
	};
	LoadActor("3")..{ 
		InitCommand=cmd(x,SCREEN_CENTER_X-114;y,SCREEN_CENTER_Y+1525);
		OnCommand=cmd(sleep,0;linear,7.567;addy,-1359;linear,4.526;addy,-240);
	};
	LoadActor("screenoverlay")..{ 
		InitCommand=cmd(Center);
	};
}