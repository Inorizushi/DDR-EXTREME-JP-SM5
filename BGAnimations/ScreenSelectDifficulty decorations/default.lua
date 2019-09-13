local t = LoadFallbackB()

local DifficultyChoices = {
	{ Name = "Beginner", difficulty = "playmode,regular;difficulty,beginner;screen,"..Branch.InstructionsNormal()},
	{ Name = "Easy", difficulty = "playmode,regular;difficulty,easy;screen,"..Branch.InstructionsNormal()},
	{ Name = "Medium", difficulty = "playmode,regular;difficulty,medium;screen,ScreenSelectMusic"},
	{ Name = "Hard", difficulty = "playmode,regular;difficulty,hard;screen,ScreenSelectMusic"},
	{ Name = "Nonstop", difficulty = "playmode,nonstop;screen,"..Branch.InstructionsCourse()},
	{ Name = "Oni", difficulty = "playmode,oni;screen,"..Branch.InstructionsCourse()},
};

local cardpath = THEME:GetPathB("","ScreenSelectDifficulty decorations/Cards");

local curIndexP1 = 1
local oldIndexP1 = curIndexP1
local curIndexP2 = 1
local oldIndexP2 = curIndexP2

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
InitCommand=cmd(draworder,98;);
---ICON P1
	Def.Sprite{
		--InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		InitCommand=function(self)
			self:draworder(2);
			self:Load(THEME:GetPathG("_difficulty","cursor/p1back"));
			self:y(SCREEN_CENTER_Y+154);
			self:setsize(77,48);
			--self:blend('BlendMode_Add')
		end;
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) == true then
				self:visible(true)
				if curIndexP1 == 1 then
					self:x(53);
				elseif curIndexP1 == 2 then
					self:x(205);
				elseif curIndexP1 == 3 then
					self:x(357);
				elseif curIndexP1 == 4 then
					self:x(509);
				elseif curIndexP1 == 5 then
					self:x(205);
				elseif curIndexP1 == 6 then
					self:x(357);
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");

		MenuDownP1MessageCommand=cmd(queuecommand,"Set");
		MenuUpP1MessageCommand=cmd(queuecommand,"Set");

		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");

		MenuDownP2MessageCommand=cmd(queuecommand,"Set");
		MenuUpP2MessageCommand=cmd(queuecommand,"Set");
	},
--P1 Part 2
	Def.Sprite{
		--InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		InitCommand=function(self)
			self:draworder(1);
			self:Load(THEME:GetPathG("_difficulty","cursor/p1back"));
			self:y(SCREEN_CENTER_Y+154);
			self:setsize(78,48);
			--self:blend('BlendMode_Add')
		end;
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) == true then
				self:visible(true)
				if curIndexP1 == 1 then
					self:x(130);
				elseif curIndexP1 == 2 then
					self:x(282);
				elseif curIndexP1 == 3 then
					self:x(434);
				elseif curIndexP1 == 4 then
					self:x(586);
				elseif curIndexP1 == 5 then
					self:x(282);
				elseif curIndexP1 == 6 then
					self:x(434);
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");

		MenuDownP1MessageCommand=cmd(queuecommand,"Set");
		MenuUpP1MessageCommand=cmd(queuecommand,"Set");

		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");

		MenuDownP2MessageCommand=cmd(queuecommand,"Set");
		MenuUpP2MessageCommand=cmd(queuecommand,"Set");
	},




---ICON P1
	Def.Sprite{
		--InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		InitCommand=function(self)
			self:draworder(2);
			self:Load(THEME:GetPathG("_difficulty","cursor/p1full"));
			self:y(SCREEN_CENTER_Y+170);
			self:setsize(77,13);
			--self:blend('BlendMode_Add')
		end;
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) == true then
				self:visible(true)
				if curIndexP1 == 1 then
					self:x(53);
				elseif curIndexP1 == 2 then
					self:x(205);
				elseif curIndexP1 == 3 then
					self:x(357);
				elseif curIndexP1 == 4 then
					self:x(509);
				elseif curIndexP1 == 5 then
					self:x(205);
				elseif curIndexP1 == 6 then
					self:x(357);
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");

		MenuDownP1MessageCommand=cmd(queuecommand,"Set");
		MenuUpP1MessageCommand=cmd(queuecommand,"Set");

		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");

		MenuDownP2MessageCommand=cmd(queuecommand,"Set");
		MenuUpP2MessageCommand=cmd(queuecommand,"Set");
	},



