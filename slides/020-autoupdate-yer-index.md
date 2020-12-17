






# Keep yer index up-to-date (automatically)


* Like any other index in PostgreSQL: autovacuum works
* But, autovacuum configuration is key
  > For this example, we picked a very aggressive one.

```bash
tpch_sf100=# select name, setting from pg_settings where name like '%autovacuum%';
                name                 |  setting
-------------------------------------+-----------
 autovacuum                          | on
 autovacuum_analyze_scale_factor     | 0
 autovacuum_analyze_threshold        | 1
 autovacuum_vacuum_scale_factor      | 0
 autovacuum_vacuum_threshold         | 1
 autovacuum_naptime                  | 1
 autovacuum_vacuum_cost_limit        | 5000
 log_autovacuum_min_duration         | 250
```


