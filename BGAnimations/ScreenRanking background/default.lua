local t = Def.ActorFrame{}

for i=0,7 do
	t[#t+1] = Def.Sprite{
	Texture="type"..i+1,
	InitCommand=function(s)
		s:xy(SCREEN_CENTER_X+WideScale(320,520),SCREEN_TOP+45)
	end,
	OnCommand=function(s)
		s:halign(0):sleep(0.5+(6*i))
		:linear(0.233):addx(-WideScale(208,408)):decelerate(0.083)
		:zoomx(0.94):accelerate(0.083):zoomx(1)
		:decelerate(0.083):zoomx(1.05):accelerate(0.083)
		:zoomx(1):sleep(4.183):decelerate(0.1):addy(-4)
		:accelerate(0.4):addy(52)
	end,
	};
end

t[#t+1] = Def.ActorFrame{
	LoadActor("rankingwide.png")..{
		InitCommand=cmd(Center);
	};
};

return t;