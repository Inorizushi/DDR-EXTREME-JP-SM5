local t = ...;
t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,38;diffuse,color("#b87000"));
	};
	LoadActor("badge")..{
		InitCommand=cmd(x,(SCREEN_WIDTH/2)+35);
	};
};
return t;
