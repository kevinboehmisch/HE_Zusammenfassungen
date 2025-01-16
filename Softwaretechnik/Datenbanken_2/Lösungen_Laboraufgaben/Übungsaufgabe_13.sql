SELECT sp.name, sp.vorname
FROM dbo.Boehmisch_spieler AS sp
INNER JOIN dbo.Boehmisch_strafe AS st
ON sp.spielernr = st.spielernr
GROUP BY name, vorname
Having count(strafe)>=1;
