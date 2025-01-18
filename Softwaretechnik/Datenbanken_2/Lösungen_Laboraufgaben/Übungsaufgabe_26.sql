SELECT 
	wt.datum, tt.name, wt.spielernr, sp.name, sp.vorname, pr.preisgeld, pr.ausgezahlt_am, 
	st.strafe, st.spielernr, st.datum

FROM			wettkampf AS wt
	-- INNER JOIN gibt nur Übereinstimmungen aus (es werden nur Spieler angezeigt, die an einem Wettkampf teilgenommen haben).
	INNER JOIN	spieler AS sp
				ON sp.spielernr=wt.spielernr
	INNER JOIN	team AS tt
				ON tt.id = wt.team_id

	-- LEFT JOIN: Zeige alle Wettkämpfe, auch wenn kein Preisgeld ausgezahlt wurde.
	-- Falls kein Preisgeld existiert, sind die Spalten pr.preisgeld und pr.ausgezahlt_am NULL.
	LEFT JOIN	preisgeld AS pr
				ON pr.wettkampf_id = wt.id

	-- LEFT JOIN: Zeige auch Wettkämpfe ohne Strafen.
	-- Nur Strafen, die am selben Tag wie der Wettkampf vergeben wurden UND zur gleichen Spieler-Nr. gehören, werden angezeigt.
	LEFT JOIN	strafe AS st
				ON st.datum = wt.datum
				AND st.spielernr = wt.spielernr
ORDER BY wt.datum DESC;

