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
		DllCall("SetCursorPos", int, 1069, int, 206)			; "Suchen"
		MouseClick, left
		Send ^v
		Send {ENTER}
		Sleep 3000												; Warten, bis Webseite geladen hat
		
		; BILD SPEICHERN UND KOPIEREN
		DllCall("SetCursorPos", int, 1069, int, 206)			; "Bild kopieren"
		MouseClick, right
		MouseMove, 20, 250, 5, R								; "Grafik speichern"
		MouseClick, left
		Sleep 100
		Send {BackSpace}										; Namen der Grafik löschen
		Send ^v													; Bestellnummer einfügen
		Send .													; .jpg anhängen
		Send jpg												
		Sleep 100
		Send ^a
		Send ^c													; Bildlink kopieren
		
		; BILD EINFÜGEN
		DllCall("SetCursorPos", int, 303, int, 324)				; Zum "Verkauf 2" Tab gehen
		MouseClick, left
		MouseClick, left
		Sleep 100
		DllCall("SetCursorPos", int, 881, int, 428)				; Bilddateinamen einfügen
		MouseClick, left
		Send ^v
		Sleep 100
		Send {F3}												; Speichern
		Sleep 200
		Send !{Right}											; Zum nächsten Artikel gehen
		Sleep 100
	}
Return

^Esc::ExitApp