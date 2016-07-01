function [flag] = PROCESS_NAME_EXIST(PROCESS_NAME)

global Process_Set;
flag=0;
for i=1:256
    if isempty(Process_Set{1,i})==1
        flag = 0;
        continue;
    end
    if strcmp(PROCESS_NAME,Process_Set{1,i}.NAME)==1
        flag = 1;
        return;
    end
end
end