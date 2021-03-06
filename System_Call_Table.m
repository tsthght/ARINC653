global System_Call_Table;
System_Call_Table = cell(1,57);
System_Call_Table{1,1} = struct('ID',1,'NAME','SYS_GET_PARTITION_STATUS');
System_Call_Table{1,2} = struct('ID',2,'NAME','SYS_SET_PARTITION_MODE');
System_Call_Table{1,3} = struct('ID',3,'NAME','SYS_GET_PROCESS_ID');
System_Call_Table{1,4} = struct('ID',4,'NAME','SYS_GET_PROCESS_STATUS');
System_Call_Table{1,5} = struct('ID',5,'NAME','SYS_CREATE_PROCESS');
System_Call_Table{1,6} = struct('ID',6,'NAME','SYS_SET_PRIORITY');
System_Call_Table{1,7} = struct('ID',7,'NAME','SYS_SUSPEND_SELF');
System_Call_Table{1,8} = struct('ID',8,'NAME','SYS_SUSPEND');
System_Call_Table{1,9} = struct('ID',9,'NAME','SYS_RESUME');
System_Call_Table{1,10} = struct('ID',10,'NAME','SYS_STOP_SELF');
System_Call_Table{1,11} = struct('ID',11,'NAME','SYS_STOP');
System_Call_Table{1,12} = struct('ID',12,'NAME','SYS_START');
System_Call_Table{1,13} = struct('ID',13,'NAME','SYS_DELAYED_START');
System_Call_Table{1,14} = struct('ID',14,'NAME','SYS_LOCK_PREEMPTION');
System_Call_Table{1,15} = struct('ID',15,'NAME','SYS_UNLOCK_PREEMPTION');
System_Call_Table{1,16} = struct('ID',16,'NAME','SYS_GET_MY_ID');
System_Call_Table{1,17} = struct('ID',17,'NAME','SYS_TIMED_WAIT');
System_Call_Table{1,18} = struct('ID',18,'NAME','SYS_PERIODIC_WAIT');
System_Call_Table{1,19} = struct('ID',19,'NAME','SYS_GET_TIME');
System_Call_Table{1,20} = struct('ID',20,'NAME','SYS_REPLENISH');
System_Call_Table{1,21} = struct('ID',21,'NAME','SYS_CREATE_SAMPLING_PORT');
System_Call_Table{1,22} = struct('ID',22,'NAME','SYS_WRITE_SAMPLING_MESSAGE');
System_Call_Table{1,23} = struct('ID',23,'NAME','SYS_READ_SAMPLING_MESSAGE');
System_Call_Table{1,24} = struct('ID',24,'NAME','SYS_GET_SAMPLING_PORT_ID');
System_Call_Table{1,25} = struct('ID',25,'NAME','SYS_GET_SAMPLING_PORT_STATUS');
System_Call_Table{1,26} = struct('ID',26,'NAME','SYS_CREATE_QUEUING_PORT');
System_Call_Table{1,27} = struct('ID',27,'NAME','SYS_SEND_QUEUING_MESSAGE');
System_Call_Table{1,28} = struct('ID',28,'NAME','SYS_RECEIVE_QUEUING_MESSAGE');
System_Call_Table{1,29} = struct('ID',29,'NAME','SYS_GET_QUEUING_PORT_ID');
System_Call_Table{1,30} = struct('ID',30,'NAME','SYS_GET_QUEUING_PORT_STATUS');
System_Call_Table{1,31} = struct('ID',31,'NAME','SYS_CLEAR_QUEUING_PORT');
System_Call_Table{1,32} = struct('ID',32,'NAME','SYS_CREATE_BUFFER');
System_Call_Table{1,33} = struct('ID',33,'NAME','SYS_SEND_BUFFER');
System_Call_Table{1,34} = struct('ID',34,'NAME','SYS_RECEIVE_BUFFER');
System_Call_Table{1,35} = struct('ID',35,'NAME','SYS_GET_BUFFER_ID');
System_Call_Table{1,36} = struct('ID',36,'NAME','SYS_GET_BUFFER_STATUS');
System_Call_Table{1,37} = struct('ID',37,'NAME','SYS_CREATE_BLACKBOARD');
System_Call_Table{1,38} = struct('ID',38,'NAME','SYS_DISPLAY_BLACKBOARD');
System_Call_Table{1,39} = struct('ID',39,'NAME','SYS_READ_BLACKBOARD');
System_Call_Table{1,40} = struct('ID',40,'NAME','SYS_CLEAR_BLACKBOARD');
System_Call_Table{1,41} = struct('ID',41,'NAME','SYS_GET_BLACKBOARD_ID');
System_Call_Table{1,42} = struct('ID',42,'NAME','SYS_GET_BLACKBOARD_STATUS');
System_Call_Table{1,43} = struct('ID',43,'NAME','SYS_CREATE_SEMAPHORE');
System_Call_Table{1,44} = struct('ID',44,'NAME','SYS_WAIT_SEMAPHORE');
System_Call_Table{1,45} = struct('ID',45,'NAME','SYS_SIGNAL_SEMAPHORE');
System_Call_Table{1,46} = struct('ID',46,'NAME','SYS_GET_SEMAPHORE_ID');
System_Call_Table{1,47} = struct('ID',47,'NAME','SYS_GET_SEMAPHORE_STATUS');
System_Call_Table{1,48} = struct('ID',48,'NAME','SYS_CREATE_EVENT');
System_Call_Table{1,49} = struct('ID',49,'NAME','SYS_SET_EVENT');
System_Call_Table{1,50} = struct('ID',50,'NAME','SYS_RESET_EVENT');
System_Call_Table{1,51} = struct('ID',51,'NAME','SYS_WAIT_EVENT');
System_Call_Table{1,52} = struct('ID',52,'NAME','SYS_GET_EVENT_ID');
System_Call_Table{1,53} = struct('ID',53,'NAME','SYS_GET_EVENT_STATUS');
System_Call_Table{1,54} = struct('ID',54,'NAME','SYS_REPORT_APPLICATION_MESSAGE');
System_Call_Table{1,55} = struct('ID',55,'NAME','SYS_CREATE_ERROR_HANDLER');
System_Call_Table{1,56} = struct('ID',56,'NAME','SYS_GET_ERROR_STATUS');
System_Call_Table{1,57} = struct('ID',57,'NAME','SYS_RAISE_APPLICATION_ERROR');