function [ PROCESS_ID,RETURN_CODE ] = GET_MY_ID()
%GET_MY_ID 此处显示有关此函数的摘要
%   此处显示详细说明

        global RETURN_CODE_TYPE
        global Idel_Process
        global  ERROR_HANDLER_PROCESS_ID
        
        if Idel_Process.ID == ERROR_HANDLER_PROCESS_ID
    		
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    		return;
        end
  
		PROCESS_ID = Idel_Process.ID;
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;


end

