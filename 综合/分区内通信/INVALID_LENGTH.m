function [ flag ] = INVALID_LENGTH( LENGTH, MAX_MESSAGE_SIZE )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
flag = 0;
if LENGTH > MAX_MESSAGE_SIZE
   flag = 1;
else
    flag = 0;
end

end

