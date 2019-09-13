return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		OnCommand=cmd(play);
		OffCommand=cmd(play);
	};
	LoadActor("../_moveon")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-10);
	};
	Def.Sprite{
		InitCommand=cmd(xy,-640/2,SCREEN_CENTER_Y);
		OnCommand=cmd(decelerate,.5;x,SCREEN_CENTER_X);
		OffCommand=cmd(accelerate,.5;x,SCREEN_WIDTH+640/2);
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
