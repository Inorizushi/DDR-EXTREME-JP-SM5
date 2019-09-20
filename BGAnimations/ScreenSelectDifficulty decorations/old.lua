local t = LoadFallbackB()

local curIndexP1 = 1
local oldIndexP1 = curIndexP1
local curIndexP2 = 1
local oldIndexP2 = curIndexP2

local cardpath = THEME:GetPathB("","ScreenSelectDifficulty decorations/Cards");

t[#t+1] = Def.Actor{
	Name="InputHandler";
	MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
	MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
	MenuRightP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Right", }); end;
	MenuLeftP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Left", }); end;
	MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
	MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
	MenuRightP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Right", }); end;
	MenuLeftP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Left", }); end;
	MenuStartP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Start", }); end;
	MenuStartP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Start", }); end;

	MenuInputMessageCommand=function(self,param)
		oldIndexP1 = curIndexP1
		oldIndexP2 = curIndexP2
		if param.Input == "Right" and param.Player == PLAYER_1 then
			curIndexP1 = curIndexP1+1

			if curIndexP2 == 5 and curIndexP1 == 4 then
				curIndexP2 = curIndexP1;
			end;

			if curIndexP1 == 5 or curIndexP1 == 6 then
				curIndexP2 = curIndexP1;
			end;

		elseif param.Input == "Left" and param.Player == PLAYER_1 then
			curIndexP1 = curIndexP1-1

			if curIndexP2 == 5 and curIndexP1 == 4 then
				curIndexP2 = curIndexP1;
			end;

			if curIndexP1 == 5 or curIndex == 6 then
				curIndexP2 = curIndexP1;
			end;
		elseif param.Input == "Down" and param.Player == PLAYER_1 then
			curIndexP1 = curIndexP1 + 1

			if curIndexP2 == 5 and curIndexP1 == 4 then
				curIndexP2 = curIndexP1;
			end;

			if curIndexP1 == 5 or curIndex == 6 then
				curIndexP2 = curIndexP1;
			end;
		elseif param.Input == "Up" and param.Player == PLAYER_1 then
			curIndexP1 = curIndexP1 - 1

			if curIndexP2 == 5 and curIndexP1 == 4 then
				curIndexP2 = curIndexP1;
			end;

			if curIndexP1 == 5 or curIndex == 6 then
				curIndexP2 = curIndexP1;
			end;
		elseif param.Input == "Right" and param.Player == PLAYER_2 then
			curIndexP2 = curIndexP2 + 1

			if curIndexP1 == 5 and curIndexP2 == 4 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 5 or curIndexP2 == 6 then
				curIndexP1 = curIndexP2;
			end;

		elseif param.Input == "Left" and param.Player == PLAYER_2 then
			curIndexP2 = curIndexP2 - 1

			if curIndexP1 == 5 and curIndexP2 == 4 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 5 or curIndexP2 == 6 then
				curIndexP1 = curIndexP2;
			end;
		elseif param.Input == "Down" and param.Player == PLAYER_2 then
			curIndexP2 = curIndexP2 + 1

			if curIndexP1 == 5 and curIndexP2 == 4 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 5 or curIndexP2 == 6 then
				curIndexP1 = curIndexP2;
			end;
		elseif param.Input == "Up" and param.Player == PLAYER_2 then
			curIndexP2 = curIndexP2 - 1

			if curIndexP1 == 5 and curIndexP2 == 4 then
				curIndexP1 = curIndexP2;
			end;

			if curIndexP2 == 5 or curIndexP2 == 6 then
				curIndexP1 = curIndexP2;
			end;
		elseif param.Input == "Start" and param.Player == PLAYER_1 then
			SOUND:PlayAnnouncer(P1announcer);
		elseif param.Input == "Start" and param.Player == PLAYER_2 then
			SOUND:PlayAnnouncer(P2announcer);
		end
	end;
};

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
	InitCommand=function(s)
		s:xy(_screen.cx,SCREEN_CENTER_Y+154):draworder(98)
		s:MaskDest():ztestmode("ZTestMode_WriteOnFail")
	end,
	LoadActor("bar");
};

