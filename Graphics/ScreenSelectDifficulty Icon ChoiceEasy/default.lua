return Def.ActorFrame{
	LoadActor("_picture")..{
		InitCommand=cmd(x,-80;y,-170);
		OnCommand=cmd(draworder,50;cropright,1;sleep,0.264;sleep,0.66;linear,0.363;cropright,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		OffCommand=cmd(cropright,0;sleep,0.726;linear,0.363;cropright,1);
	};
	LoadActor("choices")..{
		InitCommand=cmd(draworder,99;x,76);
		OnCommand=cmd(draworder,60;cropbottom,1;sleep,0.264;sleep,0.033;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,0;linear,0.726;cropleft,0;cropright,0);
		OffCommand=cmd(cropbottom,0;cropleft,0;cropright,0;sleep,0.726;linear,0.726;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,1);
	};
	
};