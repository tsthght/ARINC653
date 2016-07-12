function [ bool ] = INVALID_QUEUING_DISCIPLINE( input )
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
if input~=QUEUING_DISCIPLINE_TYPE.FIFO &&   input~= QUEUING_DISCIPLINE_TYPE.PRIORITY
    bool=1;
else
    bool=0;
end
return;
end

