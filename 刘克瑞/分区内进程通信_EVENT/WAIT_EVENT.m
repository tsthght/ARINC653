function [RETURN_CODE] = WAIT_EVENT(EVENT_ID,TIME_OUT)

global RETURN_CODE_TYPE;
global Event_Set;
global EVENT_STATE_TYPE;
global INFINITE_TIME_VALUE;
global PROCESS_STATE_TYPE;
global Time_Out_Signal;
global Current_Process;
global Current_Partition_STATUS;
global SYSTEM_NUMBER_OF_EVENTS;
global SYSTEM_MAX_TIMEOUT;
global Waiting_Timer_Set;
global PROCESS_SCHEDULING_FLAG;
global Waiting_Event_Set;

if EVENT_ID_EXIST(EVENT_ID) == 0
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
    else
        continue;
    end
end

if Event_Set{1,index}.STATE == EVENT_STATE_TYPE.UP
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    return;

elseif TIME_OUT == 0
    RETURN_CODE = RETURN_CODE_TYPE.NOT_AVAILABLE;
    return;
    
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0 || Current_Process.ID == 0 
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;

elseif TIME_OUT == INFINITE_TIME_VALUE
    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
    INSERT_INTO_WAITING(Current_Process.ID);
    INSERT_INTO_EVENT_PROCESS_QUEUE(Current_Process.ID,EVENT_ID);
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    return;
    
elseif TIME_OUT >0 && Event_Set{1,index}.STATE == EVENT_STATE_TYPE.DOWN
    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
    INSERT_INTO_WAITING(Current_Process.ID);
    INSERT_INTO_EVENT_PROCESS_QUEUE(Current_Process.ID,EVENT_ID);
    TIME_COUNTER = struct('PROCESS_ID',Current_Process.ID,'EVENT_ID',EVENT_ID,'DURATION',TIME_OUT,'TOS',round(rand(1)));
    Waiting_Timer_Set{1,numel(Waiting_Timer_Set)+1} = TIME_COUNTER;
    PROCESS_SCHEDULING_FLAG = 1;
    if TIME_COUNTER.TOS == Time_Out_Signal.TRUE
        RETURN_CODE = RETURN_CODE_TYPE.TIMED_OUT;
        return;
    else
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        return;
    end
end
   
    

        
 
    

