local t = Def.ActorFrame{}

local alphas = {0.5 ,0.5, 0.4, 0.3, 0.2, 0, 0.2, 0.3, 0.4, 0.5, 0.5};
local indexes = {0,1, 2, 3, 4, 5, 6, 7, 8, 9,10};

for i = 1,11 do
t[#t+1] = Def.ActorFrame{
  LoadActor("../_witem over")..{
    SetMessageCommand=function(self,params)
      local index = params.DrawIndex
      if index then
        if index == indexes[i] then
          self:diffuse(Color.Black)
          self:diffusealpha(alphas[i])
        else
          self:diffusealpha(0)
        end;
      end;
    end;
    OffCommand=function(s)
      s:diffuse( color("0,0,0,0.07") )
    end;
  };
};
end;

return t;
