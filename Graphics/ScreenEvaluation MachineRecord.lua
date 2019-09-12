local Player = ...
assert(Player,"MachineRecord needs Player")
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
local record = stats:GetMachineHighScoreIndex()
local hasMachineRecord = record ~= -1
local t = Def.ActorFrame {};
t[#t+1] = LoadActor("Machine Record")..{
	BeginCommand=function(self)
		self:visible(hasMachineRecord);
	end;
};

return t
