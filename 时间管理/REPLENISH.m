function [ RETURN_CODE ] = REPLENISH(BUDGET_TIME )
%REPLENISH 此处显示有关此函数的摘要
%   此处显示详细说明
        global RETURN_CODE_TYPE
%         global Current_Partition_STATUS
        global ERROR_HANDLER_PROCESS_ID
        global PROCESS_STATE_TYPE
        global Current_Process
        global Current_Partition_STATUE
     
  		if(Current_Process.ID == ERROR_HANDLER_PROCESS_ID )
   			
   			RETURN_CODE = PROCESS_STATE_TYPE.NO_ACTION;
   			return;
        end
        global INFINITE_TIME_VALUE
 		if(Current_Process.STATUS.ATTRIBUTES.PERIOD ~= INFINITE_TIME_VALUE )   		
   			RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
   			return;
        end
        global MAX_BUDGET_TIME

 		if(BUDGET_TIME > MAX_BUDGET_TIME )
  			
  			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
  			return;
        end

%  		Current_Process.STATUS.DEADLINE_TIME = NEW_DEADLINE_TIME;
 		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
 		return;
end

