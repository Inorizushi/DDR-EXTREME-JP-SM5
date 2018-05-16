local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local unjoinedPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	-- Panel
	LoadActor("_panel")..{
		InitCommand=cmd(vertalign,bottom;x,SCREEN_CENTER_X-147;y,SCREEN_CENTER_Y+195;);
		OnCommand=function(self)
			if GAMESTATE:GetNumSidesJoined() == 2 then
				self:playcommand("GainFocus")
			end
		end;
		GainFocusCommand=cmd(stoptweening;diffusealpha,1;);
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0;);
		OffCommand=cmd(sleep,0.264;accelerate,0.066;zoomy,1.16;decelerate,0.066;zoomy,1;linear,0.132;diffusealpha,0);
	};

	-- Picture
	LoadActor("dancer"..masterPlayer)..{
		InitCommand=cmd(vertalign,bottom;x,SCREEN_CENTER_X-146;y,SCREEN_CENTER_Y+128;);
		BeginCommand=cmd(playcommand,"CheckNumPlayers");
		GainFocusCommand=cmd(stoptweening;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0);
		OffCommand=cmd(sleep,0.132;accelerate,0.066;zoomy,1.12;decelerate,0.066;zoomy,1;diffusealpha,0);
		CheckNumPlayersCommand=function(self,param)
			if GAMESTATE:GetNumPlayersEnabled() > 1 then
				self:visible(false)
			end
		end;
	};

};

return t;
