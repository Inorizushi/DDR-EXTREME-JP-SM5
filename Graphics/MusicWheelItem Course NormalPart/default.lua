local t = Def.ActorFrame{
  LoadActor("backer");
  Def.Sprite{
    SetMessageCommand=function(self, param)
      self:x(-26)
      local course = param.Course;
      if course then
        local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
        if FILEMAN:DoesFileExist(actualpath.."-card.png") then
          self:Load(actualpath.."-card.png")
          self:diffusealpha(1)
          self:diffuse(color(ListColor[course:GetDisplayFullTitle()]))
        else
          self:diffusealpha(0)
        end;
      end;
    end;
  };
  Def.ActorFrame{
    SetMessageCommand=function(self, param)
      local course = param.Course;
      if course then
        local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
        if FILEMAN:DoesFileExist(actualpath.."-card.png") then
          self:diffusealpha(0)
        else
          self:diffusealpha(1)
          self:diffuse(SONGMAN:GetCourseColor(course))
        end;
      end;
    end;
    Def.BitmapText{
      Name="Title";
      Font="_shared2";
      SetMessageCommand=function(self,param)
        self:x(-127):halign(0)
        local course = param.Course;
        if course then
          self:settext(course:GetDisplayFullTitle())
        end;
      end;
    };
  }
};

return t;
