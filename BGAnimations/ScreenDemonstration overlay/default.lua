return Def.ActorFrame{
	LoadActor("lifeframe")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+27);
	};
	LoadActor("scoreframe")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-29);
	};
	LoadActor("gameover")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffuseblink;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,0.266);
	};
};