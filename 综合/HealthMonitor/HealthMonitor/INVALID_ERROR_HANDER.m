function [ FLAG ] = INVALID_ERROR_HANDER( highest_priority )

global Process_Set;

num=0;
for i=1:255
    if isempty(Process_Set{1,i})
        num=i;
        break;
    end
end

flag=0;
if (num-1)==0
    FLAG=flag;
    return;
else   
    for i=1:num-1
        if Process_Set{1,i}.CURRENT_PRIORITY == highest_priority
            flag = 1;
            break;
        end
    end
    FLAG=flag;
    return;
end

end

