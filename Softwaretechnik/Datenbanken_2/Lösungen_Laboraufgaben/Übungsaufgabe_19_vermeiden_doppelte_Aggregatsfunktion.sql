-- Lösung mit Subquery um doppelte Aggregatsfunktion zu vermeiden
SELECT sp.spielernr, sp.name, sp.vorname, SUM(st.strafe) AS gesamtstrafe
FROM dbo.Boehmisch_spieler AS sp
INNER JOIN dbo.Boehmisch_strafe AS st
ON sp.spielernr = st.spielernr
GROUP BY sp.spielernr, sp.vorname, sp.name
HAVING SUM(st.strafe) = (
    SELECT MAX(gesamtstrafe)
    FROM (
        SELECT spielernr, SUM(strafe) AS gesamtstrafe
        FROM dbo.Boehmisch_strafe
        GROUP BY spielernr
    ) AS subquery
);

-- gleiche Lösung aber mit Top 1 um nur das erste Ergebnis der Query auszuwählen
SELECT TOP 1 sp.spielernr, sp.name, sp.vorname, SUM(st.strafe)
FROM dbo.Boehmisch_spieler AS sp
INNER JOIN dbo.Boehm_strafe AS st
ON sp.spielernr=st.spielernr
GROUP BY sp.spielernr, sp.vorname, sp.name
ORDER BY SUM(st.strafe) DESC

