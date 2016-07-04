function [ PROCESS_INDEX ] = FIND_PROCESS_INDEX( PROCESS_ID )
%FIND_PROCESS_INDEX 此处显示有关此函数的摘要
%   此处显示详细说明
global PROCESS_ID_SET;
ind=find(PROCESS_ID_SET==PROCESS_ID);
if isempty(ind) == 1
     PROCESS_INDEX = -1;
     return;
else
    PROCESS_INDEX = ind;
    return; 
    
end


end

