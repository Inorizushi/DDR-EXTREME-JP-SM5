-- ScreenHowToPlay background
local ar = GetScreenAspectRatio();

local t = Def.ActorFrame{
	-- bgtile
	LoadActor("bgtile")..{
		InitCommand=cmd(Center;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_HEIGHT);
		OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w*0.5,h*0.5);
			self:texcoordvelocity(0.6,-0.6);
		end;
	};
	LoadActor("machine")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-4);
	};
	LoadActor("lights")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-117);
		OnCommand=cmd(addy,999;sleep,5.533;addy,-999;sleep,3.367;addy,999;sleep,3.066;addy,-999;sleep,3.4;addy,999;sleep,2.033;addy,-999;sleep,0.2;addy,999;sleep,1.3;addy,-999;sleep,0.2;addy,999);
	};
	LoadActor("stepcircle")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-116;y,SCREEN_CENTER_Y-6);
		OnCommand=cmd(zoom,0;sleep,3.766;zoom,1;linear,0.366;zoom,0.7;sleep,0;zoom,0);
	};
	LoadActor("stepcircle")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-116;y,SCREEN_CENTER_Y-6);
		OnCommand=cmd(blend,Blend.Add;;zoom,0;sleep,3.766;sleep,0.366;zoom,0.7;sleep,1.033;linear,0.4;zoom,0;diffusealpha,0);
	};
	LoadActor("stepcircle")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-46;y,SCREEN_CENTER_Y+54);
		OnCommand=cmd(zoom,0;sleep,10.2;zoom,1;linear,0.366;zoom,0.7;sleep,0;zoom,0);
	};
	LoadActor("stepcircle")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-46;y,SCREEN_CENTER_Y+54);
		OnCommand=cmd(blend,Blend.Add;;zoom,0;sleep,10.2;sleep,0.366;zoom,0.7;sleep,1.033;linear,0.4;zoom,0;diffusealpha,0);
	};
	LoadActor("stepcircle")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-202;y,SCREEN_CENTER_Y+54);
		OnCommand=cmd(zoom,0;sleep,10.2;zoom,1;linear,0.366;zoom,0.7;sleep,0;zoom,0);
	};
	LoadActor("stepcircle")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-202;y,SCREEN_CENTER_Y+54);
		OnCommand=cmd(blend,Blend.Add;;zoom,0;sleep,10.2;sleep,0.366;zoom,0.7;sleep,1.033;linear,0.4;zoom,0;diffusealpha,0);
	};
}
return t;
