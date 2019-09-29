local t = Def.ActorFrame{
  LoadActor("backer");
  Def.Sprite{
    SetMessageCommand=function(self, param)
      self:x(-26)
      local song = param.Song;
      if song then
        local group = song:GetGroupName()
        local Dir = song:GetSongDir()
        if FILEMAN:DoesFileExist(Dir.."/card.png") then
          self:Load(Dir.."/card.png")
          if has_value(RedEntry, song:GetDisplayMainTitle()) then
            self:diffuse(color("1,0,0,1"))
          else
            self:diffuse(SONGMAN:GetSongGroupColor(group))
            self:diffusealpha(1)
          end;
        else
          self:diffusealpha(0)
        end;
      end;
    end;
  };
  Def.ActorFrame{
    SetMessageCommand=function(self,param)
      local song = param.Song;
      if song then
        local group = song:GetGroupName()
        local Dir = song:GetSongDir()
        self:diffuse(SONGMAN:GetSongGroupColor(group))
        if FILEMAN:DoesFileExist(Dir.."/card.png") then
          self:visible(false)
        else
          self:visible(true)
        end;
      end;
    end;
    Def.BitmapText{
      Name="Title";
      Font="_shared2";
      SetMessageCommand=function(self,param)
        self:x(-127):halign(0)
        local song = param.Song;
        if song then
          local group = song:GetGroupName()
          if song:GetDisplaySubTitle() == "" then
            self:maxwidth(192):zoom(1):y(-7)
          else
            self:maxwidth(274):zoom(0.7):y(-10)
          end;
          self:settext(song:GetDisplayMainTitle())
        end;
      end;
    };
    Def.BitmapText{
      Name="Subtitle";
      Font="_shared2";
      SetMessageCommand=function(self,param)
        self:x(-127):halign(0)
        local song = param.Song;
        if song then
          local group = song:GetGroupName()
          if song:GetDisplaySubTitle() ~= "" then
            self:settext(song:GetDisplaySubTitle())
            self:maxwidth(274):zoom(0.7)
          else
            self:settext("")
          end;
        end;
      end;
    };
    Def.BitmapText{
      Name="Artist";
      Font="_shared2";
      SetMessageCommand=function(self,param)
        self:x(-127):halign(0)
        local song = param.Song;
        if song then
          local group = song:GetGroupName()
          if song:GetDisplaySubTitle() == "" then
            self:maxwidth(349):zoom(0.55):y(9)
          else
            self:maxwidth(349):zoom(0.55):y(9)
          end;
          self:settext("/"..song:GetDisplayArtist())
        end;
      end;
    };
  };
  Def.Sprite{
    Texture="WheelNotifyIcon icons",
    OnCommand=function(s) s:animate(0):xy(-154,-2) end,
    SetMessageCommand=function(s,param)
      s:visible(false)
      local so = GAMESTATE:GetSortOrder()
      if so == "SortOrder_Popularity" and param.Song then
        if SONGMAN:GetSongRank(param.Song) < 4 then
          s:visible(true):setstate( SONGMAN:GetSongRank(param.Song) )
        end
      end
      if param.Song and param.Song:HasEdits( GAMESTATE:GetCurrentStyle():GetStepsType() ) then
          s:visible(true):setstate( 4 )
      end
    end,
  }
};

return t;