---ICON P2
	Def.Sprite{
		--InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		InitCommand=function(self)
			self:draworder(1);
			self:Load(THEME:GetPathG("_difficulty","cursor/p2back"));
			self:y(SCREEN_CENTER_Y+154);
			self:setsize(77,48);
			--self:blend('BlendMode_Add')
		end;
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_2) == true then
				self:visible(true)
				if curIndexP2 == 1 then
					self:x(53);
				elseif curIndexP2 == 2 then
					self:x(205);
				elseif curIndexP2 == 3 then
					self:x(357);
				elseif curIndexP2 == 4 then
					self:x(509);
				elseif curIndexP2 == 5 then
					self:x(205);
				elseif curIndexP2 == 6 then
					self:x(357);
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");

		MenuDownP1MessageCommand=cmd(queuecommand,"Set");
		MenuUpP1MessageCommand=cmd(queuecommand,"Set");

		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");

		MenuDownP2MessageCommand=cmd(queuecommand,"Set");
		MenuUpP2MessageCommand=cmd(queuecommand,"Set");
	},
--P2 Part 2
	Def.Sprite{
		--InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		InitCommand=function(self)
			self:draworder(2);
			self:Load(THEME:GetPathG("_difficulty","cursor/p2back"));
			self:y(SCREEN_CENTER_Y+154);
			self:setsize(78,48);
			--self:blend('BlendMode_Add')
		end;
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_2) == true then
				self:visible(true)
				if curIndexP2 == 1 then
					self:x(130);
				elseif curIndexP2 == 2 then
					self:x(282);
				elseif curIndexP2 == 3 then
					self:x(434);
				elseif curIndexP2 == 4 then
					self:x(586);
				elseif curIndexP2 == 5 then
					self:x(282);
				elseif curIndexP2 == 6 then
					self:x(434);
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");

		MenuDownP1MessageCommand=cmd(queuecommand,"Set");
		MenuUpP1MessageCommand=cmd(queuecommand,"Set");

		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");

		MenuDownP2MessageCommand=cmd(queuecommand,"Set");
		MenuUpP2MessageCommand=cmd(queuecommand,"Set");
	},


---ICON P2
	Def.Sprite{
		--InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		InitCommand=function(self)
			self:draworder(2);
			self:Load(THEME:GetPathG("_difficulty","cursor/p2full"));
			self:y(SCREEN_CENTER_Y+170);
			self:setsize(77,13);
			--self:blend('BlendMode_Add')
		end;
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_2) == true then
				self:visible(true)
				if curIndexP2 == 1 then
					self:x(130);
				elseif curIndexP2 == 2 then
					self:x(282);
				elseif curIndexP2 == 3 then
					self:x(434);
				elseif curIndexP2 == 4 then
					self:x(586);
				elseif curIndexP2 == 5 then
					self:x(282);
				elseif curIndexP2 == 6 then
					self:x(434);
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");

		MenuDownP1MessageCommand=cmd(queuecommand,"Set");
		MenuUpP1MessageCommand=cmd(queuecommand,"Set");

		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");

		MenuDownP2MessageCommand=cmd(queuecommand,"Set");
		MenuUpP2MessageCommand=cmd(queuecommand,"Set");
	},

};









