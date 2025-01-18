SELECT tt.name, sum(pp.preisgeld)
FROM team AS tt
INNER JOIN wettkampf AS wt
ON tt.id = wt.team_id
INNER JOIN preisgeld AS pp
ON pp.wettkampf_id = wt.id
WHERE tt.name = 'Llamas'
GROUP BY tt.name;
