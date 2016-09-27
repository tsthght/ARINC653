function [ RETURN_CODE ] = SEND_QUEUING_MESSAGE( QUEUING_PORT_ID,MESSAGE_ADDR,LENGTH,TIME_OUT )
global RETURN_CODE_TYPE;
global PROCESS_STATE_TYPE
global Queuing_Set;
global DATA_ZONE;
global Current_Partition_STATUS;
global Current_Process;
global ERROR_HANDLER_PROCESS_ID;
global INFINITE_TIME_VALUE;
global PORT_DIRECTION_TYPE;
global PROCESS_SCHEDULING_FLAG;

if INVALID_ID(QUEUING_PORT_ID)
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

if INVALID_TIME_OUT(TIME_OUT)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return; 
end

if INVALID_LENGTH(LENGTH)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return; 
end

if INVALID_MESSAGE_ADDR(MESSAGE_ADDR)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return; 
end

location = FIND_QUEUING_PORT_INDEX( QUEUING_PORT_ID );

if Queuing_Set{1,location}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.SOURCE
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
	return;
end

if Queuing_Set{1,location}.NB_MESSAGE < Queuing_Set{1,location}.MAX_NB_MESSAGE && Queuing_Set{1,location}.WAITING_PROCESSES == 0
  
       QMESSAGE.LENGTH=LENGTH;
       QMESSAGE.ADDR=cell(1,QMESSAGE.LENGTH);
      for i = MESSAGE_ADDR:MESSAGE_ADDR+LENGTH-1
          
          QMESSAGE.ADDR{1,i-MESSAGE_ADDR+1} = DATA_ZONE{1,i};
      end
      Queuing_Set{1,location}.LAST_MESSAGE=mod(Queuing_Set{1,location}.LAST_MESSAGE+1, Queuing_Set{1,location}.MAX_NB_MESSAGE);
      Queuing_Set{1,location}.QUEUE{1,Queuing_Set{1,location}.LAST_MESSAGE}=QMESSAGE;
       if Queuing_Set{1,location}.NB_MESSAGE==0
           Queuing_Set{1,location}.FIRST_MESSAGE  =Queuing_Set{1,location}.LAST_MESSAGE;
       end
     

      Queuing_Set{1,location}.NB_MESSAGE = Queuing_Set{1,location}.NB_MESSAGE + 1;
      RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
      return;

elseif TIME_OUT==0
    
    RETURN_CODE = RETURN_CODE_TYPE.NOT_AVAILABLE;
	return;
  
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0|| Current_Process.ID == ERROR_HANDLER_PROCESS_ID
    
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
	return;

else
        if TIME_OUT ~= INFINITE_TIME_VALUE
            CREATE_TIME_OUT_COUNTER(Current_Process.ID,TIME_OUT);
        end
        
        Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
        INSERT_INTO_WAITING(Current_Process.ID);
        INSERT_INTO_QUEUE_PORT(QUEUING_PORT_ID,Current_Process.ID);     
        Queuing_Set{1,location}.WAITING_PROCESSES = Queuing_Set{1,location}.WAITING_PROCESSES + 1;
        PROCESS_SCHEDULING_FLAG = 1;
        
        signal=TIME_OUT_SIGNAL(Current_Process.ID);
        if signal==true
              RETURN_CODE = RETURN_CODE_TYPE.TIMED_OUT;
              return;
        else
            QMESSAGE.LENGTH=LENGTH;
            QMESSAGE.ADDR=cell(1,QMESSAGE.LENGTH);
            for i = MESSAGE_ADDR:MESSAGE_ADDR+LENGTH-1
          
                QMESSAGE.ADDR{1,i-MESSAGE_ADDR+1} = DATA_ZONE{1,i};
            end
            Queuing_Set{1,location}.LAST_MESSAGE=mod(Queuing_Set{1,location}.LAST_MESSAGE+1, Queuing_Set{1,location}.MAX_NB_MESSAGE);
            Queuing_Set{1,location}.QUEUE{1,Queuing_Set{1,location}.LAST_MESSAGE}=QMESSAGE;
            if Queuing_Set{1,location}.NB_MESSAGE==0
               Queuing_Set{1,location}.FIRST_MESSAGE  =Queuing_Set{1,location}.LAST_MESSAGE;
            end
            Queuing_Set{1,location}.NB_MESSAGE = Queuing_Set{1,location}.NB_MESSAGE + 1;
  
            if WAITING_TIME_COUNTER(Current_Process.ID)==1
                STOP_TIME_COUNTER(Current_Process.ID);
            end
         
         RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
	     return;
            
        end
    end
end



