local t = Def.ActorFrame{}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("ScreenSelectMusic decorations/modicons/default.lua")..{
		InitCommand=cmd(draworder,100);
    };
    
    t[#t+1] = Def.Sprite{
		Condition=GAMESTATE:IsPlayerEnabled(pn),
		Texture=THEME:GetPathB("ScreenSelectMusic decorations/diff/_difficulty","icons"),
		OnCommand=function(s)
            s:animate(0)
            :xy( pn == PLAYER_1 and SCREEN_CENTER_X-230 or SCREEN_CENTER_X+230, SCREEN_CENTER_Y+170 )
			if GAMESTATE:GetCurrentSteps(pn) then
				s:setstate( GetDifficultyIconFrame( GAMESTATE:GetCurrentSteps(pn):GetDifficulty() ) )
            end
            s:addx( -SCREEN_WIDTH ):sleep(0.717+0.15):decelerate(0.759):addx( SCREEN_WIDTH )
        end,
        DifficultyIconChangedMessageCommand=function(s,param)
            if param.Player == pn then
                s:setstate( param.Difficulty )
            end
        end
	}
end;

return t;