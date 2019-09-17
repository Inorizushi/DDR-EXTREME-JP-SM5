local t = Def.ActorFrame{};

local xPosPlayer = {
    P1 = SCREEN_CENTER_X-228,
    P2 = SCREEN_CENTER_X+228
}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do

    local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)

    t[#t+1] = Def.ActorFrame{
        InitCommand=function(self)
            local short = ToEnumShortString(pn)
            self:x(xPosPlayer[short]):y(SCREEN_CENTER_Y-118):draworder(100)
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
            Font="ScreenEvaluation percent text";
            OnCommand=function(self)
                self:settext(pss:GetActualDancePoints())
            end
        }
    };
end

return t;