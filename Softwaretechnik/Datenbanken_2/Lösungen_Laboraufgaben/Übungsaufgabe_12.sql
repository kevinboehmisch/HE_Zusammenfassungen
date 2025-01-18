SELECT 
FROM spieler
GROUP BY ort
HAVING COUNT(spielernr) >=2;
