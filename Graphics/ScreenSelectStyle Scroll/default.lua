local t = Def.ActorFrame {};
local gc = Var("GameCommand");
--------------------------------------
t[#t+1] = Def.ActorFrame {
  LoadActor( gc:GetName() );
};

return t;
