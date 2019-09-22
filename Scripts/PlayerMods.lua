function SpeedMods()
	local t = {
		Name="Speed",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		ExportOnChange = true,
		Choices = {"X1","X1.5","X2","X3","X5","X8","X0.5"},
		Values = {1,1.5,2,3,5,8,0.5},
		LoadSelections = function(s, list, pn)
			local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
			for i, val in ipairs(s.Values) do
				-- Someone knows a better way for this?
				local speedfound = false
				local checkspeeds = {playeroptions:XMod(),playeroptions:CMod()}
				for sm in ivalues(checkspeeds) do
					if sm ~= nil then if val == sm then list[i] = true speedfound = true end end
				end
				if not speedfound then list[i] = false end
			end
        end,
        NotifyOfSelection= function(s, pn, choice)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            if s.Values[choice] then
                playeroptions:XMod( tonumber(s.Values[choice]) )
                MESSAGEMAN:Broadcast("UpdateIconBar",{index=1,player=pn,ch=s.Values[choice].."x"})
            end
        end,
		SaveSelections = function(s, list, pn)
			local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
			for i, val in ipairs(s.Values) do
				if list[i] then
                    playeroptions:XMod( tonumber(val) )
				end
            end
		end
	}
	setmetatable(t, t)
	return t
end

function ModBoost()
	local t = {
		Name="Accel",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		ExportOnChange = true,
		Choices = {"OFF","ON","BRAKE","WAVE"},
		Values = {1,2,3,4},
		LoadSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            -- I hate this so much, there's gotta be a better way
            if playeroptions:Boost() == 1 then list[2] = true
            elseif playeroptions:Brake() == 1 then list[3] = true
            elseif playeroptions:Wave() == 1 then list[4] = true
            else list[1] = true end
        end,
        NotifyOfSelection= function(s, pn, choice)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            if s.Values[choice] then
                MESSAGEMAN:Broadcast("UpdateIconBar",{index=2,player=pn,ch=choice > 1 and "boost" or "default"})
            end
        end,
		SaveSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            local options = {
                {0,0,0},
                {1,0,0},
                {0,1,0},
                {0,0,1},
            }
            for i, val in ipairs(s.Values) do
                if list[i] then
                    playeroptions:Boost(options[i][1])
                    playeroptions:Brake(options[i][2])
                    playeroptions:Wave(options[i][3])
                end
            end
		end
	}
	setmetatable(t, t)
	return t
end

function ModAppearance()
	local t = {
		Name="Appearance",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		ExportOnChange = true,
		Choices = {"VISIBLE","HIDDEN","SUDDEN","STEALTH"},
		Values = {1,2,3,4},
		LoadSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            -- I hate this so much, there's gotta be a better way
            if playeroptions:Hidden() == 1 then list[2] = true
            elseif playeroptions:Sudden() == 1 then list[3] = true
            elseif playeroptions:Stealth() == 1 then list[4] = true
            else list[1] = true end
        end,
        NotifyOfSelection= function(s, pn, choice)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            if s.Values[choice] then
                MESSAGEMAN:Broadcast("UpdateIconBar",{index=3,player=pn,ch=choice > 1 and s.Choices[choice] or "default"})
            end
        end,
		SaveSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            local options = {
                {0,0,0},
                {1,0,0},
                {0,1,0},
                {0,0,1},
            }
            for i, val in ipairs(s.Values) do
                if list[i] then
                    playeroptions:Hidden(options[i][1])
                    playeroptions:Sudden(options[i][2])
                    playeroptions:Stealth(options[i][3])
                end
            end
		end
	}
	setmetatable(t, t)
	return t
end

function ModTurn()
	local t = {
		Name="Turn",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		ExportOnChange = true,
		Choices = {"OFF","MIRROR","LEFT","RIGHT","SHUFFLE"},
		Values = {1,2,3,4,5},
		LoadSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")

            -- I hate this so much, there's gotta be a better way
            if playeroptions:Mirror() then list[2] = true
            elseif playeroptions:Left() then list[3] = true
            elseif playeroptions:Right() then list[4] = true
            elseif playeroptions:Shuffle() then list[5] = true
            else list[1] = true end
        end,
        NotifyOfSelection= function(s, pn, choice)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            if s.Values[choice] then
                MESSAGEMAN:Broadcast("UpdateIconBar",{index=4,player=pn,ch=choice > 1 and s.Choices[choice] or "default"})
            end
        end,
		SaveSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            local options = {
                {false,false,false,false},
                {true,false,false,false},
                {false,true,false,false},
                {false,false,true,false},
                {false,false,false,true},
            }
            for i, val in ipairs(s.Values) do
                if list[i] then
                    playeroptions:Mirror(options[i][1])
                    playeroptions:Left(options[i][2])
                    playeroptions:Right(options[i][3])
                    playeroptions:Shuffle(options[i][3])
                end
            end
		end
	}
	setmetatable(t, t)
	return t
