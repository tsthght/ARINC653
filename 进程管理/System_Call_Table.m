global System_Call_Table;
System_Call_Table = cell(1,13);
System_Call_Table{1,1} = struct('ID',1,'NAME','SYS_GET_PROCESS_ID','PROCESS_NAME','a');
System_Call_Table{1,2} = struct('ID',2,'NAME','SYS_GET_PROCESS_STATUS','PROCESS_ID',Process_Set{1,1}.ID);
System_Call_Table{1,3} = struct('ID',3,'NAME','SYS_CREATE_PROCESS','ATTRIBUTES',ATTRIBUTES);
System_Call_Table{1,4} = struct('ID',4,'NAME','SYS_SET_PRIORITY','PROCESS_ID',Process_Set{1,1}.ID,'PRIORITY',16);
System_Call_Table{1,5} = struct('ID',5,'NAME','SYS_SUSPEND_SELF','TIME_OUT',6);
System_Call_Table{1,6} = struct('ID',6,'NAME','SYS_SUSPEND','PROCESS_ID',Process_Set{1,1}.ID);
System_Call_Table{1,7} = struct('ID',7,'NAME','SYS_RESUME','PROCESS_ID',Process_Set{1,1}.ID);
System_Call_Table{1,8} = struct('ID',8,'NAME','SYS_STOP_SELF');
System_Call_Table{1,9} = struct('ID',9,'NAME','SYS_STOP','PROCESS_ID',Process_Set{1,1}.ID);
System_Call_Table{1,10} = struct('ID',10,'NAME','SYS_START','PROCESS_ID',Process_Set{1,1}.ID);
System_Call_Table{1,11} = struct('ID',11,'NAME','SYS_DELAYED_START','PROCESS_ID',Process_Set{1,1}.ID,'DELAY_TIME',4);
System_Call_Table{1,12} = struct('ID',12,'NAME','SYS_LOCK_PREEMPTION');
System_Call_Table{1,13} = struct('ID',13,'NAME','SYS_UNLOCK_PREEMPTION');
System_Call_Table{1,14} = struct('ID',14,'NAME','SYS_GET_MY_ID');