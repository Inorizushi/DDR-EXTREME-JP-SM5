return Def.ActorFrame {
  LoadActor("bar")..{
		OnCommand=cmd(cropleft,1;cropright,1);
		OffCommand=cmd(cropbottom,0;cropleft,0;cropright,0;sleep,0.726;linear,0.726;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,1);
    SwitchToPage1Command=cmd(sleep,0.2;linear,0.5;cropleft,1;cropright,1);
		SwitchToPage2Command=cmd(sleep,0.2;linear,0.5;cropleft,0;cropright,0);
	};
};
