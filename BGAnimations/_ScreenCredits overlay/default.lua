return Def.ActorFrame {
	InitCommand=cmd(sleep,40);
	LoadActor( "bg" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1.02);
	};
	
}