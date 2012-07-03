tell application "BBEdit"
	tell window 1
		set currentLine to endLine of selection
		set nextLine to lastLine + 1
		
		-- Delete starting after the last non-whitespace character in the current line
		set findDeleteStart to find "\\s*$" options {search mode:grep} Â
			searching in line currentLine
		if found of findDeleteStart then
			set firstCharacter to characterOffset of found object of findDeleteStart
		else
			set firstCharacter to characterOffset of line lastLine
		end if
		
		-- Delete until the first non-whitespace character in the next line
		set findDeleteEnd to find "^\\s*" options {search mode:grep} Â
			searching in line nextLine
		if found of findDeleteEnd then
			set lastCharacter to characterOffset of (last character of (found object of findDeleteEnd))
		else
			set lastCharacter to (characterOffset of line nextLine) - 1
		end if
		
		-- Make the selection, then delete it
		select (characters firstCharacter thru lastCharacter)
		delete selection
	end tell
end tell