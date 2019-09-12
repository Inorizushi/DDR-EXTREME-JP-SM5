return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		OnCommand=cmd(play);
		OffCommand=cmd(play);
	};
	LoadActor("../_moveon")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-10);
	};
	Def.Sprite{
		Texture=THEME:GetPathG("_instructions", "normal.png");
		InitCommand=cmd(xy,-640/2,SCREEN_CENTER_Y);
		OnCommand=cmd(decelerate,.5;x,SCREEN_CENTER_X);
		OffCommand=cmd(accelerate,.5;x,SCREEN_WIDTH+640/2);
	};

};
