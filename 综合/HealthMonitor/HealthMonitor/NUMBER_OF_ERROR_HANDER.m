function [ NUM ] = NUMBER_OF_ERROR_HANDER( highest_priority )

global Process_Set;

num=0;
for i=1:255
    if isempty(Process_Set{1,i})
        num=i;
        break;
    end
end

N=0;
if (num-1)==0
    NUM = N;
    return;
else   
    for i=1:num-1
        if Process_Set{1,i}.CURRENT_PRIORITY == highest_priority
            N = N+1;
        end
    end
    NUM=N;
    return;
end

end

