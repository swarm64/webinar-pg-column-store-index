
# Column-store index & point-lookups


* What does a point lookup lead to?
  > Highly likely using an index, possible even index-only
  > Fraction of the index that is needed is probably cached


* Baseline: try with column-store index forced disabled

```sql
SET swarm64da.enable_columnstore = off;

EXPLAIN ANALYZE
SELECT SUM(o_totalprice)
FROM orders
WHERE o_orderdate = '1995-01-01';
```


* Try with column-store index forced enabled

```sql
SET swarm64da.enable_columnstore = on;
SET enable_bitmapscan = off;
SET enable_indexscan = off;
SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT SUM(o_totalprice)
FROM orders
WHERE o_orderdate = '1995-01-01';
```
