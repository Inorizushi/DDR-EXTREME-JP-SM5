local gc = Var("GameCommand");

return Def.ActorFrame {
	LoadFont("_shared4") .. {
		Text=gc:GetText();
		InitCommand=cmd(uppercase,true;shadowlength,1.5);
		OnCommand=cmd();
		GainFocusCommand=cmd(stoptweening;linear,0.1;zoom,1.1;diffuse,color("#f0ff00"););
		LoseFocusCommand=cmd(stopeffect;linear,0.1;zoom,1.0;diffuse,color("0.334,0.334,0.334,1"));
	};
	
};