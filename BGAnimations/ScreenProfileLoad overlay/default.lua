local t = Def.ActorFrame{
	BeginCommand=function(s)
		if SCREENMAN:GetTopScreen():HaveProfileToLoad() then
			SOUND:PlayAnnouncer( "ScreenProfileLoad MemoryLoad" )
			s:queuecommand("Action"):sleep(2):queuecommand("CardLoaded")
		else
			s:queuecommand("ContinueScreen")
		end;
	end,
	CardLoadedCommand=function(s)
		SOUND:PlayAnnouncer( "ScreenProfileLoad MemoryCorrect" )
		s:sleep(0.5):queuecommand("ContinueScreen")
	end,
	ContinueScreenCommand=function()
		SCREENMAN:GetTopScreen():Continue()
	end;
};

t[#t+1] = Def.Sprite{
	Texture="Warning1",
	InitCommand=function(s)
		s:xy( SCREEN_CENTER_X,SCREEN_CENTER_Y-130 ):diffuse(Color.Blue)
		s:addx( -SCREEN_WIDTH ):decelerate(0.2):addx( SCREEN_WIDTH )
	end,
	CardLoadedCommand=function(s)
		s:decelerate(0.2):addx( SCREEN_WIDTH )
	end,
};

t[#t+1] = Def.Sprite{
	Texture="Warning2",
	InitCommand=function(s)
		s:xy( SCREEN_CENTER_X,SCREEN_CENTER_Y-70 ):diffuse( color("1,1,0.5,1") )
		s:addx( SCREEN_WIDTH ):decelerate(0.2):addx( -SCREEN_WIDTH )
	end,
	CardLoadedCommand=function(s)
		s:decelerate(0.2):addx( -SCREEN_WIDTH )
	end,
};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s)
		s:xy( SCREEN_CENTER_X,SCREEN_CENTER_Y-30 ):diffuse( color("1,1,0.5,1") )
		s:addx( SCREEN_WIDTH ):decelerate(0.2):addx( -SCREEN_WIDTH )
	end,
	CardLoadedCommand=function(s)
		s:decelerate(0.2):addx( -SCREEN_WIDTH )
	end,
	Def.Sprite{ Texture="Warning3", InitCommand=function(s) s:xy( -140,0 ) end };
	Def.Sprite{ Texture="Warning4", InitCommand=function(s) s:xy( 120,0 ) end };
}

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-10) end,
	ActionCommand=function(s) s:decelerate(0.110):y(SCREEN_CENTER_Y+80):queuecommand("Bounce") end,
	CardLoadedCommand=function(s) s:finishtweening():linear(0.110):y(SCREEN_CENTER_Y-10) end,
	BounceCommand=function(s)
		s:decelerate(0.3):zoom(0.7)
		:bounceend(0.2):zoom(0.9)
		:decelerate(0.2):zoom(1)
		:bounceend(0.2):zoom(0.9)
		:decelerate(0.2):zoom(1)
		:queuecommand("Bounce")
	end,
	Def.Sprite{
		Texture="../_moveon",
		ActionCommand=function(s) s:sleep(0.110):queuecommand("Bounce") end,
		CardLoadedCommand=function(s) s:stoptweening():decelerate(0.1):zoom(1) end,
		BounceCommand=function(s)
			s:bouncebegin(0.3):zoomx(0.9):zoomy(1.1)
			:smooth(0.15):zoom(1)
			:bouncebegin(0.15):zoomx(0.95):zoomy(1.05)
			:smooth(0.15):zoom(1)
			:queuecommand("Bounce")
			-- :decelerate(0.2):zoom(1)
			-- :decelerate(0.4):zoom(1)
			-- :accelerate(0.4):zoomx(1.05):zoomy(0.95)
			-- :decelerate(0.4):zoomx(1):zoomy(1)
		end,
	};
}

return t;
