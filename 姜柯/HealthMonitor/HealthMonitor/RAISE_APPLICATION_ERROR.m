function [ RETURN_CODE ] = RAISE_APPLICATION_ERROR( ERROR_CODE,MESSAGE_ADDR,LENGTH )

global RETURN_CODE_TYPE;
global ERROR_CODE_TYPE;
global PRO;

MAX_ERROR_MESSAGE_SIZE=128;

if LENGTH<0 || LENGTH>MAX_ERROR_MESSAGE_SIZE
    RETURN_CODE=RETURN_CODE_TYPE.INVALID_PARAM;
    disp(RETURN_CODE);
    disp('a');
    return;
end

if ERROR_CODE~=ERROR_CODE_TYPE.APPLICATION_ERROR
    RETURN_CODE=RETURN_CODE_TYPE.INVALID_PARAM;
    disp(RETURN_CODE);
    disp('b');
    return;
end

flag=IF_HANDLER_PROCESS(PRO.ID);
num=NUMBER_OF_ERROR_HANDER(31);
if flag==1 || num==0
    disp(ERROR_CODE);
    disp(MESSAGE_ADDR);
    disp(LENGTH);
    HM_ACTION();
else
    ERROE_HANDLE_ACTION();
    PROCESS_SCHEDULING();   
end
RETURN_CODE=RETURN_CODE_TYPE.NO_ERROR;
disp(RETURN_CODE);
disp('c');
return;

end

