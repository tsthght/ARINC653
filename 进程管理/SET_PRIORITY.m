function [RETURN_CODE]= SET_PRIORITY(PROCESS_ID,PRIORITY)
         global PROCESS_STATE_TYPE;
         global Process_Set;
         global RETURN_CODE_TYPE;
         global MIN_PRIORITY_VALUE;
         global MAX_PRIORITY_VALUE;
         global SYSTEM_NUMBER_OF_PROCESSES;
         global Current_Partition_STATUS;
         global PROCESS_SCHEDULING_FLAG;

         if  PROCESS_ID_EXIST(PROCESS_ID) == 0    
             [RETURN_CODE] = RETURN_CODE_TYPE.INVALID_PARAM;
             return;
         end
         
         if  PRIORITY < MIN_PRIORITY_VALUE || PRIORITY > MAX_PRIORITY_VALUE
             [RETURN_CODE] = RETURN_CODE_TYPE.INVALID_PARAM;	
             return;
         end
         
         for i = 1:SYSTEM_NUMBER_OF_PROCESSES
             if PROCESS_ID == Process_Set{1,i}.ID
                 PRO = Process_Set{1,i};
                 index = i;
                 break;
             else
                 continue;
             end
         end
         
         if PRO.PROCESS_STATE == PROCESS_STATE_TYPE.DORMANT
             [RETURN_CODE] = RETURN_CODE_TYPE.INVALID_MODE;
             return;
         end
         
         PRO.CURRENT_PRIORITY = PRIORITY;
         Process_Set{1,index} = PRO;
         
         if Current_Partition_STATUS.LOCK_LEVEL == 0
             PROCESS_SCHEDULING_FLAG = 1;
         end
         
         [RETURN_CODE] = RETURN_CODE_TYPE.NO_ERROR;
         return;
end
	 
			
		 	
