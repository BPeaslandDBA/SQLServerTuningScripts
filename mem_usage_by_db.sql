SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT 
db_name(database_id) as DatabaseName,
cast((count(row_count)*8.0)/1024.0 as decimal(30,2)) as RAM_MB
from sys.dm_os_buffer_descriptors
group by database_id
order by 2 desc

