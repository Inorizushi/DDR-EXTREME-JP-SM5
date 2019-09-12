local t = Def.ActorFrame{};

-- The math.floor(10000*aspect) trick is used to circumvent float precision problems.
local aspectRatioSuffix = {
	[math.floor(10000*4/3)] = " 4_3",
	[math.floor(10000*16/9)] = " 16_9",
	[math.floor(10000*16/10)] = " 16_9"
}

local bg = "back"

--fall back on the 4:3 frame if we don't know about this aspect ratio at all
setmetatable(aspectRatioSuffix,{__index=function() return " standard" end})
local suffix = aspectRatioSuffix[math.floor(10000*PREFSMAN:GetPreference("DisplayAspectRatio"))]

-- fall back on the 4:3 frame if there's no frame available for this aspect ratio
if ResolveRelativePath(bg..suffix,1,true) then
	bg = bg .. suffix
else
	Warn("ScreenGameplay LifeFrame: missing frame \""..bg..suffix.."\". Using fallback assets.")
	bg = bg.." 4_3"
end

t[#t+1] = Def.Sprite{
	InitCommand=function(self)
		self:Load(THEME:GetPathB("","ScreenWithMenuElements background/"..bg))
		self:Center()
	end;
};
t[#t+1] = LoadActor("../time_slash")..{
	InitCommand=cmd(x,SCREEN_RIGHT-54;y,SCREEN_TOP+26;draworder,99);
};

return t
