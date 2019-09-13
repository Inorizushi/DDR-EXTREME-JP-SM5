local FL = true
return Def.ActorFrame{
	InitCommand=cmd(xy,_screen.cx-174,_screen.cy-66);
	OnCommand=cmd(addx,(-SCREEN_WIDTH/2.28);sleep,0.450;linear,0.267;addx,(SCREEN_WIDTH/2.33);linear,0.05;addx,-6;decelerate,0.116;addx,12;decelerate,0.067;addx,-4;decelerate,0.1;addx,4);
	OffCommand=cmd(accelerate,0.316;addx,(-SCREEN_WIDTH/2.28));
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	Def.FadingBanner{
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
			local so = GAMESTATE:GetSortOrder()
			if song then
				self:LoadFromSong(song)
				self:scaletoclipped(256,80)
				FL = false
			elseif not FL then
				FL = true
				if mw:GetSelectedType() == 'WheelItemDataType_Roulette' then
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
			end
		end;
	};
	Def.Banner{
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				self:finishtweening():diffusealpha(0):LoadFromSong(song)
				self:sleep(0.4):linear(0.1):diffusealpha(1)
			else
				self:diffusealpha(0)
			end;
			self:scaletoclipped(256,80);
		end;
	};
};
