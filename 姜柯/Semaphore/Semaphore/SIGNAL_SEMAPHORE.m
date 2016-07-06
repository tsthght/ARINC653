function [ RETURN_CODE ] = SIGNAL_SEMAPHORE( SEMAPHORE_ID )

global RETURN_CODE_TYPE;
global PROCESS_STATE_TYPE;
global Semaphore_Set;
global PAR;
global PRO;

flag=INVALID_ID(SEMAPHORE_ID);
if flag == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    disp(RETURN_CODE);
    disp('a');
    return;
end

if Semaphore_Set{1,SEMAPHORE_ID}.CURRENT_VALUE == Semaphore_Set{1,SEMAPHORE_ID}.MAXIMUM_VALUE
    RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    disp(RETURN_CODE);
    disp('b');
    return;
end
    
if Semaphore_Set{1,SEMAPHORE_ID}.WAITING_PROCESSES == 0
    Semaphore_Set{1,SEMAPHORE_ID}.CURRENT_VALUE=Semaphore_Set{1,SEMAPHORE_ID}.CURRENT_VALUE+1;
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    disp(RETURN_CODE);
    disp('c');
    return;
else
    p=Semaphore_Set{1,SEMAPHORE_ID}.P;
    PROCESS_ID=Semaphore_Set{1,SEMAPHORE_ID}.SEMAPHORE_QUEUE{1,p};
    Semaphore_Set{1,SEMAPHORE_ID}.P=Semaphore_Set{1,SEMAPHORE_ID}.P+1;
    flag=WAITING_TIME_COUNTER(PROCESS_ID);
    if flag==1
        STOP_TIME_COUNTER(PROCESS_ID);
    end
    PRO.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
    DELETE_FROM_WAITING(PRO.ID);
    INSERT_INTO_READY(PRO.ID);
    DELETE_FROM_SEMAPHORE_QUEUE(SEMAPHORE_ID);
    if PAR.LOCK_LEVEL <= 0
        PROCESS_SCHEDULING();
    end
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    disp(RETURN_CODE);
    disp('d');
end
       
end

