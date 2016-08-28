local t = Def.ActorFrame{
  LoadActor("hl")..{
    OnCommand=cmd(cropbottom,0.1;diffuseshift;blend,Blend.Add;;effectcolor1,0.2,0.33,0,1;effectcolor2,0.2,0.33,0,0;effectperiod,1.085);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("frame")..{
    InitCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) ~= true then
        self:croptop(0.27)
      end;
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) ~= true then
        self:cropbottom(0.27)
      end;
    end;
    OnCommand=cmd(addx,350;sleep,0.9;decelerate,0.2;addx,-350);
  };
};

return t;
