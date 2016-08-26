local t = LoadFallbackB()

-- Explanation
--t[#t+1] = StandardDecorationFromFile("Explanation","Explanation")

-- Warning
t[#t+1] = StandardDecorationFromFile("Warning","Warning")
t[#t+1] = StandardDecorationFromFile("Explanation","Explanation")

t[#t+1] = LoadActor("help")..{ 
	InitCommand=cmd(x,SCREEN_CENTER_X-165;y,SCREEN_BOTTOM-33.5;);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(sleep,1.22);
	
}

return t