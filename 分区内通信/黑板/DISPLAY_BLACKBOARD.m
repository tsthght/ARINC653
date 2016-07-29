function [ RETURN_CODE ] = DISPLAY_BLACKBOARD( BLACKBOARD_ID,MESSAGE_ADDR, LENGTH )
global RETURN_CODE_TYPE;
global Blackboard_Set;
global Current_Partition_STATUS;
global Waiting_Timer_Set;
global Process_Set;
global PROCESS_STATE_TYPE;
global Waiting_Blackboard_Set;
global PROCESS_SCHEDULING_FLAG


TEMP_LENGTH = 0;

    if INVALID_ID(BLACKBOARD_ID)
       RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
			return;

    end

    if FIND_BLACKBOARD_BYID( BLACKBOARD_ID )==0
         RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
			return;
    end 
    
    s=FIND_BLACKBOARD_BYID( BLACKBOARD_ID );
    
    if INVALID_LENGTH(LENGTH, Blackboard_Set{1,s}.MAX_MESSAGE_SIZE)
         RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
			return;
    end
    if INVALID_MESSAGE_ADDR(MESSAGE_ADDR)
         RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
			return;
    end
     Blackboard_Set{1,s}.EMPTY_INDICATOR =EMPTY_INDICATOR_TYPE.OCCUPIED;
     while TEMP_LENGTH < LENGTH 
         Blackboard_Set{1,s}.MESSAGE_ADDR{1,TEMP_LENGTH +1} = MESSAGE_ADDR{1,TEMP_LENGTH +1};
         TEMP_LENGTH = TEMP_LENGTH + 1;
     end
     Blackboard_Set{1,s}.LENGTH = LENGTH;
    
     j=1;
     [x,y]=Is_In_Waiting_Blackboard_Set(Blackboard_Set{1,s},j);
     while  x==1
        
         for i=1:255
             if Waiting_Timer_Set{1,i}==y
                 Waiting_Timer_Set{1,i}=[];
                 break;
             end
         end 
          Process_Set{1,y}.PROCESS_STATE=PROCESS_STATE_TYPE.READY;
          INSERT_INTO_READY(y);
         Waiting_Blackboard_Set{1,j}=[];
         DELETE_FROM_WAITING(y);
         if Current_Partition_STATUS.LOCK_LEVEL == 0
             PROCESS_SCHEDULING_FLAG = 1;

         end
              
          j=j+1;
         if j<257
       [x,y]=Is_In_Waiting_Blackboard_Set(Blackboard_Set{1,s},j); 
         end
     end
     RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;


end

