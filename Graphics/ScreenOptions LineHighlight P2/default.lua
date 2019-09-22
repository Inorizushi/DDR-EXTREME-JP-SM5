local t = ...;
t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,38;diffuse,color("#b87000"));
		UpdateFrameMessageCommand=function(s,param)
			if param.PCont then
				if param.PCont[PLAYER_1] == param.PCont[PLAYER_2] then
					s:croptop(0.5)
				else
					s:croptop(0)
				end
			end
		end,
	};
	LoadActor("badge")..{
		InitCommand=function(s) s:x((SCREEN_WIDTH/2)):halign(1) end,
		UpdateFrameMessageCommand=function(s,param)
			if param.PCont then
				if param.PCont[PLAYER_1] == param.PCont[PLAYER_2] then
					s:cropbottom(0.25):croptop(0.3):y(8)
				else
					s:cropbottom(0):y(0)
				end
			end
		end,
	};
};
return t;
