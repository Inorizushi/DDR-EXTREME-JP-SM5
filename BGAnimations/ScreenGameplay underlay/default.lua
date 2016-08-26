local t = Def.ActorFrame{

--t[#t+1] = LoadActor("frame")..{
--	InitCommand=cmd(Center);
--};

-- Extra lifemeter under, shit breaks because lol reverse.
	Def.Quad{
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

	LoadActor("Danger");
};

return t;
