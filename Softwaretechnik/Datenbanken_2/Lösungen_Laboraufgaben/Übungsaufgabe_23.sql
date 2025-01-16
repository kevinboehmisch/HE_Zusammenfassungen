SELECT sp.spielernr, sp.name, sp.vorname, SUM(st.strafe) AS gesamtstrafe
FROM dbo.Boehmisch_spieler AS sp
INNER JOIN dbo.Boehmisch_strafe AS st
ON sp.spielernr = st.spielernr
GROUP BY sp.spielernr, sp.name, sp.vorname
HAVING SUM(st.strafe) > (
	-- Subquery berechnet den Durchschnitt der Gesamtstrafen aller Spieler
    SELECT AVG(gesamtstrafe2)
    FROM (
		-- Innere Subquery berechnet die Gesamtsumme der Strafe pro Spieler (pro spielernr)
        SELECT SUM(st2.strafe) AS gesamtstrafe2
        FROM dbo.Boehmisch_strafe AS st2
		-- Ohne Group By würde die Summe insgesamt berechnet werden und nicht pro einzelnen Spieler
        GROUP BY st2.spielernr
    ) AS subquery
)
ORDER BY gesamtstrafe DESC;
