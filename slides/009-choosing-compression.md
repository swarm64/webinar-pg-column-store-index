
# Compression: disk-space usage low or CPU usage low?

```sql
CREATE INDEX my_columnstore_index
ON my_table
USING columnstore(col_a, col_b, col_c)
WITH(compression_type=’zstd’, compression_level=5);
--                      ↑                       ↑
--                 zstd or lz4                 1-9
--                 ====
```

* How does the workload behave when we vary these?

## Index creation

```bash
+-------------+--------+--------+--------+-------+-------+-------+
| Compression | zstd-1 | zstd-5 | zstd-9 | lz4-1 | lz4-5 | lz4-9 |
| Time [s]    |   1031 |   1737 |   3519 |  1503 |  1835 |  3069 |
| Size [GB]   |    274 |    249 |    234 |   358 |   338 |   330 |
| Compression |    4.5 |    5.0 |    5.3 |   3.5 |   3.7 |   3.8 |
+-------------+--------+--------+--------+-------+-------+-------+
```

## Workload runtime

```bash
+-------------+------+--------+--------+--------+-------+-------+-------+
| Compression |  PG  | zstd-1 | zstd-5 | zstd-9 | lz4-1 | lz4-5 | lz4-9 |
| Runtime [s] | 8779 |   1697 |   1706 |  1682  |  1556 |  1535 |  1532 |
| Data [TB]   | 15.6 |    1.2 |    1.1 |   1.1  |   1.5 |   1.5 |   1.4 |
+-------------+------+--------+--------+--------+-------+-------+-------+
```

See https://swarm64.com/post/compression-columnstore-indexes/ for details.
