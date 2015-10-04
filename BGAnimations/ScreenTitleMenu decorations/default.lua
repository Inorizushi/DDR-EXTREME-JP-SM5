local t = LoadFallbackB()

t[#t+1] = StandardDecorationFromFile("Songs","Songs")
t[#t+1] = StandardDecorationFromFile("Version","Version")
t[#t+1] = StandardDecorationFromFile("Warning","Warning")

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(sleep,1.22);
	
	LoadActor("logo")..{
		OnCommand=cmd(Center;diffuse,color("0.5,0.5,0.5,1"));
	};
	
}

return t