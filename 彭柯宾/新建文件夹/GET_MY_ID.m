function [ PROCESS_ID,RETURN_CODE ] = GET_MY_ID()
%GET_MY_ID �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

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

