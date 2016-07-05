function [ NUMBER ] = NUMBER_OF_PROCESS()
%NUMBER_OF_PROCESS 此处显示有关此函数的摘要
%   此处显示详细说明
    global Process_Set;
    global MAX_NUMBER_OF_PROCESS
    NUMBER =  length(find(cell2mat(cellfun(@(x)(length(x)),Process_Set,'Un',false))==0));
end

