local t = Def.ActorFrame{
    LoadActor("base")..{
        InitCommand=cmd(Center;diffusealpha,0)
    };
    LoadActor("BannerHandler.lua"),
}
t[#t+1] = StandardDecorationFromFileOptional("Header","Header");
t[#t+1] = StandardDecorationFromFileOptional("Footer","Footer");
t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");

t[#t+1] = StandardDecorationFromFile("CourseContentsList","CourseContentsList")

local numwh = THEME:GetMetric("MusicWheel","NumWheelItems")+2
t[#t+1] = Def.Actor{
	OnCommand=function(s)
		if SCREENMAN:GetTopScreen() then
			local wheel = SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetChild("MusicWheelItem")
			for i=1,numwh do
				local inv = numwh-math.round( (i-numwh/2) )+1
				wheel[i]:addx(500)
				:sleep( (i < numwh/2) and i/20 or inv/20 )
				:decelerate(0.5):addx(-500)
			end
		end
	end;
	OffCommand=function(s)
		if SCREENMAN:GetTopScreen() then
			local wheel = SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetChild("MusicWheelItem")
			for i=1,numwh do
				local inv = numwh-math.round( (i-numwh/2) )+1
				wheel[i]:sleep( (i < numwh/2) and i/20 or inv/20 )
				:accelerate(0.5):addx(500):sleep(1)
			end
		end
	end;
}

return t;