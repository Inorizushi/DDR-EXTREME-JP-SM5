local player = ...
local modifierlist = {
	Position = { -220,-139,-60,20,180,260 },
	{ "1.5x","2x","3x","5x","8x" }, -- Speed
	{ "boost", "brake", "wave" }, -- Boost
	{ "hidden","sudden","stealth" }, -- Appearance
	{ "mirror","left","right","shuffle" }, -- Turn
	{ "reverse" }, -- Misc1
	{ "noholds" }, -- Misc2
}
local t = Def.ActorFrame{}
	for i,v in ipairs(modifierlist.Position) do
		t[#t+1] = Def.Sprite{
			OnCommand=function(s)
				s:x(v)
				for v in ivalues(modifierlist[ i ]) do
					if GAMESTATE:PlayerIsUsingModifier(player,v) then
						s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..v..".png") )
					end
				end
			end;
		}
	end
return t;