function [ RETURN_CODE ] = SEND_QUEUING_MESSAGE( QUEUING_PORT_ID,MESSAGE_ADDR,LENGTH,TIME_OUT )
global RETURN_CODE_TYPE;
global PROCESS_STATE_TYPE
global Queuing_Set;
global Current_Partition_STATUS;
global Current_Process;
global Waiting_Queuing_Set;
global Waiting_Timer_Set;
global ERROR_HANDLER_PROCESS_ID;
global INFINITE_TIME_VALUE;
global Time_Out_Signal;
global PORT_DIRECTION_TYPE;
global PROCESS_SCHEDULING_FLAG;



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

if numel(Queuing_Set)~=0
    flag=0;
    for i=1:numel(Queuing_Set)
        if ~isempty(Queuing_Set{1,i})&&Queuing_Set{1,i}.ID==QUEUING_PORT_ID
            flag=1;
            break
        end
    end
    if flag==0
        RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
        return;
    end
end

location = FIND_QUEUING_PORT_INDEX( QUEUING_PORT_ID );

if Queuing_Set{1,location}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.SOURCE
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
	return;
end

TEMP_LENGTH = 0;

if Queuing_Set{1,location}.NB_MESSAGE < Queuing_Set{1,location}.MAX_NB_MESSAGE && Queuing_Set{1,location}.WAITING_PROCESSES == 0
  
  while TEMP_LENGTH < LENGTH
      Queuing_Set{1,location}.LAST_MESSAGE.MESSAGE_ADDR{1,1+TEMP_LENGTH}=MESSAGE_ADDR{1,1+TEMP_LENGTH};
      TEMP_LENGTH = TEMP_LENGTH + 1;
  end
  Queuing_Set{1,location}.LAST_MESSAGE.LENGTH=LENGTH;
  Queuing_Set{1,location}.LAST_MESSAGE.NEXT=  Queuing_Set{1,location}.NB_MESSAGE + 2 ;
  Queuing_Set{1,location}.QUEUE{1,Queuing_Set{1,location}.NB_MESSAGE+1}=Queuing_Set{1,location}.LAST_MESSAGE;
  
  if Queuing_Set{1,location}.NB_MESSAGE==0
       Queuing_Set{1,location}.FIRST_MESSAGE=Queuing_Set{1,location}.LAST_MESSAGE;
  end
  
  Queuing_Set{1,location}.NB_MESSAGE = Queuing_Set{1,location}.NB_MESSAGE + 1;
  RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
  return;
  
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0|| Current_Process.ID == ERROR_HANDLER_PROCESS_ID
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
	return;
else
    if TIME_OUT ~= INFINITE_TIME_VALUE
        CREATE_TIME_OUT_COUNTER(Current_Process.ID,TIME_OUT);
        Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
        DELETE_FROM_RUNNING(Current_Process.ID);
        INSERT_INTO_WAITING(Current_Process.ID);
        if numel(Waiting_Queuing_Set)~=0
            for i=1:numel(Waiting_Queuing_Set)
                if isempty(Waiting_Queuing_Set{1,i})
                    a.Process_ID=Current_Process.ID;
                    a.QUEUING_PORT_ID=Queuing_Set{1,m}.ID;
                    Waiting_Queuing_Set{1,i}=a;
                    break
                end
            end
        end
        
        Queuing_Set{1,location}.WAITING_PROCESSES = Queuing_Set{1,location}.WAITING_PROCESSES + 1;
        PROCESS_SCHEDULING_FLAG = 1;
        if Time_Out_Signal == 1
          RETURN_CODE = RETURN_CODE_TYPE.TIMED_OUT;
	     return;
        else
            while TEMP_LENGTH < LENGTH
              Queuing_Set{1,location}.LAST_MESSAGE.MESSAGE_ADDR{1,1+TEMP_LENGTH}=MESSAGE_ADDR{1,1+TEMP_LENGTH};
              TEMP_LENGTH = TEMP_LENGTH + 1;
            end
          Queuing_Set{1,location}.LAST_MESSAGE.LENGTH=LENGTH;
          Queuing_Set{1,location}.LAST_MESSAGE.NEXT= LENGTH+1;
          Queuing_Set{1,location}.QUEUE{1,Queuing_Set{1,location}.NB_MESSAGE+1}=Queuing_Set{1,location}.LAST_MESSAGE;
          if Queuing_Set{1,location}.NB_MESSAGE==0
               Queuing_Set{1,location}.FIRST_MESSAGE=Queuing_Set{1,location}.LAST_MESSAGE;
          end
  
          Queuing_Set{1,location}.NB_MESSAGE = Queuing_Set{1,location}.NB_MESSAGE + 1;
  
          if numel(Waiting_Timer_Set)~=0
             for i=1:numel(Waiting_Timer_Set)
                 if ~isempty(Waiting_Timer_Set{1,i})&&Waiting_Timer_Set{1,i}.ID==Current_Process.ID
                     Waiting_Timer_Set{1,i}=[];
                 end
             end
          end
         
         RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
	     return;
            
        end
    end
end


end

