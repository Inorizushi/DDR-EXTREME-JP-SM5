return Def.ActorFrame{
	LoadActor("_message")..{
		InitCommand=cmd(pause);
		OnCommand=cmd(zoomy,0);
		ShowPressStartForOptionsCommand=cmd(linear,0.25;zoomy,1;sleep,1;);
		ShowEnteringOptionsCommand=cmd(setstate,1;);
		OffCommand=cmd(linear,0.25;zoomy,0);
	};
};