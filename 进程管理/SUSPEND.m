function [RETURN_CODE] = SUSPEND (PROCESS_ID)

global Process_Set
global INFINITE_TIME_VALUE
global PROCESS_STATE_TYPE
global RETURN_CODE_TYPE
global Current_Partition_STATUS
global ERORR_HANDLER_PROCESS_ID
global Current_Process;
global MAX_NUMBER_OF_PROCESS;


%判断ID输入是否合法
flag=INVALID_ID(PROCESS_ID);
if flag == 0 || Current_Process.ID == PROCESS_ID
	 RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
     return;
end

%判断模式是否异常
if Current_Partition_STATUS.LOCK_LEVEL~=0 && PROCESS_ID == ERORR_HANDLER_PROCESS_ID
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%

%在PCB中找到要挂起的进程
for i = 1:MAX_NUMBER_OF_PROCESS
    if Process_Set{1,i}.ID==PROCESS_ID
        index = i;
    break;    
    end
end

%如果进程是休眠装状态，模式错误
if Process_Set{1,index}.PROCESS_STATE == PROCESS_STATE_TYPE.DORMANT
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%如果进程是周期性的，模式错误
if Process_Set{1,index}.PERIOD ~= 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%如果进程是等待状态，不作任何操作
if Process_Set{1,index}.PROCESS_STATE == PROCESS_STATE_TYPE.WAITING
    RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    return;
    
%将进程挂起
else 
            DELETE_FROM_READY(PROCESS_ID);
            Process_Set{1,index}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
            INSERT_INTO_WAITING(PROCESS_ID);
            RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
            return;
end


