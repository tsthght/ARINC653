function RETURN_CODE = SUSPEND_SELF(TIME_OUT)

    global ERROR_HANDLER_PROCESS_ID;
    global INFINITE_TIME_VALUE;
    global RETURN_CODE_TYPE;
    global Current_Process;
    global Current_Partition_STATUS;
    global SYSTEM_MAX_TIMEOUT;
    global Time_Out_Signal;
    global PROCESS_STATE_TYPE;
    global PROCESS_SCHEDULING_FLAG;

   
        if Current_Partition_STATUS.LOCK_LEVEL ~= 0 || Current_Process.ID == ERROR_HANDLER_PROCESS_ID; 
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
            return;
        end
        
        if TIME_OUT > SYSTEM_MAX_TIMEOUT
	        RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
  		
  		if Current_Process.PERIOD ~= INFINITE_TIME_VALUE 
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    		return;
        end
  
  		if TIME_OUT == 0 
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    		return;
        else
  			%the waiting set should be re-design
  			Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;	
            if TIME_OUT ~= INFINITE_TIME_VALUE
                TIME_COUNTER = struct('PROCESS_ID',Current_Process.ID,'DURATION',TIME_OUT,'TOS',0);
            end
            
            PROCESS_SCHEDULING_FLAG = 1;
                
  			if TIME_COUNTER.TOS == Time_Out_Signal.TRUE
    			RETURN_CODE = RETURN_CODE_TYPE.TIME_OUT;
    			return;
            else
    			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    			return;
            end
       end


