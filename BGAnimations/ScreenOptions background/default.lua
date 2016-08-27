return Def.ActorFrame{
  LoadActor("bg")..{
    InitCommand=cmd(Center;setsize,640,480);
  };
};
