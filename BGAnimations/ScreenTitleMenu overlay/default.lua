local t = Def.ActorFrame{};

if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
t[#t+1] = Def.ActorFrame{
	LoadActor("home_warn")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-84);
		OffCommand=cmd(linear,0.4;diffusealpha,0);
	};
	LoadActor("home_warn")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-84;diffusealpha,0;zoom,1.02);
		OffCommand=cmd(diffusealpha,0.5;linear,0.4;diffusealpha,0);
	};LoadActor("home_warn")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-84;diffusealpha,0;zoom,1.04);
		OffCommand=cmd(diffusealpha,0.5;linear,0.4;diffusealpha,0);
	};
};
end;

GAMESTATE:Env()["ItemThatWasJustUnlocked"] = nil

return t;
