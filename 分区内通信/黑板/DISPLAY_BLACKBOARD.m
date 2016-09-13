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
    
    index=FIND_BLACKBOARD_BYID( BLACKBOARD_ID );
    
    if INVALID_LENGTH(LENGTH, Blackboard_Set{1,index}.MAX_MESSAGE_SIZE)
         RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
			return;
    end
    if INVALID_MESSAGE_ADDR(MESSAGE_ADDR)
         RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
			return;
    end
     Blackboard_Set{1,index}.EMPTY_INDICATOR =EMPTY_INDICATOR_TYPE.OCCUPIED;
     while TEMP_LENGTH < LENGTH 
         Blackboard_Set{1,index}.MESSAGE_ADDR{1,TEMP_LENGTH +1} = MESSAGE_ADDR{1,TEMP_LENGTH +1};
         TEMP_LENGTH = TEMP_LENGTH + 1;
     end
     Blackboard_Set{1,index}.LENGTH = LENGTH;
     
    num=1;
     while num<257
          id=FIND_WAITING_ID( Blackboard_Set{1,index}.ID, num  );
          if id~=0
          STOP_TIME_COUNTER(id);
          Process_Set{1,id}.PROCESS_STATE=PROCESS_STATE_TYPE.READY;
          INSERT_INTO_READY(id);
          DELETE_FROM_WAITING(id);
          num=num+1;
          else
              break;
          end
          
     end    
         if Current_Partition_STATUS.LOCK_LEVEL == 0
             PROCESS_SCHEDULING_FLAG = 1;

         end
              
         
     RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;


end

