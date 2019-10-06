local t = Def.ActorFrame{
  LoadActor("_section part");
  --Section Card
  Def.Sprite{
    SetMessageCommand=function(self,params)
      self:x(-127):halign(0)
      local group = params.Text;
      local so = GAMESTATE:GetSortOrder();
      if group then
        local function CheckDir(groupname)
          local dirs = {"Songs","AdditionalSongs"}
          for v in ivalues(dirs) do
            if FILEMAN:DoesFileExist( v.."/"..groupname.."/card.png" ) then
              return v.."/"..groupname.."/card.png"
            end
          end
        end
        if so == "SortOrder_Group" then
          if has_value(SectionList, group) then
            self:Load(CheckDir(group));
            self:diffusealpha(1)
            self:diffuse(color("#ff8400"))
          else
            self:diffusealpha(0)
          end;
        else
          self:diffusealpha(0)
        end;
      end;
    end;
  };
  --NoSection Text
  Def.BitmapText{
    Font="_shared3.ini";
    SetMessageCommand=function(self,params)
      self:halign(0):x(-127):maxwidth(200)
      local group = params.Text;
      local so = GAMESTATE:GetSortOrder();
      if group then
        if so == "SortOrder_Group" then
          if not has_value(SectionList, group) then
            self:settext(group)
            self:diffuse(color("#ff8400"))
          else
            self:diffusealpha(0)
          end;
        else
          self:diffusealpha(0)
        end;
      end;
    end;
  };
  --Sort Text
  Def.BitmapText{
    Font="MusicWheelItem abc";
    SetMessageCommand=function(self,params)
      self:x(-96):halign(0):maxwidth(100)
      local group = params.Text;
      local so = GAMESTATE:GetSortOrder();
      if group then
        if so == "SortOrder_Title" then
          if group == "0-9" then
            self:settext("[")
          else
            self:settext(group)
          end;
        else
          self:settext("")
        end;
      end;
    end;
  };
};



return t;
