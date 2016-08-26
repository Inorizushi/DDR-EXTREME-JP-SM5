return Def.ActorFrame{
	LoadActor("centered")..{
		InitCommand=cmd(Center);
	}
}