local instructionPage = "normal"

if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then instructionPage = "nonstop"
elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then instructionPage = "oni"
end

return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_instructions",instructionPage))..{
		InitCommand=cmd(x,SCREEN_LEFT-SCREEN_CENTER_X;CenterY;);
		OnCommand=cmd(decelerate,0.3;CenterX);
		OffCommand=cmd(accelerate,0.3;x,SCREEN_RIGHT+SCREEN_CENTER_X);
	};
};