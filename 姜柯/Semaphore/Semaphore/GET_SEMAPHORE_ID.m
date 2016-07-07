function [ SEMAPHORE_ID,RETURN_CODE ] = GET_SEMAPHORE_ID( SEMAPHORE_NAME )

global RETURN_CODE_TYPE;
global Semaphore_Set;
global Semaphore_NAME_Set;


flag=INVALID_NAME(SEMAPHORE_NAME);
if flag == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    SEMAPHORE_ID=0;
    return;
end

ID=0;
for i=1:255
    if Semaphore_NAME_Set{1,i}==SEMAPHORE_NAME 
        ID=i;
        break;
    end
end

SEMAPHORE_ID=Semaphore_Set{1,ID}.ID;
RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;

end

