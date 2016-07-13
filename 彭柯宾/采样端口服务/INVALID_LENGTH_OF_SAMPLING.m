function [ flag ] = INVALID_LENGTH( LENGTH )
%INVALID_LENGTH 此处显示有关此函数的摘要
%   此处显示详细说明

flag = 0;
if 0> LENGTH &&  LENGTH>255
    flag = 1;
else
    flag = 0;
end

end

