function [ flag ] = INVALID_MESSAGE_ADDR( MESSAGE_ADDR )
%INVALID_MESSAGE_ADDR 此处显示有关此函数的摘要
%   此处显示详细说明
flag = 0;
if 0>MESSAGE_ADDR && MESSAGE_ADDR>255
    flag = 1;
else
    flag = 0;
end

end

