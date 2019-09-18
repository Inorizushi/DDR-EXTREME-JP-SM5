-- ScreenMusicScroll overlay
-- todo: sort the songs somehow

local allSongs = SONGMAN:GetAllSongs();

local songCollection = allSongs

-- REALLY SLOW; I'd like to have a binding to SongUtil::SortSongPointersByTitle,
-- but trying to get it to work with Lua tables is sucky.
--[[
local function SortSongsByTitle(song1,song2)
	local title1 = song1:GetTranslitFullTitle()
	local title2 = song2:GetTranslitFullTitle()

	local char1 = string.lower(title1:sub(1,1))
	local char2 = string.lower(title2:sub(1,1))

	local val1 = string.byte(char1)
	local val2 = string.byte(char2)

	return (val1 < val2)
end

table.sort(songCollection,function(a,b) return SortSongsByTitle(a,b) end)
--]]

local function MakeSongItem(song)
	return LoadFont("MusicList titles")..{
		Text=song:GetTranslitFullTitle();
		InitCommand=cmd(diffuse,SONGMAN:GetSongColor(song));
	};
end;

local scrollerChildren = {};
for song in ivalues(songCollection) do
	table.insert(scrollerChildren,Def.ActorFrame{ MakeSongItem(song) })
end;

local secondsPerItem = 0.142
local paddingBefore = 8
local paddingAfter = 8

return Def.ActorFrame{
	Def.ActorScroller{
		SecondsPerItem=secondsPerItem;
		NumItemsToDraw=36;
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-88);
		BeginCommand=function(self)
			SCREENMAN:GetTopScreen():PostScreenMessage( 'SM_MenuTimer', (secondsPerItem * (#scrollerChildren + paddingBefore + paddingAfter)) );
		end;
		OnCommand=cmd(ScrollWithPadding,paddingBefore,paddingAfter);
		TransformFunction=function(self,offset,itemIndex,numItems)
			self:y(offset * 44);
		end;
		children = scrollerChildren;
	};
};
