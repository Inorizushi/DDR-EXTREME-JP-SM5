local t = Def.ActorFrame{
	LoadActor("bg")..{
		InitCommand=cmd(Center);
	};
	LoadActor("../time_slash")..{
		InitCommand=cmd(x,SCREEN_RIGHT-54;y,SCREEN_TOP+26;draworder,99);
	};
}

return t