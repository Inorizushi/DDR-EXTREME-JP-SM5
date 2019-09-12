return Def.ActorFrame{
  Def.Sprite{
    InitCommand=function(self)
      if GAMESTATE:GetCoinMode() == "CoinMode_Home" then
        self:Load(THEME:GetPathG("","ScreenSelectMusic ScoreFrame P1/base.png"));
      else
        self:Load(THEME:GetPathG("","ScreenSelectMusic ScoreFrame P1/basenoscore.png"));
      end;
    end;
  };
};
