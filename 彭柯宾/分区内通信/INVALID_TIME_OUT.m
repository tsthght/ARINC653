function [ flag ] = INVALID_TIME_OUT( TIME_OUT )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if TIME_OUT<0 || TIME_OUT>255
    flag = 1;
else
    flag = 0;
    
end

end

