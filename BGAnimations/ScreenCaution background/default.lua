return Def.ActorFrame{
	LoadActor("caution")..{
		InitCommand=cmd(Center);
		OnCommand=function(self)
			if GAMESTATE:Dopefish() then self:rotationz(180) end
		end;
	}
	
}