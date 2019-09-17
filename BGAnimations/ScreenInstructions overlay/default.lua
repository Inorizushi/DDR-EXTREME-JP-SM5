return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		OnCommand=function(s) s:play() end,
		OffCommand=function(s) s:play() end
	};
	LoadActor("../_moveon")..{
		InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-10) end
	};
	Def.Sprite{
		InitCommand=function(s) s:xy(-640/2,SCREEN_CENTER_Y) end,
		OnCommand=function(s) s:decelerate(.5):x(SCREEN_CENTER_X) end,
		OffCommand=function(s) s:accelerate(.5):x(SCREEN_WIDTH+640/2) end,
		BeginCommand=function(self)
			local GM = GAMESTATE:GetPlayMode()
			if GM == 'PlayMode_Nonstop' then
				self:Load(THEME:GetPathB("","ScreenInstructions overlay/Nonstop.png"));
			elseif GM == 'PlayMode_Oni' then
				self:Load(THEME:GetPathB("","ScreenInstructions overlay/Oni.png"));
			else
				self:Load(THEME:GetPathB("","ScreenInstructions overlay/Normal.png"));
			end;
		end;
	};

};
