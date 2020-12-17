




# Prep some data...


```sql
DROP TABLE IF EXISTS newdata;
CREATE TABLE newdata AS (
  SELECT
      id::BIGINT AS id
    , (random() * 100.0)::DOUBLE PRECISION AS val
    , false AS ping
    , random_string((random() * 100)::INT)::VARCHAR(255) AS comment
  FROM generate_series(1, 100000) id
);

CREATE INDEX newdata_columnstore_index ON newdata
USING columnstore(
    id
  , val
  , ping
  , comment
);

VACUUM ANALYZE newdata;
```

