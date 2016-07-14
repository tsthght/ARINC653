function [LOCK_LEVEL,RETURN_CODE]=LOCK_PREEMPTION()
		
	    global Idel_Process
        global ERROR_HANDLER_PROCESS_ID
        global MAX_LOCK_LEVEL
        global RETURN_CODE_TYPE
        
  		if Idel_Process.ID == ERROR_HANDLER_PROCESS_ID
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
        end
    	
        
  		if Idel_Process.LOCK_LEVEL >= MAX_LOCK_LEVEL
    		
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    		return;
        end
  
 		Idel_Process.LOCK_LEVEL = Idel_Process.LOCK_LEVEL + 1;
 		LOCK_LEVEL = Idel_Process.LOCK_LEVEL;
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;
	
