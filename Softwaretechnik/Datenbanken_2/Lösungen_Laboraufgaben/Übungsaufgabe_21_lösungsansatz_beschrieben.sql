-- wer für welches Geschlecht an den meisten Wettkämpfen
-- gesucht: Person, geschlecht, aufteilen nach geschlecht
--> suchen nach spielernr in wettkampf, wo höchstanzahl = geschlecht ist

SELECT sp.geschlecht, sp.name, sp.vorname, count(wt.spielernr)
FROM dbo.Boehmisch_spieler AS sp
INNER JOIN dbo.Boehmisch_wettkampf as wt
ON sp.spielernr=wt.spielernr
GROUP BY sp.geschlecht, sp.name, sp.vorname
HAVING count(*)=(
	--der Count muss der größte count für das jeweilige geschlecht sein
	SELECT MAX(gespielte_spiele)
	FROM (
		SELECT sp2.geschlecht, sp2.name, sp2.vorname, COUNT(wt2.spielernr) AS gespielte_spiele
		FROM dbo.Boehmisch_spieler AS sp2
		INNER JOIN dbo.Boehmisch_wettkampf AS wt2
		ON sp2.spielernr=wt2.spielernr
		Where sp2.geschlecht=sp.geschlecht
		GROUP by sp2.geschlecht, sp2.name, sp2.vorname
	) AS Subquery
);