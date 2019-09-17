local t = Def.ActorFrame{}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("ScreenSelectMusic decorations/modicons/default.lua")..{
		InitCommand=cmd(draworder,100);
	};
end;

return t;