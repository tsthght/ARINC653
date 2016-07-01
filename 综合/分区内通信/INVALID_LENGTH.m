function [ flag ] = INVALID_LENGTH( LENGTH, MAX_MESSAGE_SIZE )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
flag = 0;
if LENGTH > MAX_MESSAGE_SIZE
   flag = 1;
else
    flag = 0;
end

end

