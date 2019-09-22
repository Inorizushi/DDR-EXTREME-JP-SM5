local t = Def.ActorFrame{}

local scrolltotal = -1596+42

local itm = Def.ActorFrame{
    OnCommand=function(s)
        s:xy( SCREEN_CENTER_X-115,SCREEN_CENTER_Y+517-(64*3.6) )
        :linear( 7.567 ):addy( -1359 ):linear( 4.526 ):addy( -240 )
    end,
}

t[#t+1] = Def.Sprite{
    Texture="background",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y) end;
};

for i=0,UNLOCKMAN:GetNumUnlocks()-1 do
    itm[#itm+1] = Def.ActorFrame{
        OnCommand=function(s) s:y(42*i) end,
        Def.Sprite{ Texture="UnlockBullets", OnCommand=function(s) s:x(-110):animate(0):setstate(i < 29 and i or 29 ):shadowlength(1) end };
        Def.Sprite{
            OnCommand=function(s)
                local item = {"Song","Oni","Nonstop"}
                local set = 2
                s:x(-78)
                if UNLOCKMAN:GetUnlockEntry(i) and not UNLOCKMAN:GetUnlockEntry(i):IsLocked() then
                    if UNLOCKMAN:GetUnlockEntry(i):GetSong() then set = 1 end
                    if UNLOCKMAN:GetUnlockEntry(i):GetCourse() then
                        if UNLOCKMAN:GetUnlockEntry(i):GetCourse():GetCourseType() == "CourseType_Nonstop" then set = 3 end
                    end
                    s:Load( THEME:GetPathB("ScreenUnlock","overlay/Item".. item[set] ..".png") )
                end
            end,
        },
        Def.Sprite{
            OnCommand=function(s)
                s:x(36)
                if UNLOCKMAN:GetUnlockEntry(i) and not UNLOCKMAN:GetUnlockEntry(i):IsLocked() then
                    if UNLOCKMAN:GetUnlockEntry(i):GetSong() then
                        local Song = UNLOCKMAN:GetUnlockEntry(i):GetSong()
                        if FILEMAN:DoesFileExist(Song:GetSongDir().."/card.png") then
                            s:Load(Song:GetSongDir().."/card.png")
                            s:diffuse( SONGMAN:GetSongGroupColor(Song:GetGroupName()) )
                            if has_value(RedEntry, Song:GetDisplayMainTitle()) then
                                s:diffuse(Color.Red)
                            end
                        end
                    end
                    if UNLOCKMAN:GetUnlockEntry(i):GetCourse() then
                        local course = UNLOCKMAN:GetUnlockEntry(i):GetCourse()
                        local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
                        if FILEMAN:DoesFileExist(actualpath.."-card.png") then
                            s:Load(actualpath.."-card.png")
                            s:diffuse( color(ListColor[course:GetDisplayFullTitle()]) )
                        end
                    end
                end
            end,
        },

        Def.BitmapText{
            Font="_shared2",
            Text="? ? ?",
            OnCommand=function(s)
                s:xy(10,-6):diffuse(Color.Yellow)
                :visible( UNLOCKMAN:GetUnlockEntry(i):IsLocked() )
            end,
        }

    };
end

t[#t+1] = itm

t[#t+1] = Def.Sprite{
    Texture=IsUsingWideScreen() and "back 16_9" or "back 4_3",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y) end;
};

for i=0,29 do
    t[#t+1] = Def.Sprite{
        Texture="UnlockBullets",
        OnCommand=function(s)
            s:xy( SCREEN_CENTER_X+96 + (37*math.mod( i,5 )) , SCREEN_CENTER_Y-129+( math.mod( i,30 )*7.2 )-( 7.2*math.mod( i,5 ) )  ):animate(0):setstate(i)
            :visible( not UNLOCKMAN:GetUnlockEntry(i):IsLocked() )
        end,
    };
end

return t;