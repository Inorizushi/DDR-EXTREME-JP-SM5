return Def.ActorFrame {
	InitCommand=cmd(sleep,40);
	LoadActor( "bg" )..{
		OnCommand=cmd(Center);
	};
	LoadActor( "1" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-174;y,SCREEN_CENTER_Y-85;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.4,0.4,0.4,1;effectperiod,0.528);
	};
	LoadActor( "2" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+230;y,SCREEN_CENTER_Y-158;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.4,0.4,0.4,1;effectperiod,0.528);
	};
	LoadActor( "3" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+101;y,SCREEN_CENTER_Y+47;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.4,0.4,0.4,1;effectperiod,0.528);
	};
}