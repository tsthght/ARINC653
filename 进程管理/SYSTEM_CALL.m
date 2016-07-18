function SYSTEM_CALL(systemcall_id)

%系统初始化，构造进程环境，配置文件
%ARINC653 调度案例
%Linux 调度

global System_Call_Table;
global PARA_REG1;
global PARA_REG2;
global PROCESS_SCHEDULING_FLAG;



switch(systemcall_id)
    case System_Call_Table{1,1}.ID
        [RETURN_CODE,PARTITION_STATUS] = GET_PARTITION_STATUS()
        
    case System_Call_Table{1,2}.ID
        [RETURN_CODE] = SET_PARTITION_MODE(PARA_REG1{1,1})
        
    case System_Call_Table{1,3}.ID
        [RETURN_CODE,PROCESS_ID] = GET_PROCESS_ID(PARA_REG2{1,1})
        
    case System_Call_Table{1,4}.ID
        [RETURN_CODE,PROCESS_STATUS] = GET_PROCESS_STATUS(PARA_REG1{1,1})
        
    case System_Call_Table{1,5}.ID
        [RETURN_CODE] = CREATE_PROCESS(PARA_REG2{1,1})
        
    case System_Call_Table{1,6}.ID
        [RETURN_CODE] = SET_PRIORITY(PARA_REG1{1,1},PARA_REG1{1,2})
        
    case System_Call_Table{1,7}.ID
        [RETURN_CODE] = SUSPEND_SELF(PARA_REG1{1,1})
        
    case System_Call_Table{1,8}.ID
        [RETURN_CODE] = SUSPEND(PARA_REG1{1,1})
        
    case System_Call_Table{1,9}.ID
        [RETURN_CODE] = RESUME(PARA_REG1{1,1})
        
    case System_Call_Table{1,10}.ID
        [RETURN_CODE] = STOP_SELF()
        
    case System_Call_Table{1,11}.ID
        [RETURN_CODE] = STOP(PARA_REG1{1,1})
        
    case System_Call_Table{1,12}.ID
        [RETURN_CODE] = START(PARA_REG1{1,1})
        
    case System_Call_Table{1,13}.ID
        [RETURN_CODE] = DELAYED_START(PARA_REG1{1,1},PARA_REG1{1,2})
        
    case System_Call_Table{1,14}.ID
       [LOCK_LEVEL,RETURN_CODE] = LOCK_PREEMPTION()
        
    case System_Call_Table{1,15}.ID
       [LOCK_LEVEL,RETURN_CODE] = UNLOCK_PREEMPTION()
        
    case System_Call_Table{1,16}.ID
       [PROCESS_ID,RETURN_CODE] = GET_MY_ID()
        
    case System_Call_Table{1,17}.ID
       [RETURN_CODE] = TIMED_WAIT(PARA_REG1{1,1})
        
    case System_Call_Table{1,18}.ID
       [RETURN_CODE] = PERIODIC_WAIT()
        
    case System_Call_Table{1,19}.ID
       [SYSTEM_TIME,RETURN_CODE] = GET_TIME()
        
    case System_Call_Table{1,20}.ID
       [RETURN_CODE] = REPLENISH(PARA_REG1{1,1})
        
    case System_Call_Table{1,21}.ID
       [SAMPLING_PORT_ID,RETURN_CODE] = CREATE_SAMPLING_PORT(PARA_REG2{1,1},PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
    case System_Call_Table{1,22}.ID
       [RETURN_CODE] = WRITE_SAMPLING_MESSAGE(PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
    case System_Call_Table{1,23}.ID
       [LENGTH,VALIDITY,RETURN_CODE] = READ_SAMPLING_MESSAGE(PARA_REG1{1,1},PARA_REG1{1,2})
        
    case System_Call_Table{1,24}.ID
       [SAMPLING_PORT_ID,RETURN_CODE] = GET_SAMPLING_PORT_ID(PARA_REG2{1,1})
        
    case System_Call_Table{1,25}.ID
       [SAMPLING_PORT_STATUS,RETURN_CODE] = GET_SAMPLING_PORT_STATUS(PARA_REG1{1,1})
        
    case System_Call_Table{1,26}.ID
       [QUEUING_PORT_ID,RETURN_CODE] = CREATE_QUEUING_PORT(PARA_REG2{1,1},PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3},PARA_REG1{1,4})
        
    case System_Call_Table{1,27}.ID
       [RETURN_CODE] = SEND_QUEUING_MESSAGE(PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3},PARA_REG1{1,4})
        
    case System_Call_Table{1,28}.ID
       [LENGTH,RETURN_CODE] = RECEIVE_QUEUING_MESSAGE(PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
    case System_Call_Table{1,29}.ID
       [QUEUING_PORT_ID,RETURN_CODE] = GET_QUEUING_PORT_ID(PARA_REG2{1,1})
        
    case System_Call_Table{1,30}.ID
       [QUEUING_PORT_STATUS,RETURN_CODE] = GET_QUEUING_PORT_STATUS(PARA_REG1{1,1})
        
    case System_Call_Table{1,31}.ID
       [RETURN_CODE] = CLEAR_QUEUING_PORT(PARA_REG1{1,1})
        
    case System_Call_Table{1,32}.ID
       [BUFFER_ID,RETURN_CODE] = CREATE_BUFFER(PARA_REG2{1,1},PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
    case System_Call_Table{1,33}.ID
       [RETURN_CODE] = SEND_BUFFER(PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3},PARA_REG1{1,4})
        
    case System_Call_Table{1,34}.ID
       [LENGTH,RETURN_CODE] = RECEIVE_BUFFER(PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
    case System_Call_Table{1,35}.ID
       [BUFFER_ID,RETURN_CODE] = GET_BUFFER_ID(PARA_REG2{1,1})
        
    case System_Call_Table{1,36}.ID
       [BUFFER_STATUS,RETURN_CODE] = GET_BUFFER_STATUS(PARA_REG1{1,1})
        
    case System_Call_Table{1,37}.ID
       [BLACKBOARD_ID,RETURN_CODE] = CREATE_BLACKBOARD(PARA_REG2{1,1},PARA_REG1{1,1})
        
    case System_Call_Table{1,38}.ID
       [RETURN_CODE] = DISPLAY_BLACKBOARD(PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
    case System_Call_Table{1,39}.ID
       [LENGTH,RETURN_CODE] = READ_BLACKBOARD(PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
    case System_Call_Table{1,40}.ID
       [RETURN_CODE] = CLEAR_BLACKBOARD(PARA_REG1{1,1})
        
    case System_Call_Table{1,41}.ID
       [BLACKBOARD_ID,RETURN_CODE] = GET_BLACKBOARD_ID(PARA_REG2{1,1})
        
    case System_Call_Table{1,42}.ID
       [BLACKBOARD_STATUS,RETURN_CODE] = GET_BLACKBOARD_STATUS(PARA_REG1{1,1})
        
    case System_Call_Table{1,43}.ID
       [SEMAPHORE_ID,RETURN_CODE] = CREATE_SEMAPHORE(PARA_REG2{1,1},PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
    case System_Call_Table{1,44}.ID
       [RETURN_CODE] = WAIT_SEMAPHORE(PARA_REG1{1,1},PARA_REG1{1,2})
        
    case System_Call_Table{1,45}.ID
       [RETURN_CODE] = SIGNAL_SEMAPHORE(PARA_REG1{1,1})
        
    case System_Call_Table{1,46}.ID
       [SEMAPHORE_ID,RETURN_CODE] = GET_SEMAPHORE_ID(PARA_REG2{1,1})
        
    case System_Call_Table{1,47}.ID
       [SEMAPHORE_STATUS,RETURN_CODE] = GET_SEMAPHORE_STATUS(PARA_REG1{1,1})
        
    case System_Call_Table{1,48}.ID
       [EVENT_ID,RETURN_CODE] = CREATE_EVENT(PARA_REG2{1,1})
        
    case System_Call_Table{1,49}.ID
       [RETURN_CODE] = SET_EVENT(PARA_REG1{1,1})
        
    case System_Call_Table{1,50}.ID
       [RETURN_CODE] = RESET_EVENT(PARA_REG1{1,1})
        
    case System_Call_Table{1,51}.ID
       [RETURN_CODE] = WAIT_EVENT(PARA_REG1{1,1},PARA_REG1{1,2})
        
    case System_Call_Table{1,52}.ID
       [EVENT_ID,RETURN_CODE] = GET_EVENT_ID(PARA_REG2{1,1})
        
    case System_Call_Table{1,53}.ID
       [EVENT_STATUS,RETURN_CODE] = GET_EVENT_STATUS(PARA_REG1{1,1})
        
    case System_Call_Table{1,54}.ID
       [RETURN_CODE] = REPORT_APPLICATION_MESSAGE(PARA_REG1{1,1},PARA_REG1{1,2})
        
    case System_Call_Table{1,55}.ID
       [RETURN_CODE] = CREATE_ERROR_HANDLER(PARA_REG1{1,1},PARA_REG1{1,2})
        
    case System_Call_Table{1,56}.ID
       [ERROR_STATUS,RETURN_CODE] = GET_ERROR_STATUS()
        
    case System_Call_Table{1,57}.ID
       [RETURN_CODE] = RAISE_APPLICATION_ERROR(PARA_REG1{1,1},PARA_REG1{1,2},PARA_REG1{1,3})
        
end

if PROCESS_SCHEDULING_FLAG == 1
    PROCESS_SCHEDULING();
    PROCESS_SCHEDULING_FLAG = 0;
elseif PROCESS_SCHEDULING_FLAG == 0
    %PCCounter = Current_Process.ENTRY_POINT;
    return;
end

end