SELECT 
FROM dbo.Boehmisch_spieler
GROUP BY ort
HAVING COUNT(spielernr) >=2;