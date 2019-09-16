return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT) end,
		OnCommand=function(s)
			s:diffusealpha(1):linear(0.3):diffusealpha(0)
		end
	}
}