end

function ModScroll()
	local t = {
		Name="Scroll",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		ExportOnChange = true,
		Choices = {"STANDARD","REVERSE"},
		Values = {1,2},
		LoadSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            if playeroptions:Reverse() == 0 then
                list[1] = true
            else
                list[2] = true
            end
        end,
        NotifyOfSelection= function(s, pn, choice)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            if s.Values[choice] then
                MESSAGEMAN:Broadcast("UpdateIconBar",{index=5,player=pn,ch=choice == 2 and "REVERSE" or "default"})
            end
        end,
		SaveSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            local options = {0,1}
            for i, val in ipairs(s.Values) do
                if list[i] then
                    playeroptions:Reverse(options[i])
                end
            end
		end
	}
	setmetatable(t, t)
	return t
end

function ModFreeze()
	local t = {
		Name="Freeze",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		ExportOnChange = true,
		Choices = {"OFF","ON"},
		Values = {1,2},
		LoadSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            if playeroptions:NoHolds() then
                list[1] = true
            else
                list[2] = true
            end
        end,
        NotifyOfSelection= function(s, pn, choice)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            if s.Values[choice] then
                MESSAGEMAN:Broadcast("UpdateIconBar",{index=6,player=pn,ch=choice == 1 and "FREEZE" or "default"})
            end
        end,
		SaveSelections = function(s, list, pn)
            local playeroptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
            local options = {true,false}
            for i, val in ipairs(s.Values) do
                if list[i] then
                    playeroptions:NoHolds(options[i])
                end
            end
		end
	}
	setmetatable(t, t)
	return t
end

function StepsListing()
    local Steplist = function()
        return GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse():GetAllTrails() or GAMESTATE:GetCurrentSong():GetStepsByStepsType( GAMESTATE:GetCurrentStyle():GetStepsType() )
    end
    local conv = {{},{}}
    local fixeddifflist = {
        Difficulty_Beginner = 1,
        Difficulty_Easy = 2,
        Difficulty_Medium = 3,
        Difficulty_Hard = 4,
        Difficulty_Challenge = 5,
        Difficulty_Edit = 6,
    }
    for v in ivalues(Steplist()) do
        if v:GetDifficulty() and v:GetStepsType() == GAMESTATE:GetCurrentStyle():GetStepsType() then
            conv[1][#conv[1]+1] = v
            conv[2][#conv[2]+1] = THEME:GetString("CustomDifficulty",ToEnumShortString(v:GetDifficulty()))
        end
    end
	local t = {
		Name="Steps",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		ExportOnChange = true,
		Choices = conv[2],
        LoadSelections = function(s, list, pn)
            local CM = GAMESTATE:IsCourseMode()
            local StepsOrCourse = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(pn) or GAMESTATE:GetCurrentSteps(pn)
            for i,v in ipairs(Steplist()) do
                if v == StepsOrCourse then
                    list[i] = true
                    MESSAGEMAN:Broadcast("DifficultyIconChanged",{Player=pn,Difficulty=fixeddifflist[StepsOrCourse:GetDifficulty()]-1})
                end
            end
        end,
        NotifyOfSelection= function(s, pn, choice)
            local CM = GAMESTATE:IsCourseMode()
            MESSAGEMAN:Broadcast("DifficultyIconChanged",{
                Player=pn,
                Difficulty=fixeddifflist[conv[1][choice]:GetDifficulty()]-1
            })
        end,
        SaveSelections = function(s, list, pn)
            for i,v in ipairs(Steplist()) do
                if list[i] then
                    if GAMESTATE:IsCourseMode() then
                        GAMESTATE:SetCurrentTrail(pn,conv[1][i])
                    else
                        GAMESTATE:SetCurrentSteps(pn,conv[1][i])
                    end
                end
            end
		end
	}
	setmetatable(t, t)
	return t
end
