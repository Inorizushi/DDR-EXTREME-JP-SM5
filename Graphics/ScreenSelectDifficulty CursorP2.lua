return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_difficulty","cursor/_shadown P2"))..{
		InitCommand=cmd(x,10;y,10;diffusealpha,0;rotationz,340;zoom,4;);
		OnCommand=cmd(linear,0.3;diffusealpha,0.5;rotationz,0;zoom,1;);
		OffCommand=cmd(linear,0.3;zoom,0);
		ChooseCommand=cmd(sleep,0.3;linear,0.3);
	};
		LoadActor(THEME:GetPathG("_difficulty","cursor/_cursor P2"))..{
		InitCommand=cmd(diffusealpha,0;rotationz,340;zoom,4;);
		OnCommand=cmd(linear,0.3;diffusealpha,1;rotationz,0;zoom,1;glowshift;effectperiod,0.5);
		OffCommand=cmd(linear,0.3;zoom,0);
		ChooseCommand=cmd(stopeffect;sleep,0.3;linear,0.3;addx,10;addy,10);
	};
		LoadActor(THEME:GetPathG("_difficulty","cursor/_ok P2"))..{
		InitCommand=cmd(visible,false);
		OnCommand=cmd(draworder,92;diffusealpha,0;zoom,2.4);
		ChooseCommand=cmd(visible,true;linear,0;diffusealpha,1;linear,0.3;zoom,1;linear,0.3;addx,10;addy,10);
		OffCommand=cmd(linear,0.3;zoom,0);
	};
};