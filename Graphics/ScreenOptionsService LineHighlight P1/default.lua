return Def.ActorFrame{
	Def.Sprite{
		Texture="HL.png",
		InitCommand=function(s) 
			s:diffuseshift():effectcolor1(color("#ffea37")):effectcolor2(color("#a8ff37")):effectperiod(2)
		end,
	};
};