function [ RETURN_CODE ] = STOP( PROCESS_ID )

         global RETURN_CODE_TYPE;
         global PROCESS_STATE_TYPE ;
         global Process_Set;
         global Ready_Processes_set;
         global Waiting_Processes_set;
         global Current_Partition_Timer;
         global Process_Waiting_Resource_Set;
         global Current_Partition_STATUS;
         global Current_Process;
         global Dormant_Processes_set;
         global Previous_Process;
         global ERROR_HANDLER_PROCESS_ID;
         
        if INVALID_ID(PROCESS_ID) == 0 || Current_Process.ID == PROCESS_ID
	        RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
             return;
        end
         
        PRO = Process_Set{1,FIND_PROCESS_INDEX( PROCESS_ID )};
         
         if  PRO.PROCESS_STATE == PROCESS_STATE_TYPE.DORMANT
             RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    		return;
         end
         if  PRO.PROCESS_STATE == PROCESS_STATE_TYPE.READY
             DELETE_FROM_READY(PROCESS_ID);
         elseif  PRO.PROCESS_STATE == PROCESS_STATE_TYPE.WAITING
             DELETE_FROM_WAITING(PROCESS_ID);
         end
         
          PRO.PROCESS_STATE = PROCESS_STATE_TYPE.DORMANT;
           Process_Set{1,FIND_PROCESS_INDEX( PROCESS_ID )} = PRO;
        INSERT_INTO_DORMANT(PROCESS_ID);
         if Current_Process.ID == ERROR_HANDLER_PROCESS_ID && PROCESS_ID == Previous_Process.ID
             Current_Partition_STATUS.LOCK_LEVEL = 0;
         end
         Process_Waiting_Resource_Set{1,PROCESS_ID}=[];
         Current_Partition_Timer{1,PROCESS_ID}=[];
         RETURN_CODE =  RETURN_CODE_TYPE.NO_ERROR;
		 return;
			


         



end

