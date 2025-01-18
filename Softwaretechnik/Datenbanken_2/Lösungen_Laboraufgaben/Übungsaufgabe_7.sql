SELECT count(spielernr) 
FROM spieler
WHERE datediff(yy, geboren, beitritt) > 20;
