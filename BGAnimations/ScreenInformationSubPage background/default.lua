local index = tonumber(getenv("InfoIndex"))

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenInformation","background"))..{
			InitCommand=cmd();
	};
--	LoadActor("Untitled-1")..{
--			InitCommand=cmd(Center);
--	};
--	LoadActor("../_infosub bar")..{
--			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-125);
--			OnCommand=cmd(visible,false;sleep,0.4;visible,true);
--			OffCommand=cmd(visible,false);
--	};
}
return t;