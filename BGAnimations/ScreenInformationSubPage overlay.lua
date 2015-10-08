local subPageName = getenv("InfoSubPage")
local subPageDisplayName = getenv("InfoSubPageName")
local itemIndex = getenv("InfoIndex")
local itemCount = getenv("NumInfoItems")

local t = Def.ActorFrame{
	LoadFont("_arial black 20px")..{
		Text=THEME:GetString("ScreenInformationTitles",subPageDisplayName);
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y-125;halign,0;zoom,0.75;diffuse,getenv("InfoSubPageColor"));
		OnCommand=cmd(addy,125;linear,0.4;addy,-125);
	};
	LoadFont("_green gradient")..{
		Name="IndexText";
		InitCommand=cmd(x,SCREEN_CENTER_X+222;y,SCREEN_CENTER_Y-129;queuecommand,"Set";);
		OnCommand=cmd(queuecommand,"Anim");
				AnimCommand=cmd(diffuse,color("#C8F800");strokecolor,color("#5008B0");sleep,0.1;queuecommand,"Anim2");
				Anim2Command=cmd(diffuse,color("#D0E800");strokecolor,color("#B01800");sleep,0.1;queuecommand,"Anim");
		SetCommand=function(self)
			self:settext(itemIndex.."/"..itemCount);
		end;
	};
};

if FILEMAN:DoesFileExist(THEME:GetPathG("_info","subpages/"..subPageName)) then
	t[#t+1] = LoadActor(THEME:GetPathG("_info","subpages/"..subPageName));
end

return t;