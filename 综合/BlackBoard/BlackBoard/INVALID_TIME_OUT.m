function [ b ] = INVALID_TIME_OUT( a )
%UNTITLED10 此处显示有关此函数的摘要
%   此处显示详细说明   typedef APEX_LONG_INTEGER SYSTEM_TIME_TYPE; /* 64-bit signed integer 
if a<9223372036854775808 && a>-9223372036854775809
    b=0;
else
    b=1;

end

