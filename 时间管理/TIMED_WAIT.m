function [ RETURN_CODE ] = TIMED_WAIT( DELAY_TIME )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
        global RETURN_CODE_TYPE
        global Current_Partition_STATUS
        global Current_Process
        global ERROR_HANDLER_PROCESS_ID 
        
		if ( Current_Partition_STATUS.LOCK_LEVEL ~= 0 || Current_Process.ID== ERROR_HANDLER_PROCESS_ID)
   			
   			RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
   			return;
        end
        
        global MAX_PREOCESS_DELAY_TIME
        global INFINITE_TIME_VALUE
 		if (DELAY_TIME > MAX_PREOCESS_DELAY_TIME || DELAY_TIME < INFINITE_TIME_VALUE)
   			
   			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
   			return;
        end
      
 		if(DELAY_TIME == INFINITE_TIME_VALUE)
   			
   			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
   			return;
        end
        
        global Waiting_Processes_set;
        global Running_Processes_set;
        global PROCESS_STATE_TYPE
        
 		if(DELAY_TIME ~= 0)
            
  			Running_Processes_set{1,Current_Process.ID} = 0;
            Waiting_Processes_set{1,Current_Process.ID} = Current_Process.ID;
   			Current_Process.STATUS.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
   			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        end
		


end

