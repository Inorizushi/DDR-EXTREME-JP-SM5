return Def.ActorFrame{
  LoadActor("../_section part");
  Def.Sprite{
    Texture="roulette 1x4.png",
    InitCommand=function(self)
			self:SetAllStateDelays(0.1)
      :x(-28)
		end,
  };
};
