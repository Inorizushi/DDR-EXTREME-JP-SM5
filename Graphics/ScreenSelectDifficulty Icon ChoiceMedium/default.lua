return Def.ActorFrame{
		LoadActor("_picture")..{
		InitCommand=cmd(x,-232;y,-170);
		OnCommand=cmd(draworder,50;cropright,0.8;sleep,0.264;sleep,0.66;linear,0.363;cropright,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		OffCommand=cmd(cropright,0;sleep,0.726;linear,0.363;cropright,1);
	};
	
};