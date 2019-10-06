-- ScreenHowToPlay Overlay
local Char = CHARMAN:GetRandomCharacter()

local animsets = {"BeginnerHelper_step-up","BeginnerHelper_step-jumplr","_DDRPC_common_Rest"}
local ch = Def.ActorFrame{
	OnCommand=function(s) s:fov(90):rotationx(45) end,
}
local Actions = {
	{5,1,"gameplay comment good"},
	{7.2,3},
	{8,2,"gameplay comment good"},
	{10,3,"gameplay comment danger"},
}
local beat,last_beat = 0,0
local function UpdateRate()
	beat = GAMESTATE:GetSongBeat()
	for i,m in ipairs(Actions) do
		if (beat >= m[1] and last_beat < m[1]) then
			MESSAGEMAN:Broadcast("AnimationPlay",{ Actor=m[2] or nil, Announce=m[3] or nil })
		elseif (beat < m[1]) then
			break
		end
	end
	last_beat = beat
	return s;
end

local t = Def.ActorFrame{ OnCommand=function(s) s:SetUpdateFunction( UpdateRate ) end };
local la
for i=1,3 do
	ch[#ch+1] = Def.Model{
		Meshes=Char:GetModelPath(),
		Materials=Char:GetModelPath(),
		Bones="../../../../Characters/"..animsets[i],
		OnCommand=function(s)
			s:xy(SCREEN_CENTER_X-WideScale(225,205),SCREEN_CENTER_Y+210):zoom(25):cullmode("CullMode_None")
			:rate( i == 3 and 1 or 0 ):loop( i == 3 and true or false ):z(30)
			:visible( i == 3 and true or false )
		end,
		AnimationPlayMessageCommand=function(s,param)
			s:finishtweening()
			if param.Announce then la = param.Announce end
			if param.Actor and param.Actor == i then
				s:visible(true):position(0):rate(1)
				if param.Actor < 3 then
					s:sleep(0.4):queuecommand("QuickPause1")
				else
					s:sleep(1.5):queuecommand("LastAnnounce")
				end
			else s:visible(false)
			end
		end,
		QuickPause1Command=function(s) s:rate(0):sleep(1):queuecommand("QuickResume1") end,
		QuickResume1Command=function(s) s:rate(1):sleep(0.2):queuecommand("QuickPause2") end,
		QuickPause2Command=function(s)
			if la then SOUND:PlayAnnouncer(la) end
			s:rate(0):sleep(3.4):queuecommand("QuickResume2")
		end,
		QuickResume2Command=function(s) s:rate(1):sleep(1.4):queuemessage("AnimationPlay",{Actor=3}) end,
		LastAnnounceCommand=function(s)
			if la then SOUND:PlayAnnouncer(la) end
		end,
	}
end

