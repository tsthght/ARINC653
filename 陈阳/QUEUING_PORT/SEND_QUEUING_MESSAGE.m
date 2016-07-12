function [ RETURN_CODE ] = SEND_QUEUING_MESSAGE( QUEUING_PORT_ID,MESSAGE_ADDR,LENGTH,TIME_OUT )
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
	return;
end

if INVALID_MESSAGE_ADDR(MESSAGE_ADDR)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return; 
end

if INVALID_TIME_OUT(TIME_OUT)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return; 
end

if INVALID_LENGTH(LENGTH)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
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
	return;
end

if Queuing_Set{1,m}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.SOURCE
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
	return;
end

if Queuing_Set{1,m}.NB_MESSAGE < Queuing_Set{1,m}.MAX_NB_MESSAGE && Queuing_Set{1,m}.WAITING_PROCESSES == 0
  
  while TEMP_LENGTH < LENGTH
      Queuing_Set{1,m}.LAST_MESSAGE.MESSAGE_ADDR{1,1+TEMP_LENGTH}=MESSAGE_ADDR{1,1+TEMP_LENGTH};
      TEMP_LENGTH = TEMP_LENGTH + 1;
  end
  Queuing_Set{1,m}.LAST_MESSAGE.LENGTH=LENGTH;
  Queuing_Set{1,m}.LAST_MESSAGE.NEXT=  Queuing_Set{1,m}.NB_MESSAGE + 2 ;
  Queuing_Set{1,m}.QUEUE{1,Queuing_Set{1,m}.NB_MESSAGE+1}=Queuing_Set{1,m}.LAST_MESSAGE;
  
  if Queuing_Set{1,m}.NB_MESSAGE==0
       Queuing_Set{1,m}.FIRST_MESSAGE=Queuing_Set{1,m}.LAST_MESSAGE;
  end
  
  Queuing_Set{1,m}.NB_MESSAGE = Queuing_Set{1,m}.NB_MESSAGE + 1;
  RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
	return;
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0|| Current_Process.ID == ERROR_HANDLER_PROCESS_ID
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
	return;
else
    if TIME_OUT ~= INFINITE_TIME_VALUE
       % CREATE_TIME_COUNTER(TIME_OUT,Current_Process.ID,Time_Out_Signal);
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
	     return;
        else
            while TEMP_LENGTH < LENGTH
      Queuing_Set{1,m}.LAST_MESSAGE.MESSAGE_ADDR{1,1+TEMP_LENGTH}=MESSAGE_ADDR{1,1+TEMP_LENGTH};
      TEMP_LENGTH = TEMP_LENGTH + 1;
            end
  Queuing_Set{1,m}.LAST_MESSAGE.LENGTH=LENGTH;
  Queuing_Set{1,m}.LAST_MESSAGE.NEXT= LENGTH+1;
  Queuing_Set{1,m}.QUEUE{1,Queuing_Set{1,m}.NB_MESSAGE+1}=Queuing_Set{1,m}.LAST_MESSAGE;
  if Queuing_Set{1,m}.NB_MESSAGE==0
       Queuing_Set{1,m}.FIRST_MESSAGE=Queuing_Set{1,m}.LAST_MESSAGE;
  end
  
  Queuing_Set{1,m}.NB_MESSAGE = Queuing_Set{1,m}.NB_MESSAGE + 1;
         for i=1:255
             if ~isempty(Waiting_Timer_Set{1,i})&&Waiting_Timer_Set{1,i}.ID==Current_Process.ID
                 Waiting_Timer_Set{1,i}=[];
             end
         end
         
         RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
	     return;
            
        end
    end
end


end

