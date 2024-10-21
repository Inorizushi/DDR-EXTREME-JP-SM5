-- LoadModule is by default included in 5.3, If people use 5.1 load 5.3's version manualy.
if not LoadModule then
	function LoadModule(ModuleName, ...)

		local Path = THEME:GetCurrentThemeDirectory() .. "Modules/" .. ModuleName

		if THEME.get_theme_fallback_list then -- pre-5.1 support.
			for _, theme in pairs(THEME:get_theme_fallback_list()) do
				if not FILEMAN:DoesFileExist(Path) then
					Path = "Appearance/Themes/" .. theme .. "/Modules/" .. ModuleName
				end
			end
		end

		if not FILEMAN:DoesFileExist(Path) then
			Path = "Appearance/Themes/_fallback/Modules/" .. ModuleName
		end

		if ... then
			return loadfile(Path)(...)
		end
		return loadfile(Path)()
	end
end