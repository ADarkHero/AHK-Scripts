^y::
	Loop {
		; BESTELLNUMMER KOPIEREN
		DllCall("SetCursorPos", int, 364, int, 321)				; In den Tab "Einkauf" gehen
		MouseClick, left								
		MouseClick, left	
		Sleep 100		
		DllCall("SetCursorPos", int, 359, int, 561)				; Zur Bestellnummer gehen
		MouseClick, left
		Send ^c													; Bestellnummer kopieren
		Sleep 100
		
		; WEBSEITE DURCHSUCHEN
		DllCall("SetCursorPos", int, 1638, int, 300)			; "Suchen"
		MouseClick, left
		Sleep 100
		Send ^v
		Send {ENTER}
		Sleep 2000												; Warten, bis Webseite geladen hat
		
		; BILD SPEICHERN UND KOPIEREN
		DllCall("SetCursorPos", int, 1413, int, 741)			; Mauszeiger auf Grafik bewegen
		MouseClick, right
		MouseMove, 20, 85, 5, R									; "Grafik speichern"
		MouseClick, left
		Sleep 100
		Send K
		Send e
		Send m
		Send m
		Send l
		Send e
		Send r
		Send ^v													; Bestellnummer einfügen
		Send .													; .jpg anhängen
		Send j
		Send p
		Send g
		Sleep 100
		Send ^a
		Send ^c													; Bildlink kopieren
		Sleep 100
		Send {ENTER}
		Sleep 1000
		
		; BILD EINFÜGEN
		DllCall("SetCursorPos", int, 303, int, 324)				; Zum "Verkauf 2" Tab gehen
		MouseClick, left
		MouseClick, left
		Sleep 100
		DllCall("SetCursorPos", int, 881, int, 428)				; Bilddateinamen einfügen
		MouseClick, left
		Send ^v
		Sleep 100
		Send !{Right}											; Zum nächsten Artikel gehen
		Send {ENTER}
		Sleep 100
	}
Return

^Esc::Reload