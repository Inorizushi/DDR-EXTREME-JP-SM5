return Def.ActorFrame {
	InitCommand=cmd(sleep,40);
	LoadActor( "zerogs" )..{
		OnCommand=cmd(Center);
	};
	LoadActor( "takuya" )..{
		OnCommand=cmd(CenterX;y,SCREEN_CENTER_Y+138;addx,445;sleep,28;decelerate,0.5;addx,-445);
	};
}