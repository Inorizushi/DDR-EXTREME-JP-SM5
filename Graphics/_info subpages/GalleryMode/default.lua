-- Gallery Mode information page
return Def.ActorFrame{
	InitCommand=cmd(Center);

	LoadFont("_arial black 20px")..{
		InitCommand=cmd(x,-260;y,-116;zoom,0.75;wrapwidthpixels,672;align,0,0;diffuse,color("#EEEEEE");strokecolor,color("#222222"));
		BeginCommand=function(self)
			self:settext("what the fuck is a watamote\na proper description needs to be here or something");
		end;
	};

	-- Janet
	LoadActor(THEME:GetPathG("","_information/chars/Janet"))..{
		InitCommand=cmd(x,184;y,49;);
	};
};