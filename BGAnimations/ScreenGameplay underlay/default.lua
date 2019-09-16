local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
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
				ShowCommand=cmd(visible,true;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("0,0,0,0");effectperiod,0;effectclock,"music";);
				HideCommand=cmd(visible,false);
			};
		};
	};
	Def.ActorFrame{
		Name="DangerP2";
		Def.ActorFrame{
			Name="Single";
			BeginCommand=function(self)
			local style = GAMESTATE:GetCurrentStyle()
			local styleType = style:GetStyleType()
			local bDoubles = (styleType == 'StyleType_OnePlayerTwoSides' or styleType == 'StyleType_TwoPlayersSharedSides')
				self:visible(not bDoubles)
			end;
		HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == PLAYER_2 then
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
				ShowCommand=cmd(visible,true;diffuseshift;effectcolor1,color("0,0,0,1");effectcolor2,color("0,0,0,0")effectclock,"music";);
				HideCommand=cmd(visible,false);
			};
		};
	};
};

--It's either CS or AC that displays bars on the side of the bg videos. I have to check. -Inori
t[#t+1] = LoadActor("frame")..{
	InitCommand=cmd(Center);
};

t[#t+1] = Def.Quad{
-- Extra lifemeter under, shit breaks because lol reverse.
	InitCommand=cmd(CenterX;diffuse,color("0,0,0,1"));
	OnCommand=function(self)
		if GAMESTATE:IsAnExtraStage() == true then
			self:setsize(SCREEN_WIDTH,70)
			:y(SCREEN_BOTTOM-78):
			addy(78):linear(0.6):addy(-78);
		else
			self:setsize(SCREEN_WIDTH,58)
			:y(SCREEN_TOP+20):
			addy(-50):linear(0.6):addy(50);
		end
	end;
	OffCommand=function(self)
		if GAMESTATE:IsAnExtraStage() == true then
			self:linear(0.8);addy(78);
		else
			self:linear(0.8):addy(-58);
		end;
	end;
};

return t;
