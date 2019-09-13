local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
t[#t+1] = StandardDecorationFromFileOptional("SortDisplay","SortDisplay")
t[#t+1] = LoadActor("BannerHandler.lua");
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("diff/default.lua");
	t[#t+1] = LoadActor("modicons/default.lua")..{
		InitCommand=cmd(draworder,100);
	};
end;

t[#t+1] = StandardDecorationFromFileOptional("GrooveRadar","GrooveRadar")

-- other items (balloons, etc.)

t[#t+1] = StandardDecorationFromFile( "Balloon", "Balloon" );

t[#t+1] = LoadActor("GrooveRadar base")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-168;y,SCREEN_CENTER_Y+90;);
	OnCommand=cmd(zoom,0;rotationz,-360;sleep,0.3;decelerate,0.4;rotationz,0;zoom,1);
	OffCommand=cmd(sleep,0.4;accelerate,0.383;zoom,0;rotationz,-360);
	BeginCommand=function(self,param)
		if GAMESTATE:IsCourseMode() == true then
			self:visible(false)
		end
	end;
}

local GRPos = {
	{-3,-90},
	{-104,-31},
	{-99,47},
	{98,47},
	{107,-31},
}

for i,v in ipairs(GRPos) do
	t[#t+1] = Def.Sprite{
		Texture=THEME:GetPathG("GrooveRadar","labels"),
		OnCommand=function(s)
			s:animate(0):setstate(i-1)
			:xy(SCREEN_CENTER_X-168+v[1],SCREEN_CENTER_Y+92+v[2])
			:diffusealpha(0):addx(-10):sleep(0.1+i/10):linear(0.1):diffusealpha(1):addx(10)
		end;
		OffCommand=function(s)
			s:sleep(i/10):linear(0.1):diffusealpha(0):addx(-10)
		end;
	}
end

t[#t+1] = Def.Sprite {
Texture="help 1x3.png",
	InitCommand=function(self)
		self:draworder(100):CenterX():y(SCREEN_BOTTOM-35)
		self:SetAllStateDelays(4.224)
	end,
	OnCommand=function(self)
		self:shadowlength(0):addy(999):sleep(0.6):addy(-999):diffuseblink():effectperiod(1.056)
	end,
	OffCommand=function(self)
		self:addy(999)
	end
};

return t
