function memcardActor(player)

	return LoadActor(THEME:GetPathG("MemoryCard", "Icons"))..{
		InitCommand=cmd(vertalign,bottom;xy,THEME:GetMetric("ScreenSystemLayer","Credits"..pname(player).."X"),SCREEN_BOTTOM;zoom,2;animate,false;);
		OnCommand=cmd(visible,ToEnumShortString(MEMCARDMAN:GetCardState(player)) == 'ready');
		StorageDevicesChangedMessageCommand=function(self)
			local memCardState = ToEnumShortString(MEMCARDMAN:GetCardState(player))
			self:visible(true)
			if memCardState == 'checking' then
				self:setstate(2);
			elseif memCardState == "ready" then
				self:setstate(1);
			elseif memCardState == "none" then
				self:visible(false)
			else
				self:setstate(4)
			end;
		end;
	};
end


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
	
	-- Memory cards
	memcardActor(PLAYER_1);
	memcardActor(PLAYER_2);

	
	--[[LoadActor(THEME:GetPathG("", "USB icon"))..{
		InitCommand=cmd(horizalign,right;vertalign,bottom;xy,SCREEN_RIGHT-5,SCREEN_BOTTOM;zoom,.2);
		--OnCommand=cmd(visible,true);
		OnCommand=cmd(visible,ToEnumShortString(MEMCARDMAN:GetCardState(PLAYER_2)) == 'ready');
		StorageDevicesChangedMessageCommand=cmd(playcommand,"On");
	};]]
}