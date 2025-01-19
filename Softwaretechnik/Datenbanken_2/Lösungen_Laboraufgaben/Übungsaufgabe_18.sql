SELECT sp.spielernr, sp.name, sp.vorname
FROM spieler AS sp
WHERE sp.spielernr >(
	SELECT AVG(sp2.spielernr)
	FROM spieler AS sp2
)
