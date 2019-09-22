local t = ...
t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,38):diffuse( color("#009878") ) end,
		UpdateFrameMessageCommand=function(s,param)
			if param.PCont then
				if param.PCont[PLAYER_1] == param.PCont[PLAYER_2] then
					s:cropbottom(0.5)
				else
					s:cropbottom(0)
				end
			end
		end,
	};
	LoadActor("badge")..{
		InitCommand=function(s) s:x( (-(SCREEN_WIDTH/2))+35 ) end,
		UpdateFrameMessageCommand=function(s,param)
			if param.PCont then
				if param.PCont[PLAYER_1] == param.PCont[PLAYER_2] then
					s:croptop(0.25):y(-10)
				else
					s:croptop(0):y(0)
				end
			end
		end,
	};
};
return t;