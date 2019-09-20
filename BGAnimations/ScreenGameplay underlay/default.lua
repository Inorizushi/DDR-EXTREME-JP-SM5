local t = Def.ActorFrame{};

for pn in ivalues(PlayerNumber) do
	t[#t+1] = Def.ActorFrame{
		Name="Danger"..ToEnumShortString(pn),
		Def.ActorFrame{
			Name="Single",
			BeginCommand=function(self)
			local style = GAMESTATE:GetCurrentStyle()
			local styleType = style:GetStyleType()
			local bDoubles = (styleType == 'StyleType_OnePlayerTwoSides' or styleType == 'StyleType_TwoPlayersSharedSides')
				self:visible(not bDoubles)
			end;
		HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == pn then
				if param.HealthState == "HealthState_Danger" then
					self:RunCommandsOnChildren(cmd(playcommand,"Show"))
				else
					self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
				end
			end
		end;
			LoadActor("_danger")..{
				InitCommand=function(s) s:visible(false):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(640,480) end,
				ShowCommand=function(s) s:visible(true):diffuseblink():effectcolor1(color("1,1,1,1")):effectcolor2(color("0,0,0,0")):effectclock("music") end,
				HideCommand=function(s) s:visible(false) end
			};
		};
	};
end

--It's either CS or AC that displays bars on the side of the bg videos. I have to check. -Inori
t[#t+1] = LoadActor("frame")..{
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y) end
};

t[#t+1] = Def.Quad{
-- Extra lifemeter under, shit breaks because lol reverse.
	InitCommand=function(s) s:x(SCREEN_CENTER_X):diffuse( color("0,0,0,1") ) end,
	OnCommand=function(self)
		if GAMESTATE:IsAnExtraStage() == true then
			self:setsize(SCREEN_WIDTH,70)
			:y(SCREEN_BOTTOM-30):
			addy(78):linear(0.6):addy(-78);
		else
			self:setsize(SCREEN_WIDTH,58)
			:y(SCREEN_TOP+20):
			addy(-50):linear(0.6):addy(50);
		end
	end;
	OffCommand=function(self)
		if GAMESTATE:IsAnExtraStage() == true then
			self:linear(0.8):addy(78);
		else
			self:linear(0.8):addy(-58);
		end;
	end;
};

return t;
