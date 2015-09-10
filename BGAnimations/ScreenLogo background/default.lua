local outColor = color("#00326B")

return Def.ActorFrame{
	LoadActor("bg")..{ 
		InitCommand=cmd(Center;);
	};
	LoadActor("ScreenLogoDance")..{
		InitCommand=cmd(Center;glowshift;effectcolor1,color("1,1,1,0.4");effectcolor2,color("0,0,0,0");effectperiod,2;);
	};
}