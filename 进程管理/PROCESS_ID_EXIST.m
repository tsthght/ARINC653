function [flag] = PROCESS_ID_EXIST(NUM)

global PROCESS_ID_SET;
flag=0;
if sum( ismember(PROCESS_ID_SET,NUM) )>=1 
    flag = 1;
    return;
end
