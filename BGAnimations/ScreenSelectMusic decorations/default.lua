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
