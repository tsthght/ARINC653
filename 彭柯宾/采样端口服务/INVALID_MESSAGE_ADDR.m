function [ flag ] = INVALID_MESSAGE_ADDR( MESSAGE_ADDR )
%INVALID_MESSAGE_ADDR �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
flag = 0;
if 0>MESSAGE_ADDR && MESSAGE_ADDR>255
    flag = 1;
else
    flag = 0;
end

end

