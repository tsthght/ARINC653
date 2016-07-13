function [ flag ] = INVALID_PORT_DIRECTION( PORT_DIRECTION )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
flag = 0;
if 0>PORT_DIRECTION && PORT_DIRECTION>31
    flag = 1;
else
    flag = 0;
end

end

