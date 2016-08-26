return Def.ActorFrame {
  -- Speed
    Def.Sprite{
      OnCommand=function(self)
        self:x(-220);

        if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'1.5x') then
          self:Load(THEME:GetPathB("","_selModIcons/x1.5"));
        elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'2x') then
          self:Load(THEME:GetPathB("","_selModIcons/x2"));
        elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'3x') then
          self:Load(THEME:GetPathB("","_selModIcons/x3"));
        elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'5x') then
          self:Load(THEME:GetPathB("","_selModIcons/x5"));
        elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'8x') then
          self:Load(THEME:GetPathB("","_selModIcons/x8"));
        end;
      end;
    };
    --Boost
    Def.Sprite{
      InitCommand=function(self)
        self:x(-139);
        if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'boost') then
  				self:Load(THEME:GetPathB("","_selModIcons/boost"));
  			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'brake') then
  				self:Load(THEME:GetPathB("","_selModIcons/boost"));
  			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'wave') then
  				self:Load(THEME:GetPathB("","_selModIcons/boost"));
  			end;
      end;
    };
    -- Appearance
  	Def.Sprite {
  		InitCommand=function(self)
  			self:x(-60);
  			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'hidden') then
  				self:Load(THEME:GetPathB("","_selModIcons/hidden"));
  			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'sudden') then
  				self:Load(THEME:GetPathB("","_selModIcons/sudden"));
  			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'stealth') then
  				self:Load(THEME:GetPathB("","_selModIcons/stealth"));
  			end;
  		end;
    };
    -- Turn
  	Def.Sprite {
  		InitCommand=function(self)
  			self:x(20);
  			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'mirror') then
  				self:Load(THEME:GetPathB("","_selModIcons/mirror"));
  			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'left') then
  				self:Load(THEME:GetPathB("","_selModIcons/left"));
  			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'right') then
  				self:Load(THEME:GetPathB("","_selModIcons/right"));
  			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'shuffle') then
  				self:Load(THEME:GetPathB("","_selModIcons/shuffle"));
  			end;
  		end;
    };
    --Arrow (I'm not implementing this until I figure out how I'll implement this.)
    -- Arrow
	Def.Sprite {
		InitCommand=function(self)
			self:x(90);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'NORMAL-FLAT')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'CLASSIC-FLAT')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'SOLO-FLAT')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'PS3-FLAT')
			or GAMESTATE:PlayerIsUSingModifer(PLAYER_1, 'DDRX-FLAT')
			or GAMESTATE:PlayerIsUSingModifer(PLAYER_1, 'SN2-FLAT') then
				self:Load(THEME:GetPathB("","_selModIcons/flat"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'NORMAL-SOLO')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'PS3-SOLO')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'SOLO-NOTE')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'DDRX-SOLO')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'SN2-SOLO') then
				self:Load(THEME:GetPathB("","_selModIcons/solo"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_1, 'dark') then
			  self:Load(THEME:GetPathB("","_selModIcons/dark")
		  end;
    end;
  };
    -- Scroll
  	Def.Sprite {
  		InitCommand=function(self)
  			self:x(180);
  			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
  				self:Load(THEME:GetPathB("","_selModIcons/reverse"));
  			end;
  		end;
    };
    -- FREEZE (SUCKA)
  	Def.Sprite {
  		InitCommand=function(self)
  			self:x(260);
  			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'noholds') then
  				self:Load(THEME:GetPathB("","_selModIcons/freeze"));
  			end;
  		end;
    };
};
