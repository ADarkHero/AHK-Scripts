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
		DllCall("SetCursorPos", int, 1200, int, 240)			; Suchen
		MouseClick, left
		Send ^v
		Send {ENTER}
		Sleep 7000												; Warten, bis Webseite geladen hat
		
		; BILD SPEICHERN UND KOPIEREN 
		DllCall("SetCursorPos", int, 1270, int, 615)			; Mauszeiger auf Grafik bewegen
		MouseClick, right
		MouseMove, 1, 30, 5, R									; Grafik speichern
		MouseClick, left
		Sleep 250
		Send ^c													; Bildlink kopieren
		; Dateien ohne Bild filtern
		if (clipboard = "nopicture_all.jpg" or clipboard = "detail.jpg") {				
			Clipboard = -.jpg
			Send {ESC}
		}
		else {
			Send {ENTER}
		}
		
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