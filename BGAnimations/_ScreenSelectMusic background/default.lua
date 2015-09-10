--t[#t+1] = Def.ActorFrame {
	--LoadActor( "../ScreenWithMenuElements background" )..{
	--};
--}

return Def.ActorFrame{
		LoadActor("GrooveRadar base")..{
		InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X-168;y,SCREEN_CENTER_Y+90);
		OnCommand=cmd(zoom,0;rotationz,-360;sleep,0.3;diffusealpha,1;decelerate,0.4;rotationz,0;zoom,1);
		OffCommand=cmd(sleep,0.4;accelerate,0.383;zoom,0;rotationz,-360);
	};

};

return t