return Def.ActorFrame{
	InitCommand=function(self)
	end;
	LoadActor("warning")..{
		InitCommand=cmd(Center);
	};
}
