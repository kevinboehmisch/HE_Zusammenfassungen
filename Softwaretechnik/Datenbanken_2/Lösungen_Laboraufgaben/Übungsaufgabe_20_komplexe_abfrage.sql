SELECT sp.spielernr, sp.name AS spieler_name, sp.vorname, 
       DATEDIFF(day, sp.geboren, wt.datum) AS tage_seit_geburt,
       tt.name AS team_name, 
       kap.name AS kapitaen_name,  -- Kapitänsname aus 'kap'
       kap.vorname AS kapitaen_vorname
FROM spieler AS sp
INNER JOIN wettkampf AS wt
ON sp.spielernr = wt.spielernr
INNER JOIN team AS tt
ON wt.team_id = tt.id
-- Neuer Join zur Ermittlung des Kapitäns 
INNER JOIN spieler AS kap
ON tt.kapitaen_nr = kap.spielernr
-- Spieler mit der geringsten Anzahl an Tagen seit Geburt am Wettkampf
WHERE DATEDIFF(day, sp.geboren, wt.datum) = (
    SELECT MIN(DATEDIFF(day, sp2.geboren, wt2.datum))
    FROM spieler AS sp2
    INNER JOIN wettkampf AS wt2
    ON sp2.spielernr = wt2.spielernr
);
