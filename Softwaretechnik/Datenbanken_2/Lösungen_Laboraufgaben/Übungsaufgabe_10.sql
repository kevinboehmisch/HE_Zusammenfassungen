SELECT geschlecht,
       AVG(DATEDIFF(yy, geboren, GETDATE())) AS [Durchschn. Alter]
FROM spieler
GROUP BY geschlecht;
