local t = LoadFallbackB()

-- Explanation
--t[#t+1] = StandardDecorationFromFile("Explanation","Explanation")

-- Warning
t[#t+1] = StandardDecorationFromFile("Explanation","Explanation")

t[#t+1] = LoadActor("../help")..{ 
	InitCommand=cmd(x,SCREEN_CENTER_X-165;y,SCREEN_BOTTOM-33.5;);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(sleep,1.22);
	
	--LoadActor( "choicebar" )..{
		--OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+155;zoomy,0;zoomx,0;linear,0.5;zoomy,1;sleep,0.66;linear,0.5;zoomx,1);
		--OffCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+155;sleep,0.33;linear,0.462;addx,510;cropright,1);
	--};
	LoadActor("../slash")..{
		OnCommand=cmd(draworder,99;x,SCREEN_RIGHT-103;y,SCREEN_CENTER_Y-220);
	};
	LoadActor("../mexpbg")..{
		OnCommand=cmd(x,SCREEN_RIGHT-301;y,SCREEN_TOP+57;addx,-204;sleep,0.264;sleep,0.198;linear,0.198;addx,204);
		OffCommand=cmd(sleep,0.66;linear,0.198;addx,-204);
	};
	LoadActor("../arrowmexp")..{
		OnCommand=cmd(x,SCREEN_LEFT+238;y,SCREEN_TOP+57;addx,-204;diffusealpha,0;sleep,0.264;diffusealpha,1;sleep,0.198;linear,0.198;addx,204);
		OffCommand=cmd(sleep,0.66;linear,0.198;addx,-204;sleep,0.198;diffusealpha,0);
	};
	LoadActor( "p1" )..{
<<<<<<< HEAD
		BeginCommand=cmd(playcommand,"IsP1Present");
		OnCommand=cmd(x,SCREEN_CENTER_X-24;y,SCREEN_CENTER_Y-160;vertalign,top;zoomy,0;sleep,0.134;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,1;sleep,0.566;linear,0.267;zoomy,0);
		IsP1PresentCommand=function(self,param)
			if GAMESTATE:IsPlayerEnabled(0) == false then
				self:visible(false)
			end
		end;
	};
	LoadActor( "p2" )..{
		BeginCommand=cmd(playcommand,"IsP2Present");
		OnCommand=cmd(x,SCREEN_CENTER_X+34;y,SCREEN_CENTER_Y-160;vertalign,top;zoomy,0;sleep,0.134;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,1;sleep,0.566;linear,0.267;zoomy,0);
		IsP2PresentCommand=function(self,param)
			if GAMESTATE:IsPlayerEnabled(1) == false then
				self:visible(false)
			end
		end;
=======
		OnCommand=cmd(x,SCREEN_CENTER_X-24;y,SCREEN_CENTER_Y-160;vertalign,top;zoomy,0;sleep,0.134;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,0.566;linear,0.267;zoomy,0);
>>>>>>> origin/master
	};
	
}


t[#t+1] = Def.ActorFrame {

<<<<<<< HEAD
	LoadActor( "null" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-14;cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
=======
	LoadActor( "null_p1" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-155;y,SCREEN_CENTER_Y-16;cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
>>>>>>> origin/master
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
	};
	
	LoadActor( "innull" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-275;y,SCREEN_CENTER_Y+5;horizalign,left;addx,-240;cropleft,1;sleep,0.264;sleep,0.132;sleep,0.264;linear,0.396;addx,240;cropleft,0);
		OffCommand=cmd(horizalign,left;sleep,1;sleep,0.236;linear,0.341;cropleft,1;addx,-240);
	};
	
}
	
<<<<<<< HEAD
--2P--
t[#t+1] = Def.ActorFrame {

	LoadActor( "null" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y-14;rotationy,-180;cropright,1;sleep,0.264;sleep,0.132;cropright,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropright,0.936;linear,0.396;cropright,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropright,0.936;sleep,0.016;linear,0.267;cropbottom,1);
=======

t[#t+1] = Def.ActorFrame {

	LoadActor( "null_p2" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+155;y,SCREEN_CENTER_Y-16;cropleft,1;sleep,0.264;sleep,0.132;cropleft,0.936;cropbottom,1;linear,0.264;cropbottom,0;cropleft,0.936;linear,0.396;cropleft,0);
		OffCommand=cmd(sleep,1;sleep,0.233;linear,0.333;cropleft,0.936;sleep,0.016;linear,0.267;cropbottom,1);
>>>>>>> origin/master
	};
	
	LoadActor( "innull" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+276;y,SCREEN_CENTER_Y+5;horizalign,right;addx,240;cropright,1;sleep,0.264;sleep,0.132;sleep,0.264;linear,0.396;addx,-240;cropright,0);
		OffCommand=cmd(horizalign,right;sleep,1;sleep,0.236;linear,0.341;cropright,1;addx,240);
	};
	
}

return t