local t = Def.ActorFrame{};

t[#t+1] = LoadActor("frame")..{
	InitCommand=cmd(Center);
};


return t;