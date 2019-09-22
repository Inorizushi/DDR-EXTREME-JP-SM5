local t = Def.ActorFrame{};
local pn = ...
local yPosPlayer = { [PLAYER_1] = (SCREEN_TOP+52),[PLAYER_2] = (SCREEN_TOP+64) }

local spn = ToEnumShortString(pn)
t[#t+1] = LoadActor("mod bar")..{
	Name = pn,
	InitCommand=function(self)
		self:xy(SCREEN_CENTER_X,yPosPlayer[pn])
		if IsUsingWideScreen() then
			self:fadeleft(0.1):faderight(0.1)
		end
	end;
	OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
	OffCommand=cmd(accelerate,0.783;addx,-640);
};

t[#t+1] = LoadActor( spn.."badge")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-320)
		:y( pn == PLAYER_1 and  SCREEN_TOP+52 or SCREEN_TOP+64)
		:halign(0)
		if IsUsingWideScreen() then
			self:fadeleft(0.1)
		end
	end;
	BeginCommand=function(self,param)
		self:visible( GAMESTATE:IsPlayerEnabled(pn) )
	end;
	OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
	OffCommand=cmd(accelerate,0.783;addx,-640);
};

t[#t+1] = Def.ActorFrame{
	LoadActor( "Icons", pn ) .. {
		InitCommand=function(s)
			s:player(pn):xy(SCREEN_CENTER_X, pn == PLAYER_1 and  SCREEN_TOP+52.1 or 52.1+12 ):draworder(1)
			if GAMESTATE:IsAnExtraStage() then
				s:diffuseblink():effectperiod(1/5):effectcolor1(Color.White):effectcolor2(color("1,1,1,0")):effectoffset(0.5)
			end
		end,
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
		OffCommand=cmd(accelerate,0.783;addx,-640);
	};
};

return t;
