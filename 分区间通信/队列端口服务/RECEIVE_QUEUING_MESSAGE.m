function [ LENGTH,RETURN_CODE ] =  RECEIVE_QUEUING_MESSAGE( QUEUING_PORT_ID,TIME_OUT,MESSAGE_ADDR )
global RETURN_CODE_TYPE;
global PROCESS_STATE_TYPE;
global Queuing_Set;
global Current_Partition_STATUS;
global Current_Process;
global PORT_DIRECTION_TYPE;
global ERROR_HANDLER_PROCESS_ID;
global INFINITE_TIME_VALUE;
global PROCESS_SCHEDULING_FLAG;
global DATA_ZONE;


if INVALID_ID(QUEUING_PORT_ID)
    LENGTH=0;
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return;
end

LOCATION=0;
if numel(Queuing_Set)~=0
    flag=0;
    for i=1:numel(Queuing_Set)
        if ~isempty(Queuing_Set{1,i})&&Queuing_Set{1,i}.ID==QUEUING_PORT_ID
            flag=1;
            LOCATION=i;
            break
        end
    end
    if flag==0
        LENGTH=0;
        RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
        return;
    end
end

if INVALID_MESSAGE_ADDR(MESSAGE_ADDR)
    LENGTH=0;
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;    
	return; 
end

if INVALID_TIME_OUT(TIME_OUT)
    LENGTH=0;
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;    
	return; 
end

if Queuing_Set{1,LOCATION}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.DESTINATION
    LENGTH=0;
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;    
	return;
end

if Queuing_Set{1,LOCATION}.NB_MESSAGE ~= 0
    
     LENGTH =Queuing_Set{1,LOCATION}.QUEUE{1,Queuing_Set{1,LOCATION}.FIRST_MESSAGE}.LENGTH;
     for i=1:Queuing_Set{1,LOCATION}.QUEUE{1,Queuing_Set{1,LOCATION}.FIRST_MESSAGE}.LENGTH
        DATA_ZONE{1,MESSAGE_ADDR+i-1} =Queuing_Set{1,LOCATION}.QUEUE{1,Queuing_Set{1,LOCATION}.FIRST_MESSAGE}.ADDR{1,i};
        
    end
     
    
    
    Queuing_Set{1,LOCATION}.FIRST_MESSAGE=mod(Queuing_Set{1,LOCATION}.FIRST_MESSAGE+1,Queuing_Set{1,LOCATION}.MAX_NB_MESSAGE);
    Queuing_Set{1,LOCATION}.NB_MESSAGE = Queuing_Set{1,LOCATION}.NB_MESSAGE - 1;
    
   	if Queuing_Set{1,LOCATION}.NB_MESSAGE==0
        Queuing_Set{1,LOCATION}.LAST_MESSAGE = Queuing_Set{1,LOCATION}.FIRST_MESSAGE;
        
    end
   	    
    
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
	return;
         
elseif TIME_OUT == 0
    LENGTH = 0;
    RETURN_CODE = RETURN_CODE_TYPE.NO_AVAILABLE;
    return;
    
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0|| Current_Process.ID == ERROR_HANDLER_PROCESS_ID
    LENGTH = 0;
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
    
else 
    if TIME_OUT ~= INFINITE_TIME_VALUE
        CREATE_TIME_OUT_COUNTER(Current_Process.ID,TIME_OUT);
    end

    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
    INSERT_INTO_WAITING(Current_Process.ID);
    INSERT_INTO_REVEIVE_QUEUE( QUEUING_PORT_ID,Current_Process.ID);   
    Queuing_Set{1,LOCATION}.WAITING_PROCESSES = Queuing_Set{1,LOCATION}.WAITING_PROCESSES + 1;
    PROCESS_SCHEDULING_FLAG = 1;
         
    signal=TIME_OUT_SIGNAL(Current_Process.ID);
    if signal==true
        LENGTH = 0;
        RETURN_CODE = RETURN_CODE_TYPE.TIMED_OUT;
        return;    
    else
        if WAITING_TIME_COUNTER(Current_Process.ID)==1
            STOP_TIME_COUNTER(Current_Process.ID);
        end
        
         LENGTH =Queuing_Set{1,LOCATION}.QUEUE{1,Queuing_Set{1,LOCATION}.FIRST_MESSAGE}.LENGTH;
       for i = 1:LENGTH
        DATA_ZONE{1,MESSAGE_ADDR+i-1} = Queuing_Set{1,LOCATION}.QUEUE{1,Queuing_Set{1,LOCATION}.FIRST_MESSAGE}.ADDR{1,i};
       end
        Queuing_Set{1,LOCATION}.FIRST_MESSAGE=mod(Queuing_Set{1,LOCATION}.FIRST_MESSAGE+1,Queuing_Set{1,LOCATION}.MAX_NB_MESSAGE);
        Queuing_Set{1,LOCATION}.NB_MESSAGE = Queuing_Set{1,LOCATION}.NB_MESSAGE - 1;
   	    if Queuing_Set{1,LOCATION}.NB_MESSAGE==0
         Queuing_Set{1,LOCATION}.LAST_MESSAGE = Queuing_Set{1,LOCATION}.FIRST_MESSAGE;
        end
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        return;      
                
    end

end

end

