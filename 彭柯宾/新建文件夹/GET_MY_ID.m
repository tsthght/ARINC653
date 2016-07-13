function [ PROCESS_ID,RETURN_CODE ] = GET_MY_ID()
%GET_MY_ID 此处显示有关此函数的摘要
%   此处显示详细说明

        global RETURN_CODE_TYPE;
        global Running_Processes_set;
        global  ERROR_HANDLER_PROCESS_ID
        
        if  Running_Processes_set{1,1} == ERROR_HANDLER_PROCESS_ID
    		
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    		return;
        end
  
		PROCESS_ID = Running_Processes_set{1,1};
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;


end

