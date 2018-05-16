return Def.ActorFrame {
	LoadActor(THEME:GetPathG("","_difficulty cursor/default.lua"))..{
		InitCommand=cmd(x,76;visible,false);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
};
