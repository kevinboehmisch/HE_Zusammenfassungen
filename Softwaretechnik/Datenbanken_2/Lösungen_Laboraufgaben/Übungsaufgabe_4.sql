SELECT name, vorname, month(geboren) AS 'Geburtsmonat' FROM dbo.Boehmisch_spieler
WHERE month(geboren) BETWEEN 6 AND 12
ORDER BY 'Geburtsmonat' ASC;




