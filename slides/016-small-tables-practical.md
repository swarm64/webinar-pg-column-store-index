
# Small tables: show & tell

* Create column-store index:

```sql
DROP INDEX IF EXISTS s64da_supplier_columnstore;
CREATE INDEX s64da_supplier_columnstore ON supplier USING columnstore(
  s_suppkey, s_name, s_address, s_nationkey, s_phone, s_acctbal
); -- about 63MB
VACUUM ANALYZE supplier;
```


* Baseline: try with column-store index forced disabled

```sql
SET swarm64da.enable_columnstore = off;
EXPLAIN ANALYZE
SELECT AVG(s_acctbal)
FROM supplier;
```


* Try with column-store index enabled

```sql
SET swarm64da.enable_columnstore = on;
EXPLAIN ANALYZE
SELECT AVG(s_acctbal)
FROM supplier;
```


* Hm, that cost system knows what it wants

```sql
SET swarm64da.enable_columnstore = on;
SET enable_bitmapscan = off;
SET enable_indexscan = off;
SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT AVG(s_acctbal)
FROM supplier;
```
