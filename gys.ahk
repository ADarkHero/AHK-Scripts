^y::
	Loop {
		Send ^c										; Kopiert Artikelnummer

		; Artikel auf GYS Seite suchen
		DllCall("SetCursorPos", int, 1900, int, 250)	; Mauszeiger auf GYS-Suche bewegen
		MouseClick, left
		Send ^v										; Artikelnummer einfügen
		Send {ENTER}
		Sleep 2000

		; Save picture
		MouseMove, -550, 300, 5, R	
		MouseClick, right
		MouseMove, 20, 250, 5, R					; Maus auf "Grafik speichern" bewegen
		MouseClick, left
		Loop, 25 {									; Text-Cursor zum Anfang des Dateinamens bewegen
			Send {Left}
		}	
		Send GYS
		Send ^a
		Send ^c
		Sleep 100
		Send {ENTER}
		Send {ESC}									; Fix -> wenn kein Bild angezeigt wird

		; Bild in Enventa einfügen
		MouseMove, -450, -375, 0, R	
		MouseClick, Left
		Send ^v
		Sleep 100
		Send !{Right}
		Send {ENTER}

		; Neue Artikelnummer kopieren
		MouseMove, -625, -225, 0, R	
		Sleep 500
		MouseClick, Left
		MouseClick, Left
	}

Return

^Esc::Reload