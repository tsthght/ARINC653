function [ RETURN_CODE ] = CREATE_ERROR_HANDLER( ENTRY_POINT,STACK_SIZE )

global RETURN_CODE_TYPE;
global OPERATING_MODE_TYPE;
global PAR;

highest_priority=31;
maximum_number_of_error_hander=10;

flag=INVALID_ERROR_HANDER(highest_priority);
if flag==1
    RETURN_CODE=RETURN_CODE_TYPE.NO_ERROR;
    disp(RETURN_CODE);
    disp('a');
    return;
end

num=NUMBER_OF_ERROR_HANDER(highest_priority);
if num>maximum_number_of_error_hander
    RETURN_CODE=RETURN_CODE_TYPE.INVALID_CONFIG;
    disp(RETURN_CODE);
    disp('b');
    return;
end

if STACK_SIZE<0 || STACK_SIZE>31
    RETURN_CODE=RETURN_CODE_TYPE.INVALID_CONFIG;
    disp(RETURN_CODE);
    disp('c');
    return;
end
    
if PAR.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL
     RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
     disp(RETURN_CODE);
     disp('d');
     return;
end

ATTRIBUTE=struct('ID',num+1,'DEADLINE_TIME',10,'CURRENT_PRIORITY',31,'PROCESS_STATE',0,'PERIOD',10,'TIME_CAPACITY',5,'ENTRY_POINT',ENTRY_POINT,'STACK_SIZE',STACK_SIZE,'BASE_PRIORITY',31,'DEADLINE',30,'NAME',999);            
CREATE_PROCESS(ATTRIBUTE);
RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
disp(RETURN_CODE);
disp('e');
return;

end

