return Def.ActorFrame{

	LoadActor("platforms")..{
		InitCommand=cmd(x,SCREEN_LEFT+30);
	};
};