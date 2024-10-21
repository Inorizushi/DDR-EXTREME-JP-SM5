return Def.ActorFrame{
  OnCommand=function(s)
		ChangeLanguage()
		if not FILEMAN:DoesFileExist("Save/ThemePrefs.ini") then
			Trace("ThemePrefs doesn't exist; creating file")
			ThemePrefs.ForceSave()
		  end
		  if SN3Debug then
			SCREENMAN:SystemMessage("Saving ThemePrefs.")
		  end
		  ThemePrefs.Save()
	end,
  Def.Quad{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-20;setsize,640,300;diffuse,Color("Black"));
    OnCommand=cmd(linear,0.3;cropleft,1);
    OffCommand=cmd(linear,0.3;cropleft,0);
  };
  LoadActor("overlay")..{
    InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;valign,1;setsize,SCREEN_WIDTH,438);
  };
};
