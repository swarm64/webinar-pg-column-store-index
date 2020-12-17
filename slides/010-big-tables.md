








# Column-store index & big tables

## What does "big" mean?

* Table or its indexes exceed RAM
  > Sometimes the table fits, but PG reaches its speed limit

* Likely to get evicted, especially if multiple indexes are needed for success
* Avoid "index hell" ⇨ too many different indexes to maintain

* Example table: `orders`: 150,000,000 rows.
  > Sizes:
  >   - Table itself 20GB
  >   - All indexes: 10GB


