function RETURN_CODE = RESUME (  PROCESS_ID )

         global RETURN_CODE_TYPE;
         global PROCESS_STATE_TYPE ;
         global Process_Set;
         global Ready_Processes_set;
         global Waiting_Processes_set;
         global Current_Partition_Timer;
         global Process_Waiting_Resource_Set;
         global Current_Partition_STATUS;
         global Current_Process;
         global INFINITE_TIME_VALUE;
         global PROCESS_SCHEDULING_FLAG

       
        
         
        if INVALID_ID(PROCESS_ID) == 0 || Current_Process.ID == PROCESS_ID
	        RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
             return;
        end
         
        PRO = Process_Set{1,FIND_PROCESS_INDEX( PROCESS_ID )};
         
         if  PRO.PROCESS_STATE == PROCESS_STATE_TYPE.DORMANT
             RETURN_CODE =  RETURN_CODE_TYPE.INVALID_MODE;
    		return;
         end
         
         if PRO.PERIOD ~= INFINITE_TIME_VALUE
             RETURN_CODE =  RETURN_CODE_TYPE.INVALID_MODE;
    		return;
         end
         
         if  PRO.PROCESS_STATE ~= PROCESS_STATE_TYPE.WAITING
             RETURN_CODE =  RETURN_CODE_TYPE.NO_ACTION;
    		return;
         end
         
        Current_Partition_Timer{1,PROCESS_ID}=[];
       
         flag = 0;
         
             if Process_Waiting_Resource_Set{1,PROCESS_ID} == PROCESS_ID
                 flag = 1;
                 
             end
       
         
         if flag==0
             
               PRO.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
               Process_Set{1,FIND_PROCESS_INDEX( PROCESS_ID )} = PRO;
             
            
               DELETE_FROM_WAITING(PROCESS_ID);
                 
               INSERT_INTO_READY(PROCESS_ID);
                 
         
             
            
             if Current_Partition_STATUS.LOCK_LEVEL == 0
                 PROCESS_SCHEDULING_FLAG = 1;% 'Ask_For_Process_Scheduling';
             end
         end
             
             RETURN_CODE =  RETURN_CODE_TYPE.NO_ERROR;
		    return;

         end
         
         
         


