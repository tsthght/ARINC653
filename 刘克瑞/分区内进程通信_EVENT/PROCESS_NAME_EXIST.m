function [flag] = PROCESS_NAME_EXIST(PROCESS_NAME)

global Process_Set;
global SYSTEM_NUMBER_OF_PROCESS;

flag=0;
for i=1:SYSTEM_NUMBER_OF_PROCESS
    if strcmp(PROCESS_NAME,Process_Set{1,i}.NAME)==1
        flag = 1;
        return;
    end
end
end