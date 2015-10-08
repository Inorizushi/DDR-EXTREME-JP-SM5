local index = tonumber(getenv("InfoIndex"))

local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_TOP+12;valign,0;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("#083918"));
	};
	LoadActor("bg")..{ InitCommand=cmd(Center); };
};

return t;