-- hier wichtig man muss sich bewusst sein dass man den Durchschnitt von einer Summe berechnet!
-- 
SELECT sp.spielernr, sp.name, sp.vorname, SUM(st.strafe) AS gesamtstrafe
FROM spieler AS sp
INNER JOIN strafe AS st
ON sp.spielernr = st.spielernr
GROUP BY sp.spielernr, sp.name, sp.vorname
HAVING SUM(st.strafe) > (
	-- Subquery berechnet den Durchschnitt der Gesamtstrafen aller Spieler
    SELECT AVG(gesamtstrafe2)
    FROM (
		-- Innere Subquery berechnet die Gesamtsumme der Strafe pro Spieler (pro spielernr)
		-- Ohne Sum würde nur der Durchschnitt der einzelnen Strafen nicht der Durchschnitt aller Strafen pro Spieler berechnet werden
        SELECT SUM(st2.strafe) AS gesamtstrafe2
        FROM strafe AS st2
		-- Ohne Group By würde die Summe insgesamt berechnet werden und nicht pro einzelnen Spieler
        GROUP BY st2.spielernr
    ) AS subquery
)
ORDER BY gesamtstrafe DESC;
