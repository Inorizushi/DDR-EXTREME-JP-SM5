--Base Anchoring
return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP):valign(0):setsize(SCREEN_WIDTH,68):diffuse(color("#fef4a5"))
		end;
	};
    LoadActor("ScreenWithMenuElements header/optionsserv")..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT+263):y(SCREEN_TOP+21);
		end;
    OnCommand=cmd(addx,526;cropright,1;sleep,0.65;linear,0.4;addx,-526;cropright,0);
    OffCommand=cmd(sleep,0.05;linear,0.4;addx,526;cropright,1)
	}
}
