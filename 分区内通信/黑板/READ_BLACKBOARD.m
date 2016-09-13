function [ MESSAGE_ADDR,LENGTH,RETURN_CODE ] = READ_BLACKBOARD( BLACKBOARD_ID,TIME_OUT )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
global RETURN_CODE_TYPE;
global Blackboard_Set;
global Current_Partition_STATUS;
global Waiting_Timer_Set;
global PROCESS_SCHEDULING_FLAG ;
global PROCESS_STATE_TYPE;
global Waiting_Blackboard_Set;
global Current_Process;
global ERROR_HANDLER_PROCESS_ID;
global INFINITE_TIME_VALUE;


TEMP_LENGTH = 0;
if INVALID_ID(BLACKBOARD_ID)
    RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
    MESSAGE_ADDR=[];
			return;

end
if INVALID_TIME_OUT(TIME_OUT)
 RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
 MESSAGE_ADDR=[];
			return;
end
 
    if FIND_BLACKBOARD_BYID( BLACKBOARD_ID )==0
         RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
         MESSAGE_ADDR=[];
			return;
    end 
    index=FIND_BLACKBOARD_BYID( BLACKBOARD_ID ); 
    
if Blackboard_Set{1,index}.EMPTY_INDICATOR == EMPTY_INDICATOR_TYPE.OCCUPIED
          MESSAGE_ADDR=cell(1,Blackboard_Set{1,index}.LENGTH);
    while TEMP_LENGTH< Blackboard_Set{1,index}.LENGTH
      
        MESSAGE_ADDR{1,TEMP_LENGTH +1}=Blackboard_Set{1,index}.MESSAGE_ADDR{1,TEMP_LENGTH +1};
        TEMP_LENGTH = TEMP_LENGTH + 1;
    end
    LENGTH = Blackboard_Set{1,index}.LENGTH;
			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
            
			return;
elseif TIME_OUT == 0
        LENGTH = 0;
  			RETURN_CODE = RETURN_CODE_TYPE.NOT_AVAILABLE;
            MESSAGE_ADDR=[];
  			return;
elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0||Current_Process.ID == ERROR_HANDLER_PROCESS_ID
         LENGTH = 0;
  			RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
            MESSAGE_ADDR=[];
  			return;
elseif TIME_OUT == INFINITE_TIME_VALUE
    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
    DELETE_FROM_RUNNING(Current_Process.ID);
   
   INCERT_INTO_WBlackboard( Current_Process.ID,Blackboard_Set{1,index}.ID);
   
    INSERT_INTO_WAITING(Current_Process.ID);
    PROCESS_SCHEDULING_FLAG = 1;
    
    MESSAGE_ADDR=cell(1,Blackboard_Set{1,index}.LENGTH);
   while TEMP_LENGTH< Blackboard_Set{1,index}.LENGTH
        
        MESSAGE_ADDR{1,TEMP_LENGTH +1}=Blackboard_Set{1,index}.MESSAGE_ADDR{1,TEMP_LENGTH +1};
        TEMP_LENGTH = TEMP_LENGTH + 1;
    end
    LENGTH = Blackboard_Set{1,index}.LENGTH;
			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
            
			return;
else
    MESSAGE_ADDR=cell(1,Blackboard_Set{1,index}.LENGTH);
     while TEMP_LENGTH< Blackboard_Set{1,index}.LENGTH
        
        MESSAGE_ADDR{1,TEMP_LENGTH +1}=Blackboard_Set{1,index}.MESSAGE_ADDR{1,TEMP_LENGTH +1};
        TEMP_LENGTH = TEMP_LENGTH + 1;
    end
    LENGTH = Blackboard_Set{1,index}.LENGTH;
			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
			return;
end




end

