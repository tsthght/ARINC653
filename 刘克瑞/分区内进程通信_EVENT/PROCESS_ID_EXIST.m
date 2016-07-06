function [flag] = PROCESS_ID_EXIST(PROCESS_ID)

global Process_Set;
global SYSTEM_NUMBER_OF_PROCESS;

flag=0;
for i=1:SYSTEM_NUMBER_OF_PROCESS
    if PROCESS_ID==Process_Set{1,i}.ID
        flag = 1;
        break;
    end
end