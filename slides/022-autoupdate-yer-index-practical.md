



# INSERT, UPDATE, SELECT ... and repeat
  (sorry, it doesn't rhyme)


```sql
SET max_parallel_workers_per_gather = 4;

WITH append AS (
  INSERT INTO newdata(
    SELECT new_id, random(), false, random_string(10)
    FROM generate_series(
      (SELECT max(id) + 1     FROM newdata),
      (SELECT max(id) + 25000 FROM newdata)
    ) new_id
  )
  RETURNING id
)
UPDATE newdata
SET ping = true
WHERE id = (SELECT min(id) - 1 FROM append);

SET enable_seqscan = off;
SET swarm64da.enable_columnstore = on;

EXPLAIN (ANALYZE, VERBOSE)
SELECT AVG(val), SUM(val)
FROM newdata;
```
