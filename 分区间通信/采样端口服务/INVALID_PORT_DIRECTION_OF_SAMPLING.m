function [ flag ] = INVALID_PORT_DIRECTION( PORT_DIRECTION )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
flag = 0;
if 0>PORT_DIRECTION && PORT_DIRECTION>31
    flag = 1;
else
    flag = 0;
end

end

