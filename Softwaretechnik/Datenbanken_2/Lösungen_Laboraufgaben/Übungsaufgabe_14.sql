SELECT count(wt.id)
FROM wettkampf AS wt
INNER JOIN team AS tt
ON wt.team_id = tt.id
WHERE tt.name = 'Bären';
