return Def.ActorFrame{
	Def.Sprite{
		Texture=THEME:GetPathB("ScreenLogo","background/bg.png");
		InitCommand=cmd(Center);
	};
	--[[LoadActor("a")..{
		InitCommand=cmd(Center);
	};]]
	LoadActor("start")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_BOTTOM-70;diffuseblink;effectperiod,0.3;linear,0.5;effectcolor1,color(".5,.5,.5,1"));
	};

	Def.ActorFrame{
		Condition=PREFSMAN:GetPreference("MemoryCards"),
		InitCommand=function(self)
			self:Center():y(SCREEN_CENTER_Y-16)
			:diffuseshift():effectperiod(1.25)
			:effectcolor1(color("0.5,0.5,0.5,1"))
		end;
		LoadActor( THEME:GetPathB("ScreenProfileLoad","overlay/jp_Warning3") )..{
			InitCommand=function(self)
				self:x(-80)
			end;
		};

		LoadActor("jp_memcapable1")..{
			InitCommand=function(self)
				self:x(110)
			end;
		};

		LoadActor("jp_memcapable2")..{
			InitCommand=function(self)
				self:y(40):diffuse(color("1,1,0.4,1"))
			end;
		};
	},

	LoadActor(THEME:GetPathG("ScreenTitleJoin","Premium")) .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y( SCREEN_CENTER_Y+100 )
		end
	}
	
	--[[LoadActor(THEME:GetPathG("", "USB icon"))..{
		InitCommand=cmd(horizalign,right;vertalign,bottom;xy,SCREEN_RIGHT-5,SCREEN_BOTTOM;zoom,.2);
		--OnCommand=cmd(visible,true);
		OnCommand=cmd(visible,ToEnumShortString(MEMCARDMAN:GetCardState(PLAYER_2)) == 'ready');
		StorageDevicesChangedMessageCommand=cmd(playcommand,"On");
	};]]
}