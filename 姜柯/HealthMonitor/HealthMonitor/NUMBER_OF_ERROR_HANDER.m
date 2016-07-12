function [ NUM ] = NUMBER_OF_ERROR_HANDER()

global Process_Set;
global highest_priority;

N=0;
if numel(Process_Set)==0
    NUM = N;
    return;
else   
    for i=1:numel(Process_Set)
        if Process_Set{1,i}.CURRENT_PRIORITY == highest_priority
            N = N+1;
        end
    end
    NUM=N;
    return;
end

end

