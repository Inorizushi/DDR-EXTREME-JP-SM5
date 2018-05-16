return Def.ActorFrame {
  LoadActor(THEME:GetPathG("","_difficulty cursor/default.lua"))..{
		InitCommand=cmd(x,228;visible,false);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
    SwitchToPage1Command=cmd(visible,true);
		SwitchToPage2Command=cmd(visible,false);
	};
};
