return Def.ActorFrame{
	--Topframe underlay
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,49;valign,0;y,SCREEN_TOP;CenterX;diffuse,color("0,0,0,1"));
	};
	--Bottomframe underlay
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,70;valign,1;y,SCREEN_BOTTOM;CenterX;diffuse,color("0,0,0,1"));
	};
	LoadActor("demup")..{
		InitCommand=cmd(x,SCREEN_LEFT;halign,0;valign,0;y,SCREEN_TOP+15);
	};
	LoadActor("demdown")..{
		InitCommand=cmd(x,SCREEN_RIGHT;halign,1;valign,0;y,SCREEN_TOP+419);
	};
	--flashity flashing flasher
	LoadActor("gameover")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffuseblink;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,0.266);
	};
};
