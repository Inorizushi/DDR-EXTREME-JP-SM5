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
      Font="_arial black norm 20px";
      SetMessageCommand=function(self,param)
        self:x(-127):halign(0)
        local song = param.Song;
        if song then
          local group = song:GetGroupName()
          if song:GetDisplaySubTitle() == "" then
            self:maxwidth(192):zoom(1):zoomx(1.2):y(-8)
          else
            self:maxwidth(274):zoom(0.8):y(-10)
          end;
          self:settext(song:GetDisplayMainTitle())
        end;
      end;
    };
    Def.BitmapText{
      Name="Subtitle";
      Font="_arial black norm 20px";
      SetMessageCommand=function(self,param)
        self:x(-127):halign(0)
        local song = param.Song;
        if song then
          local group = song:GetGroupName()
          if song:GetDisplaySubTitle() ~= "" then
            self:settext(song:GetDisplaySubTitle())
            self:maxwidth(274):zoom(0.55)
          else
            self:settext("")
          end;
        end;
      end;
    };
    Def.BitmapText{
      Name="Artist";
      Font="_arial black norm 20px";
      SetMessageCommand=function(self,param)
        self:x(-127):halign(0)
        local song = param.Song;
        if song then
          local group = song:GetGroupName()
          if song:GetDisplaySubTitle() == "" then
            self:maxwidth(349):zoom(0.75):y(10)
          else
            self:maxwidth(349):zoom(0.7):y(9)
          end;
          self:settext("/"..song:GetDisplayArtist())
        end;
      end;
    };
  }
};

return t;
