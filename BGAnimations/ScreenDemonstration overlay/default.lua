return Def.ActorFrame{
	--Topframe underlay
	Def.Quad{
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,49):valign(0):xy(SCREEN_CENTER_X,SCREEN_TOP):diffuse( Color.Black ) end
	};
	--Bottomframe underlay
	Def.Quad{
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,70):valign(1):xy(SCREEN_CENTER_X,SCREEN_BOTTOM):diffuse( Color.Black ) end
	};
	Def.Sprite{ Texture="demup",
		InitCommand=function(s) s:xy(SCREEN_LEFT,SCREEN_TOP+15):align(0,0) end
	};
	Def.Sprite{ Texture="demdown",
		InitCommand=function(s) s:xy(SCREEN_RIGHT,SCREEN_TOP+419):align(1,0) end
	};
	--flashity flashing flasher
	Def.Sprite{Texture="gameover",
		InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y) end,
		OnCommand=function(s) s:diffuseblink():effectcolor1( color("1,1,1,.5") ):effectcolor2( color("0,0,0,.5") )
			:effectperiod(0.266)
		end
	};
};
