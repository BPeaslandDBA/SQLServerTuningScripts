SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

select TOP 10 
deqs.execution_count as total_executions,
deqs.last_execution_time,deqs.execution_count,
deqs.total_rows,deqs.last_rows,deqs.min_rows,deqs.max_rows, 
dest.text as SQL_Text,
db_name(dest.dbid) as DatabaseName
from sys.dm_exec_query_stats deqs
cross apply sys.dm_exec_sql_text(deqs.sql_handle) dest
order by deqs.execution_count desc