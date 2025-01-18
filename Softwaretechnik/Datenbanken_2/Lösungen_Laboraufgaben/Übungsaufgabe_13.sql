SELECT sp.name, sp.vorname
FROM spieler AS sp
INNER JOIN strafe AS st
ON sp.spielernr = st.spielernr
GROUP BY name, vorname
Having count(strafe)>=1;
