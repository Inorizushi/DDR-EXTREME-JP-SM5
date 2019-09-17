local FL = true
return Def.ActorFrame{
	InitCommand=cmd(xy,_screen.cx-168,_screen.cy-79);
	OnCommand=cmd(addx,(-SCREEN_WIDTH/(2.18));sleep,0.450;linear,0.267;addx,(SCREEN_WIDTH/(2.18))+6;linear,0.05;addx,-6;decelerate,0.116;addx,12;decelerate,0.067;addx,-4;decelerate,0.1;addx,4);
	OffCommand=cmd(accelerate,0.316;addx,(-SCREEN_WIDTH/2.1));
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	--Cached Banner fix
	Def.Sprite{
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse()
			if course then
				self:y(15)
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
	LoadActor("BannerFrame.png");
	Def.Sprite{
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse()
			if course then
				self:xy(-74,72):halign(0)
				local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
				if FILEMAN:DoesFileExist(actualpath.."-card.png") then
					self:Load(actualpath.."-card.png")
					self:diffusealpha(1)
					self:diffuse(color(ListColor[course:GetDisplayFullTitle()]))
				else
					self:diffusealpha(0)
				end
			else
				self:diffusealpha(0)
			end;
		end;
	};
	Def.Sprite{
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse()
			if course then
				self:xy(0,-48)
				local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
				if FILEMAN:DoesFileExist(actualpath.."-exp.png") then
					self:Load(actualpath.."-exp.png")
					self:diffusealpha(1)
				else
					self:diffusealpha(0)
				end
			else
				self:diffusealpha(0)
			end;
		end;
	}
};
