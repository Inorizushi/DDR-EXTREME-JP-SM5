return Def.ActorFrame{

	LoadActor(THEME:GetPathS("","Common back"))..{
		StartTransitioningCommand=cmd(play);
	};
	
	LoadActor("_black")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y;halign,0);
		OnCommand=cmd(zoomx,0;zoomy,15;sleep,0.04;diffuserightedge,color("1,1,1,0");linear,0.3;diffuserightedge,color("1,1,1,1");zoomx,10);
	};
	LoadActor("_black")..{
		InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y;halign,1);
		OnCommand=cmd(zoomx,0;zoomy,15;sleep,0.04;diffuseleftedge,color("1,1,1,0");linear,0.3;diffuseleftedge,color("1,1,1,1");zoomx,10);
	};
	LoadActor("_black")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;valign,0);
		OnCommand=cmd(zoomy,0;zoomx,20;sleep,0.04;diffusebottomedge,color("1,1,1,0");linear,0.3;diffusebottomedge,color("1,1,1,1");zoomy,7.5);
	};
	LoadActor("_black")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;valign,1);
		OnCommand=cmd(zoomy,0;zoomx,20;sleep,0.04;diffusetopedge,color("1,1,1,0");linear,0.3;diffusetopedge,color("1,1,1,1");zoomy,7.5);
	};
};