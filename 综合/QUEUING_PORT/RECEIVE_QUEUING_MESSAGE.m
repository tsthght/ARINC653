function [ MESSAGE_ADDR,LENGTH,RETURN_CODE ] =  RECEIVE_QUEUING_MESSAGE( QUEUING_PORT_ID,TIME_OUT,MESSAGE_ADDR )
global RETURN_CODE_TYPE;
global SYSTEM_NUMBER_OF_QUEUING_PORTS;
global Queuing_Set;
global Configuration_table;
 global Current_Partition_STATUS;
 global MAX_NUMBER_OF_QUEUING_PORTS;
global PARTITION_CONFIG;
global PROCESS_STATE_TYPE
global Current_Process
global Waiting_Queuing_Set 
global Waiting_Timer_Set
global ERROR_HANDLER_PROCESS_ID
global INFINITE_TIME_VALUE
global Time_Out_Signal

TEMP_LENGTH = 0;

if INVALID_ID(QUEUING_PORT_ID)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    MESSAGE_ADDR=[];
    LENGTH=0;
	return;
end
if INVALID_MESSAGE_ADDR(MESSAGE_ADDR)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    MESSAGE_ADDR=[];
    LENGTH=0;
	return; 
end

if INVALID_TIME_OUT(TIME_OUT)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    MESSAGE_ADDR=[];
    LENGTH=0;
	return; 
end

flag=0;
m=0;
for i=1:512
    if ~isempty(Queuing_Set{1,i})&&Queuing_Set{1,i}.ID==QUEUING_PORT_ID
        flag=1;
        m=i;
        break
    end
end
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    MESSAGE_ADDR=[];
    LENGTH=0;
	return;
end

if Queuing_Set{1,m}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.DESTINATION
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    MESSAGE_ADDR=[];
    LENGTH=0;
	return;
end

if Queuing_Set{1,m}.NB_MESSAGE ~= 0
    
    while TEMP_LENGTH < Queuing_Set{1,m}.FIRST_MESSAGE.LENGTH
        MESSAGE_ADDR{1,1+TEMP_LENGTH}=Queuing_Set{1,m}.FIRST_MESSAGE.MESSAGE_ADDR{1,1+TEMP_LENGTH}; 
        				TEMP_LENGTH = TEMP_LENGTH + 1;
        
    end
    LENGTH = Queuing_Set{1,m}.FIRST_MESSAGE.LENGTH;
   			Queuing_Set{1,m}.FIRST_MESSAGE = Queuing_Set{1,m}.QUEUE{1,Queuing_Set{1,m}.FIRST_MESSAGE.NEXT};
   			Queuing_Set{1,m}.NB_MESSAGE = Queuing_Set{1,m}.NB_MESSAGE - 1;  			
     		 RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
	     return;
elseif TIME_OUT == 0
    LENGTH = 0;
    RETURN_CODE = RETURN_CODE_TYPE.NO_AVAILABLE;
    MESSAGE_ADDR=[];
    return
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0|| Current_Process.ID == ERROR_HANDLER_PROCESS_ID
    LENGTH = 0;
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    MESSAGE_ADDR=[];
    return
else 
    if TIME_OUT ~= INFINITE_TIME_VALUE
        %CREATE_TIME_COUNTER(TIME_OUT,Current_Process.ID,Time_Out_Signal);
         Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
        DELETE_FROM_RUNNING(Current_Process.ID);
        INSERT_INTO_WAITING(Current_Process.ID);
        for i=1:512
            if isempty(Waiting_Queuing_Set{1,i})
                a.Process_ID=Current_Process.ID;
                a.QUEUING_PORT_ID=Queuing_Set{1,m}.ID;
                Waiting_Queuing_Set{1,i}=a;
                break
            end
        end
        
        Queuing_Set{1,m}.WAITING_PROCESSES = Queuing_Set{1,m}.WAITING_PROCESSES + 1;
        disp('Ask_For_Process_Scheduling');
        if Time_Out_Signal == 1
          RETURN_CODE = RETURN_CODE_TYPE.TIMED_OUT;
          MESSAGE_ADDR=[];
          LENGTH = 0;
	     return;
        else
            if TIME_OUT ~= INFINITE_TIME_VALUE
                %STOP_TIME_COUNTER(Current_Process.ID);
                  while TEMP_LENGTH < Queuing_Set{1,m}.FIRST_MESSAGE.LENGTH
        MESSAGE_ADDR{1,1+TEMP_LENGTH}=Queuing_Set{1,m}.FIRST_MESSAGE.MESSAGE_ADDR{1,1+TEMP_LENGTH}; 
        				TEMP_LENGTH = TEMP_LENGTH + 1;
        
                 end
    LENGTH = Queuing_Set{1,m}.FIRST_MESSAGE.LENGTH;
   			Queuing_Set{1,m}.FIRST_MESSAGE = Queuing_Set{1,m}.QPort.QUEUE{1,NEXT};
   			Queuing_Set{1,m}.NB_MESSAGE = Queuing_Set{1,m}.NB_MESSAGE - 1;  			
     		 RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
	     return;
            end
        end
        
        
        
    end

end

