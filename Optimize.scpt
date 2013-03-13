-- OCR This (Acrobat)
-- Original Script by Joe Kissell <jk@alt.cc>
-- Modified by David Klem <david.klem@gmail.com>
-- "How to make your office paperless" http://www.macworld.com/article/159007/
-- "Take Control of Your Paperless Office" http://www.takecontrolbooks.com/paperless-office

-- on adding folder items to this_folder after receiving these_items
on open of these_items
	tell application "Finder" to set appName to name of application file id "com.adobe.Acrobat.Pro"
	tell application "Finder" to set appVersion to version of application file id "com.adobe.Acrobat.Pro"
	repeat with i from 1 to number of items in these_items
		set this_item to item i of these_items
		set the item_info to info for this_item
		tell application appName
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
		tell application appName
			activate
			close the front document
		end tell
	end repeat
end open

-- key code 123 -- Left
-- key code 124 -- Right
-- key code 125 -- Down
-- key code 126 -- Up
