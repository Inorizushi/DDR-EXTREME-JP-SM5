local x = Def.ActorFrame{
	LoadActor("_moveon")..{ InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-10); };
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(0.01); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

x[#x+1] = Def.Quad{
	InitCommand=function(s)
		s:FullScreen():diffuse(Color.Black):draworder(100)
	  end,
	  BeginCommand=function(s)
		if GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer() == 0 then
		  s:visible(true)
		else
		  s:visible(false)
		end
	  end,
};

return x;