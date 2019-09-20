-- Rolling Grade Display implementation
-- By Jose_Varela
local pn = ...
local Gradepos = { [PLAYER_1] = SCREEN_CENTER_X-224, [PLAYER_2] = SCREEN_CENTER_X+224 }
local MultPos = pn == PLAYER_1 and -SCREEN_WIDTH/2 or SCREEN_WIDTH/2
local t = Def.ActorFrame{
  OnCommand=function(s)
    s:xy( Gradepos[pn] , SCREEN_TOP+112 )
    :addx(MultPos):sleep(0.250):decelerate(0.150):addx( MultPos*-1 )
  end,
  OffCommand=function(s) s:sleep(0.6):accelerate(0.150):addx(MultPos) end
}

local TotalTime = 2.5
local TimeLeftInScroll = 0
local NumGradeFrames = 11
local Grade
t[#t+1] = Def.Sprite{
  Texture=THEME:GetPathG("ScreenEvaluation gradeframe",ToEnumShortString(pn)),
  OnCommand=function(s) s:xy(-4,4) end,
}
t[#t+1] = Def.Sprite{
	Texture=THEME:GetPathG("ScreenEvaluation","grades"),
  OnCommand=function(s)
    if SCREENMAN:GetTopScreen():GetStageStats():GetPlayerStageStats(pn):GetGrade() ~= "Grade_Failed" then
      Grade = tonumber( string.sub( ToEnumShortString( SCREENMAN:GetTopScreen():GetStageStats():GetPlayerStageStats(pn):GetGrade() ), 5 ) )
    else
      Grade = 8
    end
    s:diffuseblink():effectperiod(10000)
		s:queuecommand("UpdateFrame")
	end,
	UpdateFrameCommand=function(s)
		local Mult = (64*7)/512
		local StartCoord = (64*(Grade+3))/512
		local DeltaTime = s:GetSecsIntoEffect()

		TimeLeftInScroll = math.max( 0, (TotalTime - DeltaTime) )

		local PercentIntoScrolling = 0
		PercentIntoScrolling = 1 - (TimeLeftInScroll/TotalTime)
		if (PercentIntoScrolling < 0.75) then
			PercentIntoScrolling = (PercentIntoScrolling/0.75) * (1 + 1/NumGradeFrames)
		elseif (PercentIntoScrolling < 0.9) then
			PercentIntoScrolling = (1 + 1/NumGradeFrames)
		else
			PercentIntoScrolling = (1 + 1/NumGradeFrames) - ( (PercentIntoScrolling-0.9) / 0.1 ) * 1/NumGradeFrames
		end

		s:customtexturerect( 0, StartCoord+Mult+(Mult*(PercentIntoScrolling*3)), 1, StartCoord+1+(Mult*(PercentIntoScrolling*3)) )

    if TimeLeftInScroll == 0 then s:queuecommand("StartGlow") end
		s:sleep(1/50):queuecommand("UpdateFrame")
  end,
  StartGlowCommand=function(s)
    s:finishtweening():glowshift():effectcolor1(color("1,1,1,0.4")):effectcolor2(color("0,0,0,0")):effectperiod(0.198)
  end,
}

return t;