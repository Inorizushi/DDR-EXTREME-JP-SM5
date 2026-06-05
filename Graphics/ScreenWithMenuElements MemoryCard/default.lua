local t = {};

local memCardEnabled = PREFSMAN:GetPreference("MemoryCards");
if memCardEnabled then
	function memcardActor(player)
		local plrOffset = player == PLAYER_1 and 0 or 5
		return LoadActor(THEME:GetPathG("MemoryCard", "Icons"))..{
			OnCommand=function(self)
				self:visible(ToEnumShortString(MEMCARDMAN:GetCardState(player)) == 'ready')
				self:x( player == PLAYER_1 and 0 or 24 )
				self:animate(0)
				if PROFILEMAN:ProfileWasLoadedFromMemoryCard(player) then
					self:setstate(plrOffset+3)
				end
			end,
			StorageDevicesChangedMessageCommand=function(self)
				local memCardState = ToEnumShortString(MEMCARDMAN:GetCardState(player))
				self:visible(true)
				if memCardState == 'checking' then
					self:setstate(plrOffset+2);
				elseif memCardState == "ready" then
					self:setstate(plrOffset+3);
				elseif memCardState == "none" then
					self:visible(false)
				else
					self:setstate(plrOffset+4)
				end;
			end;
		};
	end

	return Def.ActorFrame{
		memcardActor(PLAYER_1),
		memcardActor(PLAYER_2)
	}
else
	return Def.Actor {};
end
