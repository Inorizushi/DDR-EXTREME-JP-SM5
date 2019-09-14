local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local unjoinedPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	-- Panel
	LoadActor("_panel")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-148;y,SCREEN_CENTER_Y+191;);
		OnCommand=cmd(valign,1;diffusealpha,0;sleep,1.1;diffusealpha,0;linear,0.1;diffusealpha,1;zoomy,1;decelerate,0.066;zoomy,1.2;accelerate,0.066;zoomy,1);
		GainFocusCommand=cmd(stoptweening;visible,true);
		LoseFocusCommand=cmd(stoptweening;visible,false);
		OffCommand=cmd(zoomy,1;sleep,0.133;zoomy,1;linear,0.066;zoomy,1.2;sleep,0;linear,0.066;zoomy,1;diffusealpha,1;linear,0.132;diffusealpha,0);
	};

	-- Picture
	LoadActor("dancer"..masterPlayer)..{
		InitCommand=cmd(x,SCREEN_CENTER_X-148;y,SCREEN_CENTER_Y+137);
		BeginCommand=cmd(playcommand,"CheckNumPlayers");
		OnCommand=cmd(valign,1;diffusealpha,0;sleep,1.333;linear,0.117;diffusealpha,1;decelerate,0.066;zoomy,1.2;accelerate,0.066;zoomy,1);
		GainFocusCommand=cmd(stoptweening;visible,true);
		LoseFocusCommand=cmd(stoptweening;visible,false);
		OffCommand=cmd(zoomy,1;sleep,0;accelerate,0.066;zoomy,1.2;decelerate,0.066;zoomy,1;linear,0;diffusealpha,0);
		CheckNumPlayersCommand=function(self,param)
			if GAMESTATE:GetNumPlayersEnabled() > 1 then
				self:visible(false)
			end
		end;
	};

};

return t;
