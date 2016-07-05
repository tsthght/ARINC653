function RETURN_CODE = SUSPEND_SELF(TIME_OUT)

    global ERROR_HANDLER_PROCESS_ID;
    global INFINITE_TIME_VALUE;
    global RETURN_CODE_TYPE;
    global Current_Process;
    global Current_Partition_STATUS;
    global SYSTEM_MAX_TIMEOUT;
    global Time_Out_Signal;
    global Running_Processes_set;
    global Process_Set;
    global PROCESS_STATE_TYPE;
    global MAX_NUMBER_OF_PROCESS;

   
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
            max = 0;
            id = 0;
            for i =1:MAX_NUMBER_OF_PROCESS
                if Process_Set{1,i}.CURRENT_PRIORITY > max
                    max = Process_Set{1,i}.CURRENT_PRIORITY;
                    id = Process_Set{1,i}.ID;
                    PRO = Process_Set{1,i};
                end
                if i == MAX_NUMBER_OF_PROCESS
                    Running_Processes_set(1) = id;
                    Current_Process = PRO;
                end
            end
                
  			if TIME_COUNTER.TOS == Time_Out_Signal.TRUE
    			RETURN_CODE = RETURN_CODE_TYPE.TIME_OUT;
    			return;
            else
    			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    			return;
            end
        end


