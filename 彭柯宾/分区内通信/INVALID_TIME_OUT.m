function [ flag ] = INVALID_TIME_OUT( TIME_OUT )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
if TIME_OUT<0 || TIME_OUT>255
    flag = 1;
else
    flag = 0;
    
end

end

