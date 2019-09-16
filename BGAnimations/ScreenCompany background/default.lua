local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y) end,
	Def.Quad{
		OnCommand=function(s)
			s:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse( Color.White )
		end
	};
	Def.Sprite{ Texture="1",
		OnCommand=function(s) s:diffusealpha(1):sleep(5.5):linear(0.3):diffusealpha(0) end
	};
    Def.Sprite{ Texture="2",
		OnCommand=function(s) s:diffusealpha(0):sleep(5.8):linear(0.3):diffusealpha(1):sleep(5.3):linear(0.3):diffusealpha(0) end
	};
	Def.Sprite{ Texture="3",
		OnCommand=function(s) s:diffusealpha(0):sleep(11.7):linear(0.3):diffusealpha(1):sleep(5.9) end
	};
};

return t


	



