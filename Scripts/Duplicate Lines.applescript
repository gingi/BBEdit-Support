tell application "BBEdit"
	tell window 1
		set start_line to startLine of selection
		set end_line to endLine of selection
		select (lines start_line thru end_line)
		set selectionCopy to duplicate selection
		select insertion point after selection
		set selection to selectionCopy
	end tell
end tell