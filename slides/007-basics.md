
# Basic index creation (index column all them table columns)

> This table sits there and well, yeah, it wants to be indexed...


* Please welcome `partsupp`:

```bash
tpch_sf100=# \d partsupp
                         Table "public.partsupp"
    Column     |          Type          | Collation | Nullable | Default
---------------+------------------------+-----------+----------+---------
 ps_partkey    | integer                |           | not null |
 ps_suppkey    | integer                |           | not null |
 ps_availqty   | integer                |           | not null |
 ps_supplycost | double precision       |           | not null |
 ps_comment    | character varying(199) |           | not null |

[...]
```


* Add a column-store index - **easy as pie**:

```sql
CREATE INDEX partsupp_columnstore_idx ON partsupp
USING columnstore(
    ps_partkey
  , ps_suppkey
  , ps_availqty
  , ps_supplycost
  , ps_comment
);
```
