return Def.ActorFrame{
	LoadActor("_infosub bar")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-125);
		OnCommand=cmd(diffusealpha,0;addy,125;linear,0.4;addy,-125;diffusealpha,0.8;linear,0.0;diffusealpha,0);
	};
};