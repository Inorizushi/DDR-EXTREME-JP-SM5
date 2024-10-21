function InitUserPrefs()
	local Prefs = {
		UserPrefScoringMode = 'DDR Extreme',
		UserPrefProtimingP1 = false,
		UserPrefProtimingP2 = false,
	}
	for k, v in pairs(Prefs) do
		-- kind of xxx
		local GetPref = type(v) == "boolean" and GetUserPrefB or GetUserPref
		if GetPref(k) == nil then
			SetUserPref(k, v)
		end
	end
end

function SetPreferences()
	local EXPref = {
		PercentageScoring = 1,
		AllowW1 = "AllowW1_CoursesOnly",
	}
	for k, v in pairs(EXPref) do
		PREFSMAN:SetPreference(k, v)
	end
end

local Prefs = {
	Language = 
	{
		Default = "jp",
		Choices = {"Japanese","English"},
		Values = {"jp","en"}
	},
}

ThemePrefs.InitAll(Prefs)

lang = ThemePrefs.Get("Language")
function ChangeLanguage()
	if ThemePrefs.Get("Language") == "jp" then
		lang = "jp"
	else
		lang="en"
	end
end
