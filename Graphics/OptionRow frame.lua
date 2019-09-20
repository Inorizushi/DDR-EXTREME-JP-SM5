local t = Def.ActorFrame{}

t[#t+1] = Def.Sprite{
    Texture="OptionRow bullet",
    InitCommand=function(s)
        s:zoom(1):xy(45,3):diffuse( color("0.51,0.64,0.06,1") )
    end,
    LoseFocusCommand=function(s) s:diffuse( color("0.51,0.64,0.06,1") ) end,
    GainFocusCommand=function(s) s:diffuse( Color.White ) end,
}

return t;