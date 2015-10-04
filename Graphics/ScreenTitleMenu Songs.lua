-- Title Menu song info
return LoadFont("title")..{
	BeginCommand=function(self)
		self:settext(
			string.format(
				THEME:GetString( Var "LoadingScreen", "%d songs in %d groups, %d courses"),
				SONGMAN:GetNumSongs(),
				SONGMAN:GetNumSongGroups(),
				SONGMAN:GetNumCourses()
			)
		);
	end
}