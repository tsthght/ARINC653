function [ FLAG ] = IF_HANDLER_PROCESS(PRO_ID)

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
        if Process_Set{1,i}.ID == PRO_ID && Process_Set{1,i}.CURRENT_PRIORITY == 31
            flag = 1;
            break;
        end
    end
    FLAG=flag;
    return;
end


end

