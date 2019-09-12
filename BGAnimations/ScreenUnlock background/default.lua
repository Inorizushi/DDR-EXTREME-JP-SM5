local t = Def.ActorFrame{
  LoadActor("ScreenUnlock background")..{
    InitCommand=cmd(Center);
  };
  LoadActor("list1")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-114,SCREEN_CENTER_Y+517);
    OnCommand=cmd(sleep,0;linear,7.567;addy,-1359;linear,4.526;addy,-240);
  };
  LoadActor("list2")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-114,SCREEN_CENTER_Y+1021);
    OnCommand=cmd(sleep,0;linear,7.567;addy,-1359;linear,4.526;addy,-240);
  };
  LoadActor("list3")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-114,SCREEN_CENTER_Y+1525);
    OnCommand=cmd(sleep,0;linear,7.567;addy,-1359;linear,4.526;addy,-240);
  };
  LoadActor("screenoverlay")..{
    InitCommand=cmd(Center);
  };
};

return t;
