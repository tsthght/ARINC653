function [ PROCESS_ID,RETURN_CODE ] = GET_MY_ID()
%GET_MY_ID �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

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

