local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
t[#t+1] = StandardDecorationFromFileOptional("SortDisplay","SortDisplay")
t[#t+1] = LoadActor("BannerHandler.lua");
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("diff/default.lua");
end;

t[#t+1] = StandardDecorationFromFileOptional("GrooveRadar","GrooveRadar")

-- StepsDisplay
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState(player);
	end

	local name = "StepsDisplaySelMusic";

	local sd = Def.StepsDisplay {
		InitCommand=cmd(Load,name..ToEnumShortString(pn),GAMESTATE:GetPlayerState(pn););
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if not song then
				-- hacky hack 1: set all feet to nothing!
				self:GetChild("Ticks"):settext("0000000000");
				-- hacky hack 2: diffuse to beginner
				self:GetChild("Ticks"):diffuse(CustomDifficultyToColor("Beginner"))
			end
		end;
	};

	if pn == PLAYER_1 then
		sd.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
		sd.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	else
		sd.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
		sd.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	end

	return sd;
end

-- song options text (e.g. 1.5xmusic)
t[#t+1] = StandardDecorationFromFileOptional("SongOptions","SongOptions")

-- other items (balloons, etc.)

t[#t+1] = StandardDecorationFromFile( "Balloon", "Balloon" );

t[#t+1] = LoadActor("GrooveRadar base")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-168;y,SCREEN_CENTER_Y+90;);
	OnCommand=cmd(zoom,0;rotationz,-360;sleep,0.3;decelerate,0.4;rotationz,0;zoom,1);
	OffCommand=cmd(sleep,0.4;accelerate,0.383;zoom,0;rotationz,-360);
	BeginCommand=function(self,param)
			if GAMESTATE:IsCourseMode() == true then
				self:visible(false)
			end
		end;
}

return t
