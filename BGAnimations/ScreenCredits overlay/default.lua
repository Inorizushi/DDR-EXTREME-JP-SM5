return Def.ActorFrame {
	InitCommand=function(s) s:sleep(40) end,
	Def.Sprite{ Texture="extreme_special_ending",
		OnCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-14):texturewrapping(1):zoomtowidth(610):zoomtoheight(420)
			:diffusealpha(1):sleep(32):diffuse(Color.Black)
		end
	};
	Def.Sprite{
		Texture="glitchborder",
		InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y) end
	};
	Def.Sprite{
		Texture="logo",
		OnCommand=function(s)
			s:diffusealpha(0):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-14):zoomtowidth(610):zoomtoheight(420)
			:linear(29.45):diffusealpha(0):linear(0.3):diffusealpha(1):sleep(3.5):diffusealpha(1):linear(0.8):diffusealpha(0)
		end
	};
}