xPos = {_screen.cx-228,_screen.cx-76,_screen.cx+76,_screen.cx+228,_screen.cx-76,_screen.cx+73};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s)
		s:draworder(98):y(_screen.cy+154)
		s:MaskDest():ztestmode("ZTestMode_WriteOnFail")
	end,
	OnCommand=function(s) s:queuecommand("Set") end,
	MenuRightP1MessageCommand=function(s) s:queuecommand("Set") end,
	MenuLeftP1MessageCommand=function(s) s:queuecommand("Set") end,
	MenuDownP1MessageCommand=function(s) s:queuecommand("Set") end,
	MenuUpP1MessageCommand=function(s) s:queuecommand("Set") end,
	MenuRightP2MessageCommand=function(s) s:queuecommand("Set") end,
	MenuLeftP2MessageCommand=function(s) s:queuecommand("Set") end,
	MenuDownP2MessageCommand=function(s) s:queuecommand("Set") end,
	MenuUpP2MessageCommand=function(s) s:queuecommand("Set") end,
---ICON P1
	Def.ActorFrame{
		SetHeavyP1Command=function(self)
			self:x(_screen.cx+228);
		end,
		SetNonstopP1Command=function(self)
			self:x(_screen.cx-76);
		end,
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) == true then
				self:visible(true)
				if curIndexP1 == 4 then
					if oldIndexP1 == 5 or oldIndexP2 == 5 then
						self:sleep(0.45):queuecommand("SetHeavyP1")
					else
						self:x(_screen.cx+228);
					end
				elseif curIndexP1 == 5  then
					if oldIndexP1 == 4 or oldIndexP2 == 4 then
						self:sleep(0.45):queuecommand("SetNonstopP1")
					else
						self:x(_screen.cx-76);
					end
				else
					self:x(xPos[curIndexP1])
				end;
			else
				self:visible(false)
			end;
		end;
		LoadActor("cursor/cursor1")..{
			InitCommand=function(s)
				s:cropright(0.5):cropbottom(0.35):halign(0)
			end,
		},
		LoadActor("cursor/cursor1")..{
			InitCommand=function(s)
				s:cropleft(0.5):cropbottom(0.35):halign(1)
			end,
		},
		LoadActor("cursor/cursor1")..{
			InitCommand=function(s)
				s:croptop(0.65)
			end,
		},
	},
	Def.ActorFrame{
		SetHeavyP2Command=function(self)
			self:x(_screen.cx+228);
		end,
		SetNonstopP2Command=function(self)
			self:x(_screen.cx-76);
		end,
		SetCommand=function(self)
			if GAMESTATE:IsPlayerEnabled(PLAYER_2) == true then
				self:visible(true)
				if curIndexP2 == 4 then
					if oldIndexP2 == 5 or oldIndexP1 == 5 then
						self:sleep(0.45):queuecommand("SetHeavyP2")
					else
						self:x(_screen.cx+228);
					end
				elseif curIndexP2 == 5 then
					if oldIndexP2 == 4 or oldIndexP1 == 4 then
						self:sleep(0.45):queuecommand("SetNonstopP2")
					else
						self:x(_screen.cx-76);
					end
				else
					self:x(xPos[curIndexP2]);
				end;
			else
				self:visible(false)
			end;
		end;
		LoadActor("cursor/cursor2")..{
			InitCommand=function(s)
				s:cropright(0.5):cropbottom(0.35):halign(0)
			end,
		},
		LoadActor("cursor/cursor2")..{
			InitCommand=function(s)
				s:cropleft(0.5):cropbottom(0.35):halign(1)
			end,
			SetCommand=function(s)
				if curIndexP1 == curIndexP2 then
					s:visible(false)
				else
					s:visible(true)
				end
			end,
		},
		LoadActor("cursor/cursor2")..{
			InitCommand=function(s)
				s:croptop(0.65)
			end,
			SetCommand=function(s)
				if curIndexP1 == curIndexP2 then
					s:cropleft(0.5)
				else
					s:cropleft(0)
				end
			end,
		},
	},
};

t[#t+1] = Def.ActorFrame{
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
					P2announcer = "ScreenSelectMaster comment heavy";
				elseif curIndexP2 == 5 then
					if oldIndexP2 == 4 then
						self:sleep(0.2):queuecommand("LoadNonstopP2")
					else
						self:Load(cardpath.."/NONSTOP P2.png");
					end;
					P2announcer = "ScreenSelectMaster comment nonstop";
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
	},
};

t[#t+1] = LoadActor("../"..lang.."help")..{
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
		OnCommand=cmd();AnimCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
		OffCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
	};
	LoadActor(THEME:GetPathG("_difficulty","cursor/_OK P2"))..{
		InitCommand=cmd(player,PLAYER_2;draworder,99;x,152;x,SCREEN_CENTER_X+76;y,SCREEN_CENTER_Y+84;diffusealpha,0);
		OnCommand=cmd();AnimCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
		OffCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
	};
}

return t
