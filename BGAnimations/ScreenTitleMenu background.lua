local t = Def.ActorFrame{};

if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("","/ScreenLogo background/bg"))..{
		InitCommand=cmd(Center);
		OffCommand=cmd(sleep,0;queuecommand,"Anim");
		AnimCommand=cmd(linear,0.09;zoomx,1.4;linear,0.09;zoomx,1;queuecommand,"Anim");
	};
	LoadActor(THEME:GetPathB("","/ScreenLogo background/bg"))..{
		InitCommand=cmd(Center;diffusealpha,0.5);
		OffCommand=cmd(sleep,0.05;queuecommand,"Anim");
		AnimCommand=cmd(linear,0.09;zoomx,1.4;linear,0.09;zoomx,1;queuecommand,"Anim");
	};
	LoadActor(THEME:GetPathB("","/ScreenLogo background/bg"))..{
		InitCommand=cmd(Center;diffusealpha,0.2);
		OffCommand=cmd(sleep,0.1;queuecommand,"Anim");
		AnimCommand=cmd(linear,0.09;zoomx,1.4;linear,0.09;zoomx,1;queuecommand,"Anim");
	};
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0.625"));
		OffCommand=cmd(linear,0.1;diffusealpha,0;linear,1;diffusealpha,0.625);
	};
};
else
	t[#t+1] = Def.ActorFrame{
		LoadActor(THEME:GetPathB("","/ScreenLogo background/bg"))..{
			InitCommand=cmd(Center);
		};
		Def.Quad{
			InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0"));
			OffCommand=cmd(linear,0.1;diffusealpha,0;linear,1;diffusealpha,1);
		};
	};
end;

return t;
