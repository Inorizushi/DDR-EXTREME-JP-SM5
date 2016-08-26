return Def.ActorFrame{
	--Topframe underlay
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,66;valign,0;y,SCREEN_TOP;CenterX;diffuse,color("0,0,0,1");
	};
	--Bottomframe underlay
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,140;valign,1;y,SCREEN_BOTTOM;CenterX;diffuse,color("0,0,0,1");
	};
	LoadActor("lifeframe")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+27);
	};
	LoadActor("scoreframe")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-29);
	};
	--flashity flashing flasher
	LoadActor("gameover")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffuseblink;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,0.266);
	};
};
