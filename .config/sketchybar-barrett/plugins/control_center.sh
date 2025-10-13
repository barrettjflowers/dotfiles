#!/bin/bash

osascript -e '
-- Click the “Control Center” menu bar item.
delay 0.0
set timeoutSeconds to 0.000000
set uiScript to "click menu bar item 2 of menu bar 1 of application process \"Control Center\""
my doWithTimeout( uiScript, timeoutSeconds )

on doWithTimeout(uiScript, timeoutSeconds)
	set endDate to (current date) + timeoutSeconds
	repeat
		try
			run script "tell application \"System Events\"
" & uiScript & "
end tell"
			exit repeat
		on error errorMessage
			if ((current date) > endDate) then
				error "Can not " & uiScript
			end if
		end try
	end repeat
end doWithTimeout
'
