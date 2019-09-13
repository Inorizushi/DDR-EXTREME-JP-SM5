-- versus
local t = Def.ActorFrame{
	GainFocusCommand=function(s) MESSAGEMAN:Broadcast("StyleVersus") end;
	LoadActor("_item")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+154;y,SCREEN_CENTER_Y-116;draworder,99);
		OnCommand=cmd(croptop,1;sleep,0.683;linear,0.217;croptop,0;decelerate,0.1;addy,-10;accelerate,0.1;addy,10);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(stopeffect);
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		DisabledCommand=cmd(diffuse,color("0.2,0.2,0.2,1"));
		OffCommand=cmd(decelerate,0.1;addy,-10;accelerate,0.1;addy,10;linear,0.217;croptop,1);
	};
	LoadActor("../_Style highlight")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+154;y,SCREEN_CENTER_Y-116;draworder,99);
		OnCommand=cmd(croptop,1;sleep,0.683;linear,0.217;croptop,0;decelerate,0.1;addy,-10;accelerate,0.1;addy,10);
		GainFocusCommand=cmd(visible,true;diffuseshift;blend,Blend.Add;;effectcolor1,color("0,0,0,1");effectcolor2,color("0.37,0.37,0.37,1");effectperiod,0.480);
		LoseFocusCommand=cmd(visible,false);
		OffCommand=cmd(visible,false);
	};
};
return t;
