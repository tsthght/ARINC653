

function [flag] = INVALIDE_NAME(STR)


global PROCESS_NAME_SET;
flag=0;

if sum( ismember(PROCESS_NAME_SET,STR) ) >=  1
    flag = 1;
    return;
end

