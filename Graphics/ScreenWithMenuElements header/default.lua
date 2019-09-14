local screenName = Var "LoadingScreen"
local headerTextImage

--this should probably be a metric
local screens = {
	{"ScreenSelectMusic","Music.png"},
	{"ScreenPlayerOptions","Options.png"},
	{"ScreenMapControllers","Options.png"},
	{"ScreenOptionsService","optionsserv.png"},
	{"ScreenOptionsServiceChild","optionsserv.png"},
	{"ScreenSelectStyle","style.png"},
	{"ScreenSelectDifficulty","diff.png"},
	{"ScreenEvaluationNormal","eval.png"},
	{"ScreenEvaluationSummary","eval.png"},
	{"ScreenEvaluationOni","eval.png"},
	{"ScreenEvaluationNonstop","eval.png"},
	{"ScreenSelectCourse","course.png"},
}

for v in ivalues(screens) do
	if screenName == v[1] then
		headerTextImage = v[2]
	end
end

--Base Anchoring
local out = Def.ActorFrame{
	LoadActor("base")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP):valign(0):setsize(SCREEN_WIDTH,68);
		end;
	};
  LoadActor("time_slash")..{
		InitCommand=cmd(x,SCREEN_RIGHT-54;y,SCREEN_TOP+26;);
    OnCommand=function(self)
      if screenName ~= 'ScreenOptionsService' then
        self:visible(true)
      else
        self:visible(false)
      end;
    end;
	};
}

--Text Anchoring
if headerTextImage then
	table.insert(out,LoadActor(headerTextImage)..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT+263):y(SCREEN_TOP+21);
		end;
    OnCommand=cmd(addx,526;cropright,1;sleep,0.65;linear,0.4;addx,-526;cropright,0);
    OffCommand=cmd(sleep,0.05;linear,0.4;addx,526;cropright,1)
	})
end

return out
