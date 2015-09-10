local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,0;sleep,30;diffuse,color("1,1,1,1"));
	};
};
t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
			OnCommand=cmd();
		};
		LoadActor("1") .. {
			OnCommand=cmd(zoomx,1.1;diffusealpha,0;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
		};
        LoadActor("2") .. {
			OnCommand=cmd(zoomx,1.1;diffusealpha,0;sleep,6;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
		};
		LoadActor("3") .. {
			OnCommand=cmd(zoomx,1.1;diffusealpha,0;sleep,12;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
		};
        	
	};
};

return t


	



