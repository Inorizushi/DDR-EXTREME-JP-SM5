if PREFSMAN:GetPreference("MemoryCards") then
	return LoadActor( THEME:GetPathB("_fade", "out") )
end

return LoadActor( THEME:GetPathB("_wfade", "out") )