t[#t+1] = ch

	t[#t+1] = Def.ActorFrame{
	Def.Sprite{
		Texture=THEME:GetPathG("ScreenGameplay","LifeFrame/normal"),
		InitCommand=cmd(CenterX;y,SCREEN_TOP+29);
		OnCommand=cmd(draworder,99);
	};
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,90;valign,1;CenterX;y,SCREEN_BOTTOM+10;diffuse,Color("Black"));
	};
	LoadActor("scoreframe")..{
		InitCommand=cmd(halign,1;x,SCREEN_RIGHT;valign,1;y,SCREEN_BOTTOM+10);
	};
	LoadActor("howtoplay.png")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(cropbottom,0;sleep,1.533;linear,0.233;addy,64;cropbottom,1);
	};
	LoadActor("howtoplay_jp")..{
		Name="HowToPlayBig";
		InitCommand=cmd(Center);
		OnCommand=cmd(addy,-64;croptop,1;sleep,1.7;linear,0.233;addy,64;croptop,0;sleep,1.267;linear,0.233;addy,-64;croptop,1);
	};

	-- let the messages begin
	Def.ActorFrame {
		LoadActor("text_up")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+146;y,SCREEN_CENTER_Y+47);
			ShowCommand=cmd(zoomy,0;sleep,5.8;decelerate,0.3;zoomy,1;sleep,2;zoomy,0);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("text_jump")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+146;y,SCREEN_CENTER_Y+47);
			ShowCommand=cmd(zoomy,0;sleep,12.166;decelerate,0.3;zoomy,1;sleep,2;zoomy,0);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y+2);
			ShowCommand=cmd(rotationz,-90;addy,999;sleep,4;addy,-999;accelerate,0.266;addx,-80;sleep,0.8;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+122;y,SCREEN_CENTER_Y+84);
			ShowCommand=cmd(rotationz,-90;addy,999;sleep,10.433;addy,-999;accelerate,0.266;addx,-80;sleep,0.8;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("pinkhand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+240;y,SCREEN_CENTER_Y-34);
			ShowCommand=cmd(addy,999;sleep,5.5;addy,-999;linear,0.067;addy,-36;sleep,2.366;linear,0.167;addy,44;sleep,0;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+246;y,SCREEN_CENTER_Y-34);
			ShowCommand=cmd(addy,999;sleep,11.933;addy,-999;linear,0.067;addy,-36;sleep,2.366;linear,0.167;addy,44;sleep,0;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("bluehand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+108;y,SCREEN_CENTER_Y-34);
			ShowCommand=cmd(zoomx,-1;addy,999;sleep,11.933;addy,-999;linear,0.067;addy,-36;sleep,2.366;linear,0.167;addy,44;sleep,0;addy,999);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("greenhand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+174;y,SCREEN_CENTER_Y-28);
			ShowCommand=cmd(diffusealpha,0;sleep,17.366;diffusealpha,1;linear,0.198;y,SCREEN_CENTER_Y-120;bob;effectperiod,0.5;effectmagnitude,0,15,0);
			OnCommand=cmd(queuecommand,"Show");
		};
		LoadActor("text_gameover")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+146;y,SCREEN_CENTER_Y+47);
			ShowCommand=cmd(zoomy,0;sleep,18.666;decelerate,0.3;zoomy,1);
			OnCommand=cmd(queuecommand,"Show");
		};

	};
};
local travelDist = SCREEN_WIDTH*1.7;
local LeftToRightIn = Def.ActorFrame{
	Def.Sprite{ Texture="../LeftToRight_green",InitCommand=function(s) s:blend(Blend.Add) end };
	Def.Quad{ InitCommand=function(s) s:addx(64):diffuse(Color.Black):halign(0):zoomto(travelDist,32) end };
};

local RightToLeftIn = Def.ActorFrame{
	Def.Sprite{ Texture="../RightToLeft_green",InitCommand=function(s) s:blend(Blend.Add) end };
	Def.Quad{ InitCommand=function(s) s:addx(-64):diffuse(Color.Black):halign(1):zoomto(travelDist,32) end };
};

local LeftToRightOut = Def.ActorFrame{
	Def.Sprite{ Texture="../LeftToRight_green",InitCommand=function(s) s:blend(Blend.Add) end };
	Def.Quad{ InitCommand=function(s) s:addx(64):diffuse(Color.Black):halign(0):zoomto(-travelDist,32) end };
};

local RightToLeftOut = Def.ActorFrame{
	Def.Sprite{ Texture="../RightToLeft_green",InitCommand=function(s) s:blend(Blend.Add) end };
	Def.Quad{ InitCommand=function(s) s:addx(-64):diffuse(Color.Black):halign(1):zoomto(-travelDist,32) end };
};

local range = {0,1,2,3,2,1,0}
local range2 = {0,1,2,3,3,2,1,0}
for i=0,6 do
	--Stars in animation
	--Stars in left to right
	t[#t+1] = LeftToRightIn..{
		InitCommand=function(s) s:xy(SCREEN_LEFT-63,48+(64*i)) end,
		OnCommand=function(s) s:addx(-80*i):linear(2):addx(1920) end
	};
	--Stars in left to right
	t[#t+1] = RightToLeftIn..{
		InitCommand=function(s) s:xy(SCREEN_RIGHT+63,16+(64*i)) end,
		OnCommand=function(s) s:addx(560-80*i):linear(2):addx(-1920) end
	};
	
	--Stars out animation
	--stars out right to left
	t[#t+1] = RightToLeftOut..{
		InitCommand=function(s) s:xy(SCREEN_RIGHT+65,48+(64*i)) end,
		OnCommand=function(s) s:addx(80*range[i+1]):sleep(22.566):linear(1.368):addx(-1280) end,
	};
end
for i=0,7 do
	--stars out left to right
	t[#t+1] = LeftToRightOut..{
		InitCommand=function(s) s:xy(SCREEN_LEFT-65,16+(64*i)) end,
		OnCommand=function(s) s:addx(-80*range2[i+1]):sleep(22.566):linear(1.368):addx(1280) end,
	};
end

return t;
