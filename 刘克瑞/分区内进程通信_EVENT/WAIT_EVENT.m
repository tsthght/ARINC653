function [RETURN_CODE] = WAIT_EVENT(EVENT_ID,TIME_OUT)

global RETURN_CODE_TYPE;
global Event_Set;
global EVENT_STATE_TYPE;
global INFINITE_TIME_VALUE;
global Running_Process;
global PROCESS_STATE_TYPE;
global Time_Out_Signal;
global Current_Process;
global SYSTEM_MAX_TIMEOUT;
global SYSTEM_NUMBER_OF_EVENTS;

if  EVENT_ID_EXIST(EVENT_ID) == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    return;
end

if TIME_OUT > SYSTEM_MAX_TIMEOUT
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    return;
end

for i = 1:SYSTEM_NUMBER_OF_EVENTS
    if  Event_Set{1,i}.ID == EVENT_ID
        index = i;
        break;
    end
end

if Event_Set{1,index}.STATE == EVENT_STATE_TYPE.UP
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    return;

elseif TIME_OUT == 0
    RETURN_CODE = RETURN_CODE_TYPE.NOT_AVAILABLE;
    return;
    
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0 || isnan(Current_Process.ID) == 1 
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;

elseif TIME_OUT == INFINITE_TIME_VALUE
    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
    for i = 1:255
        if Running_Process == Current_Process.ID
            Running_Process = [];
        end
        
        INSERT_INTO_WAITING(Current_Process.ID);
    end
        Ask_For_Process_Scheduling();
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
else
    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
    for i = 1:255
        if Running_Processes_set{1,i} == Current_Process.ID
            Running_Processes_set{1,i} = [];
        end
        INSERT_INTO_WAITING(Current_Process.ID);
    end
    Ask_For_Process_Scheduling();
    if Time_out_Signal == 

        
 
    

