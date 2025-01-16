 SELECT spielernr, name, vorname, strasse, ort 
FROM dbo.Boehmisch_spieler
 WHERE 
strasse NOT LIKE '%gärten' AND
 ort='Göppingen' OR spielernr=28