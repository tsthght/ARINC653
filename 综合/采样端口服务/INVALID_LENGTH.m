function [ flag ] = INVALID_LENGTH( LENGTH )
%INVALID_LENGTH �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

flag = 0;
if 0> LENGTH &&  LENGTH>255
    flag = 1;
else
    flag = 0;
end

end

