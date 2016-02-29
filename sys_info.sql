SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT 
cpu_count as CPUCount,
cpu_ticks as CPUTicks,
physical_memory_in_bytes/1024/1024/1024 as RAM_GB,
DATEADD(ss, -(ms_ticks / 1000), GetDate()) AS ServerStartTime,
sqlserver_start_time as SQLServerStartTime,
'Windows '+cast(windows_sku as varchar)+' '+ windows_service_pack_level as WindowsVersion
FROM sys.dm_os_sys_info
CROSS JOIN sys.dm_os_windows_info 



