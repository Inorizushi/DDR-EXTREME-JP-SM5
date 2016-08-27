-- EXTREME colors
function PlayerColor( pn )
	if pn == PLAYER_1 then return color("#1FEFB6") end
	if pn == PLAYER_2 then return color("#FFBD18") end
	return color("1,1,1,1")
end

CustomDifficultyColor = {
	Beginner	= color("0.058,0.98,0.99,1"),	-- cyan
	Easy		= color("#f5a806"),		-- light yellow
	Medium		= color("0.98,0,0.63,1"),		-- light pink-red
	Hard		= color("0,0.97,0.28,1"),		-- light green
	Challenge	= color("0.45,0.42,0.98,1"),	-- purple blue
	Edit		= color("0.8,0.8,0.8,1"),		-- grey

	-- alternate names
	Light		= color("#FFB400"),			-- yellow
	Standard	= color("#FF0060"),			-- red
	Heavy		= color("#5AFF00"),			-- green
};

function CustomDifficultyToColor( sCustomDifficulty )
	return CustomDifficultyColor[sCustomDifficulty] or color("#FFFFFF")
end
