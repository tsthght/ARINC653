function [LOCK_LEVEL,RETURN_CODE ] = UNLOCK_PREEMPTION()

        global Current_Process;
        global ERROR_HANDLER_PROCESS_ID
        global RETURN_CODE_TYPE
        global Current_Partition_STATUS;
        global OPERATING_MODE_TYPE;
        global PROCESS_SCHEDULING_FLAG;
       
       if Current_Process.ID == ERROR_HANDLER_PROCESS_ID || Current_Partition_STATUS.OPERATING_MODE ~= OPERATING_MODE_TYPE.NORMAL|| Current_Partition_STATUS.LOCK_LEVEL == 0
    		LOCK_LEVEL = -1;
            RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    		return;
       end
  
  		Current_Partition_STATUS.LOCK_LEVEL = Current_Partition_STATUS.LOCK_LEVEL - 1;
        
		if Current_Partition_STATUS.LOCK_LEVEL == 0 
            PROCESS_SCHEDULING_FLAG = 1;
        end
			
		LOCK_LEVEL = Current_Partition_STATUS.LOCK_LEVEL;
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        end


end

