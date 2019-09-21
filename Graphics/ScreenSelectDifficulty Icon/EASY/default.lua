return Def.ActorFrame {
	LoadActor("choices")..{
		InitCommand=cmd(draworder,99);
		OnCommand=cmd(draworder,60;cropbottom,1;sleep,0.264;sleep,0.033;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,0;linear,0.726;cropleft,0;cropright,0);
		OffCommand=cmd(cropbottom,0;cropleft,0;cropright,0;sleep,0.726;linear,0.726;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,1);
		SwitchToPage1Command=cmd(diffusealpha,1;linear,0.4;cropleft,0;cropright,0);
		SwitchToPage2Command=cmd(linear,0.4;cropleft,1;cropright,1;sleep,0;diffusealpha,0);
	};
};
