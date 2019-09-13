local t = Def.ActorFrame{};

local yPosPlayer = {
    P1 = (SCREEN_TOP+52),
    P2 = (SCREEN_TOP+64)
}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("mod bar")..{
		Name = pn,
		InitCommand=function(self)
			local short = ToEnumShortString(pn)
			self:y(yPosPlayer[short])
			:CenterX()
		end;
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
		OffCommand=cmd(accelerate,0.783;addx,-640);
	};
end

t[#t+1] = LoadActor("p1badge")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-320):y(SCREEN_TOP+52):halign(0);
	end;
	BeginCommand=function(self,param)
		if GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then
			self:visible(true);
		else
			self:visible(false);
		end;
	end;
	OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
	OffCommand=cmd(accelerate,0.783;addx,-640);
};

t[#t+1] = LoadActor("p2badge")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-320):y(SCREEN_TOP+64):halign(0);
	end;
	BeginCommand=function(self,param)
		if GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') then
			self:visible(true);
		else
			self:visible(false);
		end;
	end;
	OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
	OffCommand=cmd(accelerate,0.783;addx,-640);
};

t[#t+1] = Def.ActorFrame{
	LoadActor( "Icons" ) .. {
		InitCommand=cmd(player,PLAYER_1;CenterX;y,SCREEN_TOP+52.1;draworder,1);
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.317;decelerate,0.766;addx,SCREEN_WIDTH);
		OffCommand=cmd(accelerate,0.783;addx,-640);
	};
};

return t;
