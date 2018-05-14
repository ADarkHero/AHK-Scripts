^y::
	SetKeyDelay, 100
	SetMouseDelay, 100
	Loop {
		; BESTELLNUMMER KOPIEREN
		DllCall("SetCursorPos", int, 88, int, 259)				; Zelle links oben anklicken
		MouseClick, left
		Send ^c													; Bestellnummer kopieren
		Sleep 100
		
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
		DllCall("SetCursorPos", int, 1250, int, 425)			; "Bild kopieren"
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
		DllCall("SetCursorPos", int, 300, int, 258)				; In Excel Spalte B anklicken
		MouseClick, left
		MouseClick, left
		MouseClick, left
		Send ^v
		Sleep 250
		DllCall("SetCursorPos", int, 950, int, 878)				; Scrolling-Pfeil nach unten klicken
		MouseClick, left
		Sleep 1000
	}
Return

^Esc::Reload