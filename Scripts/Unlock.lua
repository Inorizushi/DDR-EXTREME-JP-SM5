-- by not prefixing "local" before this variable,
-- it will have global scope throughout your theme
-- and can be accessed from any other theme file
ItemThatWasJustUnlocked = nil

codes = {
	"JLEDKZTKOZGDJJ",
	"UBNRXAOUJGPQQI",
	"PVAGUPMUALPOEZ",
	"RVNYIXOYKAWEM ",
	"SQFRXYYJSBERAH",
	"JHEDXF ALZSMSH",
	"BWUVHBKKVXFXYA"
}

function UnlockSomeStuffMaybe(text)
	-- How many unlocks are there? Get the number.
	local HowMany = UNLOCKMAN:GetNumUnlocks()

	if HowMany > 0 then
		if text == "JLEDKZTKOZGDJJ" then
			for i=1,6 do UNLOCKMAN:UnlockEntryID(tostring(i)) end
			ItemThatWasJustUnlocked = "1-6"
		elseif text == "UBNRXAOUJGPQQI" then
			for i=1,9 do UNLOCKMAN:UnlockEntryID(tostring(i)) end
			ItemThatWasJustUnlocked = "1-9"
		elseif text == "PVAGUPMUALPOEZ" then
			for i=1,15 do UNLOCKMAN:UnlockEntryID(tostring(i)) end
			ItemThatWasJustUnlocked = "1-15"
		elseif text == "RVNYIXOYKAWEM " then
			for i=1,18 do UNLOCKMAN:UnlockEntryID(tostring(i)) end
			ItemThatWasJustUnlocked = "1-18"
		elseif text == "SQFRXYYJSBERAH" then
			for i=1,24 do UNLOCKMAN:UnlockEntryID(tostring(i)) end
			ItemThatWasJustUnlocked = "1-24"
		elseif text == "JHEDXF ALZSMSH" then
			for i=1,27 do UNLOCKMAN:UnlockEntryID(tostring(i)) end
			ItemThatWasJustUnlocked = "1-27"
		elseif text == "BWUVHBKKVXFXYA" then
			for i=1,35 do UNLOCKMAN:UnlockEntryID(tostring(i)) end
			ItemThatWasJustUnlocked = "1-30"
		else
			ItemThatWasJustUnlocked = nil
		end;
	else
		-- the lookup didn't find any locked content that matched the typed text
		-- so set this variable to nil
		ItemThatWasJustUnlocked = nil
	end
end
