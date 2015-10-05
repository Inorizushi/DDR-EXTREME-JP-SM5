return Def.ActorFrame{
		LoadActor("_picture")..{
		InitCommand=cmd(x,-232;y,-170);
		OnCommand=cmd(draworder,50;cropright,0.8;sleep,0.264;sleep,0.66;linear,0.363;cropright,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.268;cropbottom,1);
	};
	
};