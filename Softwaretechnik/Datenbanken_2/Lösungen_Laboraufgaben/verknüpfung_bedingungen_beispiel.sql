 SELECT spielernr, name, vorname, strasse, ort 
FROM spieler
 WHERE 
strasse NOT LIKE '%gärten' AND
 ort='Göppingen' OR spielernr=28
