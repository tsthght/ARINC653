function [LOCK_LEVEL,RETURN_CODE]=LOCK_PREEMPTION()
		
        global Current_Process;
        global ERROR_HANDLER_PROCESS_ID
        global MAX_LOCK_LEVEL
        global RETURN_CODE_TYPE
        global Current_Partition_STATUS;

        
  		if Current_Process.ID == ERROR_HANDLER_PROCESS_ID
            LOCK_LEVEL = -1;
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
            return;
        end
    	
        
  		if Current_Partition_STATUS.LOCK_LEVEL >= MAX_LOCK_LEVEL
    		LOCK_LEVEL = -1;
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    		return;
        end
  
 		Current_Partition_STATUS.LOCK_LEVEL = Current_Partition_STATUS.LOCK_LEVEL + 1;
 		LOCK_LEVEL = Current_Partition_STATUS.LOCK_LEVEL;
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;
	
