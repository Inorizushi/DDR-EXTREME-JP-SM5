-- by not prefixing "local" before this variable,
-- it will have global scope throughout your theme
-- and can be accessed from any other theme file
GAMESTATE:Env()["ItemThatWasJustUnlocked"] = nil

codes = {
	{"JLEDKZTKOZGDJJ",6},
	{"UBNRXAOUJGPQQI",9},
	{"PVAGUPMUALPOEZ",15},
	{"RVNYIXOYKAWEM ",18},
	{"SQFRXYYJSBERAH",24},
	{"JHEDXF ALZSMSH",27},
	{"BWUVHBKKVXFXYA",30}
}

function UnlockSomeStuffMaybe(text)
	-- How many unlocks are there? Get the number.
	local HowMany = UNLOCKMAN:GetNumUnlocks()

	if HowMany > 0 then
		for v in ivalues(codes) do
			-- Since each sequential code just unlocks whatever the last one had and then its own,
			-- let's make a loop that manages the max number and the code.
			if v[1] == text then
				GAMESTATE:Env()["ItemThatWasJustUnlocked"] = tostring("1-"..v[2])
				for i=1,v[2] do
					UNLOCKMAN:UnlockEntryID(tostring(i))
				end
			end
		end
	end
end
