return Def.ActorFrame{
  Def.Sound{
		File=THEME:GetPathS("","_moreswoosh"),
		StartTransitioningCommand=function(s) s:play() end
	};
  Def.Quad{
    InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT):diffuse( color("0,0,0,1") ) end,
    OnCommand=function(s) s:diffusealpha(1):linear(0.266):diffusealpha(0) end
  };
};