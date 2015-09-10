local t = Def.ActorFrame{};

-- used on most menu element screens
t[#t+1] = StandardDecorationFromFileOptional("Header","Header");
t[#t+1] = StandardDecorationFromFileOptional("Footer","Footer");
--t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFileOptional("Help", "Help");

-- only used on a few screens (namely SelMusic and Evaluation)
t[#t+1] = StandardDecorationFromFileOptional("StageDisplay", "StageDisplay");

return t