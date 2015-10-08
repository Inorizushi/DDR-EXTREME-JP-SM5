local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	LoadActor("1") .. {
			OnCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
	};
    LoadActor("2") .. {
			OnCommand=cmd(diffusealpha,0;sleep,6;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
	};
	LoadActor("3") .. {
			OnCommand=cmd(diffusealpha,0;sleep,12;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
	};
        	
};

return t


	



