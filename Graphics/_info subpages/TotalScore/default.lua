-- Total Score information page
local t = Def.ActorFrame{
	InitCommand=cmd(Center);

	-- キミのTOTAL SCOREはこれだ! ("This is your TOTAL SCORE!")
	LoadFont("_arial black 20px")..{
		InitCommand=cmd(x,-260;y,-116;zoom,0.75;wrapwidthpixels,672;align,0,0;diffuse,color("#EEEEEE");strokecolor,color("#222222"));
		BeginCommand=function(self)
			self:settext(THEME:GetString("InformationTotalScore","HeaderText"));
		end;
	};

	-- label
	LoadFont("ScreenSystemLayer credits normal")..{
		Text="TOTAL SCORE";
		InitCommand=cmd(y,-27;);
	};

	-- score (xxx: should be rollingnumbers, probably)
	LoadFont("_score")..{
		InitCommand=cmd(y,-3);
		BeginCommand=function(self)
			local profile = PROFILEMAN:GetMachineProfile()

			self:settextf("%011d",0)
		end;
	};

	-- explanation
	-- "(説明)
	-- MUSIC RECORDSのSINGLEと
	-- DOUBLEのBASIC, TRICK,
	-- MANIACの すべてのすべての合計点です."
	-- "(Description)
	-- Total Points consists of your Music Records in Single and Double modes
	-- with Basic, Trick and Maniac difficulties."
	LoadFont("_arial black 20px")..{
		Text=THEME:GetString("InformationTotalScore","DescriptionText");
		InitCommand=cmd(x,-260;y,80;align,0,0;zoom,0.75;wrapwidthpixels,512*1.25);
	};
};

return t;