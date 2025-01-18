SELECT sp.name, sp.vorname, sp.spielernr
FROM spieler AS sp
INNER JOIN strafe AS st
ON st.spielernr = sp.spielernr
WHERE st.strafe >= 30
GROUP BY sp.name, sp.vorname, sp.spielernr
HAVING count(st.strafe) > 3;
