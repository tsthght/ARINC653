function [ bool] = INVALID_ID( ID )
%UNTITLED2 此处显示有关此函数的摘要
%   BLACKBOARD_ID_TYPE为32位有符号整数
bool=1;

    if ID>0 && ID<2147483648
        bool=0;
        
    end



end

