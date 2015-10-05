local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local unjoinedPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	-- Information panel
	LoadActor("_info")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y+9;);
		OnCommand=cmd(draworder,90;zoomy,0;sleep,0.264;zoomy,0.079;linear,0.25;zoomy,1.125;linear,0.1;zoomy,0.914;linear,0.1;zoomy,1.052;linear,0.083;zoomy,0.973;linear,0.066;zoomy,1);
		GainFocusCommand=cmd(stoptweening;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0);
		OffCommand=cmd(sleep,0.183;linear,0.066;zoomy,0.973;linear,0.083;zoomy,1.052;linear,0.1;zoomy,0.914;linear,0.1;zoomy,1.125;linear,0.25;zoomy,0.079;linear,0;diffusealpha,0);
	};
	
	-- Panel
	LoadActor("_panel")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-147;y,SCREEN_CENTER_Y+195;);
		OnCommand=cmd(vertalign,bottom;diffusealpha,0;sleep,0.264;sleep,0.792;linear,0.132;diffusealpha,1;decelerate,0.066;zoomy,1.16;accelerate,0.066;zoomy,1);
		GainFocusCommand=cmd(stoptweening;diffusealpha,1;);
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0;);
		OffCommand=cmd(sleep,0.264;accelerate,0.066;zoomy,1.16;decelerate,0.066;zoomy,1;linear,0.132;diffusealpha,0);
	};

	-- Picture
	LoadActor("dancer"..masterPlayer)..{
		InitCommand=cmd(x,SCREEN_CENTER_X-147;y,SCREEN_CENTER_Y+140);
		BeginCommand=cmd(playcommand,"CheckNumPlayers");
		OnCommand=cmd(vertalign,bottom;draworder,90;diffusealpha,0;sleep,0.264;sleep,0.792;sleep,0.264;linear,0.132;diffusealpha,1;decelerate,0.066;zoomy,1.12;accelerate,0.066;zoomy,1);
		GainFocusCommand=cmd(diffusealpha,1);
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