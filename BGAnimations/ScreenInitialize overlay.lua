return Def.ActorFrame{
    Def.Actor{
        BeginCommand=function(s)
            --Run EXJPConfig function (04 Main.lua) if DDREXJP_config/OutfoxPrefs.ini doesn't exist.
            if not FILEMAN:DoesFileExist("/Save/DDREXJP_config/OutfoxPrefs.ini") then
                EXJPConfig()
            end
        end
    },
}