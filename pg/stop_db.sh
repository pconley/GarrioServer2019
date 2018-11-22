export CURRENT=$(pwd)
export PGDATA=$CURRENT/pg/data
echo Using current PGDATA = $PGDATA
pg_ctl stop