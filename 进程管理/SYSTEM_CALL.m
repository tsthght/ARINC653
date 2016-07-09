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
        [RETURN_CODE,PROCESS_ID] = GET_PROCESS_ID(PARA_REG2{1,1})
        return;
    case System_Call_Table{1,2}.ID
        [RETURN_CODE,PROCESS_STATUS] = GET_PROCESS_STATUS(PARA_REG1{1,1})
        return;
    case System_Call_Table{1,3}.ID
        RETURN_CODE = CREATE_PROCESS(PARA_REG2{1,1})
        return;
    case System_Call_Table{1,4}.ID
        RETURN_CODE = SET_PRIORITY(PARA_REG1{1,1},PARA_REG1{1,2})
        if RETURN_CODE == RETURN_CODE_TYPE.NO_ERROR
            PROCESS_SCHEDULING();
            PROCESS_SCHEDULING_FLAG = 0;
        end 
        return;
    case System_Call_Table{1,5}.ID
        RETURN_CODE = SUSPEND_SELF(PARA_REG1{1,1})
        if RETURN_CODE == RETURN_CODE_TYPE.NO_ERROR
            PROCESS_SCHEDULING();
            PROCESS_SCHEDULING_FLAG = 0;
        end 
        return;
    case System_Call_Table{1,6}.ID
        RETURN_CODE = SUSPEND(PARA_REG1{1,1})
        return;
    case System_Call_Table{1,7}.ID
        RETURN_CODE = RESUME(PARA_REG1{1,1})
        if RETURN_CODE == RETURN_CODE_TYPE.NO_ERROR
            PROCESS_SCHEDULING();
            PROCESS_SCHEDULING_FLAG = 0;
        end 
        return;
    case System_Call_Table{1,8}.ID
        RETURN_CODE = STOP_SELF()
        if RETURN_CODE == RETURN_CODE_TYPE.NO_ERROR
            PROCESS_SCHEDULING();
            PROCESS_SCHEDULING_FLAG = 0;
        end 
        return;
    case System_Call_Table{1,9}.ID
        RETURN_CODE = STOP(PARA_REG1{1,1})
        return;
    case System_Call_Table{1,10}.ID
        RETURN_CODE = START(PARA_REG1{1,1})
        if RETURN_CODE == RETURN_CODE_TYPE.NO_ERROR
            PROCESS_SCHEDULING();
            PROCESS_SCHEDULING_FLAG = 0;
        end 
        return;
    case System_Call_Table{1,11}.ID
        RETURN_CODE = DELAYED_START(PARA_REG1{1,1},PARA_REG1{1,2})
        if RETURN_CODE == RETURN_CODE_TYPE.NO_ERROR
            PROCESS_SCHEDULING();
            PROCESS_SCHEDULING_FLAG = 0;
        end 
        return;
    case System_Call_Table{1,12}.ID
       [LOCK_LEVEL,RETURN_CODE] = LOCK_PREEMPTION()
        return;
    case System_Call_Table{1,13}.ID
       [LOCK_LEVEL,RETURN_CODE] = UNLOCK_PREEMPTION()
       if RETURN_CODE == RETURN_CODE_TYPE.NO_ERROR
            PROCESS_SCHEDULING();
            PROCESS_SCHEDULING_FLAG = 0;
        end 
        return;
    case System_Call_Table{1,14}.ID
       [PROCESS_ID,RETURN_CODE] = GET_MY_ID()
        return;
end