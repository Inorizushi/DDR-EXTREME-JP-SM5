local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad{
			OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("1,1,1,1"));
	};
	LoadActor("1") .. {
			OnCommand=cmd(diffusealpha,1;sleep,5.5;linear,0.3;diffusealpha,0);
	};
    LoadActor("2") .. {
			OnCommand=cmd(diffusealpha,0;sleep,5.8;linear,0.3;diffusealpha,1;sleep,5.3;linear,0.3;diffusealpha,0);
	};
	LoadActor("3") .. {
			OnCommand=cmd(diffusealpha,0;sleep,11.7;linear,0.3;diffusealpha,1;sleep,5.9);
	};
        	
};

return t


	



