SELECT tt.name AS 'team', sp.name AS 'Spieler_Name', sp.vorname AS 'Spieler_Vorname', sum(st.strafe)
FROM team AS tt
INNER JOIN spieler AS sp
ON sp.spielernr = tt.kapitaen_nr
INNER JOIN strafe AS st
ON tt.kapitaen_nr = st.spielernr
WHERE tt.kapitaen_nr IS NOT NULL
GROUP BY tt.name, sp.name, sp.vorname;
