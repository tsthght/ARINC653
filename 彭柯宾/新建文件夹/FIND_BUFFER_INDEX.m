function [ BUFFER_INDEX ] = FIND_BUFFER_INDEX( BUFFER_ID )
%FIND_PROCESS_INDEX 此处显示有关此函数的摘要
%   此处显示详细说明
global Buffer_id_set;
ind=find(Buffer_id_set==BUFFER_ID);
if isempty(ind) == 1
     BUFFER_INDEX = -1;
     return;
else
    BUFFER_INDEX = ind;
    return; 
    
end