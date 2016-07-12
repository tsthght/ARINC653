function [ ERROR_STATUS,RETURN_CODE ] = GET_ERROR_STATUS()

global RETURN_CODE_TYPE;
global Error_Process;
global Current_Process;

if Current_Process.ID~=0 && Current_Process.CURRENT_PRIORITY~=31    
    ERROR_STATUS.ERROR_CODE = -1; 
    ERROR_STATUS.LENGTH = -1;
    ERROR_STATUS.FAILED_PROCESS_ID = -1;
    ERROR_STATUS.FAILED_ADDRESS = -1;
    RETURN_CODE=RETURN_CODE_TYPE.INVALID_CONFIG;
    return;
end

if numel(Error_Process)==0
    ERROR_STATUS.ERROR_CODE = -1; 
    ERROR_STATUS.LENGTH = -1;
    ERROR_STATUS.FAILED_PROCESS_ID = -1;
    ERROR_STATUS.FAILED_ADDRESS = -1;
    RETURN_CODE=RETURN_CODE_TYPE.NO_ACTION;
    return;
end

ERROR_STATUS.ERROR_CODE = Error_Process{1,1}.ERROR_CODE; 
ERROR_STATUS.LENGTH = Error_Process{1,1}.LENGTH;
ERROR_STATUS.FAILED_PROCESS_ID = Error_Process{1,1}.FAILED_PROCESS_ID;
ERROR_STATUS.FAILED_ADDRESS = Error_Process{1,1}.FAILED_ADDRESS;
Error_Process{1,1}=[];
RETURN_CODE=RETURN_CODE_TYPE.NO_ERROR;
return;

end

