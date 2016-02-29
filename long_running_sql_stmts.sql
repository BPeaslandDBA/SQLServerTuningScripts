SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

select TOP 10 
CAST ((deqs.total_elapsed_time/deqs.execution_count)/1000000.0 AS DECIMAL(30,2)) as avg_elapsed_secs,
deqs.last_execution_time,deqs.execution_count,
deqs.total_rows,deqs.last_rows,deqs.min_rows,deqs.max_rows, 
dest.text as SQL_Text,
db_name(dest.dbid) as DatabaseName
from sys.dm_exec_query_stats deqs
cross apply sys.dm_exec_sql_text(deqs.sql_handle) dest
order by deqs.total_elapsed_time/deqs.execution_count desc