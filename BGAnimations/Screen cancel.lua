return Def.ActorFrame{

	Def.Sound{
		File=THEME:GetPathS("","Common back"),
		StartTransitioningCommand=function(s) s:play() end
	};

	Def.Sprite{
		Texture="_black",
		InitCommand=function(s) s:y(SCREEN_CENTER_Y):halign(0) end,
		OnCommand=function(s)
			s:zoomx(0):zoomy(15):sleep(0.04):diffuserightedge( color("1,1,1,0") ):linear(0.3)
			:diffuserightedge( Color.White ):zoomx(10):sleep(1)
		end
	};
	Def.Sprite{
		Texture="_black",
		InitCommand=function(s) s:xy(SCREEN_RIGHT,SCREEN_CENTER_Y):halign(1) end,
		OnCommand=function(s)
			s:zoomx(0):zoomy(15):sleep(0.04):diffuseleftedge( color("1,1,1,0") ):linear(0.3)
			:diffuseleftedge( Color.White ):zoomx(10)
		end
	};
	Def.Sprite{
		Texture="_black",
		InitCommand=function(s) s:x(SCREEN_CENTER_X):valign(0) end,
		OnCommand=function(s)
			s:zoomy(0):zoomx(20):sleep(0.04):diffusebottomedge( color("1,1,1,0") ):linear(0.3)
			:diffusebottomedge( Color.White ):zoomy(7.5)
		end
	};
	Def.Sprite{
		Texture="_black",
		InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_BOTTOM):valign(1) end,
		OnCommand=function(s)
			s:zoomy(0):zoomx(20):sleep(0.04):diffusetopedge( color("1,1,1,0") ):linear(0.3)
			:diffusetopedge( Color.White ):zoomy(7.5)
		end
	};
};
