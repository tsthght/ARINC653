function [ bool ] = INVALID_QUEUING_DISCIPLINE( input )
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if input~=QUEUING_DISCIPLINE_TYPE.FIFO &&   input~= QUEUING_DISCIPLINE_TYPE.PRIORITY
    bool=1;
else
    bool=0;
end
return;
end

