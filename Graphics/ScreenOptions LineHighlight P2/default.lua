local t = ...;
t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,38;diffuse,color("#b87000"));
	};
	LoadActor("badge")..{
		InitCommand=function(s) s:x((SCREEN_WIDTH/2)):halign(1) end
	};
};
return t;
