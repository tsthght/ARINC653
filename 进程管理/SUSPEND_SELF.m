function RETURN_CODE = SUSPEND_SELF(TIME_OUT)

    global ERROR_HANDLER_PROCESS_ID;
    global INFINITE_TIME_VALUE;
    global RETURN_CODE_TYPE;
    global WAITING_PROCESSES_SET;
    global Process_Set;
   
    ID = Process_Set{1,TIME_OUT}.ID
            fprintf('ID is %d\n',INVALIDE_ID(TIME_OUT))
            WAITING_PROCESSES_SET(ID) = ID
    
	%if ( INVALIDE_ID(TIME_OUT) == 0 && Process_Set{1,TIME_OUT}.ID ~= ERROR_HANDLER_PROCESS_ID&& Process_Set{1,TIME_OUT}.PERIOD == INFINITE_TIME_VALUE )
        if INVALIDE_ID(TIME_OUT) == 0
	        RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
		
% 		if (Current_Partition_STATUS.LOCK_LEVEL ~= 0 ) || ( Current_Process.ID == ERROR_HANDLER_PROCESS_ID )
%     		
%             RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
%     		return;
%         end
  		
  		if Process_Set{1,TIME_OUT}.PERIOD ~= INFINITE_TIME_VALUE 
    		
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    		return;
        end
  
  
  		if TIME_OUT == 0 
    		
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    		return;
        
  		else
		
  			%the waiting set should be re-design
  			Process_Set{1,TIME_OUT}.PROCESS_STATE = WAITING;
            ID = Process_Set{1,TIME_OUT}.ID
            fprintf('ID is %d\n',ID)
  			WAITING_PROCESSES_SET(ID) = 1000;
  			
%   			if TIME_OUT ~= INFINITE_TIME_VALUE 
%     			_CREATE_TIME_COUNTER(TIME_OUT, Current_Process.ID, *Time_Out_Signal);
%             end
  			%Ask_For_Process_Scheduling();
  			
  			if Time_Out_Signal == TRUE
    			
    			RETURN_CODE = RETURN_CODE_TYPE.TIME_OUT;
    			return;
			
  			else
  			
    			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    			return;
  			
            end
        end


