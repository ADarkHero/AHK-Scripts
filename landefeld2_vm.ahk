^y::
	SetKeyDelay, 100
	SetMouseDelay, 100
	Loop {
		; BESTELLNUMMER KOPIEREN
		DllCall("SetCursorPos", int, 350, int, 335)				; In den Tab "Einkauf" gehen
		MouseClick, left	
		Send ^a	
		DllCall("SetCursorPos", int, 350, int, 571)				; Zur Bestellnummer gehen
		MouseClick, left
		Send ^c													; Bestellnummer kopieren
		
		; WEBSEITE DURCHSUCHEN
		DllCall("SetCursorPos", int, 1300, int, 250)			; "Suchen"
		MouseClick, left
		Send ^a
		Send ^v
		Send {ENTER}
		Sleep 2000												; Warten, bis Webseite geladen hat
		
		; BILD SPEICHERN UND KOPIEREN
		DllCall("SetCursorPos", int, 1400, int, 673)			; Mauszeiger auf Grafik bewegen
		MouseClick, right
		MouseMove, 50, -125, 5, R								; "Grafik speichern"
		MouseClick, left
		Send LF
		StringReplace, clipboard, clipboard, /, , All			; / \ in Windows Dateinamen ist ungültig.
		StringReplace, clipboard, clipboard, \, , All
		Send ^v													; Bestellnummer einfügen
		Send .													; .jpg anhängen
		Send jpg
		Send ^a
		Send ^c													; Bildlink kopieren
		Send {ENTER}
		
		; BILD EINFÜGEN
		DllCall("SetCursorPos", int, 300, int, 333)				; Zum "Verkauf 2" Tab gehen
		MouseClick, left
		MouseClick, left
		DllCall("SetCursorPos", int, 900, int, 435)				; Bilddateinamen einfügen
		MouseClick, left
		Send ^v
		Send {F3}												; Speichern
		Send !{Right}											; Zum nächsten Artikel gehen
		Sleep 1000
	}
Return

^Esc::Reload