local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay");
if GAMESTATE:GetPlayMode() ~= "PlayMode_Oni" then
t[#t+1] = Def.ActorFrame{
  LoadActor("frame1")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-228,SCREEN_CENTER_Y+9;player,PLAYER_1);
    OnCommand=cmd(blend,Blend.Add;diffusealpha,0;sleep,0.25;linear,0.4;diffusealpha,1;sleep,0;diffusealpha,0);
    OffCommand=cmd(sleep,0.333;diffusealpha,1;linear,0.366;diffusealpha,0;sleep,0;addy,999);
  };
  LoadActor("frame2")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X+228,SCREEN_CENTER_Y+9;player,PLAYER_2);
    OnCommand=cmd(blend,Blend.Add;diffusealpha,0;sleep,0.25;linear,0.4;diffusealpha,1;sleep,0;diffusealpha,0);
    OffCommand=cmd(sleep,0.333;diffusealpha,1;linear,0.366;diffusealpha,0;sleep,0;addy,999);
  };
};

t[#t+1] = Def.ActorFrame{
  Def.RollingNumbers{
    Font="ScreenEvaluation Combo",
    InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-202;y,SCREEN_CENTER_Y+80;diffuse,color("#FFFF00");playcommand,"Set";);
    OnCommand=cmd(draworder,90;diffusealpha,0;sleep,0.266;linear,0.416;diffusealpha,1);
    OffCommand=cmd(sleep,0.066;sleep,0.333;linear,0.416;diffusealpha,0);
    SetCommand=function(self)
      self:Load("RollingNumbersMaxCombo")
      self:targetnumber(STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo());
    end;
  };
};

t[#t+1] = Def.ActorFrame{
  Def.RollingNumbers{
    Font="ScreenEvaluation Combo",
    InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);x,SCREEN_CENTER_X+254;y,SCREEN_CENTER_Y+80;diffuse,color("#FFFF00");playcommand,"Set";);
    OnCommand=cmd(draworder,90;diffusealpha,0;sleep,0.266;linear,0.416;diffusealpha,1);
    OffCommand=cmd(sleep,0.066;sleep,0.333;linear,0.416;diffusealpha,0);
    SetCommand=function(self)
      self:Load("RollingNumbersMaxCombo")
      self:targetnumber(STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_2):MaxCombo());
    end;
  };
};
end

return t;
