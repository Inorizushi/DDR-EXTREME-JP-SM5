local pref = PREFSMAN:GetPreference("Premium")
local premiumItem
if pref == 'Premium_DoubleFor1Credit' then premiumItem = "doubles"
elseif pref == 'Premium_2PlayersFor1Credit' then premiumItem = "joint"
end

local t = Def.ActorFrame{}

if premiumItem ~= "" then
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenTitleJoin","Messages/_premium "..premiumItem))..{
		OnCommand=function(self) self:texcoordvelocity(0.25,0):SetTextureFiltering(false) end,
	}
end

return t