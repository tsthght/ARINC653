function [ FLAG ] = INVALID_ERROR_HANDER()

global Process_Set;
global highest_priority;

flag=0;
if numel(Process_Set)==0
    FLAG=flag;
    return;
else   
    for i=1:numel(Process_Set)
        if Process_Set{1,i}.CURRENT_PRIORITY == highest_priority
            flag = 1;
            break;
        end
    end
    FLAG=flag;
    return;
end

end

