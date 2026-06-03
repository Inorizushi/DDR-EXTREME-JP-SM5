local grades = {
	Grade_Tier01 = 2;
	Grade_Tier02 = 2;
	Grade_Tier03 = 4;
	Grade_Tier04 = 6;
	Grade_Tier05 = 8;
	Grade_Tier06 = 10;
	Grade_Tier07 = 12;
	Grade_Failed = 0;
	Grade_None = 0;
};

local t = LoadActor( "grades" ) .. {
	InitCommand=function(self) self:pause() end,
	SetGradeCommand=function(self, params)
		-- The grade should only appear for the player who has a valid profile to set the data to.
		if not PROFILEMAN:IsPersistentProfile(params.PlayerNumber) then
			self:zoom(0)
		end

		local state = grades[params.Grade] or grades.Grade_None;
		local offset = params.PlayerNumber == PLAYER_1 and 0 or 1
		self:setstate(state+offset);
	end;
};

return t