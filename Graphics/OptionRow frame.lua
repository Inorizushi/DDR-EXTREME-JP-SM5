local t = Def.ActorFrame{}

t[#t+1] = Def.Sprite{
    Texture="OptionRow bullet",
    InitCommand=function(s)
        s:zoom(1):xy(45,3):diffuse( color("0.51,0.64,0.06,1") )
    end,
    LoseFocusCommand=function(s)
        s:diffuse( color("0.51,0.64,0.06,1") )
    end,
    GainFocusCommand=function(s)
        s:diffuse( Color.White )
        if GAMESTATE:GetNumPlayersEnabled() == 2 then
            if not GAMESTATE:Env()["ch"] then
                GAMESTATE:Env()["ch"] = {  }
            end
            if SCREENMAN:GetTopScreen() then
                for pn in ivalues(PlayerNumber) do
                    if not GAMESTATE:Env()["ch"] then
                        GAMESTATE:Env()["ch"] = { [pn] = nil }
                    end
                    GAMESTATE:Env()["ch"][pn] = SCREENMAN:GetTopScreen():GetCurrentRowIndex(pn)
                end
            end
            MESSAGEMAN:Broadcast("UpdateFrame",{PCont=GAMESTATE:Env()["ch"]})
        end
    end,
}

return t;