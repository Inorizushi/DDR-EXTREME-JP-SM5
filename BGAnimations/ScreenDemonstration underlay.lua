return Def.ActorFrame{
	--Topframe underlay
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Color.Black):sleep(0.2):linear(0.4):diffusealpha(0) end
	};
};
