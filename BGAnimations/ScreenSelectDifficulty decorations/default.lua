local t = LoadFallbackB()

local DifficultyChoices = {
	{ Name = "Beginner", difficulty = "playmode,regular;difficulty,beginner;screen,"..Branch.InstructionsNormal()},
	{ Name = "Easy", difficulty = "playmode,regular;difficulty,easy;screen,"..Branch.InstructionsNormal()},
	{ Name = "Medium", difficulty = "playmode,regular;difficulty,medium;screen,ScreenSelectMusic"},
	{ Name = "Hard", difficulty = "playmode,regular;difficulty,hard;screen,ScreenSelectMusic"},
	{ Name = "Nonstop", difficulty = "playmode,nonstop;screen,"..Branch.InstructionsCourse()},
	{ Name = "Oni", difficulty = "playmode,oni;screen,"..Branch.InstructionsCourse()},
};

local curIndexP1 = 1
local curIndexP2 = 1

t[#t+1] = Def.ActorFrame{
	InitCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) == false then
			self:visible(true)
		else
			self:visible(false)
		end;
		self:x(SCREEN_CENTER_X-156):y(SCREEN_CENTER_Y-14)
	end;
	LoadActor( "null" )..{
		OnCommand=cmd(cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
	};

	LoadActor( "innull" )..{
		OnCommand=cmd(x,-119;y,19;horizalign,left;addx,-240;cropleft,1;sleep,0.264;sleep,0.132;sleep,0.264;linear,0.396;addx,240;cropleft,0);
		OffCommand=cmd(sleep,1;sleep,0.236;linear,0.341;cropleft,1;addx,-240);
	};
};

--2P--
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) == false then
			self:visible(true)
		else
			self:visible(false)
		end;
		self:x(SCREEN_CENTER_X+156):y(SCREEN_CENTER_Y-14)
	end;
	LoadActor( "null" )..{
		OnCommand=cmd(zoomx,-1;cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
	};
	LoadActor( "innull" )..{
		OnCommand=cmd(x,119;y,19;horizalign,right;addx,240;cropright,1;sleep,0.264;sleep,0.132;sleep,0.264;linear,0.396;addx,-240;cropright,0);
		OffCommand=cmd(horizalign,right;sleep,1;sleep,0.236;linear,0.341;cropright,1;addx,240);
	};
};

t[#t+1] = Def.ActorFrame{
	Def.Actor{
		Name="InputHandler";
		MenuRightP1MessageCommand=function(self)
			curIndexP1 = curIndexP1 + 1
		end;
		MenuLeftP1MessageCommand=function(self)
			curIndexP1 = curIndexP1 - 1
		end;
		MenuRightP2MessageCommand=function(self)
			curIndexP2 = curIndexP2 + 1
		end;
		MenuLeftP2MessageCommand=function(self)
			curIndexP2 = curIndexP2 - 1
		end;
	};
	--[[Def.BitmapText{
		Font="Common Normal",
		InitCommand=function(self)
			self:CenterX():y(SCREEN_CENTER_Y-20):diffuse(Color("Blue"))
		end;
		OnCommand=cmd(settext,(curIndexP1));
		MenuRightP1MessageCommand=cmd(queuecommand,"On");
		MenuLeftP1MessageCommand=cmd(queuecommand,"On");
	},
	Def.BitmapText{
		Font="Common Normal",
		InitCommand=function(self)
			self:CenterX():y(SCREEN_CENTER_Y+20):diffuse(Color("Orange"))
		end;
		OnCommand=cmd(settext,(curIndexP2));
		MenuRightP2MessageCommand=cmd(queuecommand,"On");
		MenuLeftP2MessageCommand=cmd(queuecommand,"On");
	},]]--
	Def.Sprite{
		InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) == true then
				self:visible(true)
				if curIndexP1 == 1 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceBEGINNER P1/_picture"));
				elseif curIndexP1 == 2 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceEASY P1/_picture"));
				elseif curIndexP1 == 3 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceMEDIUM P1/_picture"));
				elseif curIndexP1 == 4 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceHard P1/_picture"));
				elseif curIndexP1 == 5 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceNonstop P1/_picture"));
				elseif curIndexP1 == 6 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceOni P1/_picture"));
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");
	},
	Def.Sprite{
		InitCommand=cmd(x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y-14);
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_2) == true then
				self:visible(true)
				if curIndexP2 == 1 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceBEGINNER P2/_picture"));
				elseif curIndexP2 == 2 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceEASY P2/_picture"));
				elseif curIndexP2 == 3 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceMEDIUM P2/_picture"));
				elseif curIndexP2 == 4 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceHard P2/_picture"));
				elseif curIndexP2 == 5 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceNonstop P2/_picture"));
				elseif curIndexP2 == 6 then
					self:Load(THEME:GetPathG("","ScreenSelectDifficulty Scroll ChoiceOni P2/_picture"));
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropleft,1;sleep,0.264;sleep,0.132;cropleft,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropleft,0.936;linear,0.396;cropleft,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropleft,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");
	},
};

t[#t+1] = LoadActor("../help")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-165;y,SCREEN_BOTTOM-33.5;);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_TOP+58;draworder,100);
	LoadActor("explanation")..{
		InitCommand=cmd(x,SCREEN_LEFT+136);
		OnCommand=cmd(draworder,99;diffusealpha,0;sleep,0.264;diffusealpha,1);
	};
	Def.Quad{
		InitCommand=cmd(x,SCREEN_LEFT+339;setsize,230,24;diffuse,color("#8cbd00"));
		OnCommand=cmd(addx,-204;sleep,0.264;sleep,0.198;linear,0.198;addx,204);
		OffCommand=cmd(sleep,0.66;linear,0.198;addx,-204);
	};
	LoadActor("arrow")..{
		InitCommand=cmd(x,SCREEN_LEFT+238);
		OnCommand=cmd(addx,-204;diffusealpha,0;sleep,0.264;diffusealpha,1;sleep,0.198;linear,0.198;addx,204);
		OffCommand=cmd(sleep,0.66;linear,0.198;addx,-204;sleep,0.198;diffusealpha,0);
	};
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(sleep,1.22);
	LoadActor( "p1" )..{
		BeginCommand=cmd(playcommand,"IsP1Present");
		OnCommand=cmd(x,SCREEN_CENTER_X-24;y,SCREEN_CENTER_Y-160;vertalign,top;zoomy,0;sleep,0.134;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,1;sleep,0.566;linear,0.267;zoomy,0);
		IsP1PresentCommand=function(self,param)
			if GAMESTATE:IsPlayerEnabled(0) == false then
				self:visible(false)
			end
		end;
	};
	LoadActor( "p2" )..{
		BeginCommand=cmd(playcommand,"IsP2Present");
		OnCommand=cmd(x,SCREEN_CENTER_X+34;y,SCREEN_CENTER_Y-160;vertalign,top;zoomy,0;sleep,0.134;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,1;sleep,0.566;linear,0.267;zoomy,0);
		IsP2PresentCommand=function(self,param)
			if GAMESTATE:IsPlayerEnabled(1) == false then
				self:visible(false)
			end
		end;
	};

}

return t
