









# Column-store index & small tables

## What does small mean?

* Table or its indexes fit into RAM
* Unlikely to get evicted

* Example table: `supplier`: 1,000,000 rows.
  > Sizes:
  >   - Table itself 170MB
  >   - PK index 21MB

