SELECT geschlecht, 
       AVG(DATEDIFF(yy, geboren, GETDATE()) - 
       CASE 
           WHEN DATEADD(yy, DATEDIFF(yy, geboren, GETDATE()), geboren) > GETDATE() 
           THEN 1 
           ELSE 0 
       END) AS [Durchschn. Alter]
FROM spieler
GROUP BY geschlecht;
