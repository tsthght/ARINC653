function [ RETURN_CODE ] = RAISE_APPLICATION_ERROR( ERROR_CODE,MESSAGE_ADDR,LENGTH )

global RETURN_CODE_TYPE;
global ERROR_CODE_TYPE;
global Current_Process;
global MAX_ERROR_MESSAGE_SIZE;
global PROCESS_SCHEDULING_FLAG;

if LENGTH<0 || LENGTH>MAX_ERROR_MESSAGE_SIZE
    RETURN_CODE=RETURN_CODE_TYPE.INVALID_PARAM;
    return;
end

if ERROR_CODE~=ERROR_CODE_TYPE.APPLICATION_ERROR
    RETURN_CODE=RETURN_CODE_TYPE.INVALID_PARAM;
    return;
end
 
if (Current_Process.ID==0 && Current_Process.CURRENT_PRIORITY==31) || NUMBER_OF_ERROR_HANDER()==0
    HM_ACTION();
else
    ERROE_HANDLE_ACTION();
    PROCESS_SCHEDULING_FLAG = 1; 
end
RETURN_CODE=RETURN_CODE_TYPE.NO_ERROR;
return;

end

