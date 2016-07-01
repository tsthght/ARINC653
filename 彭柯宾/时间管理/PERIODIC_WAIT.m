function [ RETURN_CODE  ] = PERIODIC_WAIT()
%PERIODIC_WAIT 此处显示有关此函数的摘要
%   此处显示详细说明
        global RETURN_CODE_TYPE
        global Current_Partition_STATUS
        
        global ERROR_HANDLER_PROCESS_ID
        global PROCESS_STATE_TYPE
        global Current_Process
if ( Current_Partition_STATUS.LOCK_LEVEL ~= 0 || Current_Process.ID == ERROR_HANDLER_PROCESS_ID)
			
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
end

        
 		Current_Process.STATUS.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
 		RETURN_CODE =RETURN_CODE_TYPE.NO_ERROR;
 		return;




