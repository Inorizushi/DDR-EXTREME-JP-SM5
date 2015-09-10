return Def.ActorFrame{
	-- for widescreen things; temporary.
	--LoadActor("bg")..{ InitCommand=cmd(Center;FullScreen;diffusealpha,0.333) },

	LoadActor("bg")..{ InitCommand=cmd(Center) },
}