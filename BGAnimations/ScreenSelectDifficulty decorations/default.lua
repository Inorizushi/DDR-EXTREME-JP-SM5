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


for i=1,2 do
t[#t+1] = Def.ActorFrame{
	InitCommand=function(self) self:x(i == 2 and _screen.cx+156 or _screen.cx-156):y(_screen.cy-14) end;
	LoadActor( "null" )..{
		OnCommand=function(s)
			if i == 2 then s:zoomx(-1) end
			s:cropright(1):sleep(0.396):cropright(0.936):cropbottom(1):linear(0.264):cropbottom(0):cropright(0.936):linear(0.396):cropright(0)
		end,
		OffCommand=function(s) s:sleep(1.233):linear(0.333):cropright(0.936):sleep(0.016):linear(0.267):cropbottom(1) end,
	};
	LoadActor( "innull" )..{
		OnCommand=function(s)
			s:y(19)
			if i == 2 then 
				s:x(119):halign(1):addx(240):cropright(1):sleep(0.66):linear(0.396):addx(-240):cropright(0)
			else 
				s:x(-119):halign(0):addx(-240):cropleft(1):sleep(0.66):linear(0.396):addx(240):cropleft(0)
			end
		end,
		OffCommand=function(s)
			s:sleep(1.236):linear(0.341)
			if i == 2 then s:cropright(1):addx(240)
			else s:cropleft(1):addx(-240)
			end
		end,
	};
};
end

t[#t+1] = LoadActor("bar")..{
	InitCommand=function(s)
		s:xy(_screen.cx,SCREEN_CENTER_Y+154):draworder(98)
		s:MaskDest():ztestmode("ZTestMode_WriteOnFail")
	end,
};

local xPos = {_screen.cx-228,_screen.cx-76,_screen.cx+76,_screen.cx+228,_screen.cx-76,_screen.cx+73};

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
						self:sleep(0.2):queuecommand("SetHeavyP1")
					else
						self:x(_screen.cx+228);
					end
				elseif curIndexP1 == 5  then
					if oldIndexP1 == 4 or oldIndexP2 == 4 then
						self:sleep(0.2):queuecommand("SetNonstopP1")
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
						self:sleep(0.2):queuecommand("SetHeavyP2")
					else
						self:x(_screen.cx+228);
					end
				elseif curIndexP2 == 5 then
					if oldIndexP2 == 4 or oldIndexP1 == 4 then
						self:sleep(0.2):queuecommand("SetNonstopP2")
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
		OnCommand=cmd(queuecommand,"Set";cropbottom,1;cropright,0.936;sleep,0.417;linear,0.267;cropbottom,0;sleep,0.016;linear,0.35;cropright,0);
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

t[#t+1] = LoadActor("../help")..{
	InitCommand=function(s) s:xy(_screen.cx-165,SCREEN_BOTTOM-33.5) end,
	OnCommand=function(s) s:draworder(199):diffuseblink():effectperiod(0.5) end,
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_TOP+58;draworder,100);
	LoadActor("explanation")..{
		InitCommand=cmd(x,SCREEN_LEFT+136);
		OnCommand=function(self)
			self:draworder(99):diffusealpha(0):sleep(0.264):diffusealpha(1);
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

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.ActorFrame{
		LoadActor(ToEnumShortString(pn))..{
			InitCommand=function(s)
				s:xy(pn == "PlayerNumber_P2" and _screen.cx+34 or _screen.cx-24,_screen.cy-160):valign(0)
			end,
			OnCommand=function(s) s:zoomy(0):sleep(0.134):linear(0.25):zoomy(1) end,
			OffCommand=function(s) s:sleep(1.566):linear(0.267):zoomy(0) end,
		},
		LoadActor("cursor/_OK "..ToEnumShortString(pn))..{
			InitCommand=function(s) s:draworder(99):x(pn == "PlayerNumber_P2" and _screen.cx+76 or _screen.cx-76):y(_screen.cy+84):diffusealpha(0) end,
			AnimCommand=function(s) s:addy(68):diffusealpha(1):cropbottom(1):linear(0.083):addy(-68):cropbottom(0):decelerate(0.083):addy(-20):accelerate(0.083):addy(20):sleep(1):linear(0.1)
				if pn == PLAYER_1 then
					s:cropright(1)
				else
					s:cropleft(1)
				end
			end,
			OffCommand=function(s) s:playcommand("Anim") end,
		},
	}
end

return t
