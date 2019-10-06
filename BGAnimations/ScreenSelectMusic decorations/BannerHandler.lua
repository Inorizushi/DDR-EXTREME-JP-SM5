local FL = true
local audioplaying = {rou=false,ran=false}
return Def.ActorFrame{
	InitCommand=function(s) s:xy(_screen.cx-174,_screen.cy-91) end,
	OnCommand=function(s)
		s:addx(-SCREEN_WIDTH/2.28):sleep(0.45):linear(0.267):addx(SCREEN_WIDTH/2.33):linear(0.05):addx(-6):decelerate(0.116):addx(12):decelerate(0.067):addx(-4):decelerate(0.1):addx(4)
	end,
	OffCommand=function(s) s:accelerate(0.316):addx(-SCREEN_WIDTH/2.28) end,
	CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
	Def.Sound{
		Name="RandomMusic",
		File=THEME:GetPathS("random","music"),
		PlayCommand=function(s)
			if not audioplaying.ran then SOUND:StopMusic() s:play() audioplaying.ran = true end
		end,
		StopCommand=function(s)
			if audioplaying.ran then s:stop() audioplaying.ran = false end
		end,
	},
	Def.Sound{
		Name="RouletteMusic",
		File=THEME:GetPathS("roulette","music"),
		PlayCommand=function(s)
			if not audioplaying.rou then SOUND:StopMusic() s:play() audioplaying.rou = true end
		end,
		StopCommand=function(s)
			if audioplaying.rou then s:stop() audioplaying.rou = false end
		end,
	},
	Def.ActorFrame{
		--Group/Song Fading Banner
		InitCommand=function(s) s:y(25) end,
		Def.FadingBanner{
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
				local so = GAMESTATE:GetSortOrder()
				if song then
					self:LoadFromSong(song)
					self:scaletoclipped(256,80)
					self:GetParent():GetParent():GetChild("RandomMusic"):playcommand("Stop")
					self:GetParent():GetParent():GetChild("RouletteMusic"):playcommand("Stop")
					FL = false
				elseif not FL then
					FL = true
					if so == "SortOrder_Group" then
						self:LoadFromSortOrder('SortOrder_Length')
					else
						self:LoadFromSortOrder(so)
					end;
				end
			end;
		};
		--Roulette Banner
		Def.FadingBanner{
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
				FL = false
				if song then
					FL = false
					self:visible(false)
				elseif not FL then
					FL = true
					if mw:GetSelectedType() == 'WheelItemDataType_Roulette' then
						self:LoadRoulette()
						self:visible(true)
						SOUND:StopMusic()
						self:GetParent():GetParent():GetChild("RouletteMusic"):playcommand("Play")
						self:GetParent():GetParent():GetChild("RandomMusic"):playcommand("Stop")
						FL = false
					else
						self:visible(false)
					end;
				end
			end;
		};
		--Random Banner
		Def.FadingBanner{
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
				FL = false
				if song then
					FL = false
					self:visible(false)
				elseif not FL then
					FL = true
					if mw:GetSelectedType() == 'WheelItemDataType_Random' then
						self:LoadRandom()
						self:visible(true)
						SOUND:StopMusic()
						self:GetParent():GetParent():GetChild("RandomMusic"):playcommand("Play")
						self:GetParent():GetParent():GetChild("RouletteMusic"):playcommand("Stop")
						FL = false
					else
						self:visible(false)
					end;
				end
			end;
		};
		--Cached Banner fix
		Def.Sprite{
			OnCommand=cmd(playcommand,"Set"),
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				if song then
					self:finishtweening():diffusealpha(0):Load(song:GetBannerPath())
					self:sleep(0.4):linear(0.1):diffusealpha(1)
				elseif course then
					self:y(2)
					local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
					if FILEMAN:DoesFileExist(actualpath..".png") then
						self:Load(actualpath..".png")
					else
						self:Load(THEME:GetPathG("","Common fallback banner"))
					end
				else
					self:diffusealpha(0)
				end;
				self:scaletoclipped(256,80);
			end;
		};
	},
	LoadActor("BannerFrame");
};
