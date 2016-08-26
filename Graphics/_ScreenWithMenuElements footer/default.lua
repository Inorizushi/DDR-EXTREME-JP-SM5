Def.ActorFrame{
	LoadActor("_shared footer")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;draworder,99;valign,1);
	};
	LoadActor("time_slash")..{
		InitCommand=cmd(x,SCREEN_RIGHT-54;y,SCREEN_TOP+26;draworder,99);
	};
}
