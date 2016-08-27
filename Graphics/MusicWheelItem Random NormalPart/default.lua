return Def.ActorFrame{
  LoadActor("../_section part");
  Def.Sprite{
    Texture="random 1x4.png",
    InitCommand=function(self)
			self:SetAllStateDelays(0.1)
      :x(-48)
		end,
  };
};
