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
},

function UnlockSomeStuffMaybe(text)
	-- How many unlocks are there? Get the number.
	local HowMany = UNLOCKMAN:GetNumUnlocks()

	if HowMany > 0 then
		if text == "JLEDKZTKOZGDJJ" then
			UNLOCKMAN:UnlockEntryID("1")
			UNLOCKMAN:UnlockEntryID("2")
			UNLOCKMAN:UnlockEntryID("3")
			UNLOCKMAN:UnlockEntryID("4")
			UNLOCKMAN:UnlockEntryID("5")
			UNLOCKMAN:UnlockEntryID("6")
			ItemThatWasJustUnlocked = "1-6"
		elseif text == "UBNRXAOUJGPQQI" then
			UNLOCKMAN:UnlockEntryID("1")
			UNLOCKMAN:UnlockEntryID("2")
			UNLOCKMAN:UnlockEntryID("3")
			UNLOCKMAN:UnlockEntryID("4")
			UNLOCKMAN:UnlockEntryID("5")
			UNLOCKMAN:UnlockEntryID("6")
			UNLOCKMAN:UnlockEntryID("7")
			UNLOCKMAN:UnlockEntryID("8")
			UNLOCKMAN:UnlockEntryID("9")
			ItemThatWasJustUnlocked = "1-9"
		elseif text == "PVAGUPMUALPOEZ" then
			UNLOCKMAN:UnlockEntryID("1")
			UNLOCKMAN:UnlockEntryID("2")
			UNLOCKMAN:UnlockEntryID("3")
			UNLOCKMAN:UnlockEntryID("4")
			UNLOCKMAN:UnlockEntryID("5")
			UNLOCKMAN:UnlockEntryID("6")
			UNLOCKMAN:UnlockEntryID("7")
			UNLOCKMAN:UnlockEntryID("8")
			UNLOCKMAN:UnlockEntryID("9")
			UNLOCKMAN:UnlockEntryID("10")
			UNLOCKMAN:UnlockEntryID("11")
			UNLOCKMAN:UnlockEntryID("12")
			UNLOCKMAN:UnlockEntryID("13")
			UNLOCKMAN:UnlockEntryID("14")
			UNLOCKMAN:UnlockEntryID("15")
			ItemThatWasJustUnlocked = "1-15"
		elseif text == "RVNYIXOYKAWEM " then
			UNLOCKMAN:UnlockEntryID("1")
			UNLOCKMAN:UnlockEntryID("2")
			UNLOCKMAN:UnlockEntryID("3")
			UNLOCKMAN:UnlockEntryID("4")
			UNLOCKMAN:UnlockEntryID("5")
			UNLOCKMAN:UnlockEntryID("6")
			UNLOCKMAN:UnlockEntryID("7")
			UNLOCKMAN:UnlockEntryID("8")
			UNLOCKMAN:UnlockEntryID("9")
			UNLOCKMAN:UnlockEntryID("10")
			UNLOCKMAN:UnlockEntryID("11")
			UNLOCKMAN:UnlockEntryID("12")
			UNLOCKMAN:UnlockEntryID("13")
			UNLOCKMAN:UnlockEntryID("14")
			UNLOCKMAN:UnlockEntryID("15")
			UNLOCKMAN:UnlockEntryID("16")
			UNLOCKMAN:UnlockEntryID("17")
			UNLOCKMAN:UnlockEntryID("18")
			ItemThatWasJustUnlocked = "1-18"
		elseif text == "SQFRXYYJSBERAH" then
			UNLOCKMAN:UnlockEntryID("1")
			UNLOCKMAN:UnlockEntryID("2")
			UNLOCKMAN:UnlockEntryID("3")
			UNLOCKMAN:UnlockEntryID("4")
			UNLOCKMAN:UnlockEntryID("5")
			UNLOCKMAN:UnlockEntryID("6")
			UNLOCKMAN:UnlockEntryID("7")
			UNLOCKMAN:UnlockEntryID("8")
			UNLOCKMAN:UnlockEntryID("9")
			UNLOCKMAN:UnlockEntryID("10")
			UNLOCKMAN:UnlockEntryID("11")
			UNLOCKMAN:UnlockEntryID("12")
			UNLOCKMAN:UnlockEntryID("13")
			UNLOCKMAN:UnlockEntryID("14")
			UNLOCKMAN:UnlockEntryID("15")
			UNLOCKMAN:UnlockEntryID("16")
			UNLOCKMAN:UnlockEntryID("17")
			UNLOCKMAN:UnlockEntryID("18")
			UNLOCKMAN:UnlockEntryID("19")
			UNLOCKMAN:UnlockEntryID("20")
			UNLOCKMAN:UnlockEntryID("21")
			UNLOCKMAN:UnlockEntryID("22")
			UNLOCKMAN:UnlockEntryID("23")
			UNLOCKMAN:UnlockEntryID("24")
			ItemThatWasJustUnlocked = "1-24"
		elseif text == "JHEDXF ALZSMSH" then
			UNLOCKMAN:UnlockEntryID("1")
			UNLOCKMAN:UnlockEntryID("2")
			UNLOCKMAN:UnlockEntryID("3")
			UNLOCKMAN:UnlockEntryID("4")
			UNLOCKMAN:UnlockEntryID("5")
			UNLOCKMAN:UnlockEntryID("6")
			UNLOCKMAN:UnlockEntryID("7")
			UNLOCKMAN:UnlockEntryID("8")
			UNLOCKMAN:UnlockEntryID("9")
			UNLOCKMAN:UnlockEntryID("10")
			UNLOCKMAN:UnlockEntryID("11")
			UNLOCKMAN:UnlockEntryID("12")
			UNLOCKMAN:UnlockEntryID("13")
			UNLOCKMAN:UnlockEntryID("14")
			UNLOCKMAN:UnlockEntryID("15")
			UNLOCKMAN:UnlockEntryID("16")
			UNLOCKMAN:UnlockEntryID("17")
			UNLOCKMAN:UnlockEntryID("18")
			UNLOCKMAN:UnlockEntryID("19")
			UNLOCKMAN:UnlockEntryID("20")
			UNLOCKMAN:UnlockEntryID("21")
			UNLOCKMAN:UnlockEntryID("22")
			UNLOCKMAN:UnlockEntryID("23")
			UNLOCKMAN:UnlockEntryID("24")
			UNLOCKMAN:UnlockEntryID("25")
			UNLOCKMAN:UnlockEntryID("26")
			UNLOCKMAN:UnlockEntryID("27")
			ItemThatWasJustUnlocked = "1-27"
		elseif text == "BWUVHBKKVXFXYA" then
			UNLOCKMAN:UnlockEntryID("1")
			UNLOCKMAN:UnlockEntryID("2")
			UNLOCKMAN:UnlockEntryID("3")
			UNLOCKMAN:UnlockEntryID("4")
			UNLOCKMAN:UnlockEntryID("5")
			UNLOCKMAN:UnlockEntryID("6")
			UNLOCKMAN:UnlockEntryID("7")
			UNLOCKMAN:UnlockEntryID("8")
			UNLOCKMAN:UnlockEntryID("9")
			UNLOCKMAN:UnlockEntryID("10")
			UNLOCKMAN:UnlockEntryID("11")
			UNLOCKMAN:UnlockEntryID("12")
			UNLOCKMAN:UnlockEntryID("13")
			UNLOCKMAN:UnlockEntryID("14")
			UNLOCKMAN:UnlockEntryID("15")
			UNLOCKMAN:UnlockEntryID("16")
			UNLOCKMAN:UnlockEntryID("17")
			UNLOCKMAN:UnlockEntryID("18")
			UNLOCKMAN:UnlockEntryID("19")
			UNLOCKMAN:UnlockEntryID("20")
			UNLOCKMAN:UnlockEntryID("21")
			UNLOCKMAN:UnlockEntryID("22")
			UNLOCKMAN:UnlockEntryID("23")
			UNLOCKMAN:UnlockEntryID("24")
			UNLOCKMAN:UnlockEntryID("25")
			UNLOCKMAN:UnlockEntryID("26")
			UNLOCKMAN:UnlockEntryID("27")
			UNLOCKMAN:UnlockEntryID("28")
			UNLOCKMAN:UnlockEntryID("29")
			UNLOCKMAN:UnlockEntryID("30")
			UNLOCKMAN:UnlockEntryID("31")
			UNLOCKMAN:UnlockEntryID("32")
			UNLOCKMAN:UnlockEntryID("33")
			UNLOCKMAN:UnlockEntryID("34")
			UNLOCKMAN:UnlockEntryID("35")
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
