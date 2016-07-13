function [flag] = INVALID_REFRESH_PERIOD( REFRESH_PERIOD )
%INVALID_REFRESH_PERIOD 此处显示有关此函数的摘要
%   此处显示详细说明
flag = 0;
if 0>REFRESH_PERIOD && REFRESH_PERIOD>255
    flag = 1;
else
    flag = 0;
end

end





