function [PROCESS_ID,RETURN_CODE] = GET_PROCESS_ID(PROCESS_NAME)

global Process_Set;
global RETURN_CODE_TYPE;


flag = PROCESS_NAME_EXIST(PROCESS_NAME);
if flag == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG
    return;
end

for i =1:255
    if Process_Set{1,i}.NAME == PROCESS_NAME;
        PROCESS_ID = Process_Set{1,i}.ID
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
    end
    return;
end