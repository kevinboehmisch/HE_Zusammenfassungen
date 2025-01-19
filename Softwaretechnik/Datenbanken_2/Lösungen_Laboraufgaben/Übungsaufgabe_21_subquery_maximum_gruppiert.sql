-- Die Aufgabe zuerst runterbrechen:
--1. maximum gefragt (MAX()) aber Wert muss zuerst gezählt werden (COUNT())
	--> Subquery notwendig mit COUNT()= MAX() Wert aus Subquery
--2. gruppierung nach geschlecht gefragt -> granularität erhöhen mit WHERE
	--> In der Subquery eine WHERE sp.geschlecht=sp2.geschlecht, da somit neue extra Bedingung erstellt wird


-- Das Ergebnis der äußeren Query zeigt die Anzahl der Wettkämpfe pro Spieler
SELECT sp.geschlecht AS 'geschlecht', sp.name AS 'name', sp.vorname AS 'vorname', count(wt.spielernr) AS 'Anzahl Spiele'
FROM spieler AS sp
INNER JOIN wettkampf AS wt
ON sp.spielernr = wt.spielernr
GROUP BY sp.geschlecht, sp.name, sp.vorname
-- Having-Klausel filtert Spieler mit maximalen Anzahl Wettkämpfe pro Geschlecht
HAVING COUNT(wt.spielernr) = (
	-- Subquery ermittelt für jedes Geschlecht maximale Anzahl Wettkämpfe mit MAX(Anzahl_Spiele)
	SELECT MAX(Anzahl_Spiele)
	FROM (
		-- Innerhalb Subquery werden Wettkämpfe gezählt und nach geschlecht gruppiert
		SELECT sp2.geschlecht, sp2.name, sp2.vorname, COUNT(wt2.spielernr) AS Anzahl_Spiele
        FROM spieler AS sp2
        INNER JOIN wettkampf AS wt2
        ON sp2.spielernr = wt2.spielernr
		-- hierdurch durch diese WHERE-Clausel wird sichergestellt, dass sich MAX(Anzahl_Spiele) 
		-- nicht auf beide Geschlechter gleichzeitig (m,w) bezieht, sondern immer nur jeweils separat
		-- BSP: sp2.geschlecht='m' und sp.geschlecht='m' -> da sp2.geschlecht=sp.geschlecht wird das MAX(Anzahl_spiele) 
		--      nur auf 'm' (Männer) angewendet und nicht auf die 'w' Frauen
		--      -> Frauen werden nur mit Frauen und Männer nur mit Männern auf die maximale Anzahl der Spiele verglichen
		--      -> Subquery wird nur für Spieler des gleichen Geschlechts ausgeführt 
        WHERE sp2.geschlecht = sp.geschlecht -- <-- das ist die entscheidende Zeile!
        GROUP BY sp2.geschlecht, sp2.name, sp2.vorname
	) AS Subquery
); 



