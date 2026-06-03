return Def.ActorFrame{
	Def.Sprite{
		Texture=THEME:GetPathB("ScreenLogo","background/bg.png");
		InitCommand=cmd(Center);
	};
	--[[LoadActor("a")..{
		InitCommand=cmd(Center);
	};]]
	LoadActor("start")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_BOTTOM-70;diffuseblink;linear,0.5;effectcolor1,color(".5,.5,.5,1"));
	};
	
	--[[LoadActor(THEME:GetPathG("", "USB icon"))..{
		InitCommand=cmd(horizalign,right;vertalign,bottom;xy,SCREEN_RIGHT-5,SCREEN_BOTTOM;zoom,.2);
		--OnCommand=cmd(visible,true);
		OnCommand=cmd(visible,ToEnumShortString(MEMCARDMAN:GetCardState(PLAYER_2)) == 'ready');
		StorageDevicesChangedMessageCommand=cmd(playcommand,"On");
	};]]
}