local travelDist = SCREEN_WIDTH*1.5;

local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT):diffuse( Alpha(Color.Black,0) ):draworder(-1)
		end,
		OnCommand=function(s)
			s:linear(0.3):diffusealpha(1)
		end
	};
};

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:diffusealpha(0) end,
		OnCommand=function(s) s:sleep(3.284) end
	};
};

local LeftToRight = Def.ActorFrame{
	Def.Sprite{ Texture="LeftToRight" };
	Def.Quad{
		InitCommand=function(s)
			s:addx(-64):diffuse( color("#000000FF") ):halign(1):zoomto(1088,32)
		end
	};
};

local RightToLeft = Def.ActorFrame{
	Def.Sprite{ Texture="RightToLeft" };
	Def.Quad{
		InitCommand=function(s)
			s:addx(64):diffuse( color("#000000FF") ):halign(0):zoomto(SCREEN_WIDTH*1.9,32)
		end
	};
};

for i=1,7 do
	local pos = {1,2,3,4,3,2,1}
	-- 8 left -> right
	t[#t+1] = LeftToRight..{
		InitCommand=function(s)
			s:xy( SCREEN_LEFT-64*pos[i],SCREEN_CENTER_Y-176+(64*(i-1.75)) )
		end,
		OnCommand=function(s)
			s:linear(1.3):addx(SCREEN_WIDTH*1.7)
		end
	}
end

for i=1,8 do
	local pos = {1,2,3,4,3,2,1,1}
	-- 8 right -> left
	t[#t+1] = RightToLeft..{
		InitCommand=function(s)
			s:xy( SCREEN_RIGHT+64*pos[i],SCREEN_CENTER_Y-144+(64*(i-1.75)) )
		end,
		OnCommand=function(s)
			s:linear(1.3):addx(-SCREEN_WIDTH*1.7)
		end
	}
end

local clearMessageNormal = Def.ActorFrame{
	LoadActor("cleared")..{
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-6)
		end,
		OnCommand=function(s)
			s:diffusealpha(0):sleep(1.05):diffusealpha(1):sleep(0.4):sleep(1.5):linear(0.333):diffusealpha(0)
		end
	};
	Def.Quad{
		InitCommand=function(s)
			s:setsize(SCREEN_WIDTH,142):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-4):fadetop(0.2):diffuse(Color.Black)
		end,
		OnCommand=function(s)
			s:texturewrapping(1):diffusealpha(0):zoomtowidth(488):zoomtoheight(110):sleep(1):diffusealpha(1)
			:linear(0.4):addy(177+30):sleep(0):diffusealpha(0)
		end
	};
};

if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
	-- rave clear depends on who won (if anyone)
	local resultType = ""
	if GAMESTATE:IsWinner(PLAYER_1) then resultType = "winP1"
	elseif GAMESTATE:IsWinner(PLAYER_2) then resultType = "winP2"
	else resultType = "draw"
	end
	t[#t+1] = LoadActor("_rave "..resultType)..{
		Name="RaveResultMessage";
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):diffusealpha(0):cropbottom(1)
		end,
		OnCommand=function(s)
			s:sleep(1):linear(0.8):diffusealpha(1):cropbottom(0):sleep(2.0):linear(0.5):diffusealpha(0)
		end
	};
elseif GAMESTATE:IsCourseMode() then
	t[#t+1] = clearMessageNormal
else
	-- normal mode; hide if extra stage achieved
	t[#t+1] = clearMessageNormal..{
		StartTransitioningCommand=function(s)
			s:visible( GAMESTATE:GetEarnedExtraStage() == 'EarnedExtraStage_No' )
		end,
	}
end


return t
