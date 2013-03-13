-- by David Klem <david.klem@gmail.com>

on open of these_items -- drag and drop files
	repeat with i from 1 to number of items in these_items
		set this_item to item i of these_items
		tell application "Adobe Acrobat Professional.app"
			activate
			open this_item
		end tell
		tell application "System Events"
			tell application process "Acrobat"
				click the menu item "Optimize Scanned PDF" of the menu "Document" of menu bar 1
				click button "OK" of window "Optimize Scanned PDF"
				click the menu item "Save" of the menu "File" of menu bar 1
				click button "Save" of window "Save As"
				delay 0.4
				keystroke space
			end tell
		end tell
		delay 1
		tell application "Adobe Acrobat Professional.app"
			activate
			close the front document
		end tell
	end repeat
end open
