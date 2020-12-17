
# Big tables: show & tell

* Create column-store index:

```sql
DROP INDEX IF EXISTS s64da_orders_columnstore;
CREATE INDEX s64da_orders_columnstore ON orders USING columnstore(
  o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate, o_orderpriority, o_clerk, o_shippriority
); -- about 20GB
VACUUM ANALYZE orders;
```


* Baseline: try with column-store index forced disabled

```sql
SET swarm64da.enable_columnstore = off;
EXPLAIN ANALYZE
SELECT AVG(o_totalprice)
FROM orders
WHERE o_orderdate BETWEEN '1994-01-01'::DATE AND '1994-12-31';
```


* Try with column-store index enabled

```sql
SET swarm64da.enable_columnstore = on;
EXPLAIN ANALYZE
SELECT AVG(o_totalprice)
FROM orders
WHERE o_orderdate BETWEEN '1994-01-01'::DATE AND '1994-12-31';
```
