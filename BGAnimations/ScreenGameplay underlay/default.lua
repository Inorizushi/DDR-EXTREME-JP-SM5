local t = Def.ActorFrame{

--t[#t+1] = LoadActor("frame")..{
--	InitCommand=cmd(Center);
--};

-- Extra lifemeter under, shit breaks because lol reverse.
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-78;scaletoclipped,SCREEN_WIDTH,70;diffuse,color("0,0,0,1"));
		BeginCommand=cmd(playcommand,"IsExtra");
		OnCommand=cmd(addy,78;linear,0.6;addy,-78);
		OffCommand=cmd(linear,0.8;addy,78);
		IsExtraCommand=function(self,param)
			if GAMESTATE:IsAnExtraStage() == false then
				self:visible(false)
		end
	end;
	};
	
	LoadActor("beginner")..{
		InitCommand=function(self)
			local pm = GAMESTATE:GetPlayMode()
			local isBeginner = GAMESTATE:GetEasiestStepsDifficulty() == 'Difficulty_Beginner'
			self:visible(pm == 'PlayMode_Regular' and isBeginner and ThemePrefs.Get("BeginnerHelper") == true )
		end;
	};

	LoadActor("Danger");
};

return t;