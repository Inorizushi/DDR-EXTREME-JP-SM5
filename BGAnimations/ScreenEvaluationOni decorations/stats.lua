local t= Def.ActorFrame{};

local xPosPlayer = {
    P1 = SCREEN_CENTER_X-228,
    P2 = SCREEN_CENTER_X+228
}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do

local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)

local function FindText(pss)
    return string.format("%02d",pss:GetSongsPassed())
end

t[#t+1] = Def.ActorFrame{
    InitCommand=function(self)
        local short = ToEnumShortString(pn)
        self:x(xPosPlayer[short]):y(SCREEN_CENTER_Y+10):draworder(100)
    end;
    OnCommand=function(self)
        if pn == PLAYER_1 then
            self:addx(-172):sleep(0.250):decelerate(0.150):addx(172)
        else
            self:addx(172):sleep(0.250):decelerate(0.150):addx(-172)
        end
    end,
    OffCommand=function(self)
        if pn == PLAYER_1 then
            self:sleep(0.6):accelerate(0.150):addx(-172)
        else
            self:sleep(0.6):accelerate(0.150):addx(172)
        end
    end,
    LoadActor("frame "..ToEnumShortString(pn));
    Def.BitmapText{
        Font="ScreenEvaluation stage";
        InitCommand=function(self) self:xy(8,-16) end,
        OnCommand=function(self)
          self:settext(FindText(pss))
        end
      };
    Def.Sprite{
        InitCommand=function(s) s:xy(pn=='PlayerNumber_P2' and 55 or -55, -6) end,
        OnCommand=function(self)
            local course = GAMESTATE:GetCurrentCourse()
            local stages = course:GetCourseEntries()
          if pn == PLAYER_1 then
            self:Load(THEME:GetPathB("","ScreenEvaluationOni decorations/bar p1"))
          else
            self:Load(THEME:GetPathB("","ScreenEvaluationOni decorations/bar p2"))
          end;
          self:croptop(math.max(0,1-pss:GetPercentDancePoints()))
        end;
    };
};
end
return t;