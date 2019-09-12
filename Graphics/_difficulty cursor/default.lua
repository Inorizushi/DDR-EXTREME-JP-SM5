local t = Def.ActorFrame{};
--[[
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
t[#t+1] = Def.ActorFrame{
  LoadActor("p1back")..{
    --InitCommand=cmd(setsize,154,48);
	InitCommand=function(self)
		self:setsize(77,48);
		self:x(-39);
		self:draworder(115);
	end;
	OffCommand=cmd(diffusealpha,0;);
  };
  
  LoadActor("p1back")..{
    --InitCommand=cmd(setsize,154,48);
	InitCommand=function(self)
		self:setsize(77,48);
		self:x(38);
		self:draworder(110);
	end;
	OffCommand=cmd(diffusealpha,0;);
  };
  
  LoadActor("p1full")..{
    InitCommand=cmd(y,16;draworder,120;);
	OffCommand=cmd(diffusealpha,0;);
  };
}
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
t[#t+1] = Def.ActorFrame{
  LoadActor("p2back")..{
    --InitCommand=cmd(setsize,154,48);
	InitCommand=function(self)
		self:setsize(77,48);
		self:x(-39);
		self:draworder(110);
	end;
	OffCommand=cmd(diffusealpha,0;);
  };
  
  LoadActor("p2back")..{
    --InitCommand=cmd(setsize,154,48);
	InitCommand=function(self)
		self:setsize(77,48);
		self:x(38);
		self:draworder(115);
	end;
	OffCommand=cmd(diffusealpha,0;);
  };
  
  LoadActor("p2full")..{
    InitCommand=cmd(y,14;draworder,120;);
	OffCommand=cmd(diffusealpha,0;);
  };
}
end;
--]]

return t;
