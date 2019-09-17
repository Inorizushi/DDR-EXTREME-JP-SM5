return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT) end,
		OnCommand=function(s)
			s:diffusealpha(0):linear(0.3):diffusealpha(1)
		end
	}
}