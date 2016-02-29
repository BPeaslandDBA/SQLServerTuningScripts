SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

select 
sess.session_id as SessionID,
sess.login_time as LoginTime,
sess.host_name as HostName,
sess.program_name as ProgramName,
sess.login_name as LoginName,
sess.status as SessionStatus,
reqs.status as RequestStatus,
reqs.command as Command,
db_name(reqs.database_id) as DatabaseName,
reqs.blocking_session_id as BlockingSessionID,
reqs.wait_type as WaitType,
reqs.wait_time as WaitTime,
sqltext.text as SQL_Text
from sys.dm_exec_requests reqs
join sys.dm_exec_connections conn
  on conn.session_id=reqs.session_id
right outer join sys.dm_exec_sessions sess
  on reqs.session_id=sess.session_id
cross apply sys.dm_exec_sql_text(conn.most_recent_sql_handle) sqltext

