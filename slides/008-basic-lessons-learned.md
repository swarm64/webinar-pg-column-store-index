






# Lessons learned, so far...

* Index creation:

```sql
CREATE INDEX <name> ON <table> USING columnstore(<columns>);
```

# ...and more

* If in doubt, take **all columns**, well, unless
  > You know what you do (in terms of queries)
  > You got more than 32

* You can split indexes, but be aware of overlaps
  > If PG doesn't know better, it will possibly use a (slow) table scan

* Works on top of existing indexes (a hooray to cost estimation)
* Works with your most beloved consistency friends PK, UK and FK

* The Swarm64 DA column-store index reads directly from disk
  > Consider measuring your I/O subsystem and maybe improve it
