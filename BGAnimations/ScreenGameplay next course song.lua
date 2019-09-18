-- BeforeLoadingNextCourseSongMessageCommand
-- StartCommand
-- ChangeCourseSongInMessageCommand
-- ChangeCourseSongOutMessageCommand
-- FinishCommand

-- in stars
local distanceIn = SCREEN_WIDTH*1.7

local leftToRightIn = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenGameplay","in/LeftToRight"));
	Def.Quad{
		InitCommand=cmd(addx,64;diffuse,color("#000000FF");halign,0;zoomto,distanceIn,32);
	};
}

local rightToLeftIn = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenGameplay","in/RightToLeft"));
	Def.Quad{
		InitCommand=cmd(halign,1;zoomto,distanceIn,32;diffuse,color("0,0,0,1");addx,64);
	};
}

-- out stars
local distanceOut = SCREEN_WIDTH*1.5

local leftToRightOut = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenGameplay","in/LeftToRight"));
	Def.Quad{
		InitCommand=cmd(addx,-64;diffuse,color("#000000FF");halign,1;zoomto,distanceOut,32);
	};
}

local rightToLeftOut = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenGameplay","in/RightToLeft"));
	Def.Quad{
		InitCommand=cmd(addx,64;diffuse,color("#000000FF");halign,0;zoomto,distanceOut,32);
	};
}

return Def.ActorFrame{
	Def.ActorFrame{
		Name="StarsIn";

		-- left to right
		leftToRightIn..{
			InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y-176);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		leftToRightIn..{
			InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y-112);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		leftToRightIn..{
			InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y-48);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		leftToRightIn..{
			InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_CENTER_Y+16);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		leftToRightIn..{
			InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_CENTER_Y+80);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		leftToRightIn..{
			InitCommand=cmd(x,SCREEN_LEFT-384;y,SCREEN_CENTER_Y+144);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};

		-- right to left
		rightToLeftIn..{
			InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y-176;addx,distanceIn;addy,32);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,-distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		rightToLeftIn..{
			InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y-112;addx,distanceIn;addy,32);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,-distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		rightToLeftIn..{
			InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y-48;addx,distanceIn;addy,32);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,-distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		rightToLeftIn..{
			InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_CENTER_Y+16;addx,distanceIn;addy,32);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,-distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		rightToLeftIn..{
			InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_CENTER_Y+80;addx,distanceIn;addy,32);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,-distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
		rightToLeftIn..{
			InitCommand=cmd(x,SCREEN_LEFT-384;y,SCREEN_CENTER_Y+144;addx,distanceIn;addy,32);
			ChangeCourseSongInMessageCommand=cmd(sleep,1;linear,1;addx,-distanceIn);
			ChangeCourseSongOutMessageCommand=cmd(visible,false);
		};
	};

	Def.ActorFrame{
		Name="StarsOut";

		-- left to right
		leftToRightOut..{
			InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y-192);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,distanceOut);
			FinishCommand=cmd(visible,false);
		};
		leftToRightOut..{
			InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y-128);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,distanceOut);
			FinishCommand=cmd(visible,false);
		};
		leftToRightOut..{
			InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y-64);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,distanceOut);
			FinishCommand=cmd(visible,false);
		};
		leftToRightOut..{
			InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_CENTER_Y);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,distanceOut);
			FinishCommand=cmd(visible,false);
		};
		leftToRightOut..{
			InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y+64);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,distanceOut);
			FinishCommand=cmd(visible,false);
		};
		leftToRightOut..{
			InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y+128);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,distanceOut);
			FinishCommand=cmd(visible,false);
		};
		leftToRightOut..{
			InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y+192);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,distanceOut);
			FinishCommand=cmd(visible,false);
		};

		-- right to left
		rightToLeftOut..{
			InitCommand=cmd(x,SCREEN_LEFT+64;y,SCREEN_CENTER_Y-224;addx,SCREEN_WIDTH;);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,-distanceOut);
			FinishCommand=cmd(visible,false);
		};
		rightToLeftOut..{
			InitCommand=cmd(x,SCREEN_LEFT+128;y,SCREEN_CENTER_Y-160;addx,SCREEN_WIDTH;);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,-distanceOut);
			FinishCommand=cmd(visible,false);
		};
		rightToLeftOut..{
			InitCommand=cmd(x,SCREEN_LEFT+192;y,SCREEN_CENTER_Y-96;addx,SCREEN_WIDTH;);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,-distanceOut);
			FinishCommand=cmd(visible,false);
		};
		rightToLeftOut..{
			InitCommand=cmd(x,SCREEN_LEFT+256;y,SCREEN_CENTER_Y-32;addx,SCREEN_WIDTH;);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,-distanceOut);
			FinishCommand=cmd(visible,false);
		};
		rightToLeftOut..{
			InitCommand=cmd(x,SCREEN_LEFT+256;y,SCREEN_CENTER_Y+32;addx,SCREEN_WIDTH;);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,-distanceOut);
			FinishCommand=cmd(visible,false);
		};
		rightToLeftOut..{
			InitCommand=cmd(x,SCREEN_LEFT+192;y,SCREEN_CENTER_Y+96;addx,SCREEN_WIDTH;);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,-distanceOut);
			FinishCommand=cmd(visible,false);
		};
		rightToLeftOut..{
			InitCommand=cmd(x,SCREEN_LEFT+128;y,SCREEN_CENTER_Y+160;addx,SCREEN_WIDTH;);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,-distanceOut);
			FinishCommand=cmd(visible,false);
		};
		rightToLeftOut..{
			InitCommand=cmd(x,SCREEN_LEFT+64;y,SCREEN_CENTER_Y+224;addx,SCREEN_WIDTH;);
			ChangeCourseSongInMessageCommand=cmd(visible,false);
			ChangeCourseSongOutMessageCommand=cmd(visible,true;sleep,1;linear,1;addx,-distanceOut);
			FinishCommand=cmd(visible,false);
		};
	};

	-- song banner
	Def.Banner{
		Name="SongBanner";
		InitCommand=cmd(Center;scaletoclipped,256,80;diffusealpha,0);
		StartCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse()
			local entry = course:GetCourseEntry(GAMESTATE:GetLoadingCourseSongIndex())
			self:LoadFromSong(entry:GetSong())

			self:linear(0.5)
			self:diffusealpha(1)
		end;
		ChangeCourseSongOutMessageCommand=cmd(sleep,1;linear,0.5;diffusealpha,0);
	};
};