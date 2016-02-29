SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

select Blocked.session_id as BlockedSessID,
Waits.wait_type as WhyBlocked,
Blocker.session_id as BlockerSessID,
db_name(Blocked.database_id) as DatabaseName,
BlockedSQL.text as BlockedSQLText,
BlockerSQL.text as BlockerSQLText
from sys.dm_exec_connections as Blocker
inner join sys.dm_exec_requests as Blocked
on Blocker.session_id=Blocked.session_id
inner join sys.dm_os_waiting_tasks as Waits
on Blocked.session_id=Waits.session_id
cross apply sys.dm_exec_sql_text(Blocker.most_recent_sql_handle) as BlockerSQL
cross apply sys.dm_exec_sql_text(Blocked.sql_handle) as BlockedSQL



