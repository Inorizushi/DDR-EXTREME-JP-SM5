local t = Def.ActorFrame{};
t[#t+1] = StandardDecorationFromFileOptional("Header","Header");
t[#t+1] = StandardDecorationFromFileOptional("Footer","Footer");
t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");

t[#t+1] = Def.ActorFrame{
  InitCommand=function(s)
    s:xy(_screen.cx,SCREEN_TOP+119):playcommand("Set")
  end,
  OnCommand=function(s)
    s:addy(410):sleep(0.266):decelerate(0.133):addy(-410)
  end,
  OffCommand=function(s)
    s:sleep(0.6):accelerate(0.150):addy(410)
  end,
  Def.Sprite{
    SetCommand=function(s)
      local song = GAMESTATE:GetCurrentSong()
      local course = GAMESTATE:GetCurrentCourse()
      if GAMESTATE:GetPlayMode() == "PlayMode_Regular" then
        if song then
          s:LoadFromSongBanner(song)
        end
      else
        local actualpath = string.gsub(course:GetCourseDir(),".crs","")
        if FILEMAN:DoesFileExist(actualpath..".png") then
          s:Load(actualpath..".png")
        else
          s:Load(THEME:GetPathG("","Common fallback banner"))
        end
      end
      s:scaletoclipped(256,80)
    end
  },
  LoadActor(THEME:GetPathG("","ScreenEvaluation BannerFrame"));
}

t[#t+1] = Def.ActorFrame{
  LoadActor("stats.lua");
  LoadActor("Grade/default.lua");
};

return t;
