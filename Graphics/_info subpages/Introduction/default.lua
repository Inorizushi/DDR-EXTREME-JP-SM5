local t = Def.ActorFrame{
	InitCommand=cmd(Center);
	LoadFont("_arial black 20px")..{
		InitCommand=cmd(x,-256;y,-95;zoom,0.75;wrapwidthpixels,672;align,0,0;diffuse,color("#EEEEEE");strokecolor,color("#222222"));
		BeginCommand=function(self)
			self:settext("Welcome to the DDR EXTREME theme for StepMania 5. This theme is based on TakuyaMAXX and Katze/beware's DDR EXTREME theme for StepMania 3.9.\n\nRight now, this theme is a work in progress; not everything works as expected.\n\nRegardless of the status of the theme, I hope you enjoy using it as much as I did making it.");
		end
	};
	LoadFont("_2070polyester square 24px")..{
		InitCommand=cmd(x,244;y,136;halign,1;diffuse,color("#00C0FF");strokecolor,color("#006088"));
		BeginCommand=function(self)
			self:settext("-Inori");
		end
	};
};

return t;