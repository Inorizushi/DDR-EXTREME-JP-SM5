return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_difficulty cursor/default.lua"))..{
		InitCommand=cmd(x,76;visible,false);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
	LoadActor("choice")..{
		InitCommand=cmd(draworder,99;diffusealpha,0);
		OnCommand=cmd(draworder,60;cropleft,1;cropright,1);
		OffCommand=cmd(cropbottom,0;cropleft,0;cropright,0;sleep,0.726;linear,0.726;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,1);
		SwitchToPage1Command=cmd(linear,0.4;cropleft,1;cropright,1;sleep,0;diffusealpha,0);
		SwitchToPage2Command=cmd(diffusealpha,1;linear,0.4;cropleft,0;cropright,0);
	};
};
