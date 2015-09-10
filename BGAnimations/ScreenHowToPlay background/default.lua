-- ScreenHowToPlay background
local ar = GetScreenAspectRatio();

local t = Def.ActorFrame{
	-- bgtile
	LoadActor("bg")..{
		InitCommand=cmd(Center;FullScreen;);
		OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w*0.5,h*0.5);
			self:texcoordvelocity(-0.6,-0.6);
		end;
	};
	LoadActor("../_black")..{
	InitCommand=cmd(draworder,80;y,SCREEN_CENTER_Y-182;horizalign,left;vertalign,bottom;scaletoclipped,SCREEN_WIDTH,58);
	};
	LoadActor("../_black")..{
	InitCommand=cmd(draworder,80;y,SCREEN_BOTTOM;horizalign,left;vertalign,bottom;scaletoclipped,SCREEN_WIDTH,58);
	};
	LoadActor("machine")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-18);
	};
	LoadActor("frash")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-125);
	OnCommand=cmd(diffusealpha,0;sleep,5.705;diffusealpha,1;sleep,3.46;diffusealpha,0;sleep,3.095;diffusealpha,1;sleep,3.46;diffusealpha,0;sleep,1.7;diffusealpha,1;sleep,0.15;diffusealpha,0;sleep,1.65;diffusealpha,1;sleep,0.15;diffusealpha,0)
	};
	LoadActor("circle")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+118;y,SCREEN_CENTER_Y-10);
	OnCommand=cmd(diffusealpha,0;sleep,3.762;diffusealpha,1;zoom,1.68;sleep,0.099;linear,0.198;zoom,1;linear,0.033;zoom,1;linear,0.033;zoom,0.8;sleep,0.033;linear,0;diffusealpha,0.5;sleep,1.254;linear,0.33;zoom,0);
	};
	LoadActor("circle")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+203;y,SCREEN_CENTER_Y+52);
	OnCommand=cmd(diffusealpha,0;sleep,10.304;diffusealpha,1;zoom,1.68;sleep,0.099;linear,0.198;zoom,1;linear,0.033;zoom,1;linear,0.033;zoom,0.8;sleep,0.033;linear,0;diffusealpha,0.5;sleep,1.254;linear,0.33;zoom,0);
	};
	LoadActor("circle")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+48;y,SCREEN_CENTER_Y+52);
	OnCommand=cmd(diffusealpha,0;sleep,10.304;diffusealpha,1;zoom,1.68;sleep,0.099;linear,0.198;zoom,1;linear,0.033;zoom,1;linear,0.033;zoom,0.8;sleep,0.033;linear,0;diffusealpha,0.5;sleep,1.254;linear,0.33;zoom,0);
	};
};

return t;