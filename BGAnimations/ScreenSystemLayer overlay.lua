local function CreditsText( pn, useSmallFont )
	local font = useSmallFont and "CreditsSmall" or "ScreenSystemLayer Credits"
	local text = LoadFont(font) .. {
		InitCommand=function(self)
			self:name("Credits" .. PlayerNumberToString(pn))
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");

			if self.SetTextureFiltering then
				self:SetTextureFiltering(not useSmallFont)
			end
			self:zoom( useSmallFont and 2 or 1)
			:addy( useSmallFont and -4 or 0 )

			self:playcommand("UpdateVisible")
		end;
		UpdateTextCommand=function(self)
			local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
			self:settext(str);

			if GAMESTATE:IsEventMode() then
				self:settext("") -- Separate text will handle this.
			else
				if GAMESTATE:GetCoinMode() == "CoinMode_Free" then
					self:settext("FREE PLAY")
				end
				if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
					local credits = GAMESTATE:GetCoins()
					self:settext( ("CREDIT(S): %i"):format(credits) )
				end
			end
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end
			
			self:visible( bShow );
			if screen then
				local isGameplay = screen:GetScreenType() == "ScreenType_Gameplay" or screen:GetName() == "ScreenDemonstration" or screen:GetName() == "ScreenHowToPlay"
				if useSmallFont then
					self:visible( isGameplay )
				else
					self:visible( not isGameplay )
				end
			end
		end
	};
	return text;
end;

local function EventModeText( useSmallFont )
	local font = useSmallFont and "CreditsSmall" or "ScreenSystemLayer Credits"

	return Def.BitmapText{
		Font=font,
		Text="EVENT MODE",
		InitCommand=function(self)
			self:name("EventMode")
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
			if self.SetTextureFiltering then
				self:SetTextureFiltering(not useSmallFont)
			end
			self:zoom( useSmallFont and 2 or 1)
			:addy( useSmallFont and -4 or 0 )

			self:playcommand("UpdateVisible")
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end

			self:visible( GAMESTATE:IsEventMode() );
			if screen then
				-- TODO: When in a gameplay screen, change font to be the smaller variant.
				local isGameplay = screen:GetScreenType() == "ScreenType_Gameplay" or screen:GetName() == "ScreenDemonstration" or screen:GetName() == "ScreenHowToPlay"
				if useSmallFont then
					self:visible( GAMESTATE:IsEventMode() and isGameplay )
				else
					self:visible( GAMESTATE:IsEventMode() and not isGameplay )
				end
			end
		end
	}
end

--
local t = Def.ActorFrame {}
	-- Aux
t[#t+1] = LoadActor(THEME:GetPathB("ScreenSystemLayer","aux"));
	-- Credits
t[#t+1] = Def.ActorFrame {
--[[  	PlayerPane( PLAYER_1 ) .. {
		InitCommand=cmd(x,scale(0.125,0,1,SCREEN_LEFT,SCREEN_WIDTH);y,SCREEN_BOTTOM-16)
	}; --]]
 	CreditsText( PLAYER_1 );
	CreditsText( PLAYER_2 );

	CreditsText( PLAYER_1, true );
	CreditsText( PLAYER_2, true );

	EventModeText(),
	EventModeText(true)
};
	-- Text
t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=function (self)
			self:zoomtowidth(SCREEN_WIDTH):zoomtoheight(30):horizalign(left):vertalign(top):y(SCREEN_TOP):diffuse(color("0,0,0,0"))
		end,
		OnCommand=function (self)
			self:finishtweening():diffusealpha(0.85)
		end,
		OffCommand=function (self)
			self:sleep(3):linear(0.5):diffusealpha(0)
		end
	};
	Def.BitmapText{
		Font="Common Normal";
		Name="Text";
		InitCommand=function (self)
			self:maxwidth(750):horizalign(left):vertalign(top):y(SCREEN_TOP+10):x(SCREEN_LEFT+10):shadowlength(1):diffusealpha(0)
		end,
		OnCommand=function (self)
			self:finishtweening():diffusealpha(1):zoom(0.5)
		end,
		OffCommand=function (self)
			self:sleep(3):linear(0.5):diffusealpha(0)
		end
	};
	SystemMessageMessageCommand = function(self, params)
		self:GetChild("Text"):settext( params.Message );
		self:playcommand( "On" );
		if params.NoAnimate then
			self:finishtweening();
		end
		self:playcommand( "Off" );
	end;
	HideSystemMessageMessageCommand = function (self)
		self:finishtweening()
	end
};

return t;
