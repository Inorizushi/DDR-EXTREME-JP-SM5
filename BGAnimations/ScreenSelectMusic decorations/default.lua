local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
t[#t+1] = StandardDecorationFromFileOptional("SortDisplay","SortDisplay")

t[#t+1] = Def.FadingBanner{
	InitCommand=cmd(xy,_screen.cx-174,_screen.cy-66);
	OnCommand=cmd(addx,(-SCREEN_WIDTH/2.28);sleep,0.450;linear,0.267;addx,(SCREEN_WIDTH/2.33);linear,0.05;addx,-6;decelerate,0.116;addx,12;decelerate,0.067;addx,-4;decelerate,0.1;addx,4);
	OffCommand=cmd(accelerate,0.316;addx,(-SCREEN_WIDTH/2.28));
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
		local so = GAMESTATE:GetSortOrder()
		if song then
			self:LoadFromSong(song)
		elseif mw:GetSelectedType() == 'WheelItemDataType_Roulette' then
			self:LoadRoulette()
		elseif mw:GetSelectedType() == 'WheelItemDataType_Random' then
			self:LoadRandom()
		else
			if so == "SortOrder_Group" then
				self:LoadFromSortOrder('SortOrder_Length')
			else
				self:LoadFromSortOrder(so)
			end;
		end;
		self:scaletoclipped(256,80);
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};

-- difficulty icons
if ShowStandardDecoration("DifficultyIcons") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local diffFrame = LoadActor(THEME:GetPathG(Var "LoadingScreen", "DifficultyFrame"), pn)
		t[#t+1] = StandardDecorationFromTable( "DifficultyFrame" .. ToEnumShortString(pn), diffFrame );

		local diffIcon = LoadActor(THEME:GetPathG(Var "LoadingScreen", "DifficultyIcon"), pn)
		t[#t+1] = StandardDecorationFromTable( "DifficultyIcon" .. ToEnumShortString(pn), diffIcon );
	end
end

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

t[#t+1] = LoadActor("../GrooveRadar base")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-168;y,SCREEN_CENTER_Y+90;);
	BeginCommand=cmd(playcommand,"CheckCourseMode");
	OnCommand=cmd(zoom,0;rotationz,-360;sleep,0.3;decelerate,0.4;rotationz,0;zoom,1);
	OffCommand=cmd(sleep,0.4;accelerate,0.383;zoom,0;rotationz,-360);
	CheckCourseModeCommand=function(self,param)
			if GAMESTATE:IsCourseMode() == true then
				self:visible(false)
			end
		end;
}

return t
