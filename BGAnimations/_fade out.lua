return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s)
			s:FullScreen():diffuse( Color.Black )
		end,
		OnCommand=function(s)
			s:diffusealpha(0):linear(0.3):diffusealpha(1)
		end,
	}
}