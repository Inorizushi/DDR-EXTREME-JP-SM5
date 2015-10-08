-- single
return Def.ActorFrame{
	LoadActor("_item")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+67;y,SCREEN_CENTER_Y-117;draworder,99);
		OnCommand=cmd(croptop,1;sleep,0.66;linear,0.198;croptop,0;decelerate,0.099;addy,-6;sleep,0;accelerate,0.099;addy,6);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(stopeffect);
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		DisabledCommand=cmd(diffuse,color("1,1,1,1"));
		OffCommand=cmd(decelerate,0.099;addy,-6;sleep,0;accelerate,0.099;addy,6;croptop,0;linear,0.198;croptop,1);
	};
	LoadActor("../_Style highlight")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+67;y,SCREEN_CENTER_Y-117;draworder,99);
		OnCommand=cmd(croptop,1;sleep,0.66;linear,0.198;croptop,0;decelerate,0.099;addy,-6;sleep,0;accelerate,0.099;addy,6);
		GainFocusCommand=cmd(visible,true;diffusealpha,0.8;diffuseshift;blend,Blend.Add;;diffuseblink;effectperiod,0.25);
		LoseFocusCommand=cmd(visible,false);
		OffCommand=cmd(visible,false);
	};
};