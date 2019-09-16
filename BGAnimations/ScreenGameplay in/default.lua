local travelDist = SCREEN_WIDTH*1.7;

local LeftToRight = Def.ActorFrame{
	Def.Sprite{ Texture="../LeftToRight_green" };
	Def.Quad{
		InitCommand=function(s)
			s:addx(64):diffuse( color("#000000FF") ):halign(0):zoomto(travelDist,32)
		end
	};
};

local RightToLeft = Def.ActorFrame{
	Def.Sprite{ Texture="../RightToLeft_green" };
	Def.Quad{
		InitCommand=function(s)
			s:addx(-64):diffuse( color("#000000FF") ):halign(1):zoomto(travelDist,32)
		end
	};
};

local t = Def.ActorFrame{}

t[#t+1] = Def.Quad{
	InitCommand=function(s)
		s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT):diffuse( Color.Black )
	end,
	OnCommand=function(s)
		s:linear(0.4):diffusealpha(0)
	end;
}

for i=1,6 do
	-- 6 left -> right
	t[#t+1] = LeftToRight..{
		InitCommand=function(s)
			s:xy( SCREEN_LEFT-64*i,SCREEN_CENTER_Y-176+(64*(i-1)) )
		end,
		OnCommand=function(s)
			s:linear(0.4):addx(SCREEN_WIDTH*1.7)
		end
	}
	-- 6 right -> left
	t[#t+1] = RightToLeft..{
		InitCommand=function(s)
			s:xy( SCREEN_RIGHT+64*i,SCREEN_CENTER_Y-144+(64*(i-1)) )
		end,
		OnCommand=function(s)
			s:linear(0.4):addx(-SCREEN_WIDTH*1.7)
		end
	}
end

return t;