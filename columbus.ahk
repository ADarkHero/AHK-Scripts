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
		DllCall("SetCursorPos", int, 1400, int, 65)				; "Suchen"
		MouseClick, left
		; Clipboard manipulieren
		SetKeyDelay, 5
		Url = www.mercateo.com/mimegallery.jsp?CatalogID=C4054&SKU=
		Send %Url%
		Send %clipboard%
		SetKeyDelay, 100
		Send {ENTER}
		Sleep 1000												; Warten, bis Webseite geladen hat
		
		; BILD SPEICHERN UND KOPIEREN
		DllCall("SetCursorPos", int, 1300, int, 435)			; "Bild kopieren"
		MouseClick, right
		MouseMove, 50, 50, 5, R									; "Grafik speichern"
		MouseClick, left
		Sleep 250
		Send ^v													; Bestellnummer einfügen
		Clipboard = 											; Clipboard leeren, falls kein Bild gefunden wurde
		Send .													; .jpg anhängen
		Send jpg												
		Send ^a
		Sleep 250
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