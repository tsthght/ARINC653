function [ bool] = INVALID_ID( ID )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   BLACKBOARD_ID_TYPEΪ32λ�з�������
bool=1;

    if ID>0 && ID<2147483648
        bool=0;
        
    end



end

