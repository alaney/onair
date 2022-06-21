if application "Google Chrome" is running then
	tell application "Google Chrome"
		repeat with theWindow in every window
			repeat with theTab in every tab of theWindow
				if theTab's title contains "Meet -" then
					return 1
				end if
			end repeat
		end repeat
		return 0
	end tell
end if
return 0