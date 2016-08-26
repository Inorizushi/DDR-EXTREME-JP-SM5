return Def.ActorFrame {
	Def.ActorFrame{
		Name="DangerP1";
		Def.ActorFrame{
			Name="Single";
			BeginCommand=function(self)
				local style = GAMESTATE:GetCurrentStyle()
				local styleType = style:GetStyleType()
				local bDoubles = (styleType == 'StyleType_OnePlayerTwoSides' or styleType == 'StyleType_TwoPlayersSharedSides')
				self:visible(not bDoubles)
			end;
	HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Danger" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			Def.Quad{
				InitCommand=cmd(visible,false;FullScreen;diffuse,color("0,0,0,1"));
				ShowCommand=cmd(visible,true;diffuseblink;effectperiod,1);
				HideCommand=cmd(visible,false);
			};
			LoadActor("_danger")..{
				InitCommand=cmd(visible,false;Center;zoomto,640,480);
				ShowCommand=cmd(visible,true;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0")effectclock,"music";);
				HideCommand=cmd(visible,false);
			};
		};
	};
};
