-- xxx: this isn't working; need a setenv hack?
--[[
local prevScreen = Var "PreviousScreen"
return prevScreen == "ScreenSongOptions" and LoadActor(THEME:GetPathB("_options","to options")) or LoadActor(THEME:GetPathB("_fade in","sound"))
--]]

return LoadActor(THEME:GetPathB("_fade in","sound"))