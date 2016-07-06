function [ NUM ] = NUMBER_OF_ERROR_PROCESS()

global Error_Process;

num=0;
for i=1:255
    if isempty(Error_Process{1,i})
        num=i;
        break;
    end
end

NUM=num-1;

end

