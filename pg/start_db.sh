export CURRENT=$(pwd)
export PGDATA=$CURRENT/pg/data
echo setting PGDATA to $PGDATA
pg_ctl -l pg/logfile start