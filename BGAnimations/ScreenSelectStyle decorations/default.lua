local t = LoadFallbackB()

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_TOP+58;draworder,100);
	LoadActor("jp_explanation")..{
		InitCommand=cmd(x,SCREEN_LEFT+164);
		OnCommand=cmd(draworder,99;diffusealpha,0;sleep,0.264;diffusealpha,1);
	};
	Def.Quad{
		InitCommand=cmd(x,SCREEN_LEFT+420;setsize,288,24;diffuse,color("#8cbd00"));
		OnCommand=cmd(addx,-256;sleep,0.264;sleep,0.198;linear,0.198;addx,256);
		OffCommand=cmd(sleep,0.396;linear,0.198;addx,-256);
	};
	LoadActor("arrow")..{
		InitCommand=cmd(x,SCREEN_LEFT+292);
		OnCommand=cmd(addx,-256;diffusealpha,0;sleep,0.264;diffusealpha,1;sleep,0.198;linear,0.198;addx,256);
		OffCommand=cmd(sleep,0.396;linear,0.198;addx,-256;sleep,0.198;diffusealpha,0);
	};
};

t[#t+1] = LoadActor("jp_Warning.png")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y+94;valign,0);
	OnCommand=cmd(addy,-999;sleep,0.473;addy,999;addy,-76;linear,0.160;addy,76;decelerate,0.033;zoomy,0.95;accelerate,0.033;zoomy,1;decelerate,0.033;zoomy,1.05;accelerate,0.033;zoomy,1;sleep,0.8;queuecommand,"Flash");
	FlashCommand=cmd(diffuseshift;effectperiod,0.5;effectcolor1,1,1,1,1;effectcolor2,0.5,0.5,0.5,1);
	OffCommand=cmd(stopeffect;sleep,0;accelerate,0.2;addy,-80;linear,0;diffusealpha,0);
};


t[#t+1] = LoadActor("../jp_help")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-165;y,SCREEN_BOTTOM-33.5;);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y+9;);
		OnCommand=cmd(draworder,90;zoomy,0;sleep,0.264;zoomy,0.079;linear,0.25;zoomy,1.125;linear,0.1;zoomy,0.914;linear,0.1;zoomy,1.052;linear,0.083;zoomy,0.973;linear,0.066;zoomy,1);
		OffCommand=cmd(sleep,0.183;linear,0.066;zoomy,0.973;linear,0.083;zoomy,1.052;linear,0.1;zoomy,0.914;linear,0.1;zoomy,1.125;linear,0.25;zoomy,0.079;linear,0;diffusealpha,0);
	Def.Sprite{
		StyleSingleMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/jp_single.png")) end,
		StyleVersusMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/jp_versus.png")) end,
		StyleDoubleMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/jp_double.png")) end,
	};
	Def.Sprite{
		Texture="Stage 2x3.png";
		InitCommand=cmd(xy,95,-17;pause;playcommand,"Set");
		SetCommand=function(s)
			local maxstages = PREFSMAN:GetPreference("SongsPerPlay")
			s:setstate(maxstages-1)
		end
	}
};

return t
