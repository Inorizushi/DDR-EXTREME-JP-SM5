return Def.ActorFrame {
	LoadActor("choices")..{
		InitCommand=cmd(draworder,99;x,76);
		OnCommand=cmd(draworder,60;cropbottom,1;sleep,0.264;sleep,0.033;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,0;linear,0.726;cropleft,0;cropright,0);
		OffCommand=cmd(cropbottom,0;cropleft,0;cropright,0;sleep,0.726;linear,0.726;cropleft,0.493;cropright,0.493;linear,0.264;cropbottom,1);
	};
	LoadActor(THEME:GetPathG("_difficulty","cursor/_OK P1"))..{
		InitCommand=cmd(draworder,99;y,-74;diffusealpha,0);
		BeginCommand=cmd(playcommand,"CheckNumPlayers");
		OnCommand=cmd();
		OffCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
		CheckNumPlayersCommand=function(self,param)
			if GAMESTATE:IsPlayerEnabled(0) == false then
				self:visible(false)
			end
		end;
	};
	LoadActor(THEME:GetPathG("_difficulty","cursor/_OK P2"))..{
		InitCommand=cmd(draworder,99;x,152;y,-74;diffusealpha,0);
		BeginCommand=cmd(playcommand,"CheckNumPlayers");
		OnCommand=cmd();
		OffCommand=cmd(addy,68;diffusealpha,1;cropbottom,1;linear,0.083;addy,-68;cropbottom,0;decelerate,0.083;addy,-20;accelerate,0.083;addy,20;sleep,1;linear,0.1;cropright,1);
		CheckNumPlayersCommand=function(self,param)
			if GAMESTATE:IsPlayerEnabled(1) == false then
				self:visible(false)
			end
		end;
	};
};
