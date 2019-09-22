local t =  Def.ActorFrame{}

-- if something was unlocked, the ItemThatWasJustUnlocked variable will have been set
-- to be a path in the UnlockSomeStuffMaybe() function in your ./Scripts/Unlock.lua file
if GAMESTATE:Env()["ItemThatWasJustUnlocked"] then
	-- regardless of banner or not-banner, display some reward text
	t[#t+1] = LoadFont("Common normal")..{
		Name="RewardText",
		InitCommand=cmd(xy, _screen.cx, 110; zoom,1.25),
		OnCommand=function(self)
			self:settext("You have unlocked: " .. tostring(GAMESTATE:Env()["ItemThatWasJustUnlocked"]))
		end
	}
	-- this is a sound to be played upon a successful unlock
	-- this looks in your theme's ./Sounds/ directory for a file called "_unlock.ogg"
	t[#t+1] = LoadActor( THEME:GetPathS("", "_unlock.ogg")	)..{ Name="songUnlocked"; }
	-- play that sound
	t.OnCommand=function(self)
		if song then
			self:GetChild("songUnlocked"):play()
		end
	end

-- otherwise, nothing was unlocked, and the path variable is nil
else

	t[#t+1] = LoadFont("Common normal")..{
		Name="FailureText",
		Text="Not quite...",
		InitCommand=cmd(xy, _screen.cx,_screen.cy-50; zoom,1.4)
	}

	-- this is a sound to be played upon a failure to unlock
	-- this looks in your theme's ./Sounds/ directory for a file called "_unlockFail.ogg"
	t[#t+1] = LoadActor( THEME:GetPathS("", "_unlockFail.mp3") )..{ Name="songNotUnlocked" }

	-- play that sound
	t.OnCommand=function(self)
		self:GetChild("songNotUnlocked"):play()
	end
end

return t
