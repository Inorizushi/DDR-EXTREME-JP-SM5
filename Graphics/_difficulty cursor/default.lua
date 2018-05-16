local t = Def.ActorFrame{};

if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
t[#t+1] = Def.ActorFrame{
  LoadActor("p1back")..{
    InitCommand=cmd(setsize,152,50);
  };
  LoadActor("p1full")..{
    InitCommand=cmd(y,17);
  };
}
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
t[#t+1] = Def.ActorFrame{
  LoadActor("p2back")..{
    InitCommand=cmd(setsize,152,50);
  };
  LoadActor("p2full")..{
    InitCommand=cmd(y,17);
  };
}
end;

return t;
