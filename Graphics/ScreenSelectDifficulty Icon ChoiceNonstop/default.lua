return Def.ActorFrame {
  LoadActor("bar")..{
		OnCommand=cmd(cropleft,1;cropright,1);
		OffCommand=cmd(cropbottom,0;cropleft,0;cropright,0;sleep,0.726;linear,0.726;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,1);
		SwitchToPage1Command=cmd(linear,0.3;cropleft,1;cropright,1);
		SwitchToPage2Command=cmd(linear,0.3;cropleft,0;cropright,0);
	};
  LoadActor(THEME:GetPathG("","_difficulty cursor/default.lua"))..{
		InitCommand=cmd(x,-76;visible,false);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
    SwitchToPage1Command=cmd(visible,false);
		SwitchToPage2Command=cmd(visible,true);
	};
};
