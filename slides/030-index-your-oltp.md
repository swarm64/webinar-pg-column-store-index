














# You have: OLTP. You want: analytics on top

* Rule of thumb:
  > Your server has capacity: add the column-store index
  > If not, consider replication

  (and, ...if you are on AWS RDS, consider using PG Nitrous ;-)

