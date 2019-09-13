local t = Def.ActorFrame{};

--[[t[#t+1] = Def.BitmapText{
    Name="Diff",
    Font="_arial black norm 20px";
    CurrentSongChangedMessageCommand=function(s)
        s:queuecommand("Set")
    end,
    SetCommand=function(s)
        s:xy(SCREEN_RIGHT-250,SCREEN_TOP+90):zoom(0.75)
        local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
        s:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)))
        :diffuse(CustomDifficultyToColor(diff)):strokecolor(color("0,0,0,0.5")):uppercase(true)
    end,
}]]

t[#t+1] = Def.Quad{
    InitCommand=function(s)
        s:FullScreen():diffuse(color("0,0,0,0.5"))
    end,
    OnCommand=function(s)
        s:diffusealpha(1):sleep(0.2):linear(0.2):diffusealpha(0.5)
    end,
    OffCommand=function(s)
        s:diffusealpha(0.5):sleep(0.2):linear(0.2):diffusealpha(1)
    end,
};

--SongInfo
t[#t+1] = Def.ActorFrame{
    InitCommand=function(s)
        s:xy(SCREEN_LEFT+25,SCREEN_TOP+125)
    end,
    CurrentSongChangedMessageCommand=function(s)
        s:queuecommand("Set")
    end,
    OnCommand=function(s)
        s:diffusealpha(0):sleep(0.2):linear(0.2):diffusealpha(1)
    end,
    OffCommand=function(s)
        s:diffusealpha(1):sleep(0.2):linear(0.2):diffusealpha(0)
    end,
    Def.Banner{
        SetCommand=function(s)
            s:y(-70):halign(0)
            local song = GAMESTATE:GetCurrentSong()
            if song then
                s:LoadFromSong(song)
            end
            s:scaletoclipped(256,80)
        end
    },
    Def.BitmapText{
        Name="Title",
        Font="_arial black norm 20px";
        SetCommand=function(s)
            s:halign(0):y(-10)
            local song = GAMESTATE:GetCurrentSong()
            if song then
                s:settext(song:GetDisplayFullTitle())
            end
        end
    },
    Def.BitmapText{
        Name="Artist",
        Font="_arial black norm 20px";
        SetCommand=function(s)
            s:halign(0):y(10)
            local song = GAMESTATE:GetCurrentSong()
            if song then
                s:settext(song:GetDisplayArtist())
            end
        end
    },
}

--Progress Bar
t[#t+1] = Def.ActorFrame{
    InitCommand=function(s)
        s:xy(_screen.cx,SCREEN_BOTTOM-50)
    end,
    OnCommand=function(s)
        s:diffusealpha(0):sleep(0.2):linear(0.2):diffusealpha(1)
    end,
    OffCommand=function(s)
        s:diffusealpha(1):sleep(0.2):linear(0.2):diffusealpha(0)
    end,
    Def.Quad{
        InitCommand=function(s)
            s:setsize(SCREEN_WIDTH/1.2,2):diffusealpha(0.5)
        end,
    },
    Def.SongMeterDisplay{
        InitCommand=cmd(SetStreamWidth,SCREEN_WIDTH/1.2);
        Stream=Def.Quad{
            InitCommand=function(s)
                s:setsize(SCREEN_WIDTH/1.2,2)
            end,
        },
        Tip=Def.Quad{
            InitCommand=function(s)
                s:setsize(1,8)
            end
        },
    };
    Def.BitmapText{
        Name="Length",
        Font="_arial black norm 20px";
        CurrentSongChangedMessageCommand=function(s)
            s:queuecommand("Set")
        end,
        SetCommand=function(s)
            local song = GAMESTATE:GetCurrentSong()
            if song then
                local secs = song:MusicLengthSeconds()
                s:settext(SecondsToMMSS(secs)):diffusealpha(0.5)
                s:halign(1):xy(SCREEN_WIDTH/2.4,10):zoom(0.5)
            end
        end
    }
}

return t;