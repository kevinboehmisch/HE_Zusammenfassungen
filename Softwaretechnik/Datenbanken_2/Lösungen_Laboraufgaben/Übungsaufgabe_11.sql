-- die Werte in der Beispielausgabe in den Übungsgaben stimmen nicht überein
-- externes nachzählen der Werte zeigt aber dass die Abfrage korrekt ist
SELECT spielernr, 
       SUM(strafe) AS gesamtstrafe
FROM dbo.Boehmisch_strafe
GROUP BY spielernr
HAVING SUM(strafe) > 0
ORDER BY gesamtstrafe DESC;