t[#t+1] = Def.ActorFrame{
	Def.Actor{
		Name="InputHandler";
		MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
		MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
		MenuRightP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Right", }); end;
		MenuLeftP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Left", }); end;
		MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
		MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
		MenuRightP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Right", }); end;
		MenuLeftP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Left", }); end;

		MenuInputMessageCommand=function(self,param)
			oldIndexP1 = curIndexP1
			oldIndexP2 = curIndexP2
			if param.Input == "Right" and param.Player == PLAYER_1 then
				curIndexP1 = curIndexP1+1

				if curIndexP2 == 5 and curIndexP1 == 4 then
					curIndexP2 = curIndexP1;
				end;

				if curIndexP1 == 5 then
					curIndexP2 = curIndexP1;
				end;

				if curIndexP1 == 6 then
					curIndexP2 = curIndexP1;
				end;
			elseif param.Input == "Left" and param.Player == PLAYER_1 then
				curIndexP1 = curIndexP1-1

				if curIndexP2 == 5 and curIndexP1 == 4 then
					curIndexP2 = curIndexP1;
				end;

				if curIndexP1 == 5 then
					curIndexP2 = curIndexP1;
				end;

				if curIndexP1 == 6 then
					curIndexP2 = curIndexP1;
				end;
			elseif param.Input == "Down" and param.Player == PLAYER_1 then
				curIndexP1 = curIndexP1 + 1

				if curIndexP2 == 5 and curIndexP1 == 4 then
					curIndexP2 = curIndexP1;
				end;

				if curIndexP1 == 5 then
					curIndexP2 = curIndexP1;
				end;

				if curIndexP1 == 6 then
					curIndexP2 = curIndexP1;
				end;
			elseif param.Input == "Up" and param.Player == PLAYER_1 then
				curIndexP1 = curIndexP1 - 1

				if curIndexP2 == 5 and curIndexP1 == 4 then
					curIndexP2 = curIndexP1;
				end;

				if curIndexP1 == 5 then
					curIndexP2 = curIndexP1;
				end;

				if curIndexP1 == 6 then
					curIndexP2 = curIndexP1;
				end;
			elseif param.Input == "Right" and param.Player == PLAYER_2 then
			curIndexP2 = curIndexP2 + 1

			if curIndexP1 == 5 and curIndexP2 == 4 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 5 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 6 then
				curIndexP1 = curIndexP2;
			end;
			elseif param.Input == "Left" and param.Player == PLAYER_2 then
			curIndexP2 = curIndexP2 - 1

			if curIndexP1 == 5 and curIndexP2 == 4 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 5 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 6 then
				curIndexP1 = curIndexP2;
			end;
			elseif param.Input == "Down" and param.Player == PLAYER_2 then
			curIndexP2 = curIndexP2 + 1

			if curIndexP1 == 5 and curIndexP2 == 4 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 5 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 6 then
				curIndexP1 = curIndexP2;
			end;
			elseif param.Input == "Up" and param.Player == PLAYER_2 then
			curIndexP2 = curIndexP2 - 1

			if curIndexP1 == 5 and curIndexP2 == 4 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 5 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 6 then
				curIndexP1 = curIndexP2;
			end;
		end;
		end;
		MenuStartP1MessageCommand=function(self)
			SOUND:PlayAnnouncer(P1announcer);
		end;

		MenuStartP2MessageCommand=function(self)
			SOUND:PlayAnnouncer(P2announcer);
		end;
	};

	Def.Sprite{
		InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14);
		LoadHeavyP1Command=function(self)
			self:Load(cardpath.."/HEAVY P1.png");
		end;
		LoadNonstopP1Command=function(self)
			self:Load(cardpath.."/NONSTOP P1.png");
		end;
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) == true then
				self:visible(true)
				if curIndexP1 == 1 then
					self:Load(cardpath.."/BEGINNER P1.png");
					P1announcer = "ScreenSelectMaster comment beginner";
				elseif curIndexP1 == 2 then
					self:Load(cardpath.."/LIGHT P1.png");
					P1announcer = "ScreenSelectMaster comment light";
				elseif curIndexP1 == 3 then
					self:Load(cardpath.."/STANDARD P1.png");
					P1announcer = "ScreenSelectMaster comment standard";
				elseif curIndexP1 == 4 then
					if oldIndexP1 == 5 then
						self:sleep(0.2):queuecommand("LoadHeavyP1")
					else
						self:Load(cardpath.."/HEAVY P1.png");
					end;
					P1announcer = "ScreenSelectMaster comment heavy";
				elseif curIndexP1 == 5 then
					if oldIndexP1 == 4 then
						self:sleep(0.2):queuecommand("LoadNonstopP1")
					else
						self:Load(cardpath.."/NONSTOP P1.png");
					end;
					P1announcer = "ScreenSelectMaster comment nonstop";
				elseif curIndexP1 == 6 then
					self:Load(cardpath.."/ONI P1.png");
					P1announcer = "ScreenSelectMaster comment oni";
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set"cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");

		MenuDownP1MessageCommand=cmd(queuecommand,"Set");
		MenuUpP1MessageCommand=cmd(queuecommand,"Set");

		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");

		MenuDownP2MessageCommand=cmd(queuecommand,"Set");
		MenuUpP2MessageCommand=cmd(queuecommand,"Set");
	},
	Def.Sprite{
		InitCommand=cmd(x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y-14);
		LoadHeavyP2Command=function(self)
			self:Load(cardpath.."/HEAVY P2.png");
		end;
		LoadNonstopP2Command=function(self)
			self:Load(cardpath.."/NONSTOP P2.png");
		end;
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_2) == true then
				self:visible(true)
				if curIndexP2 == 1 then
					self:Load(cardpath.."/BEGINNER P2.png");
					P2announcer = "ScreenSelectMaster comment beginner";
				elseif curIndexP2 == 2 then
					self:Load(cardpath.."/LIGHT P2.png");
					P2announcer = "ScreenSelectMaster comment light";
				elseif curIndexP2 == 3 then
					self:Load(cardpath.."/STANDARD P2.png");
					P2announcer = "ScreenSelectMaster comment standard";
				elseif curIndexP2 == 4 then
					if oldIndexP2 == 5 then
						self:sleep(0.2):queuecommand("LoadHeavyP2")
					else
						self:Load(cardpath.."/HEAVY P2.png");
					end;
					P1announcer = "ScreenSelectMaster comment heavy";
				elseif curIndexP2 == 5 then
					if oldIndexP2 == 4 then
						self:sleep(0.2):queuecommand("LoadNonstopP2")
					else
						self:Load(cardpath.."/NONSTOP P2.png");
					end;
					P1announcer = "ScreenSelectMaster comment nonstop";
				elseif curIndexP2 == 6 then
					self:Load(cardpath.."/ONI P2.png");
					P2announcer = "ScreenSelectMaster comment oni";
				end;
			else
				self:visible(false)
			end;
		end;
		OnCommand=cmd(queuecommand,"Set";cropleft,1;sleep,0.264;sleep,0.132;cropleft,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropleft,0.936;linear,0.396;cropleft,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropleft,0.936;sleep,0.016;linear,0.267;cropbottom,1);

		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");

		MenuDownP1MessageCommand=cmd(queuecommand,"Set");
		MenuUpP1MessageCommand=cmd(queuecommand,"Set");

		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");

		MenuDownP2MessageCommand=cmd(queuecommand,"Set");
		MenuUpP2MessageCommand=cmd(queuecommand,"Set");
		--[[
		MenuRightP1MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP1MessageCommand=cmd(queuecommand,"Set");
		MenuRightP2MessageCommand=cmd(queuecommand,"Set");
		MenuLeftP2MessageCommand=cmd(queuecommand,"Set");
		--]]
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
		--OnCommand=cmd(draworder,99;diffusealpha,0;sleep,0.264;diffusealpha,1);
		OnCommand=function(self)
			self:draworder(99);
			self:diffusealpha(0);
			self:sleep(0.264);
			self:diffusealpha(1);
			SOUND:PlayAnnouncer("ScreenSelectMaster intro");
		end;
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
		InitCommand=cmd(player,PLAYER_1;);
		OnCommand=cmd(x,SCREEN_CENTER_X-24;y,SCREEN_CENTER_Y-160;vertalign,top;zoomy,0;sleep,0.134;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,1;sleep,0.566;linear,0.267;zoomy,0);
	};
	LoadActor( "p2" )..{
		InitCommand=cmd(player,PLAYER_2;);
		OnCommand=cmd(x,SCREEN_CENTER_X+34;y,SCREEN_CENTER_Y-160;vertalign,top;zoomy,0;sleep,0.134;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,1;sleep,0.566;linear,0.267;zoomy,0);
	};

}

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_difficulty","cursor/_OK P1"))..{
		InitCommand=cmd(player,PLAYER_1;draworder,99;x,SCREEN_CENTER_X-76;y,SCREEN_CENTER_Y+84;diffusealpha,0);
		OnCommand=cmd();
		--SelectP1Command=cmd(addy,68;diffusealpha,1;);
		--MenuStartP1MessageCommand=cmd(queuecommand,"SelectP1");
		OffCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
	};
	LoadActor(THEME:GetPathG("_difficulty","cursor/_OK P2"))..{
		InitCommand=cmd(player,PLAYER_2;draworder,99;x,152;x,SCREEN_CENTER_X+76;y,SCREEN_CENTER_Y+84;diffusealpha,0);
		OnCommand=cmd();
		OffCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
	};
}

return t
