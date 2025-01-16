SELECT DISTINCT year(wt.datum) AS 'Jahr', 
       tt.name AS 'Siegerteam', 
       COUNT(*) AS 'Gewonnene Spiele'
FROM dbo.Boehmisch_wettkampf AS wt
INNER JOIN dbo.Boehm_team AS tt
ON tt.id = wt.team_id
-- Berücksichtigt nur Spiele, in denen die Punktzahl des Spielers höher war als die des Gegners (Sieg)
WHERE wt.punktzahlspieler > wt.punktzahlgegner
GROUP BY YEAR(wt.datum), tt.id, tt.name
-- Filtert Teams, die die höchste Anzahl an Siegen pro Jahr haben
HAVING COUNT(*) = (
    -- Subquery: Bestimmt das Team mit den meisten Siegen pro Jahr
	SELECT TOP 1 COUNT(*)
	FROM dbo.Boehmisch_wettkampf AS wt2 
	-- Betrachtet nur Spiele im gleichen Jahr wie in der Hauptabfrage wo es einen Sieg gab
	WHERE year(wt2.datum) = year(wt.datum) 
	-- durch das AND werden also verlorene und unentschiedene Spiele nicht betrachtet
	  AND wt2.punktzahlspieler > wt2.punktzahlgegner
	-- Gruppiert erneut nach Team (für die Anzahl der Siege pro Team im Jahr)
	-- (Gruppieren nach Jahr nicht mehr notwendig, da WHERE Bedingung bereits nach Jahr filtert)
	GROUP BY wt2.team_id
	-- Gibt das Team mit den meisten Siegen (höchster COUNT) zurück
	ORDER BY COUNT(*) DESC
)
ORDER BY year(wt.datum);
