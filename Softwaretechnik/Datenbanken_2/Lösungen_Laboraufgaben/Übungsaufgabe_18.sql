SELECT TOP 1 sp.spielernr, sp.name, sp.vorname, SUM(st.strafe)
FROM dbo.Boehmisch_spieler AS sp
INNER JOIN dbo.Boehm_strafe AS st
ON sp.spielernr=st.spielernr
GROUP BY sp.spielernr, sp.vorname, sp.name
ORDER BY SUM(st.strafe) DESC
