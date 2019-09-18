local gc = Var("GameCommand");

return Def.ActorFrame {
	LoadFont("_shared2") .. {
		Text=gc:GetText();
		InitCommand=cmd(uppercase,true;shadowlength,2);
		OnCommand=cmd();
		GainFocusCommand=cmd(stoptweening;diffuseshift;effectcolor1,color("#FFFD86");effectcolor2,color("#808080");effectperiod,0.5;);
		LoseFocusCommand=cmd(stopeffect;diffuse,color("#808080"));
	};
	
};