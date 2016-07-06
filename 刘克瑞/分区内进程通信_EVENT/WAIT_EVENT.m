function [RETURN_CODE] = WAIT_EVENT(EVENT_ID,TIME_OUT)

global RETURN_CODE_TYPE;
global Event_Set;
global EVENT_STATE_TYPE;
global INFINITE_TIME_VALUE;
global PROCESS_STATE_TYPE;
global Time_Out_Signal;
global Current_Process;
global Current_Partition_STATUS;

flag = EVENT_ID_EXIST(EVENT_ID);
if flag == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM
    return;
end

if TIME_OUT > 200
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM
    return;
end

for i = 1:256
    if  Event_Set{1,i}.ID == EVENT_ID
        index = i;
        break;
    end
end

if Event_Set{1,index}.STATE == EVENT_STATE_TYPE.UP
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
    return;

elseif TIME_OUT == 0
    RETURN_CODE = RETURN_CODE_TYPE.NOT_AVAILABLE
    return;
    
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0 || isnan(Current_Process.ID) == 1 
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE
    return;

elseif TIME_OUT == INFINITE_TIME_VALUE
    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
    INSERT_INTO_WAITING(Current_Process.ID);
    INSERT_INTO_EVENT_PROCESS_QUEUE(Current_Process.ID,EVENT_ID);
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
    return;
    
elseif TIME_OUT >0 && Event_Set{1,index}.STATE == EVENT_STATE_TYPE.DOWN
    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
    INSERT_INTO_WAITING(Current_Process.ID);
    INSERT_INTO_EVENT_PROCESS_QUEUE(Current_Process.ID,EVENT_ID);
    TIME_COUNTER = struct('PROCESS_ID',Current_Process.ID,'EVENT_ID',EVENT_ID,'DURATION',TIME_OUT,'TOS',0);
    if TIME_COUNTER.TOS == Time_Out_Signal.TRUE
        RETURN_CODE = RETURN_CODE_TYPE.TIMED_OUT
        return;
    else
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
        return;
    end
end
   
    

        
 
    

