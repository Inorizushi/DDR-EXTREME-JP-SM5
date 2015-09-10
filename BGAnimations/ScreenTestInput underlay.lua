return Def.ActorFrame {
	--Def.ControllerStateDisplay {
	--	InitCommand=cmd(LoadGameController,
	--};
	Def.DeviceList {
		Font="Common normal";
		InitCommand=cmd(x,SCREEN_CENTER_X-300;y,SCREEN_TOP+80;zoom,0.8;halign,0);
	};

	Def.InputList {
		Font="Common normal";
		InitCommand=cmd(x,SCREEN_CENTER_X-280;CenterY;zoom,0.8;shadowlength,1;halign,0;vertspacing,8;);
	};
};
