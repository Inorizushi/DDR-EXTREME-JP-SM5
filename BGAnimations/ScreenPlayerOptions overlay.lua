local t = Def.ActorFrame{}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = loadfile( THEME:GetPathB("ScreenSelectMusic","decorations/modicons") )(pn)..{
		InitCommand=function(s) s:draworder(100) end,
    }
end;

return t;