local t = Def.ActorFrame{}

local DiffToIndex = {
  ["Difficulty_Beginner"] = 0,
  ["Difficulty_Easy"] = 1,
  ["Difficulty_Medium"] = 2,
  ["Difficulty_Hard"] = 3,
  ["Difficulty_Challenge"] = 4,
  ["Difficulty_Edit"] = 5,
}

local xPosPlayer = {
    P1 = SCREEN_CENTER_X-263,
    P2 = SCREEN_CENTER_X-73
}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1] = Def.ActorFrame{
  InitCommand=function(self)
    local short = ToEnumShortString(pn)
    self:x(xPosPlayer[short]):y(SCREEN_CENTER_Y+15)
  end,
  LoadActor("_frame "..ToEnumShortString(pn))..{
    OnCommand=cmd(addy,40;cropbottom,1;sleep,0.717;decelerate,0.183;addy,-40;cropbottom,0);
    OffCommand=cmd(sleep,0.2;accelerate,0.183;addy,40;cropbottom,1);
  };
  Def.ActorFrame{
    InitCommand=cmd(x,pn=="PlayerNumber_P2" and 15 or -15);
    OnCommand=cmd(addy,40;diffusealpha,0;sleep,0.717;decelerate,0.183;addy,-40;diffusealpha,1);
    OffCommand=cmd(sleep,0.2;accelerate,0.183;addy,40;diffusealpha,0);
    Def.Sprite{
      Texture="_difficulty icons 1x6.png";
      InitCommand=cmd(pause);
      SetCommand=function(self)
        local song = GAMESTATE:GetCurrentSong()
        if song then
          local steps = GAMESTATE:GetCurrentSteps(pn)
          if steps then
            self:setstate(DiffToIndex[steps:GetDifficulty()])
            self:visible(true)
          end
        else
          self:visible(false)
        end
      end;
      CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
  		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
  		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
    };
    LoadActor("_autogen")..{
      InitCommand=cmd(visible,false);
  		BeginCommand=cmd(playcommand,"Set");
  		ShowCommand=cmd(visible,true;diffuseshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,1"));
  		HideCommand=cmd(visible,false;stopeffect);
      CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
  		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
  		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
  		SetCommand=function(self)
  			local song = GAMESTATE:GetCurrentSong()
  			if song then
  				local steps = GAMESTATE:GetCurrentSteps(pn)
  				if steps then
  					if steps:IsAutogen() then self:playcommand("Show")
  					else self:playcommand("Hide")
  					end
  				else
  					self:playcommand("Hide")
  				end
  			else
  				self:playcommand("Hide")
  			end
  		end;
    };
  };
};
end;

return t;
