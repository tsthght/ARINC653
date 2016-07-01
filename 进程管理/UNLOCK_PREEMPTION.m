function [LOCK_LEVEL,RETURN_CODE ] = UNLOCK_PREEMPTION()
       global Idel_Process
       global RETURN_CODE_TYPE
       global ERROR_HANDLER_PROCESS_ID
       global OPERATING_MODE_TYPE
       
       if Idel_Process.ID == ERROR_HANDLER_PROCESS_ID || Idel_Process.OPERATING_MODE ~= OPERATING_MODE_TYPE.NORMAL|| Idel_Process.LOCK_LEVEL == 0
    	
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    		return;
       end
  
  		Idel_Process.LOCK_LEVEL = Idel_Process.LOCK_LEVEL - 1;
		if Idel_Process.LOCK_LEVEL == 0 
			
		LOCK_LEVEL = Idel_Process.LOCK_LEVEL;
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        end


end

